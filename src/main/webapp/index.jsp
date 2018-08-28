<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="css/header.css" />
<link rel="stylesheet" type="text/css" href="css/homepage.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<style type="text/css">
.header3 .header3-cont ul .l3 {
	color: #D63A3B;
}
</style>


<script type="text/javascript">
$(document).ready(function() {

if(${requestScope.typelist==null}||${requestScope.list==null}){
window.location.href = "index";
}

});
</script>


</head>
<body>


	<div class="box">
		<div class="header">
			<div class="header1">
				<div class="header1-cont">
					<div class="left">
						欢迎您来到鲜生购,&nbsp;<span><a class="a2">徐晓良良良</a></span>
					</div>
					<div class="right">
						<ul>
							<li>我的订单<em></em></li>
							<li><a href="shopping.html">购物车<em></em></a></li>
							<li>收藏夹<em></em></li>
							<li><a href="The member center.html">会员中心<em></em></li>
							</a>
							<li>客户服务<em></em></li>
						</ul>
						<div class="clear"></div>

					</div>

				</div>
				<div class="clear"></div>

			</div>
			<div class="header2">
				<div class="header2-cont">
					<a href="index.html"><img src="img/images/gengduo_03.png" /></a>
					<!--172*62-->
					<div class="sousuo">
						<div class="sousuo-up">
							<input type="text" name="" id="" value="" placeholder="泰国榴莲" />
							<em></em>
							<p>搜索</p>
						</div>
						<div class="sousuo-down">
							<ul>
								<li><a class="red" href="">热门：</a></li>
								<li><a class="red" href="">牛油果</a></li>
								<li><a href="">草莓</a></li>
								<li><a a class="red" href="">草莓</a></li>
								<li><a href="">三文鱼</a></li>
								<li><a a class="red" href="">有机菠菜</a></li>
								<li><a href="">蓝莓</a></li>
								<li><a class="red" href="">百香果</a></li>
								<li><a href="">牛肉</a></li>
							</ul>
							<div class="clear"></div>
						</div>

					</div>
					<div class="gouwuche">
						<a href="shopping.html"><em></em></a><span>购物车</span>
					</div>
				</div>
				<div class="clear"></div>

			</div>
			<div class="header3">
				<div class="header3-cont">
					<ul>
						<li class="l1">全部分类</li>
						<div class="all">
							<dl>
								 <c:forEach items="${requestScope.typelist}" var="r">
								 <c:if test="${r.parentid==0}">
								    <dt>${r.name}</dt>
								 </c:if>
								 <c:forEach items="${requestScope.typelist}" var="rr">
								 <c:if test="${rr.parentid==r.id}">
								 <dd> 
								 	<a href="">${rr.name}</a>
								 </dd>
								 </c:if>
								 </c:forEach>
								 </c:forEach>
							</dl>
							<div class="more">
								更多<em></em>
							</div>
						</div>
						<li class="l2 l3">首页</li>
						<li class="l2">主厨先生</li>
						<li class="l2">每日推荐</li>
						<li class="l2">会员专享</li>
						<li class="l2">品质保障</li>
					</ul>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="banner">
			<img src="img/banner.png" /> <img src="img/images/badjksa_02.png" />
			<img src="img/images/badjksa_02.png" />
			<ul>
				<li class="current"></li>
				<li></li>
				<li></li>
			</ul>
		</div>
		<script type="text/javascript">
			var n = 0
			function again() {
				$('.banner img').last().animate(
						{
							'marginLeft' : '-1349',
							opacity : '0'
						},
						1500,
						function() {
							$(this).css({
								opacity : '1',
								'marginLeft' : '0'
							});
							$('.banner').prepend($('.banner img').last())
							if (n < $('.banner ul li').length - 1) {
								n++;
								$('.banner ul li').eq(n).addClass(
										'.banner ul current').siblings()
										.removeClass('.banner ul current');
							} else {
								n = 0;
								$('.banner ul li').eq(n).addClass(
										'.banner ul current').siblings()
										.removeClass('.banner ul current');
							}
						})
			}
			setInterval(again, 1800);
		</script>
	</div>
	<div class="box2">
		<div class="banner-small">
			<div class="every">
				<p>
					<img src="img/mr.png" />
				</p>
				<p>每日推荐</p>
			</div>
			<div class="s1">
				<a href="Detail page.html"><img src="img/jiulian.png" /></a>
			</div>
			<div class="s1">
				<a href=""><img src="img/s2.png" /></a>
			</div>
			<div class="s1">
				<a href=""><img src="img/s3.png" /></a>
			</div>
			<div class="s1">
				<a href=""><img src="img/xiaolongxia.png" /></a>
			</div>
		</div>
		<div class="clear"></div>
		<script type="text/javascript">
			$('.header1-cont .left .a1').click(function() {
				$('.tanchu').css('display', 'block')
			})
			$('.close').click(function() {
				$('.tanchu').css('display', 'none')
			})
		</script>

		<!--新品上市-->
		<c:forEach items="${requestScope.list}" var="r">
			<div class="xpss">
				<div class="xpss1">
					<p class="p1 ">${r.tname}</p>
					<p class="p2 ">
						<a href="">更多<em></em></a>
					</p>
				</div>
				<div class="clear"></div>
				<div class="xpss2">
					<a class="a1" href=""><img src="img/xp1.png" /></a> <a class="a2"
						href=""> <em></em>
						<p class="p1">
							<img src="${r.pics}" width="60" height="90" />
						</p>
						<p class="p2">${r.fullname}</p>
						<p class="p3">${r.tip}</p>
						<p class="p4">${r.price}</p>
						<p class="p5">
							已售<span>${r.salecount}</span>件
						</p>
					</a>
				</div>
				<div class="clear"></div>
			</div>
		</c:forEach>




		<!--品牌专卖-->
		<div class="xpss">
			<div class="xpss-pp">
				<p class="p1 ">品牌专卖</p>
				<p class="p2 ">
					<a href="">更多<em></em></a>
				</p>
			</div>
			<div class="clear"></div>
			<div class="xpss2">
				<a class="a1" href=""><img src="img/pp1.png" /></a> <a
					href="fruit.html"><img src="img/pp2.png" /></a> <a class="a2"
					href="">

					<p class="p1">
						<img src="img/images/150140_20.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2" href="">

					<p class="p1">
						<img src="img/images/150140_22.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2" href="">

					<p class="p1">
						<img src="img/images/150140_24.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a>

			</div>
			<div class="ppzm-3">
				<a href=""><img src="img/pp8.png" /></a> <a class=""><img
					src="img/pp4.png" /></a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_03.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_05.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_08.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a>
			</div>
			<div class="clear"></div>
			<div class="banner2">
				<img src="img/banner2.png" />

			</div>
		</div>
		<!--水果专场-->
		<div class="fruit">
			<div class="title">
				<a href="fruit.html"><p class="p1 ">水果专场</p></a>
				<p class="p2 ">
					<a href="">更多<em></em></a>
				</p>
			</div>
			<div class="content1">
				<a href=""><img src="img/gdi.png" /></a> <a href=""><img
					src="img/sdhfg.png" /></a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_14.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_17.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a>
			</div>
			<div class="content2">
				<div class="left">
					<div class="up">
						<ul>
							<li><a href="">草莓</a></li>
							<li><a href="">香蕉</a></li>
							<li><a href="">牛油果</a></li>
							<li><a href="">橙子</a></li>
							<li><a href="">柚子</a></li>
							<li><a href="">芒果</a></li>
							<li><a href="">西瓜</a></li>
						</ul>
						<ul>
							<li><a href="">草莓</a></li>
							<li><a href="">香蕉</a></li>
							<li><a href="">牛油果</a></li>
							<li><a href="">橙子</a></li>
							<li><a href="">柚子</a></li>
							<li><a href="">芒果</a></li>
							<li><a href="">西瓜</a></li>
						</ul>
						<ul>
							<li><a href="">草莓</a></li>
							<li><a href="">香蕉</a></li>
							<li><a href="">牛油果</a></li>
							<li><a href="">橙子</a></li>
							<li><a href="">柚子</a></li>
							<li><a href="">芒果</a></li>
							<li><a href="">西瓜</a></li>
						</ul>
					</div>
					<div class="down">
						<p class="p1">今日鲜果快讯</p>
						<p class="p2">
							<span>【水果知多少】</span>大家了解水果的基础分类吗？水果分为三类:酸性、 亚酸性、甜性。 酸性水果:
							葡萄柚、橘子、凤梨、奇异果、柠檬、 酸苹果、草莓、酸李 亚酸性水果:苹果、芒果、杏子、木瓜、 葡萄、桃子等。
						</p>
					</div>

				</div>
				<a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_22.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_25.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2" href="">
					<p class="p1">
						<img src="img/images/130120_27.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2" href="">
					<p class="p1">
						<img src="img/images/130120_30.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a>
			</div>
		</div>
		<!--蔬菜专场-->
		<div class="vegetable">
			<div class="title">
				<p class="p1 ">蔬菜专场</p>
				<p class="p2 ">
					<a href="">更多<em></em></a>
				</p>
			</div>
			<div class="content1-v">
				<a href=""><img src="img/gdiu.png" /></a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_36.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2"> <img src="img/ijhfd.png" />
				</a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_38.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_41.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a>
			</div>
			<div class="content2-v">
				<div class="left">
					<div class="up">
						<ul>
							<li><a href="">草莓</a></li>
							<li><a href="">香蕉</a></li>
							<li><a href="">牛油果</a></li>
							<li><a href="">橙子</a></li>
						</ul>
						<ul>
							<li><a href="">草莓</a></li>
							<li><a href="">香蕉</a></li>
							<li><a href="">牛油果</a></li>
							<li><a href="">橙子</a></li>
						</ul>
						<ul>
							<li><a href="">草莓</a></li>
							<li><a href="">香蕉</a></li>
							<li><a href="">牛油果</a></li>
							<li><a href="">橙子</a></li>
						</ul>
					</div>
					<div class="down">
						<p class="p1">今日鲜果快讯</p>
						<p class="p2">
							<span>【水果知多少】</span>大家了解水果的基础分类吗？水果分为三类:酸性、 亚酸性、甜性。 酸性水果:
							葡萄柚、橘子、柠檬等。
						</p>
					</div>
				</div>
				<a class="a2" href="">
					<p class="p1">
						<img src="img/images/130120_47.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2" href="">
					<p class="p1">
						<img src="img/images/130120_50.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2" href="">
					<p class="p1">
						<img src="img/images/130120_53.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2" href="">
					<p class="p1">
						<img src="img/images/130120_55.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2" href="">
					<p class="p1">
						<img src="img/images/130120_45.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a>
			</div>
			<div class="clear"></div>
		</div>
		<!--海鲜水产-->
		<div class="fish">
			<div class="title">
				<p class="p1 ">海鲜水产</p>
				<p class="p2 ">
					<a href="">更多<em></em></a>
				</p>
			</div>
			<div class="content1-v">
				<a href=""><img src="img/hdsjkf.png" /></a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_62.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_64.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2"> <img src="img/gsjabfdf.png" />
				</a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_67.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a>
			</div>
			<div class="content2-v">
				<div class="left">
					<div class="up">
						<ul>
							<li><a href="">草莓</a></li>
							<li><a href="">香蕉</a></li>
							<li><a href="">牛油果</a></li>
							<li><a href="">橙子</a></li>
						</ul>
						<ul>
							<li><a href="">草莓</a></li>
							<li><a href="">香蕉</a></li>
							<li><a href="">牛油果</a></li>
							<li><a href="">橙子</a></li>
						</ul>
						<ul>
							<li><a href="">草莓</a></li>
							<li><a href="">香蕉</a></li>
							<li><a href="">牛油果</a></li>
							<li><a href="">橙子</a></li>
						</ul>
					</div>
					<div class="down">
						<p class="p1">今日鲜果快讯</p>
						<p class="p2">
							<span>【水果知多少】</span>大家了解水果的基础分类吗？水果分为三类:酸性、 亚酸性、甜性。 酸性水果:
							葡萄柚、橘子、柠檬等。
						</p>
					</div>
				</div>
				<a class="a2" href="">
					<p class="p1">
						<img src="img/images/130120_72.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2" href="">
					<p class="p1">
						<img src="img/images/130120_74.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2" href="">
					<p class="p1">
						<img src="img/images/130120_76.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2" href="">
					<p class="p1">
						<img src="img/images/130120_77.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2" href="">
					<p class="p1">
						<img src="img/images/130120_79.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a>

			</div>
			<div class="clear"></div>

		</div>

		<!--猪牛羊肉-->
		<div class="meat">
			<div class="title">
				<p class="p1">猪牛羊肉</p>
				<p class="p2 ">
					<a href="">更多<em></em></a>
				</p>
			</div>
			<div class="content1-v">
				<a href=""><img src="img/hdsgf.png" /></a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_03.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_103.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_108.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_87.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a1" href="">
					<p class="p1">
						<img src="img/images/130120_89.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a>


			</div>
			<div class="content2-v">
				<div class="left">
					<div class="up">
						<ul>
							<li><a href="">草莓</a></li>
							<li><a href="">香蕉</a></li>
							<li><a href="">牛油果</a></li>
							<li><a href="">橙子</a></li>


						</ul>
						<ul>
							<li><a href="">草莓</a></li>
							<li><a href="">香蕉</a></li>
							<li><a href="">牛油果</a></li>
							<li><a href="">橙子</a></li>


						</ul>
						<ul>
							<li><a href="">草莓</a></li>
							<li><a href="">香蕉</a></li>
							<li><a href="">牛油果</a></li>
							<li><a href="">橙子</a></li>
						</ul>
					</div>
					<div class="down">
						<p class="p1">今日鲜果快讯</p>
						<p class="p2">
							<span>【水果知多少】</span>大家了解水果的基础分类吗？水果分为三类:酸性、 亚酸性、甜性。 酸性水果:
							葡萄柚、橘子、柠檬等。
						</p>
					</div>

				</div>
				<a class="a2" href="">
					<p class="p1">
						<img src="img/gdf.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2" href="">
					<p class="p1">
						<img src="img/gdf.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2" href="">
					<p class="p1">
						<img src="img/gdf.png" />
					</p>
					<p class="p2">绿鲜知 四季荷兰豆500g</p>
					<p class="p3">绿色农场采摘 健康有机</p>
					<p class="p4">￥15.8</p>
					<p class="p5">
						已售<span>1230</span>件
					</p>
				</a> <a class="a2"> <img src="img/sgsd.png" />
				</a>

			</div>
			<div class="clear"></div>

		</div>
		<footer>
			<div class="up">
				<ul class="cont">
					<li class="l1"><a href=""><span class="s1"></span><i
							class="i1">顺丰包邮</i></a></li>
					<li class="l1"><a href=""><span class="s2"></span><i
							class="i1">同城次日到达</i></a></li>
					<li class="l1"><a href=""><span class="s3"></span><i
							class="i1">7天无理由退换货</i></a></li>
					<li class="l1"><a href=""><span class="s4"></span><i
							class="i1">线下体验店</i></a></li>
					<li class="l2">
						<p class="p1">24小时全国服务热线</p>
						<p class="p2">400-888-8888</p>
						<p class="p3">
							<a href=""><span class="s5"></span><i class="i2">联系客服</i></a>
						</p>
					</li>

				</ul>
				<div class="clear"></div>
			</div>
			<div class="down">
				<div class="one">
					<ol>
						<dt>
							<a href="">购物指南</a>
						</dt>
						<dd>
							<a href="">购物流程</a>
						</dd>
						<dd>
							<a href="">支付方式</a>
						</dd>
					</ol>
					<ol>
						<dt>
							<a href="">购物指南</a>
						</dt>
						<dd>
							<a href="">购物流程</a>
						</dd>
						<dd>
							<a href="">支付方式</a>
						</dd>
					</ol>
					<ol>
						<dt>
							<a href="">购物指南</a>
						</dt>
						<dd>
							<a href="">购物流程</a>
						</dd>
						<dd>
							<a href="">支付方式</a>
						</dd>
					</ol>
					<ol>
						<dt>
							<a href="">购物指南</a>
						</dt>
						<dd>
							<a href="">购物流程</a>
						</dd>
						<dd>
							<a href="">支付方式</a>
						</dd>
					</ol>
					<ol>
						<dt>
							<a href="">购物指南</a>
						</dt>
						<dd>
							<a href="">购物流程</a>
						</dd>
						<dd>
							<a href="">支付方式</a>
						</dd>
					</ol>

					<div class="ew1">
						<p>
							<img src="img/er.png" />
						</p>
						<p>鲜生购公众号</p>

					</div>
					<div class="ew2">
						<p>
							<img src="img/er.png" />
						</p>
						<p>鲜生购APP</p>
					</div>
				</div>
				<div class="clear"></div>
				<div class="two"></div>
				<div class="three">
					<span>网络文化经营许可证：19333520156</span> <span>鲁公网安备：25854651152</span> <span>违法和不良信息举报电话：110</span>
					<span>消费者维权电话：12305</span>
					<p>Copyright&nbsp;©&nbsp;2010-2020&nbsp;xianshenggou.com&nbsp;版权所有</p>
				</div>
		</footer>

	</div>

</body>
</html>
