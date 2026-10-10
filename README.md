# shopping-system
基于 SpringBoot + Vue 的电商管理系统

## 项目介绍
本系统是一套前后端分离的电商平台，包含前台用户商城与后台管理模块。
后端使用SpringBoot框架，前端采用Vue技术栈，MySQL作为数据库，实现商品管理、订单处理、用户管理、购物车等电商基础业务功能。

## 技术栈
### 后端
- SpringBoot
- MyBatis
- MySQL
- Maven

### 前端
- Vue2 / Vue3
- Element UI
- Axios

## 项目模块
1. 用户模块：用户注册、登录、个人信息维护
2. 商品模块：商品分类、商品上架、商品信息展示、搜索
3. 购物车模块：商品加入购物车、数量修改、删除购物项
4. 订单模块：创建订单、订单状态管理
5. 后台管理模块：管理员对用户、商品、订单进行管理

## 运行说明
### 后端启动
1. 导入sql文件夹中的数据库脚本，在MySQL中创建数据库并执行
2. 修改application.yml中的数据库连接地址、账号、密码
3. 使用Maven加载依赖，运行SpringBoot启动类

### 前端启动
1. 进入vue目录，执行`npm install`安装依赖
2. 执行`npm run serve`启动前端项目
3. 在浏览器访问前端页面地址

## 项目结构
shopping-system
├── springboot        // 后端代码
├── vue               // 前端代码
├── sql               // 数据库脚本
├── files             // 静态资源
└── .gitignore        //git 忽略配置
