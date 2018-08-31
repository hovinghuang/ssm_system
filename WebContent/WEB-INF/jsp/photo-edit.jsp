<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,photo-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
<script type="text/javascript" src="http://libs.useso.com/js/respond.js/1.4.2/respond.min.js"></script>
<script type="text/javascript" src="http://cdn.bootcss.com/css3pie/2.0beta1/PIE_IE678.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="static/h-ui/css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="static/h-ui.admin/css/H-ui.admin.css"/>
<link href="lib/fileinput/css/bootstrap.min.css" rel="stylesheet">
<link href="lib/fileinput/css/fileinput.min.css" rel="stylesheet"/>
<style>
select{
    font-family: "微软雅黑";
/*     background: rgba(0,0,0,0); */
    font-size: 14px;
/*     color: white; */
    border-radius: 4px;
}
option{
    color: black;
    background: #FFFFFF;
    line-height: 20px;
}
option:hover{
    background: #EBCCD1;
}
</style>
<title>添加相册</title>
</head>
<body>
<div class="pd-20">
  <div class="Huiform"><!--  action="addPhoto" method="post" enctype="multipart/form-data"  -->
    <form id="form-photo-edit"> 
    	<div class="row">
    	<div class="col-sm-2">
            <p  style="float:right">相册名称：</p>
          </div>
          <div class="col-sm-9">
            <input type="hidden" name="id" value="${photo.id}"/>
            <input type="text" class="form-control" value="${photo.name}" placeholder="" id="name" name="name" datatype="*2-16" nullmsg="相册名不能为空">
          </div>
          </div>
          <br>
          <div class="row">
    	<div class="col-sm-2">
            <p  style="float:right">相册描述：</p>
          </div>
          <div class="col-sm-9">
            <input  class="form-control" value="${photo.description}" placeholder="" id="description" name="description" datatype="*2-100" nullmsg="描述不能为空">
          </div>
          </div>
          <br>
          <div class="row">
    	<div class="col-sm-2">
            <p  style="float:right">相册类型：</p>
          </div>
          <div class="col-sm-9">
          <select name="photoType">
          	<c:forEach items="${photoTypeList}" var="ptl">
          			<c:set var="hasType" value="false" />
                        <c:if test="${ptl.id==photo.tid}">
                            <c:set var="hasType" value="true" />
                        </c:if>
				<option ${hasType?"selected ='selected'":"" } value="${ptl.id}">${ptl.name}</option>
			</c:forEach>
		  </select>
            <!-- <input type="text" class="form-control" value="" placeholder="" id="photoType" name="photoType" datatype="*2-16"> -->
          </div>
          </div>
          <br>
          <div class="row">
    	<div class="col-sm-2">
            <p  style="float:right">相册文件：</p>
          </div>
          <div class="col-sm-9">
            <input id="input-id" name="filename" multiple type="file" data-show-caption="true"> 
          </div>
          </div>
          <br>
          <div class="row">
          <div class="col-sm-2">
          </div>
    	<div class="col-sm-9">
            <button onClick="photo_save_submit();" class="btn btn-primary radius" id="submit" type="button"><i class="icon-ok"></i>&nbsp;&nbsp;确&nbsp;定&nbsp;&nbsp;</button>
          </div>
          </div>   
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
<script src="lib/fileinput/js/fileinput.min.js" type="text/javascript"></script>
<script src="lib/fileinput/js/zh.js" type="text/javascript"></script>   

<!-- <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script> -->
<script type="text/javascript">
function photo_save_submit(){
console.log('photo_save_submit');
var formData = new FormData(document.getElementById("form-photo-edit"));
console.log('var formData');
$.ajax({
    type:"post",
    url:"editPhoto",
    data : formData, 
    processData:false,
    contentType:false,
    dataType: 'json',
    success: function(data){//success指的是请求并成功返回信息
		console.log(data.msg);
		if(data.msg == 'success'){
			layer.msg('上传成功!',{icon:1,time:1000});
			setTimeout('window.parent.location.reload()',300); //延迟0.3秒
		}else{
			layer.msg('上传失败!',{icon:1,time:1000});
		}
	},
	error:function(data) {
		console.log(data.msg);
		layer.msg('请求失败!',{icon:1,time:1000});
	},
});
}
$(function () {  
    initFileInput("input-id");  
})    
function initFileInput(ctrlName) {  
    var control = $('#' + ctrlName);  
    control.fileinput({  
        language: 'zh', //设置语言  
        uploadUrl: "", //上传的地址  
        allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀  
        maxFilesNum : 10,//上传最大的文件数量  
        uploadAsync: false, //默认异步上传  
        showUpload: false, //是否显示上传按钮  
        showRemove : true, //显示移除按钮  
        showPreview : true, //是否显示预览  
        showCaption: false,//是否显示标题  
        browseClass: "btn btn-primary", //按钮样式   
        maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小  
        enctype: 'multipart/form-data',  
        validateInitialCount:true,  
        previewFileIcon: "<iclass='glyphicon glyphicon-king'></i>",  
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",  
    }).on('filepreupload', function(event, data, previewId, index) {     //上传中  
        var form = data.form, files = data.files, extra = data.extra,  
        response = data.response, reader = data.reader;  
        console.log('文件正在上传');  
    }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功  
        console.log('文件上传成功！'+data.id);    
    }).on('fileerror', function(event, data, msg) {  //一个文件上传失败  
        console.log('文件上传失败！'+data.id);  
    })  
}
</script>
</body>
</html>