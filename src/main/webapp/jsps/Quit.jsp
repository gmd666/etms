<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>后台登录</title>
		<%
    		String path = request.getContextPath();
    		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
   		%>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/login.css" />
	</head>

	<body>
		<div class="m-login-bg">
			<div class="m-login">
				<h3>欢迎您下次使用</h3>
				<div class="m-login-warp">
					<div class="layui-form-item m-login-btn">
						<div class="layui-inline">
								<button class="layui-btn layui-btn-normal" lay-submit lay-filter="login" onclick="javascript:{window.location='<%=basePath %>jsps/Login.jsp'}">普通登录</button>
						</div>
						<div class="layui-inline">
								<button  class="layui-btn layui-btn-primary" onclick="javascript:{window.location='<%=basePath %>jsps/QuickLogin.jsp'}">快速登陆</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>