<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<title>后台登录</title>
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <div class="text-c"  ><h4 id="showResult" class="c-red">${error}</h4></div>
    <form class="form form-horizontal" action="login" method="post">
      <div class="row cl">
        <label class="form-label col-xs-3"><img src="static/h-ui.admin/images/username.png"width="42" height="42"><!-- <i class="Hui-iconfont">&#xe60d;</i> --></label>
        <div class="formControls col-xs-8">
          <input id="username" name="username" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><img src="static/h-ui.admin/images/password.png"width="42" height="42"><!-- <i class="Hui-iconfont">&#xe60e;</i> --></label>
        <div class="formControls col-xs-8">
          <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
        </div>  
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="checkCode" id="checkCode" class="input-text size-L" type="text" placeholder="验证码" value="" style="width:150px;">
          <img src="PictureCheckCode" id="CreateCheckCode" align="middle" height="40" width="100"> <a id="kanbuq" class="c-green" href="" onclick="myReload()">看不清，换一张</a> </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="" type="submit" onclick="checkform(event)" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright by 成都金融控股企业微信管理系统</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript">
function myReload() {
	document.getElementById("CreateCheckCode").src = document
			.getElementById("CreateCheckCode").src
			+ "?nocache=" + new Date().getTime();
}
function checkform(evt) {
    $user_name = document.getElementById("username").value;
    $user_pwd = document.getElementById("password").value;
    $user_checkCode = document.getElementById("checkCode").value;
    if ($user_name == '') {
        /* alert("用户名不能为空"); */
        $("#showResult").empty();
        $("#showResult").append("用户名不能为空");
        $("#showResult").css("color", "red");
        evt.preventDefault();
        return false;
    }

    if ($user_pwd == '') {
        $("#showResult").empty();
        $("#showResult").append("密码不能为空");
        $("#showResult").css("color", "red");
        evt.preventDefault();
        return false;
    }
    
    if ($user_checkCode == '') {
        $("#showResult").empty();
        $("#showResult").append("验证码不能为空");
        $("#showResult").css("color", "red");
        evt.preventDefault();
        return false;
    }

    return true;
}
</script>
</body>
</html>