<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/header.css" />
<link rel="stylesheet" type="text/css" href="css/the member center.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />


<link href="houtai_css/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="houtai_css/css/style.css" />
<link href="houtai_css/assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="houtai_css/assets/css/ace.min.css" />
<link rel="stylesheet" href="houtai_css/font/css/font-awesome.min.css" />
<script src="houtai_css/js/jquery-1.9.1.min.js"></script>
<script src="houtai_css/assets/layer/layer.js" type="text/javascript"></script>
<script src="houtai_css/assets/laydate/laydate.js"
	type="text/javascript"></script>
<script src="houtai_css/assets/js/bootstrap.min.js"></script>
<script src="houtai_css/assets/js/typeahead-bs2.min.js"></script>
<script src="houtai_css/assets/js/jquery.dataTables.min.js"></script>
<script src="houtai_css/assets/js/jquery.dataTables.bootstrap.js"></script>


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
							<li><a href="membercenter.jsp">会员中心<em></em></li>
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
		<div class="cont-hy">
			<ul>
				<li class="left">
					<dt class="d1">订单中心</dt>
					<dd>我的订单</dd>
					<dd>评价晒单</dd>
					<dd>我的活动</dd>
					<dt class="d2">关注中心</dt>
					<dd>我的订单</dd>
					<dd>评价晒单</dd>
					<dd>我的活动</dd>
					<dt class="d3">设置中心</dt>
					<dd class="dd1">个人信息</dd>
					<dd>收货地址</dd>

				</li>

				<li class="center">

					<div class="clearfix">

						<div class="admin_modify_style" id="Personal">
							<div class="type_title">个人信息</div>
							
							<div class="xinxi">
								<form class="f2" action="updateuser" method="post">
									<input type="hidden" name="id" value="${requestScope.info.id}">
									<div class="form-group">
									
										<label class="col-sm-3 control-label no-padding-right"
											for="form-field-1">用户名： </label>
										<div class="col-sm-9">
											<input type="text" id="website-title" class="col-xs-7 "
												disabled="disabled" name="email" value="${requestScope.info.email}"
												id="user-tel"  /> &nbsp;&nbsp;&nbsp; <a
												href="javascript:ovid()"
												onclick="change_Password(${requestScope.info.id})"
												class="btn btn-warning btn-xs">修改密码</a>
										</div>

									</div>


									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"
											for="form-field-1">移动电话： </label>
										<div class="col-sm-9">
											<input type="text" class="col-xs-7 text_info"
												value="${requestScope.info.tel}" id="website-title"
												name="tel" disabled="disabled">
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"
											for="form-field-1">金额： </label>
										<div class="col-sm-9">
											<input type="text" class="col-xs-7 "
												value="${requestScope.info.amount}" id="website-title"
												name="amount" disabled="disabled">
										</div>
									</div>


								<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"
											for="form-field-1">等级： </label>
										<div class="col-sm-9">
											<select id="website-title" class="col-xs-7"
												disabled="disabled" name="power">
												<c:forEach items="${requestScope.levelstatus}" var="r"
													varStatus="v">
													<c:if test="${requestScope.info.level!=v.index}">
														<option value="${v.index}">${r}</option>
													</c:if>
													<c:if test="${requestScope.info.level==v.index}">
														<option selected="selected" value="${v.index}">${r}</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
									</div>


									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"
											for="form-field-1">状态： </label>
										<div class="col-sm-9">
											<select id="website-title" class="col-xs-7"
												disabled="disabled" name="status">
												<c:forEach items="${requestScope.userstatus}" var="r"
													varStatus="v">
													<c:if test="${requestScope.info.status!=v.index}">
														<option value="${v.index}">${r}</option>
													</c:if>
													<c:if test="${requestScope.info.status==v.index}">
														<option selected="selected" value="${v.index}">${r}</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
									</div>

									
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"
											for="form-field-1">备注： </label>
										<div class="col-sm-9">
											<input type="text" id="website-title"
												class="col-xs-7 text_info" disabled="disabled"
												value="${requestScope.info.comments}" name="comments">
										</div>
									</div>

									<div class="formControls ">
										<input type="hidden" class="input-text" value="${requestScope.info.password}" name="password">
										<input type="hidden" class="input-text" value="${requestScope.info.email}" name="email">
										<input type="hidden" class="input-text" value="${requestScope.info.amount}" name="amount">
									</div>



									<button onclick="save_info();" class="btn btn-success radius"
										type="button">保存修改</button>
								</form>

								<button onclick="modify();" class="btn btn-danger radius"
									type="submit">修改信息</button>

							</div>
						</div>


					</div>


				</li>

			</ul>

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


	<div class="change_Pass_style" id="change_Pass">
		<form class="f1" action="updatepassword" method="post">
			<input type="hidden" name="id" value="${requestScope.info.id}">
			<ul class="xg_style">
				<li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input
					name="password" type="password" class="" id="password"></li>

				<li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input
					name="newpassword" type="password" class="" id="Nes_pas"></li>
				<li><label class="label_name">确认密码</label><input
					name="newpassword2" type="password" class="" id="c_mew_pas"></li>

			</ul>
			<!--       <div class="center"> <button class="btn btn-primary" type="button" id="submit">确认修改</button></div>-->
		</form>
	</div>

