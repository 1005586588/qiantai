<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="css/header.css" />
<link rel="stylesheet" type="text/css" href="css/shopping.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script src="js/jquery-3.1.1.min.js"></script>

</head>

<script type="text/javascript">
	function orders() {
		var ids = [];
		var sids = [];
		$(".chk").each(function() {
			if ($(this).prop("checked")) {
				ids.push($(this).attr("myid"));
				sids.push($(this).attr("sid"));
			}
		});
		if (ids.length == 0) {
			alert("请选择行!");
			return;
		}
		var allcount = $(".s7").text();
		allcount = parseFloat(allcount.substring(1));
		var allcount2 = $(".s77").text();
		allcount2 = parseFloat(allcount2.substring(1));
		var id = ${sessionScope.user.id};
	
		location.href = "orders?ids=" + ids + "&id=" + id + "&allcount="
				+ allcount+"&allcount2="+allcount2 +"&sid="+sids;
	}
	

	// 	function MYsubmit() {
	// 		var data = [];
	// 		$(".down1").each(function() {
	// 			var id = $(this).attr("myid");
	// 			var count = $(this).find(".n2").text();
	// 			var row = {
	// 				id : id,
	// 				count : count
	// 			};
	// 			data.push(row);
	// 		});
	// 		alert(data[1].id);
	// 		$.ajax({
	// 			type : "POST",
	// 			url : "orders",
	// 			contentType : "application/json; charset=utf-8",
	// 			data : JSON.stringify(data),
	// 			dataType : "json",
	// 			success : function(json) {
	// 				if (json.status > 0) {
	// 					alert(1);
	// 				}
	// 			}
	// 		});
	// 	}

	
	function changercount(id, count) {
		
		$.ajax({
				url : "changercount",
				type : "POST",
				data : {product_id:id,count:count},
				success : function(json) {
					if(json==0)
					alert("失败");
				}
			});
	}

	function alljs() {
		var a=0;
		var all = 0;
		var all2 = 0;
		$(".chk").each(function() {
			if ($(this).prop("checked")) {
				a=a+1;
				var parent = $(this).parents(".down1");
				var amount = parent.find(".l7").text();
				amount = parseFloat(amount.substring(1));
				
				
				var amount2 = parent.find(".l4").text();
				amount2 = parseFloat(amount2.substring(1));
				var scount2 = parent.find(".n2").text();
				
				all += amount;
				all2 = all2+(scount2*amount2);
			}
		});
		$(".s7").text("￥" + all);
		$(".s44").text(a);
		$(".s77").text("￥" + all2);
	}

		function del(id) {
			if (confirm("确认删除？")) {
			$.post("shopcardelet", {id : id}, function(json) {
				if(json==1){
					alert("删除成功！");
				}
			}, "json")
		}
	}

	$(function() {

		$(".zchk").on("click", function() {
			if (event.target.checked) {
				$(".chk").prop("checked", "checked");
				alljs();
			} else {
				$(".chk").prop("checked", "");
				alljs();
			}
		})

		$(".chk").on("click", function() {
			alljs();

		});
		$(".del").on("click", function() {
			var parent = $(event.target).parents(".down1");
			var id = parent.attr("myid");
			$(event.target).parents(".down1").remove();
			// 			del(id);
			alljs();
		});

		$(".n1").on("click", function() {
			var count = parseInt($(event.target).next().text());
			if (count > 1)
				$(event.target).next().text("" + (--count));
			var parent = $(event.target).parents(".down1");
			var id = parent.attr("myid");
			var price = parent.find(".l5").text();
			price = parseFloat(price.substring(1));
			parent.find(".l7").text("￥" + (count * price).toFixed(2));
			changercount(id, count);
			alljs();
		});
		$(".n3").on("click", function() {
			var count = parseInt($(event.target).prev().text());
			var parent = $(event.target).parents(".down1");
			$(event.target).prev().text("" + (++count));
			var id = parent.attr("myid");
			var price = parent.find(".l5").text();
			price = parseFloat(price.substring(1));
			parent.find(".l7").text("￥" + (count * price).toFixed(2));
			changercount(id, count);
			alljs();
		});
	});
	
	
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
</script>
<script language="JavaScript" type="text/javascript">
	
