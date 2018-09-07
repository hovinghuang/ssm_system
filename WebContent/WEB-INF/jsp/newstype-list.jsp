<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<title>信息类型管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 企业内容发布及管理 <span class="c-gray en">&gt;</span> 信息类型管理 <a class="btn btn-success radius r" id="btn-refresh" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
  <div class="text-c"><!--  日期范围： -->
    <!-- <input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
    -
    <input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;"> -->
    <!-- <input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="" name=""><button type="submit" class="btn btn-success" id="" name=""><i class="icon-search"></i> 搜用户</button> -->

  </div>
  <br>
  <div class="panel panel-default">
  <div class="panel-header" style="height:28px;" >
<!--     <span class="l"><a href="javascript:;" onclick="users_del()" class="btn btn-danger radius"><i class="icon-trash"></i> 批量删除</a> -->
    <a href="javascript:;" onclick="newstype_add('添加角色','addNewsTypePage','550','530')" class="btn btn-primary"><i class="icon-plus"></i> 添加类型</a></span>
    <%-- <span class="r">共有数据：<strong>${amount}</strong> 条</span> --%>
  </div>
  <table class="table table-border table-hover table-striped table-sort">
    <thead>
      <tr class="text-l">
        <th width="80">ID</th>
        <th width="100">类型名称</th>
        <th width="100">类型描述</th>
        <th width="100">操作</th>
      </tr>
    </thead>
    <tbody>
     </tbody>
  </table>
</div>
 </div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
var table =$('.table-sort').dataTable({
    "bInfo": false,
    "searching": false,
	"bPaginate": false ,//开启分页功能，如果不开启，将会全部显示
    "iDisplayLength" : 10, //默认显示的记录数
	"lengthChange": false, //是否允许用户自定义显示数量
	"processing": true,
    "serverSide": true,
	"ordering":false,
	"ajax": {
        "url": "listNewsTypeTable",
        "type": "POST",
        "dataType":"JSON",
    }, 
    "aoColumns": [
               {"data":"id"},
               {"data":"name"},
               {"data":"description"},
               {"data":"id"}
               ],
    "aoColumnDefs": [
        { 
    	"bSortable": false, 
    	"aTargets": [0,] 
    	},
        {
        targets: 3,
        render: function (data, type, row, meta) {
        	var e_title = "编辑角色";
        	var e_url = "editNewsTypePage?id="+ data;
        	var e_id = data;
        	var e_w = 550;  	
        	var e_h = 550;
            return '<a title="编辑" href="javascript:;" onclick="newstype_edit('+'\''+e_title+'\''+','+'\''+e_url+'\''+','+'\''+e_id+'\''+','+'\''+e_w+'\''+','+'\''+e_h+'\''+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> '
            +'<a title="删除" href="javascript:;" onclick="newstype_del(this,'+data+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
        }
        } 
        ]
	});
/*角色-添加*/
function newstype_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*角色-编辑*/
function newstype_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*角色-删除*/
function newstype_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'deleteNewsType?id='+ id,
			dataType: 'json',
			success:function(data) { //请求成功后处理函数。
	        	console.log(data.msg);
				if(data.msg == 'success'){
					layer.msg('提交成功!',{icon:1,time:1000});
					setTimeout('window.location.reload()',300); //延迟0.3秒
				}else{
					layer.msg('提交失败!请检查，很可能是该用户名已经被占用。',{icon:1,time:2000});
				}
	        },
	        error:function(data) {//请求失败处理函数  
	        	console.log(data.msg);
				layer.msg('请求失败!稍等请重新提交',{icon:1,time:1000});
	        },
		});		
	});
}
</script>
</body>
</html>
