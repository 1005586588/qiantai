<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta name="keywords" content="甜爱，SweetLove,甜品，甜点，生日蛋糕，冰淇淋，冰品" />
<meta name="description"
	content="甜爱网上商城是专注于甜品销售、进口的网站，各种甜品、甜点齐全，还有解暑的各种冰品任顾客挑选，让他们感受到爱的温馨。">
<meta charset="utf-8">
<title>我的甜品，你的爱~</title>
<link rel="shortcut icon" href="images/logo_01.png">
<link rel="stylesheet" href="css/order.css">
<link rel="stylesheet" type="text/css" href="css/header.css" />


<script type="text/javascript">

	function aaa(code,id,amount) {
		alert("支付成功！！")
		location.href = "update1?code=" + code+ "&orders_id="+ id + "&amount="+amount;
	}
	function status3(code,id,amount) {
		alert("收货成功！！")
		location.href = "update13?code=" + code + "&orders_id="+ id + "&amount="+amount;
	}
	function status4(code,id,amount) {
		alert("退货成功！！")
		location.href = "update14?code=" + code + "&orders_id="+ id + "&amount="+amount;
	}
	
	
	function shopping(id){
		if(${sessionScope.user==null}){
			alert("请先登录！！！")
			location.href = "login2.jsp";
		}else{
		location.href = "shop?id="+id;
		}
	}
	function userinfo(id){
		if(${sessionScope.user==null}){
			alert("请先登录！！！")
			location.href = "login2.jsp";
		}else{
		location.href = "userinfo?id="+id;
		}
	}
	function order(id){
		if(${sessionScope.user==null}){
			alert("请先登录！！！")
			location.href = "login2.jsp";
		}else{
		location.href = "order?id="+id;
		}
	}
	function collect(id){
		if(${sessionScope.user==null}){
			alert("请先登录！！！")
			location.href = "login2.jsp";
		}else{
		location.href = "collect?id="+id;
		}
	}
	
	function orderinfo(id){
		
		location.href = "orderinfo?id="+id;
		
	}
	
