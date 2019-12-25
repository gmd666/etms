<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"  content="width=device-width, initial-scale=1" />

<style>
*{
	margin: 0;
	padding: 0;
	border: none;
}
html,body{
	width: 100%;
	height: 100%;
	overflow:hidden;
}
</style>
</head>
<body>
<h2 style="text-align:center;">欢迎来到企业任务管理系统</h2>
<script type="text/javascript">
var w=document.body.clientWidth;
var h=document.body.clientHeight;
var canvas=document.createElement('canvas');
canvas.width=w;
canvas.height=h;
document.body.appendChild(canvas);
canvas.style.backgroundColor="#0073B3";
var context=canvas.getContext('2d');
 var Rot=0;
var R_init=0;
var timer=null;
var targent_R=Math.round(w/10);
setInterval( function(){
		
	 R_init=R_init+1;
	 if(R_init<targent_R+1)
	 {
	 Drawcilrcle(context,R_init);

  if(R_init===targent_R){
 setTimeout(function(){

	clearInterval(timer);
	
	 timer=	setInterval( function(){
	 Rot=Rot+1;
	 if(Rot<180)
	 {
	 Drawcilrcle(context,targent_R);
	 Drawmove(context,targent_R,Rot);
	 Drawmove_bottom(context,targent_R,Rot);
	   Drawtext(context,Rot)
	 }
		 
	  else if(Rot===180){
	Drawcilrcle(context,targent_R);
	Drawfinsh(context,targent_R,360);
	Drawtext(context,Rot);
	
	 }


},10);
	},50);
	 }
	 }

	 
},5);


function Drawcilrcle(cxt,r){
	cxt.clearRect(0,0,w,h);
	cxt.beginPath();
	cxt.arc(w/2,h/2, r, 0 ,2*Math.PI);
	cxt.fillStyle="rgba(255,255,255,0.2)";
	cxt.fill();
	cxt.beginPath();
	cxt.arc(w/2,h/2, r+20,0 ,2*Math.PI);
	cxt.strokeStyle="rgba(0,0,0,0.2)";
	cxt.lineWidth=1;
	cxt.stroke();
	cxt.closePath();
}
	function Drawmove_bottom(cxt,r,rot){
	cxt.save();
	cxt.beginPath();
	 cxt.translate(w/2,h/2);//将画布坐标系原点移至中心
	 cxt.rotate(rot/180*Math.PI); 
	 cxt.translate(-(w/2),-(h/2));//修正画布坐标系
	cxt.arc(w/2,h/2, r+20, 0,rot/180*Math.PI);
	cxt.strokeStyle="rgba(255,255,255,0.3)";
	cxt.lineWidth=6;
	cxt.stroke();
	cxt.closePath();
	cxt.restore();
}
function Drawmove(cxt,r,rot){
	cxt.save();
	cxt.beginPath();
	 cxt.translate(w/2,h/2);//将画布坐标系原点移至中心
	 cxt.rotate(rot/180*Math.PI); 
	 cxt.translate(-(w/2),-(h/2));//修正画布坐标系
	cxt.arc(w/2,h/2, r+20,180/180*Math.PI,(rot+180)/180*Math.PI);
	cxt.strokeStyle="rgba(255,255,255,0.3)";
	cxt.lineWidth=6;
	cxt.stroke();
	cxt.restore();
	cxt.closePath();
	
}
function Drawfinsh(cxt,r,rot){
	cxt.save();
	cxt.beginPath();
	cxt.arc(w/2,h/2, r+20,0,2*Math.PI);
	cxt.strokeStyle="rgba(255,255,255,0.3)";
	cxt.lineWidth=6;
	cxt.stroke();
	cxt.restore();
	cxt.closePath();
	
}
function Drawtext(cxt,rot){
	cxt.save();
	cxt.beginPath();
	cxt.textAlign="center";
	 cxt.font=" 20pt  Aira";
	cxt.fillStyle="rgba(255,255,255,1)";
	cxt.fillText(Math.round(rot/180*100)+"%",w/2,h/2+10);
	cxt.restore();
	cxt.closePath();
	
}
</script>

</body>
</html>

