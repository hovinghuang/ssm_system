<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>编辑角色</title>
</head>
<body>
<div class="pd-20">
  <div class="Huiform"><!-- action="saveUser" method="post"  -->
    <form id="form-role-edit">
      <table class="table table-bg">
        <tbody>
          <tr>
          	<input type="hidden" name="id" value="${role.id}"/>
            <th width="100" class="text-r"><span class="c-red">*</span> 角色名称：</th>
            <td><input type="text" style="width:200px" class="input-text" value="${role.name}" placeholder="" id="name" name="name" datatype="*2-16" nullmsg="角色名不能为空"></td>
          </tr>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 角色描述：</th>
            <td><input type="text" style="width:200px" class="input-text" value="${role.desc_}" placeholder="" id="desc_" name="desc_" datatype="*2-16" nullmsg="角色描述"></td>
          </tr>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 配置权限：</th>
            <td>
            	<div style="width:300px">
                <c:forEach items="${ps}" var="p">
                    <c:set var="hasPermission" value="false" />
                    <c:forEach items="${currentPermissions}" var="currentPermission">
                        <c:if test="${p.id==currentPermission.id}">
                            <c:set var="hasPermission" value="true" />
                        </c:if>
                    </c:forEach>
                    <input type="checkbox"  ${hasPermission?"checked='checked'":"" } name="permissionIds" value="${p.id}"> ${p.name}<br>
                </c:forEach>
            </div> 
            </td>
          </tr>
          <tr>
            <td><button class="btn btn-success radius" type="submit"><i class="icon-ok"></i> 确定</button></td>
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
<script type="text/javascript">
$(function(){
	$("#form-role-edit").validate({
		rules:{
			username:{
				required:true,
				minlength:2,
				maxlength:16
			},
			desc_:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$.ajax({
		        async : false,
		        cache : false,
		        type : 'POST',
		        data : $("#form-role-edit").serialize(),
		        url : "editRole",//请求的action路径  
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
		        }
		    });
		}
	});
});
</script>
</body>
</html>