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
		    <li class="layui-this">制定新任务</li>
		    <li style="color: red;font-weight:900">${msg}</li>
		    <li style="color: green;font-weight:900">${msg1}</li>
		  </ul>
		  <div class="layui-tab-content">
		    <div class="layui-tab-item layui-show">
		    	<form class="layui-form" action="<c:url value='/updateTask.do'/>" method="post">
				  <input type="hidden" name="tid" value="${task.tid }">
				  <input type="hidden" name="mid" value="${sessionScope.Luser.id}">
				  <div class="layui-form-item">
				    <label class="layui-form-label">任务名称：</label>
				    <div class="layui-input-block">
				      <input type="text" name="tname" autocomplete="off" required lay-verify="required" class="layui-input" value="${task.tname}">
				      <span style="color: red;font-weight:900">${errors.tname}</span>
				    </div>
				  </div>
				   <!-- 选择任务开始时间-->
				   <div class="layui-form-item">
					    <label class="layui-form-label">开始时间：</label>
					    <div class="layui-input-block">
					      <input type="date" name="tstart"  class="layui-input" value="${task.tstart }">
					      <span style="color: red;font-weight:900">${errors.tstart}</span>
					    </div>
				  </div>
				  <!-- 选择任务结束时间 -->
					<div class="layui-form-item">
					    <label class="layui-form-label">结束时间：</label>
					    <div class="layui-input-block">
					      <input type="date" name="tend"  class="layui-input" value="${task.tend }">
					      <span style="color: red;font-weight:900">${errors.tend}</span>
					    </div>
				  	</div>
				   <!--选择实施人 -->
				   	<div class="layui-form-item">
						<label class="layui-form-label">实施人：</label>
					    <div class="layui-input-block">
					     		<select class="layui-input" name="tuser">
					     			<option value ="${Tuser }">${Tuser}</option>
					     			<c:forEach items="${userlist}" var="user">
					     				<option value ="${user.truename }">${user.truename }</option>
					     			</c:forEach>
								</select>
					    </div>
					</div>
					<!-- 工作经历 -->
				  <div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">任务描述：</label>
				    <div class="layui-input-block">
				      <textarea name="ttxt" placeholder="请输入内容" required lay-verify="required" class="layui-textarea">${task.ttxt}</textarea>
				    </div>
				  </div>
				  <!-- 任务状态-->
				 <label class="layui-form-label" >任务状态：</label>
				   <div class="layui-input-block">
				      	<select class="layui-input" name="tstate">
					     		<option value ="0">未实施</option>
					     		<option value ="1">实施中</option>
					     		<option value ="2">已完成</option>
						</select>
				    </div> 
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button type="submit" class="layui-btn layui-btn-normal" lay-submit lay-filter="adminInfo">确认修改</button>
				      <button onclick="javaScript:{window.location='<%=basePath %>jsps/director/ChangeTask.jsp'}" class="layui-btn layui-btn-normal" style="margin-left:200px;">取消修改</button>
				    </div>
				  </div>
				</form>
		    </div>
		  </div>
		</div>
	</body>
</html>