<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>尚硅谷会员注册页面</title>
	<%--静态包含base标签、css样式、jQuery文件	--%>
	<%@include file="/pages/common/head.jsp"%>
	<script type="text/javascript">
		//页面加载完后
		$(function (){
			$("#username").change(function () {
				//获取用户名
				var username = this.value;
				if(username != ""){
					$.getJSON("${basePath}userServlet","action=ajaxCheckUserName&username="+username,function (data){
						//用户名已存在
						if(data.check) {
							$("span.errorMsg").text("用户名已存在！")
						} else {
							$("span.errorMsg").text("用户名可用！")
						}
					});
				} else {
					$("span.errorMsg").text("");
				}
			});

			//点击验证码图片切换验证码
			$("#code_img").click(function (){
				//this对象，当前正在响应事件的dom对象
				this.src="${basePath}kaptcha.jpg?d="+new Date();
			});
			//给注册事件绑定单击事件
			$("#sub_btn").click(function (){
				//获取用户名输入框内容
				var userpassText = $("#").val();
				//创建正则表达式对象
				var userpassPatt = /^\w{5,12}$/;
				//使用test方法验证
				if(!userpassPatt.test(userpassText)){
					//提示错误
					$("span.errorMsg").text("密码错误！");
					return false;
				}
				$("span.errorMsg").text("");

				//密码
				var userpassText = $("#password").val();

				//验证密码
				var repwd = $("#repwd").val();
				if(repwd!=userpassText){
					//提示错误
					$("span.errorMsg").text("确认密码与密码不符！");
					return false;
				}
				$("span.errorMsg").text("");

				//邮箱
				var email = $("#email").val();
				var emailPatt = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
				if(!emailPatt.test(email)){
					$("span.errorMsg").text("邮箱输入错误！");
					return false;
				}
				$("span.errorMsg").text("");

				//验证码
				var codeText = $("#code").val();
				//去除验证码前后空格
				var codeText = $.trim("codeText");
				if(codeText == null || codeText == ""){
					//提示
					$("span.errorMsg").text("验证码不能为空！");
					return false;
				}
				$("span.errorMsg").text("");
			})
		})
	</script>
<style type="text/css">
	.login_form{
		height:420px;
		margin-top: 25px;
	}
	
</style>
</head>
<body>
		<div id="login_header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
		</div>
		
			<div class="login_banner">
			
				<div id="l_content">
					<span class="login_word">欢迎注册</span>
				</div>
				
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>注册尚硅谷会员</h1>
								<span class="errorMsg">
									${requestScope.msg}
								</span>
							</div>
							<div class="form">
								<form action="userServlet" method="post">
									<input type="hidden" name="action" value="regist">
									<label>用户名称：</label>
									<input class="itxt" type="text" placeholder="请输入用户名"
										   autocomplete="off" tabindex="1" name="username" id="username"
											value="${requestScope.username}"/>
									<br />
									<br />
									<label>用户密码：</label>
									<input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" id="password" />
									<br />
									<br />
									<label>确认密码：</label>
									<input class="itxt" type="password" placeholder="确认密码" autocomplete="off" tabindex="1" name="repwd" id="repwd" />
									<br />
									<br />
									<label>电子邮件：</label>
									<input class="itxt" type="text"  placeholder="请输入邮箱地址"
										   autocomplete="off" tabindex="1" name="email" id="email"
										   value="${requestScope.email}"/>
									<br />
									<br />
									<label>验证码：</label>
									<input class="itxt" type="text" name="code" style=" width: 100px;"  height="28" id="code"/>
									<img alt="" id="code_img" src="kaptcha.jpg" style="float: right; margin-right:80px; width: 100px;"  height="40">
									<br />
									<br />
									<input type="submit" value="注册" id="sub_btn" />
									
								</form>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		<%--静态包含 页脚	--%>
		<%@include file="/pages/common/footer.jsp"%>
</body>
</html>