</script>
</head>
<body>
	<div id="headCon">
		<!--页头-->
		<div class="header1">
			<div class="header1-cont">
				<div class="left">
					欢迎您来到鲜生购,&nbsp;<span><a class="a2"
						onclick="userinfo(${sessionScope.user.id});">${sessionScope.user.email}</a></span>
				</div>
				<div class="right">
					<ul>
						<c:if test="${sessionScope.user==null}">
							<li><a href="login2.jsp">登录/注册<em></em></a></li>
						</c:if>
						<li><a onclick="order(${sessionScope.user.id});">我的订单<em></em></a></li>
						<li><a onclick="shopping(${sessionScope.user.id});">购物车<em></em></a></li>
						<li><a onclick="collect(${sessionScope.user.id});">收藏夹<em></em></a></li>
						<li><a onclick="userinfo(${sessionScope.user.id});">会员中心<em></em></a></li>
						<li><a href="login2.jsp">注销<em></em></a></li>
					</ul>
					<div class="clear"></div>
				</div>
			</div>
			<div class="clear"></div>
		</div>

		<ul>
			<a href="index.html"><li></li></a>
			<ol>
				<li><a href="index.html">首页</a></li>
				<li><a href="#">西式甜品</a></li>
				<li><a href="HongKong.html">港式甜品</a></li>
				<li><a href="#">中式甜品</a></li>
				<li><a href="#">日式甜品</a></li>
				<li class="search"><input value="提拉米苏">
					<button></button></li>
			</ol>
		</ul>
	</div>
	<!--内容-->
	<div id="contentCon">
		<div class="left">
			<div></div>
			<p>晨曦夏夜</p>
			<a href="#">切换账号</a> <span></span>
			<ul>
				<li><a onclick="userinfo(${sessionScope.user.id});">个人信息</a></li>
				<li><a onclick="order(${sessionScope.user.id});" class="my">我的订单</a></li>
				<!-- 				<li><a href="#">地址管理</a></li> -->
				<li><a onclick="shopping(${sessionScope.user.id});">购物车</a></li>
				<li><a onclick="collect(${sessionScope.user.id});">收藏夹</a></li>
			</ul>
		</div>
		<div class="right">
			<ul>
				<li class="all">全部订单</li>
				<li>待付款</li>
				<li>已发货</li>
				<li>待评价</li>
				<li>售后服务</li>
			</ul>

			<c:forEach items="${requestScope.orderlist}" var="o">
			
				<ol>
					<input type="checkbox" />
					<p>${o.date}</p>
					&nbsp;&nbsp;
					<p>订单号：</p>
					<p>${o.code}</p>
					<a href="#"></a>
				</ol>
				<div>
				<c:forEach items="${requestScope.orderlist2}" var="oo">
				<c:if test="${oo.id==o.id}">
					<dd class="item clearfix"
						style="display: table; padding: 10px 0; color: #333;">
						<div class="item-row">
							<div style="margin-left: 10px">
								<div style="margin-left: 10px">
									<img src="${oo.pic}" width="70" height="80"> 	<a style="margin-left: 10px;">商品名称：${oo.fullname}</a>
								</div>
								<div style="margin-top: 27px;margin-right: 70px;font-size: 14px;color: #4c4c4c;">
									<span style="margin-left: 10px;">数量：${oo.count}</span> <span style="margin-left: 10px;">单价：${oo.nowprice}</span>
								</div>
							</div>
						</div>
					</dd>
				</c:if>
				</c:forEach>
					<ul>
						<!-- 						<a onclick="orderinfo(o.id);">查看详情</a> -->
						<li>原总价：¥${o.amount}</li>
						<li>现总价：¥${o.nowamount}</li>
						<li><a href="#">收货地址：${o.aname}&nbsp;${o.aaddr}</a></li>
						<li><a href="#">收货人：${o.uname}</a></li>
						<li><a href="#">联系电话：${o.atel}</a></li>
						<li><a href="#">评论：${o.assessstatusa}</a></li>
						<li><c:if test="${o.status==0}">
								<a href="#">状态：${o.sa}</a>
								<span>
									<button
										style="display: inline-block; margin-bottom: 0; font-size: 14px; height: 38px; line-height: 38px; text-align: center; cursor: pointer; background-color: #fff; border: 1px solid #ff4a00; color: #ff4a00; padding: 0; width: 148px;"
										onclick="aaa('${o.code}',${o.id},${o.nowamount});">支付</button>
								</span>
							</c:if> <c:if test="${o.status==2}">
								<a href="#">状态：${o.sa}</a>
								<span>
									<button
										style="display: inline-block; margin-bottom: 0; font-size: 14px; height: 38px; line-height: 38px; text-align: center; cursor: pointer; background-color: #fff; border: 1px solid #ff4a00; color: #ff4a00; padding: 0; width: 148px;"
										onclick="status3('${o.code}',${o.id},${o.nowamount});">收货</button>
								</span>
							</c:if> <c:if test="${o.status==1}">
								<a href="#">状态：${o.sa}</a>
							</c:if> <c:if test="${o.status==3}">
								<a href="#">状态：${o.sa}</a>
								<span>
									<button
										style="display: inline-block; margin-bottom: 0; font-size: 14px; height: 38px; line-height: 38px; text-align: center; cursor: pointer; background-color: #fff; border: 1px solid #ff4a00; color: #ff4a00; padding: 0; width: 148px;"
										onclick="status4('${o.code}',${o.id},${o.nowamount});">退货</button>
								</span>
							</c:if> <c:if test="${o.status==4}">
								<a href="#">状态：${o.sa}</a>
							</c:if> <c:if test="${o.status==5}">
								<a href="#">状态：${o.sa}</a>
							</c:if></li>
					</ul>
				</div>
			</c:forEach>
		</div>
		<ol>
			<a href="#" id="left"><li>&lt;</li></a>
			<a href="#" id="NO1"><li>1</li></a>
			<a href="#"><li>2</li></a>
			<a href="#"><li>3</li></a>
			<a href="#"><li>...</li></a>
			<a href="#"><li>10</li></a>
			<a href="#" id="right"><li>&gt;</li></a>
		</ol>

	</div>
	<!--页脚-->
	<div id="footCon">
		<ul>
			<li>
				<div class="cold"></div> <span></span>
				<ol>
					<h2>18小时低温</h2>
					<p>全程冷链配送</p>
				</ol>
			</li>
			<li>
				<div class="wuxiu"></div> <span></span>
				<ol>
					<h2>7*24小时营业</h2>
					<p>全年无休</p>
				</ol>
			</li>
			<li>
				<div class="baoyou"></div> <span></span>
				<ol>
					<h2>满88包邮</h2>
					<p>次日送达</p>
				</ol>
			</li>
		</ul>
		<ol>
			<li><i></i> <a href="index.html">www.sweetlove.com</a>
				<div>
					<a href="http://www.weibo.com" class="weibo"></a> <a
						href="http://wx.qq.com" class="weixin"></a>
				</div></li>
			<ul>
				<li class="text01">
					<p>关于甜爱</p> <span></span> <a href="#">媒体报道</a> <a href="#">知识产权</a>
					<a href="#">加入我们</a>
				</li>
				<li>
					<p>帮助中心</p> <span></span> <a href="#">购物指南</a> <a href="#">订单管理</a>
					<a href="#">常见问题</a>
				</li>
				<li>
					<p>服务支持</p> <span></span> <a href="#">服务保障</a> <a href="#">用户协议</a>
					<a href="#">售后服务</a>
				</li>
				<li>
					<p>商业合作</p> <span></span> <a href="#">集合采购</a> <a href="#">品牌合作</a>
					<a href="#">媒体合作</a>
				</li>
			</ul>
			<div>
				<p>联系我们</p>
				<h2>400-8888-000</h2>
				<span>24小时服务热线</span> <a href="#">在线客服</a>
			</div>
		</ol>
		<div></div>
		<li>
			<p>Copyright © 2016 sweetlove.com Inc.All Rights Reserved.
				北京甜爱食品有限公司</p> <span>版权所有 京ICP备14049645号-1
				增值电信业务经营许可证：京ICP证160100号</span>
		</li>
	</div>
</body>
</html>
