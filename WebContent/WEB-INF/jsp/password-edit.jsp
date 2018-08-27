<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
<script type="text/javascript" src="http://libs.useso.com/js/respond.js/1.4.2/respond.min.js"></script>
<script type="text/javascript" src="http://cdn.bootcss.com/css3pie/2.0beta1/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<title>修改密码</title>
</head>
<body>
<div class="pd-20">
  <form class="Huiform" id="form-password-edit">
    <table class="table table-border table-bordered table-bg">
      <thead>
        <tr>
          <th colspan="2">请输入密码</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th class="text-r" width="30%">旧密码：</th>
          <td>
          	<input type="hidden" name="userid" value="${userId}"/>
          	<input name="oldpassword" id="oldpassword" class="input-text" type="password" autocomplete="off" placeholder="密码" tabindex="1" datatype="*6-16" nullmsg="请输入旧密码！" errormsg="4~16个字符，区分大小写！"> 
          </td>
        </tr>
        <tr>
          <th class="text-r">新密码：</th>
          <td><input name="newpassword" id="newpassword" class="input-text" type="password" autocomplete="off" placeholder="设置密码" tabindex="2" datatype="*6-16"  nullmsg="请输入您的新密码！" errormsg="4~16个字符，区分大小写！" > 
          </td>
        </tr>
        <tr>
          <th class="text-r">再次输入新密码：</th>
          <td><input name="newpassword2" id="checkPwd" class="input-text" type="password" autocomplete="off" placeholder="确认新密码" tabindex="3" datatype="*" recheck="newpassword" nullmsg="请再输入一次新密码！" errormsg="您两次输入的新密码不一致！"> 
          </td>
        </tr>
        <tr>
          <th></th>
          <td>
            <button type="submit" class="btn btn-success radius" id="admin-password-save" name="admin-password-save"><i class="icon-ok"></i> 确定</button>
          </td>
        </tr>
      </tbody>
    </table>
  </form>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	$("#form-password-edit").validate({
		rules:{
			oldpassword:{
				required:true,
				minlength:2,
				maxlength:16
			},
			newpassword:{
				required:true,
			},
			newpassword2:{
			      equalTo: "#newpassword"
		    }
		},
		submitHandler:function(form){
			$.ajax({
		        type : 'POST',
		        data : $("#form-password-edit").serialize(),
		        url : "passwordEdit",//请求的action路径  
		        dataType: 'json',
		        success:function(data) { //请求成功后处理函数。
		        	console.log(data.msg);
					if(data.msg == 'success'){
						layer.msg('密码修改成功!',{icon:1,time:1000});
						setTimeout('window.parent.location.reload()',300); //延迟0.3秒 
					}else if(data.msg == 'oldpassworderror'){
						layer.msg('密码修改失败!旧密码错误',{icon:1,time:2000});
					}else{
						layer.msg('密码修改失败!',{icon:1,time:2000});
					}
		        },
		        error:function(data) {//请求失败处理函数  
		        	console.log(data.msg);
					layer.msg('请求失败!稍等请重新提交',{icon:1,time:1000});
		        }
		    });
		}
	});
});
</script>
</body>
</html>