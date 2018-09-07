<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>编辑信息公告</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<script type="text/javascript" charset="utf-8" src="lib/ueditor/utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="lib/ueditor/utf8-jsp/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="lib/ueditor/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<link rel="stylesheet" href="lib/zTree/v3/css/demo.css" type="text/css">
<link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link type="text/css" rel="stylesheet" href="static/h-ui/css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="static/h-ui.admin/css/H-ui.admin.css"/>
</head>
<body>
<div class="pd-20">
  <div class="Huiform">
    <form id="form-news-edit">
    <div class="input-dyna-add">
        </div>
      <table class="table table-bg">
        <tbody>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 文章标题：</th>
            <td>  
            <input name="id" type="hidden" id="id" value="${news.id}">
            <input name="tpic_url" type="hidden" id="tpic_url" value="${news.tpic_url}">
            <input name="user_id" type="hidden" id="user_id" value="${news.user_id}">
            <input name="reading" type="hidden" id="reading" value="${news.reading}">
            <input name="status" type="hidden" id="status" value="${news.status}">
            <input name="createtime" type="hidden" id="createtime" value="${news.createtime}">
            <input name="cpic_url" type="hidden" id="cpic_url" value="${news.cpic_url}">
            <input name="stick" type="hidden" id="stick" value="${news.stick}">
            <input name="audit" type="hidden" id="audit" value="${news.audit}">
            <input name="content" type="hidden" id="content" value="">
            <input type="text" style="width:300px" class="input-text" value="${news.title}" placeholder="" id="title" name="title" datatype="*2-16" nullmsg="文章标题不能为空"></td>
          </tr>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 文章类型：</th>
            <td>  
	            <select name="newstype_id">
	          	<c:forEach items="${newsTypeList}" var="ntl">
					<option value="${ntl.id}" ${(news.newstype_id==ntl.id)?"selected='selected'":"" }>${ntl.name}</option>
				</c:forEach>
			  	</select>
            </td>
          </tr>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 文章摘要：</th>
            <td><input type="text" style="width:500px;height:70px;" class="input-text" value="${news.newsabstract}" placeholder="" id="newsabstract" name="newsabstract" datatype="*2-16" nullmsg="文章摘要不能为空"></td>
          </tr>
          <tr>
            <th width="100" valign="top" class="text-r"><span class="c-red">*</span> 文章内容：</th>
            <td>
            	<script id="editor" type="text/plain" style="width:80%;height:300px;"></script>
            </td>
          </tr>
          <tr>
            <th width="100" class="text-r">
            <button class="btn btn-success radius" type="submit" onClick="uptext();"><i class="icon-ok"></i> 确定</button>
			</th>
            <td></td>
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
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
//实例化编辑器
//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
var ue = UE.getEditor('editor');
var oldcontent = '${news.content}';
//判断ueditor 编辑器是否创建成功
ue.addListener("ready", function () {
// editor准备好之后才可以使用
ue.setContent(oldcontent);
});
function uptext(){
    if (!UE.getEditor('editor').hasContents()){
    alert('请先填写内容!');
    }else{
    	var info = UE.getEditor('editor').getContent();
    	$("#content").val(info);
    }
  }
$(function(){
	$("#form-news-edit").validate({
		/* rules:{
			username:{
				required:true,
				minlength:2,
				maxlength:16
			},
			desc_:{
				required:true,
			},
		}, */
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$.ajax({
		        async : false,
		        cache : false,
		        type : 'POST',
		        data : $("#form-news-edit").serialize(),
		        url : "editNews",//请求的action路径  
		        dataType: 'json',
		        success:function(data) { //请求成功后处理函数。
		        	console.log(data.msg);
					if(data.msg == 'success'){
						layer.msg('提交成功!',{icon:1,time:1000});
						setTimeout('window.parent.location.reload()',300); //延迟0.3秒
					}else{
						layer.msg('提交失败!',{icon:1,time:2000});
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