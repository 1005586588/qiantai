<%@page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta name="keywords" content="甜爱，SweetLove,甜品，甜点，生日蛋糕，冰淇淋，冰品"/>
<meta name="description" content="甜爱网上商城是专注于甜品销售、进口的网站，各种甜品、甜点齐全，还有解暑的各种冰品任顾客挑选，让他们感受到爱的温馨。">
<meta charset="utf-8">
<title>我的甜品，你的爱~</title>
<link rel="shortcut icon" href="images/logo_01.png">
<link rel="stylesheet" href="css/shoppingCar.css"> 
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/carts.css">

</head>

<body>
<!--页头-->
<div id="headCon">
	<div>
    	<p>我的甜品 你的爱~</p>
        <ol>
            <li><a href="login.html">请登录</a></li>
            <li><a href="register.html">注册</a></li>
            <a href="order.html">我的订单</a>
            <!--<a href="#" class="shoppingCar">
            	<i></i>
            	<span>购物车（0）</span>
            </a>-->
        </ol>
    </div>
    <ul>
    	<a href="index.html"><li></li></a>
        <p>我的收藏</p>
        <ol>
            <li>
            	<div class="my"><img src="images/shopCar_08.png"></div>
                <p class="red">我的收藏</p>
            </li>
            <li>
            	<div class="order"><img src="images/shopCar_03.png"></div>
                <p>确认订单</p>
            </li>
            <li class="pay">
            	<div class="pay"><img src="images/shopCar_11.png"></div>
                <p>支付</p>
            </li>
            <li class="bingo">
            	<div class="bingo"><img src="images/shopCar_05.png"></div>
                <p>完成</p>
            </li>
        </ol>
    </ul>
</div>
<!--内容-->
<div id="contentCon">
	<ul>
    	<li>
        	<p>我的收藏（5）</p>
            <span></span>
        </li>
        <p>优惠（2）</p>
    </ul>
    <section class="cartMain">
        <div class="cartMain_hd">
            <ul class="order_lists cartTop">
                <li class="list_chk">
                    <!--所有商品全选-->
                    <input type="checkbox" id="all" class="whole_check">
                    <label for="all"></label>
                    全选
                </li>
                <li class="list_con">商品信息</li>
                <li class="list_info">商品参数</li>
                <li class="list_price">单价（元）</li>
                <li class="list_amount">加入时间</li>
                <li class="list_op">操作</li>
            </ul>
        </div>

        <div class="cartBox">
            <div class="shop_info">
            </div>
            <div class="order_content">
            		
            <c:forEach items="${requestScope.list}" var="r">
            
                <ul class="order_lists">
                    <li class="list_chk">
                        <input type="checkbox" id="checkbox_2" class="son_check">
                        <label for="checkbox_2"></label>
                    </li>
                    <li class="list_con">
                        <div class="list_img"><a href="javascript:;"><img src="${r.pics}"alt=""></a></div>
                        <div class="list_text"><a href="javascript:;">${r.fullname}</a></div>
                    </li>
                    <li class="list_info">
                        <p>￥${r.price}</p>
                    </li>
                    <li class="list_price">
                        <p class="price">￥${r.nowprice}</p>
                    </li>
                 	<li class="list_info">
                        <p>${r.date}</p>
                    </li>
                    <li class="list_op">
                        <p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p>
                    </li>
                    
                </ul>
                
                
                </c:forEach>
            </div>
        </div>

  
        <!--底部-->

    </section>
    <section class="model_bg"></section>
    <section class="my_model">
        <p class="title">删除宝贝<span class="closeModel">X</span></p>
        <p>您确认要删除该宝贝吗？</p>
        <div class="opBtn"><a href="javascript:;" class="dialog-sure">确定</a><a href="javascript:;" class="dialog-close">关闭</a></div>
    </section>
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="js/carts.js"></script>
</div>
<!--页脚-->
<div id="footCon">
	<ul>
    	<li>
        	<div class="cold"></div>
            <span></span>
            <ol>
            	<h2>18小时低温</h2>
            	<p>全程冷链配送</p>
            </ol>
        </li>
        <li>
        	<div class="wuxiu"></div>
            <span></span>
            <ol>
            	<h2>7*24小时营业</h2>
            	<p>全年无休</p>
            </ol>
        </li>
        <li>
        	<div class="baoyou"></div>
            <span></span>
            <ol>
            	<h2>满88包邮</h2>
            	<p>次日送达</p>
            </ol>
        </li>
    </ul>
    <ol>
    	<li>
        	<i></i>
            <a href="index.html">www.sweetlove.com</a>
            <div>
            	<a href="http://www.weibo.com" class="weibo"></a>
                <a href="http://wx.qq.com" class="weixin"></a>
            </div>
        </li>
        <ul>
        	<li class="text01">
            	<p>关于甜爱</p>
                <span></span>
                <a href="#">媒体报道</a>
                <a href="#">知识产权</a>
                <a href="#">加入我们</a>
            </li>
            <li>
            	<p>帮助中心</p>
                <span></span>
                <a href="#">购物指南</a>
                <a href="#">订单管理</a>
                <a href="#">常见问题</a>
            </li>
            <li>
            	<p>服务支持</p>
                <span></span>
                <a href="#">服务保障</a>
                <a href="#">用户协议</a>
                <a href="#">售后服务</a>
            </li>
            <li>
            	<p>商业合作</p>
                <span></span>
                <a href="#">集合采购</a>
                <a href="#">品牌合作</a>
                <a href="#">媒体合作</a>
            </li>
        </ul>
        <div>
        	<p>联系我们</p>
            <h2>400-8888-000</h2>
            <span>24小时服务热线</span>
            <a href="#">在线客服</a>
        </div>
    </ol>
    <div></div>
    <li>
        <p>Copyright © 2016 sweetlove.com Inc.All Rights Reserved. 北京甜爱食品有限公司</p>
        <span>版权所有 京ICP备14049645号-1 增值电信业务经营许可证：京ICP证160100号</span>
    </li>
</div>
</body>
</html>
