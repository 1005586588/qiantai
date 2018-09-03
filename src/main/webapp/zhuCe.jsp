<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>注册</title>

<link rel="stylesheet"
	href="bootstrap-3.3.0-dist/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/zhuCe.css">

<script src="js/jquery-3.1.1.min.js"></script>
<script src="bootstrap-3.3.0-dist/dist/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("#login_btn").on('click', function() {
		$.post("userzuce", $(".f2").serialize(), function(json) {
			if (json == 1) {
				alert("注册成功！");
				window.location.href = "login2.jsp";
			}
		}, "json");
	});
});
	//验证邮箱
	function checkmail() {
		apos = form1.email.value.indexOf("@");
		dotpos = form1.email.value.lastIndexOf(".");
		if (apos < 1 || dotpos - apos < 2) {
			divmail.innerHTML = '<font class="tips_false">邮箱输入错误</font>';
		} else {
			divmail.innerHTML = '<font class="tips_true">输入正确</font>';
		}
	}
	//验证密码 
	function checkpsd1() {
		psd1 = form1.password.value;
		var flagZM = false;
		var flagSZ = false;
		var flagQT = false;
		if (psd1.length<6 || psd1.length>12) {
			divpassword1.innerHTML = '<font class="tips_false">长度错误</font>';
		} else {
			for (i = 0; i < psd1.length; i++) {
				if ((psd1.charAt(i) >= 'A' && psd1.charAt(i) <= 'Z')
						|| (psd1.charAt(i) >= 'a' && psd1.charAt(i) <= 'z')) {
					flagZM = true;
				} else if (psd1.charAt(i) >= '0' && psd1.charAt(i) <= '9') {
					flagSZ = true;
				} else {
					flagQT = true;
				}
			}
			if (!flagZM || !flagSZ || flagQT) {
				divpassword1.innerHTML = '<font class="tips_false">密码必须是字母数字的组合</font>';

			} else {

				divpassword1.innerHTML = '<font class="tips_true">输入正确</font>';

			}

		}
	}
	//验证确认密码 
	function checkpsd2() {
		if (form1.password.value != form1.password2.value) {
			divpassword2.innerHTML = '<font class="tips_false">您两次输入的密码不一样</font>';
		} else {
			divpassword2.innerHTML = '<font class="tips_true">输入正确</font>';
		}
	}
	function checkna() {
		na = form1.tel.value;
		if (na.length != 11) {
			divname.innerHTML = '<font class="tips_false">电话号码不正确！</font>';

		} else {
			divname.innerHTML = '<font class="tips_true">输入正确</font>';
		}
	}
</script>
<body>
	<div class="zhuCe">
		<a href="index.html"><img class="imgs01" src="images/logo04.jpg"
			alt="这是一张图片"></a>
		<div class="con">
			<div class="con01">
				<img class="pic01" src="images/logoone.jpg">
				<div class="box01"></div>
				<div class="box02"></div>
				<img class="pic02" src="images/logotwo.jpg">
				<div class="box03"></div>
				<div class="box02"></div>
				<img class="pic02" src="images/logothree.jpg">
			</div>
			<div class="con02">
				<div class="word01">填写账户信息</div>
				<div class="word02">验证账户信息</div>
				<div class="word03">注册成功</div>
			</div>
		</div>
		<div class="contact">
			<form class="f2" name="form1" method="post">
				<ul>
					<li><label>电子邮箱：</label> <input class="text" type="text"
						name="email" placeholder="请输入你的邮箱" onblur="checkmail()" required /><span
						class="tips" id="divmail"></span></li>
					<li><label>密码：</label> <input class="password" type="password"
						name="password" placeholder="请输入你的密码" onblur="checkpsd1()"
						required /><span class="tips" id="divpassword1">密码必须由字母和数字组成</span>
					</li>
					<li><label>确认密码：</label> <input class="password"
						type="password" name="password2" placeholder="请再次输入你的密码"
						onblur="checkpsd2()" required /><span class="tips"
						id="divpassword2">两次密码需要相同</span></li>
					<li><label>电话：</label> <input class="text" type="text"
						name="tel" placeholder="请输入电话" onblur="checkna()" required /><span
						class="tips" id="divname"></span></li>
				</ul>

				<input type="hidden" class="input-text" value="1" name="level">
				<input type="hidden" class="input-text" value="0" name="amount">
				<input type="hidden" class="input-text" value="0" name="status">

<!-- 				<div class="dian"> -->
<!-- 					<input class="dot" name="" type="checkbox" value=""><span>已阅读并同意条款</span> -->
<!-- 				</div> -->
				<button
					style="width: 320px; margin-left: 40px; margin-top: 10px; background: #fe294d; border: 0; margin-left: 132px; font-size: 20px; text-align: center; line-height: 40px; color: #FFFFFF; cursor: pointer; border-radius: 5px; font-family:"
					微软雅黑", "宋体", "黑体";" id="login_btn" name="" type="button">注册
				</button>
			</form>
		</div>
	</div>

</body>
</html>

