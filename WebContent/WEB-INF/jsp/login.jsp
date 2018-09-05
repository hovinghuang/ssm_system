<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统登录</title>
<link href="static/login/css/login.css" rel="stylesheet" type="text/css" media="all" />
<link href="static/login/css/demo.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="static/login/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="static/login/js/jquery.cookie.js"></script>
<script type="text/javascript" src="static/login/js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="static/login/js/Validform_v5.3.2_min.js"></script>

<script>

//解决session过期，跳转到首页并跳出iframe
if (window != top)   
    top.location.href = location.href;   

//初始化页面时验证是否记住了密码
$(document).ready(function() {
    if ($.cookie("rmbUser") == "true") {
        $("#rmbUser").attr("checked", true);
        $("#username").val($.cookie("username"));
        $("#password").val($.cookie("password"));
    }
});
//保存用户信息
function saveUserInfo() {
    if ($("#rmbUser").attr("checked") == true) {
        var username = $("#username").val();
        var password = $("#password").val();
        $.cookie("rmbUser", "true", { expires: 7 }); // 存储一个带7天期限的 cookie
        $.cookie("username", username, { expires: 7 }); // 存储一个带7天期限的 cookie
        $.cookie("password", password, { expires: 7 }); // 存储一个带7天期限的 cookie
    }
    else {
        $.cookie("rmbUser", "false", { expires: -1 });
        $.cookie("username", '', { expires: -1 });
        $.cookie("password", '', { expires: -1 });
    }
}
function myReload() {
	document.getElementById("CreateCheckCode").src = document
			.getElementById("CreateCheckCode").src
			+ "?nocache=" + new Date().getTime();
}

$(function(){

$(".i-text").focus(function(){
$(this).addClass('h-light');
});

$(".i-text").focusout(function(){
$(this).removeClass('h-light');
});

$("#username").focus(function(){
 var username = $(this).val();
 if(username=='输入账号'){
 $(this).val('');
 }
});

$("#username").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入账号');
 }
});

$("#password").focus(function(){
 var password = $(this).val();
 if(password=='输入密码'){
 $(this).val('');
 }
});


$("#yzm").focus(function(){
 var username = $(this).val();
 if(username=='输入验证码'){
 $(this).val('');
 }
});

$("#yzm").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入验证码');
 }
});

});




</script>


</head>

<body>


<div class="header">
  <h1 class="headerLogo"><a title="企业微信后台管理系统" target="_blank" href="#"><img alt="logo" src="static/login/images/logo.gif"></a></h1>
	<div class="headerNav">
		<a target="_blank" href="#">企业官网</a>
		<a target="_blank" href="#">关于我们</a>
		<a target="_blank" href="#">开发团队</a>
		<a target="_blank" href="#">意见反馈</a>
		<a target="_blank" href="#">帮助</a>	
	</div>
</div>

<div class="banner">

<div class="login-aside">
  <div id="o-box-up"></div>
  <div id="o-box-down"  style="table-layout:fixed;">
   <div class="error-box">${error}</div>
   
   <form class="registerform" action="login" method="post">
   <div class="fm-item">
	   <label for="logonId" class="form-label">账号：</label>
	   <input type="text" value="" maxlength="100" id="username" name="username" class="i-text" datatype="s2-18" errormsg="用户名至少2个字符,最多18个字符！" required autocomplete='current-username'>    
       <div class="ui-form-explain"></div>
  </div>
  
  <div class="fm-item">
	   <label for="logonId" class="form-label">密码：</label>
	   <input type="password" value="" maxlength="100" id="password" name="password" class="i-text" datatype="*6-16" nullmsg="请设置密码！" errormsg="密码范围在6~16位之间！" required autocomplete='current-password'>    
       <div class="ui-form-explain"></div>
  </div>
  
  <div class="fm-item pos-r">
	   <label for="logonId" class="form-label">验证码</label>
	   <input name="checkCode" type="text" value="" maxlength="100" id="yzm" class="i-text yzm" nullmsg="请输入验证码！" >    
       <div class="ui-form-explain"><img id="CreateCheckCode" src="PictureCheckCode" class="yzm-img" onclick="myReload()"/></div>
  </div>
  <div class="fm-item">
  	<label class="form-label"><input type="checkbox" id="rmbUser">记住用户名</label>
  </div>
  <div class="fm-item">
	   <label for="logonId" class="form-label"></label>
	   <input type="submit" value="" tabindex="4" onclick="saveUserInfo()" id="send-btn" class="btn-login"> 
       <div class="ui-form-explain"></div>
  </div>
  
  </form>
  
  </div>

</div>

	<div class="bd">
		<ul>
			<li style="background:url(static/login/themes/theme-pic1.jpg) #CCE1F3 center 0 no-repeat;"><a target="_blank" href="#"></a></li>
			<li style="background:url(static/login/themes/theme-pic2.jpg) #BCE0FF center 0 no-repeat;"><a target="_blank" href="#"></a></li>
		</ul>
	</div>

	<div class="hd"><ul></ul></div>
</div>
<script type="text/javascript">
/* jQuery(".banner").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"fold",  autoPlay:true, autoPage:true, trigger:"click" }); */
</script>


<div class="banner-shadow"></div>

<div class="footer">
   <p>Copyright &copy; 2018.Company name All rights reserved.</p>
</div>

</body>
</html>
