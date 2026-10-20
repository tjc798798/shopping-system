package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.entity.Goods;
import com.example.springboot.service.IGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

/**
 * AI 助手控制器
 */
@RestController
@RequestMapping("/ai")
public class AiController {

    @Autowired
    private IGoodsService goodsService;

    /**
     * AI 聊天接口
     * @param params 包含 message 的请求体
     * @return AI 的响应内容
     */
    @PostMapping("/chat")
    public Result chat(@RequestBody Map<String, String> params) {
        String message = params.get("message");
        if (message == null || message.trim().isEmpty()) {
            return Result.error("消息内容不能为空");
        }

        String response;
        String lowerMsg = message.toLowerCase().trim();

        // 1. 基础算术运算逻辑 (加减乘除)
        // 匹配模式：数字 运算符 数字，例如 1+1, 10 / 2, 5.5 * 3
        Pattern mathPattern = Pattern.compile("(\\d+\\.?\\d*)\\s*([\\+\\-\\*/])\\s*(\\d+\\.?\\d*)");
        Matcher matcher = mathPattern.matcher(lowerMsg);
        if (matcher.find()) {
            try {
                double num1 = Double.parseDouble(matcher.group(1));
                String op = matcher.group(2);
                double num2 = Double.parseDouble(matcher.group(3));
                double result = 0;
                boolean valid = true;

                switch (op) {
                    case "+": result = num1 + num2; break;
                    case "-": result = num1 - num2; break;
                    case "*": result = num1 * num2; break;
                    case "/":
                        if (num2 == 0) {
                            response = "哎呀，除数不能为零哦！";
                            valid = false;
                        } else {
                            result = num1 / num2;
                        }
                        break;
                    default: valid = false;
                }

                if (valid) {
                    // 如果结果是整数，去掉小数点
                    String resultStr = (result == (long) result) ? String.format("%d", (long) result) : String.format("%.2f", result);
                    response = "好的，我为您计算好了：" + matcher.group(1) + " " + op + " " + matcher.group(3) + " = " + resultStr;
                    return Result.success(response);
                }
            } catch (Exception e) {
                // 解析失败则继续走后面的关键词逻辑
            }
        }

        // 获取所有商品数据用于匹配
        List<Goods> allGoods = goodsService.selectAll();
        
        if (lowerMsg.contains("你好") || lowerMsg.contains("hello")) {
            response = "您好！我是您的智能购物助手。您可以问我关于商品价格、推荐或订单的问题，比如“碎花连衣裙多少钱？”";
        } else if (lowerMsg.contains("价格") || lowerMsg.contains("多少钱") || lowerMsg.contains("几钱")) {
            // 尝试匹配具体商品名称
            Goods target = null;
            for (Goods g : allGoods) {
                if (lowerMsg.contains(g.getName().toLowerCase())) {
                    target = g;
                    break;
                }
            }
            if (target != null) {
                response = target.getName() + " 的当前价格是 ¥" + target.getPrice() + "。目前库存还有 " + target.getStore() + " 件，非常值得购买哦！";
            } else {
                response = "您是想查询商品价格吗？请告诉我具体的商品名称，例如：“碎花连衣裙的价格是多少？”";
            }
        } else if (lowerMsg.contains("推荐") || lowerMsg.contains("好货")) {
            List<Goods> hotGoods = goodsService.sales(); // 获取热销商品
            if (!hotGoods.isEmpty()) {
                String names = hotGoods.stream().limit(3).map(Goods::getName).collect(Collectors.joining("、"));
                response = "为您推荐目前最受欢迎的商品：" + names + "。您可以点击导航栏的“全部商品”查看详情。";
            } else {
                response = "为您推荐 Apple iPhone 17 和 三只松鼠坚果礼盒，都是近期的爆款！";
            }
        } else if (lowerMsg.contains("优惠") || lowerMsg.contains("活动")) {
            response = "我们现在有新人大礼包，注册即可领取优惠券。此外，部分数码产品正在进行限时促销，不容错过哦！";
        } else if (lowerMsg.contains("订单") || lowerMsg.contains("物流")) {
            response = "您可以点击导航栏中的“个人中心” -> “我的订单”来查看您的订单状态和物流信息。";
        } else {
            // 兜底逻辑：尝试查找消息中是否提到了某个商品
            Goods mentioned = null;
            for (Goods g : allGoods) {
                if (lowerMsg.contains(g.getName().toLowerCase())) {
                    mentioned = g;
                    break;
                }
            }
            if (mentioned != null) {
                response = "您提到了 " + mentioned.getName() + "。这款商品描述是：" + mentioned.getDescr() + "。如果您想了解它的价格或购买，可以直接点击进入商品详情页。";
            } else {
                response = "收到您的消息了！“" + message + "” 是一个很有趣的话题。目前我正在不断学习中，如果您有关于购物的具体问题，我会尽力帮您解答！";
            }
        }

        return Result.success(response);
    }
}
