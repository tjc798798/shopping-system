/*
 Navicat Premium Data Transfer

 Source Server         : stop
 Source Server Type    : MySQL
 Source Server Version : 80019 (8.0.19)
 Source Host           : localhost:3306
 Source Schema         : stop

 Target Server Type    : MySQL
 Target Server Version : 80019 (8.0.19)
 File Encoding         : 65001

 Date: 10/10/2026 15:04:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (1, '苹果17', 'https://ts1.tc.mm.bing.net/th/id/OIP-C.6e5xMkm0aN_HTrOxYFxZGgHaHa?w=193&h=193&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=ImgAns&rm=2', 4);
INSERT INTO `carousel` VALUES (2, '可口可乐', 'https://ts1.tc.mm.bing.net/th/id/OIP-C.G6zm5pm5HxqMzqXjPSmouwHaLH?w=193&h=290&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=ImgAns&rm=2', 3);

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (4, 2, 3, '2026-10-08 15:51:00');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '详情介绍',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `store` int NULL DEFAULT NULL COMMENT '库存',
  `user_id` int NULL DEFAULT NULL COMMENT '添加人',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上架日期',
  `type_id` int NULL DEFAULT NULL COMMENT '分类ID',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态',
  `sales` int NULL DEFAULT NULL COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '三只松鼠每日坚果礼盒', '三只松鼠每日坚果孕妇健康混合干果果仁零食礼盒休闲食品节日送礼坚果礼盒 【4+3】每日坚果750g/30袋', '<p>三只松鼠<img src=\"https://ts1.tc.mm.bing.net/th/id/OIP-C.vrpGUukOs-cpe8F54JDn_QHaHa?w=193&amp;h=193&amp;c=8&amp;rs=1&amp;qlt=90&amp;o=6&amp;dpr=1.3&amp;pid=ImgAns&amp;rm=2\" contenteditable=\"false\" style=\"font-size: 14px;\"/></p>', 'https://ts1.tc.mm.bing.net/th/id/OIP-C.vrpGUukOs-cpe8F54JDn_QHaHa?w=193&h=193&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=ImgAns&rm=2', 49.00, 100, 1, '2025-11-28 10:06:55', 10, '上架', 0);
INSERT INTO `goods` VALUES (2, '臻味高端纯坚果礼盒', '臻味高端纯坚果礼盒6罐装1520g环球礼臻节日礼品坚果干果炒货团购送礼', '<p>高端坚果<img src=\"https://ts1.tc.mm.bing.net/th/id/OIP-C.WmQexoK98oIBnjFLPrteygHaHa?w=193&amp;h=193&amp;c=8&amp;rs=1&amp;qlt=90&amp;o=6&amp;dpr=1.3&amp;pid=ImgAns&amp;rm=2\" contenteditable=\"false\" style=\"font-size: 14px;\"/></p>', 'https://ts1.tc.mm.bing.net/th/id/OIP-C.WmQexoK98oIBnjFLPrteygHaHa?w=193&h=193&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=ImgAns&rm=2', 149.00, 99, 1, '2025-11-28 10:06:55', 10, '上架', 1);
INSERT INTO `goods` VALUES (3, '可口可乐（Coca-Cola）汽水饮料', '可口可乐（Coca-Cola）汽水饮料 碳酸饮料 330ml*24摩登罐 新老包装随机发货', '<p>可口可乐<img src=\"https://ts1.tc.mm.bing.net/th/id/OIP-C.G5181nipHVBkZGvAfoAVagHaHa?w=193&amp;h=193&amp;c=8&amp;rs=1&amp;qlt=90&amp;o=6&amp;dpr=1.3&amp;pid=ImgAns&amp;rm=2\" contenteditable=\"false\" style=\"font-size: 14px;\"/></p>', 'https://ts1.tc.mm.bing.net/th/id/OIP-C.G5181nipHVBkZGvAfoAVagHaHa?w=193&h=193&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=ImgAns&rm=2', 3.00, 99, 1, '2025-11-28 10:06:55', 11, '上架', 1);
INSERT INTO `goods` VALUES (4, 'Apple/苹果 iPhone 17', 'Apple/苹果 iPhone 17 256GB 白色 支持移动联通电信5G 双卡双待手机', '<p>苹果17<img src=\"https://ts1.tc.mm.bing.net/th/id/OIP-C.jyeWeNOEH8-_KNKKJ7VMswAAAA?w=193&amp;h=145&amp;c=8&amp;rs=1&amp;qlt=90&amp;o=6&amp;dpr=1.3&amp;pid=ImgAns&amp;rm=2\" contenteditable=\"false\" style=\"font-size: 14px;\"/></p>', 'https://ts1.tc.mm.bing.net/th/id/OIP-C.jyeWeNOEH8-_KNKKJ7VMswAAAA?w=193&h=145&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=ImgAns&rm=2', 5999.00, 100, 1, '2025-11-28 10:06:55', 12, '上架', 0);
INSERT INTO `goods` VALUES (5, '稻香村稻香村新品坚果桃酥饼干', '稻香村稻香村新品坚果桃酥饼干点心零食休闲办公室下午茶礼盒装送礼囤货 【坚果含量≥13%】坚果桃酥800', '<p>桃酥饼干<img src=\"https://cn.bing.com/th?id=OPAC.zk3qsXmunrQqTg474C474&amp;o=5&amp;pid=21.1&amp;w=140&amp;h=140&amp;qlt=100&amp;dpr=1.3&amp;o=2&amp;c=8&amp;pcl=f5f5f5\" contenteditable=\"false\" style=\"font-size: 14px;\"/></p>', 'https://ts1.tc.mm.bing.net/th/id/OIP-C.1x_fkTtH-vzUz-f1YJWVuwHaE8?w=193&h=135&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=ImgAns&rm=2', 26.00, 100, 1, '2025-11-28 10:04:53', 10, '上架', 0);
INSERT INTO `goods` VALUES (6, '颜小贝鲜牛乳黄油厚切吐司面包', '颜小贝鲜牛乳黄油厚切吐司面包1000g 整箱手撕早餐零食代餐饱腹6种口味', '<p>土司面包<img src=\"https://ts1.tc.mm.bing.net/th/id/OIP-C.XeMnoDNwO0HrLnsr6MxbqwHaE7?w=193&amp;h=135&amp;c=8&amp;rs=1&amp;qlt=90&amp;o=6&amp;dpr=1.3&amp;pid=ImgAns&amp;rm=2\" contenteditable=\"false\" style=\"font-size: 14px;\"/></p>', 'https://ts1.tc.mm.bing.net/th/id/OIP-C.XeMnoDNwO0HrLnsr6MxbqwHaE7?w=193&h=135&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=ImgAns&rm=2', 24.00, 100, 1, '2025-11-28 10:06:55', 10, '上架', 0);
INSERT INTO `goods` VALUES (7, '元朗鸡蛋卷', '元朗鸡蛋卷 饼干礼盒曲奇休闲特产零食品糕点 广东老字号送老年人454g', '<p>鸡蛋卷<img src=\"https://ts1.tc.mm.bing.net/th/id/OIP-C.H4w8DbXNuETun9XlX1uN-wHaJ4?w=193&amp;h=257&amp;c=8&amp;rs=1&amp;qlt=90&amp;o=6&amp;dpr=1.3&amp;pid=ImgAns&amp;rm=2\" contenteditable=\"false\" style=\"font-size: 14px;\"/></p>', 'https://ts1.tc.mm.bing.net/th/id/OIP-C.H4w8DbXNuETun9XlX1uN-wHaJ4?w=193&h=257&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=ImgAns&rm=2', 46.00, 99, 1, '2025-11-28 10:08:41', 10, '上架', 1);
INSERT INTO `goods` VALUES (8, '美味壹客全麦坚果欧包', '美味壹客全麦坚果欧包无蔗糖休闲零食小面包早餐0添加代餐400g整箱8包', '<p>全麦坚果<img src=\"https://ts1.tc.mm.bing.net/th/id/OIP-C.H5SjIp7e_uWAsUHX9VQH1AHaNC?w=193&amp;h=331&amp;c=8&amp;rs=1&amp;qlt=90&amp;o=6&amp;dpr=1.3&amp;pid=ImgAns&amp;rm=2\" contenteditable=\"false\" style=\"font-size: 14px;\"/></p>', 'https://ts1.tc.mm.bing.net/th/id/OIP-C.H5SjIp7e_uWAsUHX9VQH1AHaNC?w=193&h=331&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=ImgAns&rm=2', 11.00, 100, 1, '2025-11-28 10:10:21', 10, '上架', 0);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '公告内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` int NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '管理员', '欢迎来到电商后台系统', '2026-10-9', 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名称',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单号',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品ID',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `nums` int NULL DEFAULT NULL COMMENT '数量',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `user_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  `user_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '购买时间',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '待付款' COMMENT '订单状态',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (18, '臻味高端纯坚果礼盒', '202610091320010', 2, 149.00, 1, 'tom', '13988776699', '北京', '2026-10-09 13:20:10', '待付款', 2);
INSERT INTO `orders` VALUES (19, '可口可乐（Coca-Cola）汽水饮料', '202610091325040', 3, 3.00, 1, 'tom', '13988776699', '北京', '2026-10-09 13:25:40', '已支付', 2);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (10, '零食');
INSERT INTO `type` VALUES (11, '饮料');
INSERT INTO `type` VALUES (12, '数码产品');
INSERT INTO `type` VALUES (13, '女装');
INSERT INTO `type` VALUES (14, '男装');
INSERT INTO `type` VALUES (15, '家具');
INSERT INTO `type` VALUES (16, '办公用品');
INSERT INTO `type` VALUES (17, '图书');
INSERT INTO `type` VALUES (18, '美妆');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `infos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '个人介绍',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `account` double(10, 2) NULL DEFAULT 0.00 COMMENT '余额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123', '管理员', '13677889988', 'admin@xxx.com', '湘潭', 'http://localhost:9999/file/download/汤姆.jpg', '男', 21, '我是管理员', 'ADMIN', 0.00);
INSERT INTO `user` VALUES (2, 'tom', '123', '汤姆', '13988776699', 'jerry@qq.com', '北京', 'http://localhost:9999/file/download/汤姆.jpg', '男', 24, '我爱你，亲爱的姑娘', 'USER', 97.00);
INSERT INTO `user` VALUES (3, 'jerry', '123', '杰瑞', '15098765321', 'tom@qq.com', '上海', 'http://localhost:9999/file/download/杰瑞.jpg', '男', 25, '我爱你，亲爱的姑娘', 'USER', 0.00);

SET FOREIGN_KEY_CHECKS = 1;
