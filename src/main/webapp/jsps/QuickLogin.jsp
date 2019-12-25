<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>后台登录</title>
		<script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
 		 <script src="../js/jquery-1.9.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="../css/layui.css" />
		<link rel="stylesheet" type="text/css" href="../css/login.css" />
	</head>
	<body>
		<div class="m-login-bg">
			<div class="m-login">
				<h3>人脸识别登录系统</h3>
				<div class="m-login-warp" style="height:320px;">
						<h2>调整好姿势后请点击下方确认按钮</h2>
						<video id="myVideo" src="" width= 100%; height=100%></video>
 						<canvas id="myCanvas" width="640px" height="480px" hidden="hidden"></canvas>
 						<button  class="layui-btn layui-btn-primary" onclick="takePhoto()">确认</button>
 						<button  class="layui-btn layui-btn-primary" style="float:right;" onclick="javascript:{window.location='Login.jsp'}">返回</button>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript"> 
		  var myVideo = document.getElementById('myVideo');
		  navigator.mediaDevices.getUserMedia({
		    video: true
		  }).then(function (mediaStream) {
		    myVideo.srcObject = mediaStream;
		    myVideo.onloadedmetadata = function () {
		      /* myVideo.controls = "controls"; 不显示控件*/
		      myVideo.play();
		    }
		  });
		 
		 function takePhoto(){
			 var canvas = document.getElementById('myCanvas').getContext('2d');
			 canvas.drawImage(myVideo, 0, 0);
			    var imgsrc = document.getElementById("myCanvas").toDataURL(
				"image/png").split("base64,")[1];
			    $.ajax({
					type: "POST",
			        url:'../faceLogin.do',
			        data:{message:imgsrc},
			      	success:function(score){
			          	if(score==1){
			              	window.location="./admin/admin_index.jsp"
			             }else if(score==2){
			            	 window.location="./director/director_index.jsp" 
			             }else if(score==3){
			            	 window.location="./employee/employee_index.jsp"
			             }else{
			            	 alert("登陆失败！请调整好姿势后再点击确认!")
			             }
			        },
			        error:function(){
			        	alert("登陆失败！请确认联网后再点击确认!")
			        }
			    })
			}
		 /* setInterval("jiance()","1100");   */
	</script>
</html>