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
		    <li class="layui-this">制定新计划</li>
		    <li style="color: red;font-weight:900">${msg}</li>
		    <li style="color: green;font-weight:900">${msg1}</li>
		  </ul>
		  <div class="layui-tab-content">
		    <div class="layui-tab-item layui-show">
		    	<form class="layui-form" action="<c:url value='/addPlan.do'/>" method="post">
				  <input type="hidden" name="tid" value="${tid}">
				  <input type="hidden" name="username" value="${sessionScope.Luser.truename}">
				  <div class="layui-form-item">
				    <label class="layui-form-label">计划名称：</label>
				    <div class="layui-input-block">
				      <input type="text" name="pname" autocomplete="off" required lay-verify="required" class="layui-input" value="${plan.pname}">
				      <span style="color: red;font-weight:900">${errors.pname}</span>
				    </div>
				  </div>
				   <!-- 选择任务开始时间-->
				   <div class="layui-form-item">
					    <label class="layui-form-label">开始时间：</label>
					    <div class="layui-input-block">
					      <input type="date" name="pstart"  class="layui-input" value="${plan.pstart }">
					      <span style="color: red;font-weight:900">${errors.pstart}</span>
					    </div>
				  </div>
				  <!-- 选择任务结束时间 -->
					<div class="layui-form-item">
					    <label class="layui-form-label">结束时间：</label>
					    <div class="layui-input-block">
					      <input type="date" name="pend"  class="layui-input" value="${plan.pend }">
					      <span style="color: red;font-weight:900">${errors.pend}</span>
					    </div>
				  	</div>
				  	<!-- 是否反馈 --> 
				  	<label class="layui-form-label" >是否反馈：</label>
				  <div class="layui-input-block" >
				      <input type="radio" name="rstate" checked="checked" value="0">未反馈
				   </div>
					<!-- 工作经历 -->
				  <div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">计划描述：</label>
				    <div class="layui-input-block">
				      <textarea name="ptxt" placeholder="请输入内容" required lay-verify="required" class="layui-textarea">${plan.ptxt}</textarea>
				    </div>
				  </div>
				  <!-- 任务状态-->
				 <label class="layui-form-label" >计划状态：</label>
				   <div class="layui-input-block">
				      <input type="radio" name="pstate" checked="checked" value="0">未实施
				    </div> 
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button type="submit" class="layui-btn layui-btn-normal" lay-submit lay-filter="adminInfo">立即提交</button>
				      <button type="reset" class="layui-btn layui-btn-normal" style="margin-left:200px;">取消提交</button>
				    </div>
				  </div>
				</form>
		    </div>
		  </div>
		</div>
	</body>
</html>