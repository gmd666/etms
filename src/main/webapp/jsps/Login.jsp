<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<h3>企业任务管理系统后台登录</h3>
				<div class="m-login-warp">
					<div class="layui-form-item m-login-btn">
						<div class="layui-inline">
								<button class="layui-btn layui-btn-normal" lay-submit lay-filter="login">普通登录</button>
						</div>
						<div class="layui-inline">
								<button  class="layui-btn layui-btn-primary" onclick="javascript:{window.location='<%=basePath %>/jsps/QuickLogin.jsp'}">快速登陆</button>
						</div>
					</div>
					<form class="layui-form" action="<c:url value='/userLogin.do'/>" method="post">
						<input type="hidden" name="method" value="Login">
						<h2>请选择对应角色</h2>
						<div class="layui-form-item">
							<select class="layui-input" name="identify">
									<option value ="管理员">管理员</option>
									<option value="主管">主管</option>
									<option value="员工">员工</option>
							</select>
						</div>
						<div class="layui-form-item">
							<input type="text" name="username" required lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
							<span style="color: red;font-weight:900">${msg}</span>
						</div>
						<div class="layui-form-item">
							<input type="text" name="password" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
						</div>
						<!-- <div class="layui-form-item">
							<div class="layui-inline">
								<input type="text" name="verity" required lay-verify="required" placeholder="验证码" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-inline">
								<img class="verifyImg" onclick="this.src=this.src+'?c='+Math.random();" src="../images/yzm.jpg" />
							</div>
						</div> -->
						<div class="layui-form-item m-login-btn">
							<div class="layui-inline">
								<button type="submit" class="layui-btn layui-btn-normal" lay-submit lay-filter="login">登录</button>
							</div>
							<div class="layui-inline">
								<button type="reset" class="layui-btn layui-btn-primary">取消</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>