# JSP_SSM_Springboot_Pet_adoption
JSP基于SSM宠物领养宠粮购买网站可升级SpringBoot毕业源码案例设计
## 程序开发环境：myEclipse/Eclipse/Idea都可以 + mysql数据库
## 前台技术框架： Bootstrap  后台架构框架: SSM
系统分为前台后台，两个身份，管理员，用户
公告信息，该模块可以查看宠物疾病，注意宠物保养等措施信息公告。
公共留言信息。这个设立主要是为小区内的用户晒宠物信息等功能
管理员可以发布流浪宠物领养信息，该宠物身上有什么问题，用户看到可以进行领养。
一个宠物粮食在线售卖，用户可以进行购买，生成相应的订单
用户可以登记查看自己领养的宠物记录
## 实体ER属性：
用户: 用户名,登录密码,姓名,性别,生日,用户照片,联系电话,家庭地址,注册时间

公告信息: 公告id,标题,公告类别,公告内容,发布日期

公共留言: 留言id,留言标题,留言内容,留言人,留言时间,管理回复,回复时间

宠物: 宠物id,宠物类别,宠物名称,宠物照片,宠物介绍,领养要求,领养状态,登记时间

宠物类别: 宠物类别id,宠物类别名称

宠物粮食: 宠粮id,宠粮名称,宠粮照片,宠粮介绍,库存数量,上架日期

宠粮订单: 订单id,宠粮名称,预订用户,预订数量,订单状态,预订时间

领养: 领养id,被领养宠物,领养人,领养申请时间,审核状态