</body>
</html>
<script>

 //按钮点击事件
function modify(){
	 $('.text_info').attr("disabled", false);
	 $('.text_info').addClass("add");
	  $('#Personal').find('.xinxi').addClass("hover");
	  $('#Personal').find('.btn-success').css({'display':'block'});
	};
function save_info(){
	
	$.post($(".f2").attr("action"),$(".f2").serialize(),function(json){
		if(json.status>0){
		parent.fresh();
		var	index=parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	}else{
		alert(json.text);
	}
		
	},"json");
	
	     var num=0;
		 var str="";
     $(".xinxi input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
			  
			   layer.alert('修改成功！',{
               title: '提示框',				
			   icon:1,			   		
			  });
			  $('#Personal').find('.xinxi').removeClass("hover");
			  $('#Personal').find('.text_info').removeClass("add").attr("disabled", true);
			  $('#Personal').find('.btn-success').css({'display':'none'});
			  layer.close(index);
		  }		  		
	};	
 //初始化宽度、高度    
    $(".admin_modify_style").height($(window).height()); 
	$(".recording_style").width($(window).width()-400); 
    //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".admin_modify_style").height($(window).height()); 
	$(".recording_style").width($(window).width()-400); 
  });
    
  //修改密码
  function star(){
			$("#password").val("")
            $("#Nes_pas").val("")
            $("#c_mew_pas").val("")
		}
  
  function change_Password(){
	   layer.open({
    type: 1,
	title:'修改密码',
	area: ['300px','300px'],
	shadeClose: true,
	content: $('#change_Pass'),
	btn:['确认修改'],
	cancel: function(index, layero){
        star()
    },
	yes:function(index, layero){		
		   if ($("#password").val()==""){
			  layer.alert('原密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		  if ($("#Nes_pas").val()==""){
			  layer.alert('新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		   
		  if ($("#c_mew_pas").val()==""){
			  layer.alert('确认新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          }
		    if(!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val() )
        {
            layer.alert('密码不一致!',{
              title: '提示框',				
				icon:0,
			    
			 });
			 return false;
        }   
		 else{
			 $.post("updateuserpassword", $(".f1").serialize(),
						function(json) {
							if (json == 0) {
								alert("原密码错误！");
								return;
							}else{
								
								layer.alert('修改成功！',{
						               title: '提示框',				
									icon:1,		
									  }); 
									  layer.close(index); 
									  star();
									  
							}
						}, "json");
		  }	 
	}
    });
	  }
</script>
<script>
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,6]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
});</script>
