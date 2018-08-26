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
<link type="text/css" rel="stylesheet" href="static/h-ui/css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="static/h-ui.admin/css/H-ui.admin.css"/>
<title>添加用户</title>
</head>
<body>
<div class="pd-20">
  <div class="Huiform"><!-- action="saveUser" method="post"  -->
    <form id="form-user-add">
      <table class="table table-bg">
        <tbody>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 用户名：</th>
            <td><input type="text" style="width:200px" class="input-text" value="" placeholder="" id="username" name="name" datatype="*2-16" nullmsg="用户名不能为空"></td>
          </tr>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 姓名：</th>
            <td><input type="text" style="width:200px" class="input-text" value="" placeholder="" id="username" name="realname" datatype="*2-16" nullmsg="姓名不能为空"></td>
          </tr>
          <tr>
            <th class="text-r"><span class="c-red">*</span> 性别：</th>
            <td><label>
                <input name="sex" type="radio" id="sex-1" value="1" checked>
                男</label>
              <label>
                <input type="radio" name="sex" value="0" id="sex-2">
                女</label></td>
          </tr>
          <tr>
            <th class="text-r"><span class="c-red">*</span> 手机：</th>
            <td><input type="text" style="width:300px" class="input-text" value="" placeholder="" id="mobile" name="phone"></td>
          </tr>
          <tr>
            <th class="text-r">邮箱：</th>
            <td><input type="text" style="width:300px" class="input-text" value="" placeholder="" id="email" name="email"></td>
          </tr>
          <tr>
            <th class="text-r">地址：</th>
            <td><textarea class="input-text" name="address" id="uloc" style="height:100px;width:300px;"></textarea></td>
          </tr>
          <tr>
            <th></th>
            <td><button class="btn btn-success radius" id="submit" type="submit"><i class="icon-ok"></i> 确定</button></td>
          </tr>
        </tbody>
      </table>
    </form>
  </div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--请在下方写此页面业务相关的脚本--> 
<!-- <script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> -->
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>

<!-- <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script> -->
<script type="text/javascript">
$(function(){
	/* $("#submit").click(function(){
		$.ajax({
	        type : 'POST',
	        data : $("#form-user-add").serialize(),
	        url : "addUser",//请求的action路径  
	        dataType: 'json',
	        success: function(data){
	        	layer.msg('提交成功!',{icon:1,time:1000});
				setTimeout('window.parent.location.reload()',300); //延迟0.3秒
				console.log("提交成功!");
			},
			error:function(data) {
				console.log(data.msg);
				layer.msg('提交失败!请重新编辑',{icon:1,time:1000});
			}
	    });
	}); */
	$("#form-user-add").validate({
		/* rules:{
			username:{
				required:true,
				minlength:2,
				maxlength:16
			},
			sex:{
				required:true,
			},
			mobile:{
				required:true,
				isMobile:true,
			},
			email:{
				required:true,
				email:true,
			},
		},
		onkeyup:false,
		focusCleanup:true, */
		/* success:"valid", */
		submitHandler:function(form){
			$.ajax({
		        type : 'POST',
		        data : $("#form-user-add").serialize(),
		        url : "addUser",//请求的action路径  
		        dataType: 'json',
		        success:function(data) { //请求成功后处理函数。
		        	console.log(data.msg);
					if(data.msg == 'success'){
						layer.msg('提交成功!',{icon:1,time:1000});
						setTimeout('window.parent.location.reload()',300); //延迟0.3秒
					}else{
						layer.msg('提交失败!请检查，很可能是该用户名已经被占用。',{icon:1,time:2000});
					}
		        },
		        error:function(data) {//请求失败处理函数  
		        	console.log(data.msg);
					layer.msg('请求失败!稍等请重新提交',{icon:1,time:1000});
		        },
		    });
		}
	});
});
</script>
</body>
</html>