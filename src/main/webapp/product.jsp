<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>产品详情</title>
<link rel="stylesheet" type="text/css" href="css/product.css">
<script src="js/jquery.min.1.11.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
	// 图片上下滚动
	var count = $("#imageMenu li").length - 5; /* 显示 6 个 li标签内容 */
	var interval = $("#imageMenu li:first").width();
	var curIndex = 0;
	
	$('.scrollbutton').click(function(){
		if( $(this).hasClass('disabled') ) return false;
		
		if ($(this).hasClass('smallImgUp')) --curIndex;
		else ++curIndex;		
		$("#imageMenu ul").stop(false, true).animate({"marginLeft" : -curIndex*interval + "px"}, 600);
	});	
	// 解决 ie6 select框 问题
	$.fn.decorateIframe = function(options) {
        if ($.browser.msie && $.browser.version < 7) {
            var opts = $.extend({}, $.fn.decorateIframe.defaults, options);
            $(this).each(function() {
                var $myThis = $(this);
                //创建一个IFRAME
                var divIframe = $("<iframe />");
                divIframe.attr("id", opts.iframeId);
                divIframe.css("position", "absolute");
                divIframe.css("display", "none");
                divIframe.css("display", "block");
                divIframe.css("z-index", opts.iframeZIndex);
                divIframe.css("border");
                divIframe.css("top", "0");
                divIframe.css("left", "0");
                if (opts.width == 0) {
                    divIframe.css("width", $myThis.width() + parseInt($myThis.css("padding")) * 2 + "px");
                }
                if (opts.height == 0) {
                    divIframe.css("height", $myThis.height() + parseInt($myThis.css("padding")) * 2 + "px");
                }
                divIframe.css("filter", "mask(color=#fff)");
                $myThis.append(divIframe);
            });
        }
    }
    $.fn.decorateIframe.defaults = {
        iframeId: "decorateIframe1",
        iframeZIndex: -1,
        width: 0,
        height: 0
    }
    //放大镜视窗
    $("#bigView").decorateIframe();
    //点击到中图
    var midChangeHandler = null;
	
    $("#imageMenu li img").bind("click", function(){
		if ($(this).attr("id") != "onlickImg") {
			midChange($(this).attr("src").replace("small", "mid"));
			$("#imageMenu li").removeAttr("id");
			$(this).parent().attr("id", "onlickImg");
		}
	}).bind("mouseover", function(){
		if ($(this).attr("id") != "onlickImg") {
			window.clearTimeout(midChangeHandler);
			midChange($(this).attr("src").replace("small", "mid"));
			$(this).css({ "border": "3px solid #959595" });
		}
	}).bind("mouseout", function(){
		if($(this).attr("id") != "onlickImg"){
			$(this).removeAttr("style");
			midChangeHandler = window.setTimeout(function(){
				midChange($("#onlickImg img").attr("src").replace("small", "mid"));
			}, 1000);
		}
	});
    function midChange(src) {
        $("#midimg").attr("src", src).load(function() {
            changeViewImg();
        });
    }
    //大视窗看图
    function mouseover(e) {
        if ($("#winSelector").css("display") == "none") {
            $("#winSelector,#bigView").show();
        }
        $("#winSelector").css(fixedPosition(e));
        e.stopPropagation();
    }
    function mouseOut(e) {
        if ($("#winSelector").css("display") != "none") {
            $("#winSelector,#bigView").hide();
        }
        e.stopPropagation();
    }
    $("#midimg").mouseover(mouseover); //中图事件
    $("#midimg,#winSelector").mousemove(mouseover).mouseout(mouseOut); //选择器事件

    var $divWidth = $("#winSelector").width(); //选择器宽度
    var $divHeight = $("#winSelector").height(); //选择器高度
    var $imgWidth = $("#midimg").width(); //中图宽度
    var $imgHeight = $("#midimg").height(); //中图高度
    var $viewImgWidth = $viewImgHeight = $height = null; //IE加载后才能得到 大图宽度 大图高度 大图视窗高度

    function changeViewImg() {
        $("#bigView img").attr("src", $("#midimg").attr("src").replace("mid", "big"));
    }
    changeViewImg();
    $("#bigView").scrollLeft(0).scrollTop(0);
    function fixedPosition(e) {
        if (e == null) {
            return;
        }
        var $imgLeft = $("#midimg").offset().left; //中图左边距
        var $imgTop = $("#midimg").offset().top; //中图上边距
        X = e.pageX - $imgLeft - $divWidth / 2; //selector顶点坐标 X
        Y = e.pageY - $imgTop - $divHeight / 2; //selector顶点坐标 Y
        X = X < 0 ? 0 : X;
        Y = Y < 0 ? 0 : Y;
        X = X + $divWidth > $imgWidth ? $imgWidth - $divWidth : X;
        Y = Y + $divHeight > $imgHeight ? $imgHeight - $divHeight : Y;

        if ($viewImgWidth == null) {
            $viewImgWidth = $("#bigView img").outerWidth();
            $viewImgHeight = $("#bigView img").height();
            if ($viewImgWidth < 200 || $viewImgHeight < 200) {
                $viewImgWidth = $viewImgHeight = 800;
            }
            $height = $divHeight * $viewImgHeight / $imgHeight;
            $("#bigView").width($divWidth * $viewImgWidth / $imgWidth);
            $("#bigView").height($height);
        }
        var scrollX = X * $viewImgWidth / $imgWidth;
        var scrollY = Y * $viewImgHeight / $imgHeight;
        $("#bigView img").css({ "left": scrollX * -1, "top": scrollY * -1 });
        $("#bigView").css({ "top": 480, "left": $(".preview").offset().left + $(".preview").width() + 45 });

        return { left: X, top: Y };
    }
  /**
             * click  outline,衣服规格
             */
            var $clothType = $('.cloth_type').children('li');
            var $colorType = $('.color_type');
            $clothType.click(function () {
                var that = $(this);
                $clothType.css('outline' , 'none');
                select_line(that)
            });
            $colorType.click(function () {
                var that = $(this);
                $colorType.css('outline' , 'none');
                select_line(that)
            });

 			/**
             * input value购买数量
             */

            $('#des_num').val(1);
            $num = $('#des_num').val();
            var $up = $('#num_up');
            var $down = $('#num_down');

            $up.click(function () {inputNum(1)});
            $down.click(function () {inputNum(-1)});

        function select_line(a1) {
            a1.css('outline' , 'none');
            a1.css('outline' , '#8aa8e5 2px solid');
        }

        function inputNum(a1) {
            var a2 = parseInt(a1);
            $num = parseInt($num);
            $num += a2;
            if ($num > 0){
                $('#des_num').val($num);
            }else {
                $num = 1;
            }
        }
});

		function addcar(){
			
			if(${sessionScope.user==null}){
				alert("请先登录！！！")
				location.href = "login2.jsp";
			}else{
				var product_id=${requestScope.product.id};
				var user_id=${sessionScope.user.id};
				var count=parseInt($(".n2").text());
				location.href = "addcar?product_id="+product_id +"&user_id="+user_id+"&count="+count;
				alert("成功添加到购物车！！！")
			}
		};
		