</script>
<body>
	<div class="box">
		<!--头部-->
		<div class="header">


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



			<div class="header2">
				<div class="header2-cont">
					<a href="index.html"><img src="img/images/gengduo_03.png" /></a>
					<!--172*62-->
					<div class="sousuo">
						<div class="sousuo-up">
							<form action="select" method="post">
								<input type="text" name="txt" id="" value="" placeholder="泰国榴莲" />
								<em></em>
								<button
									style="cursor: pointer; font-size: 14px; color: #ffffff; line-height: 28px; width: 60px; height: 28px; text-align: center; background: #D63A3B; position: absolute; top: 0; right: 0;"
									type="submit">查询</button>
							</form>
						</div>
						<div class="sousuo-down">
							<ul>
								<li><a class="red" href="">热门：</a></li>
								<li><a class="red" href="">牛油果</a></li>
								<li><a href="">草莓</a></li>
								<li><a class="red" href="">草莓</a></li>
								<li><a href="">三文鱼</a></li>
								<li><a class="red" href="">有机菠菜</a></li>
								<li><a href="">蓝莓</a></li>
								<li><a class="red" href="">百香果</a></li>
								<li><a href="">牛肉</a></li>
							</ul>
							<div class="clear"></div>
						</div>

					</div>
					<div class="gouwuche">
						<em onclick="shopping(${sessionScope.user.id});"></em><span
							onclick="shopping(${sessionScope.user.id});">购物车</span>
					</div>
				</div>
				<div class="clear"></div>
			</div>


			<div class="header3">
				<div class="header3-cont">
					<ul>
						<li class="l1">全部分类</li>
						<li class="l2">首页</li>
						<li class="l2">主厨先生</li>
						<li class="l2">每日推荐</li>
						<li class="l2">会员专享</li>
						<li class="l2">品质保障</li>
					</ul>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<!--导航横线-->
		<div class="line"></div>
		<div class="cont-shopping">
			<div class="all">
				<input type="checkbox" class="zchk" name="" id="" value="" /><span
					class="s1">全选</span><span class="s2">商品信息</span><span class="s3">原价格</span>
				<span class="s4">现价格(元)</span><span class="s5">数量</span><span
					class="s6">小计</span><span style="margin-left: 115px;">操作</span>
			</div>
			<!--天天新鲜-->

			<div class="thing">
				<c:forEach items="${requestScope.carlist}" var="c">

					<ul class="down1" myid="${c.id}">

						<li class="l1"><input type="checkbox" class="chk"
							 myid="${c.id}" sid="${c.sid}" name="" id="" value="" /></li>
						<li class="l2"><img src="${c.pic}"
							style="width: 94px; height: 86px;" /></li>
						<li class="l3"><a href="info?id=${c.id}"><p
									style="margin-left: 30px; width: 120px">${c.fullname}</p></a></li>
						<li class="l4">￥${c.price}</li>
						<li class="l5" style="margin-left: 120px;">￥${c.nowprice}</li>
						<li class="l6" style="margin-left: 70px;"><span class="n1">-</span> <span class="n2">${c.scount}</span>
							<span class="n3">+</span></li>

						<li class="l7">￥${c.scount*c.nowprice}</li>
						<li class="l8">
						
							<p class="del" style="margin-top:20px " onclick="del(${c.sid});">删除</p>
						</li>
					</ul>
				</c:forEach>
			</div>

			<div class="all2">
				<input type="checkbox" name="" id="" value="" /><span class="s1">全选</span>
				<span class="s2">删除选中商品</span><span class="s3 "
					style="margin-left: 230px;">已选中商品</span> <span class="s4 s44">0</span><span
					class="s5">件</span> <span class="s6">原总价(元)：</span> <span
					class=" s77">￥0</span> <span class="s6">现总价(元)：</span> <span
					class="s7">￥0</span><span class="s8" onclick="orders()">结算</span>
			</div>
		</div>

		<!--footer-->
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
			</div>
		</footer>
	</div>
</body>
</html>
