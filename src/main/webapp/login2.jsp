<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>登录</title>

<link rel="stylesheet"
	href="bootstrap-3.3.0-dist/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/login.css">

<script src="js/jquery.min.1.11.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="bootstrap-3.3.0-dist/dist/js/bootstrap.min.js"></script>

</head>

<body>
	<div class="login">
		<a href="index.html"><img class="imgs01"
			src="images/jingdong-logo.jpg" alt="这是一张图片"></a>
		<div class="content">
			<img class="imgs02" src="images/logoimgs01.jpg" alt="这是一张图片">
			<div class="kuang">
				<p>登录</p>
				<form class="f2" action="login2" method="post">
					<div class="con01">
						<img src="images/logodenglu.jpg"> <input id="userName"
							name="email" type="text" required="required" placeholder="请输入用户名" />
					</div>
					<div class="con02">
						<img src="images/logomima.jpg"> <input id="password"
							name="password" type="password" required="required" placeholder="请输入密码" />
					</div>
					<div class="con03">
					<span>${sessionScope.error}</span>
						<button
							style="width: 320px; height: 50px; margin-left: 40px; margin-top: 60px; background: #fe294d; border: none; 
							font-size: 20px;text-align:center;line-height: 50px; color: #FFFFFF;  font-family:"微软雅黑", "宋体", "黑体";" 
							id="login_btn" name="" type="submit">登录</button>
					</div>
				</form>
				<div class="word">
					<a href="#">忘记密码</a> <a href="zhuCe.jsp">免费注册</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