function sendorder(){
			
			if(${sessionScope.user==null}){
				alert("请先登录！！！")
				location.href = "login2.jsp";
			}else{
				var allcount=${requestScope.product.nowprice};
				var allcount2=${requestScope.product.price};
				var product_id=${requestScope.product.id};
				var user_id=${sessionScope.user.id};
				location.href = "orders1?ids="+product_id +"&id="+user_id+ "&allcount="
				+ allcount+"&allcount2="+allcount2 ;
			}
		};
		
function shoucang(){
			
			if(${sessionScope.user==null}){
				alert("请先登录！！！")
				location.href = "login2.jsp";
			}else{
			
				var product_id=${requestScope.product.id};
				var user_id=${sessionScope.user.id};
				location.href = "shoucang?product_id="+product_id +"&user_id="+user_id ;
			}
		};
		
		
		
$(function() {
			$(".n1").click(function() {
				var count = parseInt($(event.target).next().text());
				if (count > 1)
					$(event.target).next().text("" + (--count));
				var parent = $(event.target).parents(".down1");
			});
			
			$(".n3").click(function() {
				var count = parseInt($(event.target).prev().text());
				var parent = $(event.target).parents(".down1");
				$(event.target).prev().text("" + (++count));
			});
			
});	
</script>
<body>
	<!---head--------->
	<div class="header">
		<div class="box">
			<div class="title">
				<img class="images01" src="images/logo01.jpg" alt="这是一张图片"> <a
					href="index.html"><div>菲兹首页</div></a> <a href="user.html"><p>
						<span>crazy</span>
					</p></a> <a href="user.html"><p>积分13</p></a> <a href="#"><p>消息</p></a> <a
					href="#"><p>我的收藏</p></a> <a href="orders.html"><p>
						<img src="images/logo02.jpg">我的订单
					</p></a> <a href="shopping.html"><p>
						<img src="images/logo03.jpg">购物篮
					</p></a>
			</div>
		</div>
		<div class="logoCon">
			<img src="images/logodianming.jpg" alt="这是一张图片"> <input
				id="souCang" type="submit" value="+收藏">
			</form>
			<form>
				<input id="search" type="text" value="" placeholder="输入你想要的商品"><input
					id="souSuo" type="submit" value="搜索">
			</form>
		</div>
	</div>
	<!-----图片------>
	<div class="pic">
		<img src="images/images51.jpg" alt="这是一张图片">
	</div>
	<!----导航部分-------------------------->
	<div class="navCon">
		<ul class="nav">
			<a class="active" href="#">首页</a>
			<a href="#"> 所有宝贝</a>
			<a href="#">毛呢外套</a>
			<a href="#">羽绒服</a>
			<a href="#">棉服</a>
			<a href="#">连衣裙</a>
			<a href="#">卫衣</a>
			<a href="#">毛衣</a>
			<a href="#">衬衫</a>
			<a href="#">清仓特惠</a>
		</ul>
	</div>
	<!---产品------------------------------>
	<div class="products">
		<div class="preview">
			<div id="vertical" class="bigImg">
				<img src="${requestScope.product.pics}" width="400" height="400"
					alt="" id="midimg" />
				<div style="display: none;" id="winSelector"></div>
			</div>
			<!--bigImg end-->
			<div class="smallImg">
				<div class="scrollbutton smallImgUp disabled"></div>
				<div id="imageMenu">
					<ul>
						<li id="onlickImg"><img src="${requestScope.product.pics}"
							alt="模特" /></li>
						<li><img src="${requestScope.product.pics}" alt="模特" /></li>
						<li><img src="${requestScope.product.pics}" alt="模特" /></li>
						<li><img src="${requestScope.product.pics}" alt="模特" /></li>
						<li><img src="${requestScope.product.pics}" alt="模特" /></li>
					</ul>
				</div>
			</div>
			<!--smallImg end-->
			<div id="bigView" style="display: none;">
				<img width="800" height="800" alt="" src="" />
			</div>
		</div>
		<div class="product">
			<div
				style="margin-top: -40px; font-size: 14px; color: #666; line-height: 25px;">
				<p>
					产品名：<span>${requestScope.product.fullname}</span>
				</p>
				<p>
					活动：<span>${requestScope.product.activity}</span>
				</p>
				<p>
					提示：<span>${requestScope.product.tip}</span>
				</p>
				<p>
					优惠：<span>${requestScope.product.sale}</span>
				</p>
			</div>
			<div class="words01">
				<h1>
					价格：<span>${requestScope.product.price}</span>
				</h1>
				<p>
					促销价：<span>${requestScope.product.nowprice}</span>
				</p>
			</div>

			<div class="words02">
				<p>收藏：</p>
				<input onclick="shoucang();" type="button" value="收藏商品">
			</div>
			<div class="words03">
				<p>颜色分类：</p>
				<img class="color_type" src="${requestScope.product.pics}"
					width="40px" height="40px" alt="模特"> <img class="color_type"
					src="${requestScope.product.pics}" width="40px" height="40px"
					alt="模特">
			</div>
			<div class="words04">
				<p>尺码：</p>
				<ul class="cloth_type">
					<li>S</li>
					<li>M</li>
					<li>L</li>
					<li>XL</li>
				</ul>
			</div>
			<div class="words05">
				<p>数量：</p>
				<span class="n1">-</span> <span class="n2">1</span> <span class="n3">+</span>
			</div>
			<div class="words06">
				<input class="goumai" onclick="sendorder()" name="立即购买"
					type="button" value="立即购买"> <input class="gouwuche"
					onclick="addcar()" name="加入购物车" type="button" value="加入购物车">
			</div>
			<ul class="words07">
				<li>服务承诺</li>
				<li>正品保证</li>
				<li>七天无理由退款</li>
				<li>全国包邮</li>
			</ul>
			<div class="words08">
				<p>支付方式：</p>
				<img src="images/logozhifu.jpg" alt="这是一张图片">
			</div>
		</div>
	</div>
	<!---商品详情---------->
	<div class="titles">
		<div class="bei_jing">
			<h1>商品详情</h1>
			<p>
				1<span>累计评价</span>
			</p>
		</div>
	</div>
	<!---照片------------->
	<div class="picture">
		<div class="pictures">${requestScope.product.info}</div>
	</div>
	<!---foot-------->
	<div class="footer01">
		<div class="footerBox">
			<img src="images/logo05.jpg" alt="这是一张图片">
			<div class="footerCon01">
				<ul class="foot01">
					<li><a href="#"><span>公司</span></a></li>
					<li><a href="#">关于我们</a></li>
					<li><a href="#">招聘信息</a></li>
					<li><a href="#">联系我们</a></li>
				</ul>
			</div>
			<div class="footerCon02">
				<ul class="foot02">
					<li><a href="#"><span>消费者</span></a></li>
					<li><a href="#">消费者服务</a></li>
					<li><a href="#">意见反馈</a></li>
					<li><a href="#">手机版下载</a></li>
				</ul>
			</div>
			<div class="footerCon03">
				<ul class="foot03">
					<li><a href="#"><span>支付方式</span></a></li>
					<li><a href="#">快捷支付</a></li>
					<li><a href="#">银联支付</a></li>
					<li><a href="#">微信支付</a></li>
				</ul>
			</div>
			<div class="footerCon04">
				<ul class="foot04">
					<li><a href="#"><span>商家服务</span></a></li>
					<li><a href="#">商家入驻</a></li>
					<li><a href="#">商家中心</a></li>
					<li><a href="#">运营服务</a></li>
				</ul>
			</div>
			<div class="footerCon05">
				<ul class="foot05">
					<li><a href="#"><span>手机商城</span></a></li>
				</ul>
				<div class="erWeiMa"></div>
			</div>
		</div>
	</div>
	<div class="footer02">
		<p>营业执照注册号：330106000129004 增值电信业务经营许可证：鲁B2-20110349
			网络文化经营许可证：鲁网文（2016）0349-219号 安全责任书 鲁公网安备 33010602002329号——林杨工作室</p>
	</div>
</body>
</html>
