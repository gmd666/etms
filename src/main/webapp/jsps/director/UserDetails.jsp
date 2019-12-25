<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>网站后台管理模版</title>
		<%
    		String path = request.getContextPath();
    		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
   		%>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/admin.css"/>
	</head>
	<body>
		<div class="layui-tab page-content-wrap">
		  <ul class="layui-tab-title">
		    <li class="layui-this">查看信息</li>
		  </ul>
		  <div class="layui-tab-content">
		    <div class="layui-tab-item layui-show">
		    	<form class="layui-form">
				  <div class="layui-form-item">
				    <label class="layui-form-label">用户名：</label>
				    <div class="layui-input-block">
				      <input type="text" name="username" autocomplete="off" class="layui-input" value="${user.username}">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">密码：</label>
				    <div class="layui-input-block">
				      <input type="text" name="password"  class="layui-input" value="${user.password }">
				    </div>
				  </div>
				   <div class="layui-form-item">
				    <label class="layui-form-label">真实姓名：</label>
				    <div class="layui-input-block">
				      <input type="text" name="truename"  class="layui-input" value="${user.truename }">
				    </div>
				  </div>
				  <!--  选择性别-->
				    <div class="layui-form-item">
					    <label class="layui-form-label">性别：</label>
					    <div class="layui-input-block">
					      <input type="text" name="truename" class="layui-input" value="${user.gender}">
					    </div>
				  	</div>
				   <!-- 选择出生日期-->
				   <div class="layui-form-item">
					    <label class="layui-form-label">出生日期：</label>
					    <div class="layui-input-block">
					      <input type="text" name="borndate"  class="layui-input" value="${ user.borndate}">
					    </div>
				  </div>
				   <!--选择学历  -->
				   	 <div class="layui-form-item">
				    <label class="layui-form-label">学历：</label>
				    <div class="layui-input-block">
				      <input type="text" name="truename"  class="layui-input" value="${user.degree }">
				    </div>
				  </div>
					<!-- 选择入职时间 -->
					<div class="layui-form-item">
					    <label class="layui-form-label">入职时间：</label>
					    <div class="layui-input-block">
					      <input type="text" name="borndate"  class="layui-input" value="${ user.swt}">
					    </div>
				  	</div>
				  <!--  选择身份-->
				  <div class="layui-form-item">
					    <label class="layui-form-label">角色：</label>
					    <div class="layui-input-block">
					      <input type="text" name="borndate"  class="layui-input" value="${ user.identify}">
					    </div>
				  	</div>
				  <!-- 选择职位 -->
				  <div class="layui-form-item">
				    <label class="layui-form-label">职位：</label>
				    <div class="layui-input-block">
				      <input type="text" name="position"   class="layui-input" value="${user.position }">
				    </div>
				  </div>
				  <!-- 工作经历 -->
				  <div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">工作经历：</label>
				    <div class="layui-input-block">
				      <textarea name="works"  class="layui-textarea" >${user.works }</textarea>
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <a  class="layui-btn layui-btn-normal" lay-submit lay-filter="adminInfo" href="<c:url value='/lookUser.do'/>">返回</a>
				    </div>
				  </div>
				</form>
		    </div>
		  </div>
		</div>
	</body>
</html>