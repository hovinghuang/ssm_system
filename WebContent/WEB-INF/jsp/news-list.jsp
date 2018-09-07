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
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<title>信息内容管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 操作员及权限管理 <span class="c-gray en">&gt;</span> 信息内容管理 <a class="btn btn-success radius r" id="btn-refresh" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
  <div class="text-c"><!--  日期范围： -->
    <input type="text" value="" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
    -
    <input type="text" value="" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
    <input type="text" value="" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="key" name="key"><button type="submit" href="javascript:;" onclick="news_search('关键字查找信息','searchnewsByKeyPage','1000','700')" class="btn btn-success" id="sub" name=""><i class="icon-search"></i> 搜信息</button>

  </div>
  <br>
  <div class="panel panel-default">
  <div class="panel-header" style="height:28px;" >
    <span class="l"><a href="javascript:;" onclick="newss_del()" class="btn btn-danger"><i class="icon-trash"></i> 批量删除</a>
    <a href="javascript:;" onclick="news_add('添加信息','addNewsPage','550','550')" class="btn btn-primary"><i class="icon-plus"></i> 添加信息</a></span>
    <span class="r">共有数据：<strong>${amount}</strong> 条</span>
  </div>
 
  <table class="table table-border table-hover table-striped table-sort">
    <thead>
      <tr class="text-l">
        <th width="25"><input type="checkbox" name="" value=""></th>
        <th width="40">ID</th>
        <th width="100">标题</th>
        <th width="40">类型</th>
        <th width="100">摘要</th>
        <th width="50">发布用户</th>
        <th width="50">阅读量</th>
        <th width="50">发布状态</th>
        <th width="100">时间</th>
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
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
var table =$('.table-sort').dataTable({
	"ordering": false, // 禁止排序
	"searching": false,
	"bStateSave": false,//状态保存
    "bInfo": false,
    "iDisplayLength" : 10, //默认显示的记录数
	"lengthChange": false, //是否允许信息自定义显示数量
	"processing": true,
    "serverSide": true,
	"aaSorting": [[1, "desc"]],
	 "language": {
		 "emptyTable":"没有数据", 
		 "info":"展示 _START_ 到 _END_ ;总共  _TOTAL_ 条记录",
		 "paginate": {
		      "previous": "上一页",
		      "next": "下一页",
		      "last": "尾页"
		    }
		  },
	"ajax": {
        "url": "listNewsTable",
        "type": "POST",
        "dataType":"JSON",
    }, 
    "aoColumns": [
			   {"data":"id"},
               {"data":"id"},
               {"data":"title"},
               {"data":"news_type"},
               {"data":"newsabstract"},
               {"data":"user_name"},
               {"data":"reading"},
               {"data":"status"},
               {"data":"createtime"},
               {"data":"id"}
               ],
    "aoColumnDefs": [
        { 
    	"bSortable": false, 
    	"aTargets": [0,1,2,3,4,5,6,7,8,9] 
    	},{
        targets: 0,//指定第一列，从0开始，0表示第一列，1表示第二列……
        render: function(data, type, row, meta) {
            return '<input type="checkbox" id="checkbox_id" name="checklist" value="' + data + '" />';
        }},
        {
        targets: 9,
        render: function (data, type, row, meta) {
        	var e_title = "编辑信息";
        	var e_url = "editNewsPage?id="+ data;
        	var e_id = data;
        	var e_w = 550;  	
        	var e_h = 570;
            return '<a title="编辑" href="javascript:;" onclick="news_edit('+'\''+e_title+'\''+','+'\''+e_url+'\''+','+'\''+e_id+'\''+','+'\''+e_w+'\''+','+'\''+e_h+'\''+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> '
            +'<a title="删除" href="javascript:;" onclick="news_del(this,'+data+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
        }
        } 
        ]
	});

/*信息-查找*/
function news_search(title,url,w,h){
	if(($('#key').val()=='')){
        /* alert('输入不为空'); */
        layer.msg('关键字不能为空!',{icon:1,time:1000});
    }else{
    	layer_show(title,url,w,h);
    }
}
/*信息-添加*/
function news_add(title,url,w,h){
	/* layer_show(title,url,w,h); */
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*信息-编辑*/
function news_edit(title,url,id,w,h){
	/* layer_show(title,url,w,h); */
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*信息-删除*/
function news_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'deleteNews?id='+ id,
			dataType: 'json',
			success: function(data){//success指的是请求并成功返回信息
				console.log(data.msg);
				if(data.msg == 'success'){
					$(obj).parents("tr").remove();
					layer.msg('删除成功!',{icon:1,time:1000});
				}else{
					layer.msg('删除失败!',{icon:1,time:1000});
				}
			},
			error:function(data) {
				console.log(data.msg);
				layer.msg('请求失败!',{icon:1,time:1000});
			},
		});		
	});
}
/*信息-批量删除*/
function newss_del(){
	console.log('/*信息-批量删除*/');
	var idArray =new Array();;
	var checked = $("input[name='checklist']:checked").val([]);//获取提交的表单下input为复选框所有选中的数组值
	for(var i=0;i<checked.length;i++){//循环值
		idArray[i] = checked[i].value;
		console.log('ids[i]:'+idArray[i]);
	}
	if(idArray != ''){
		layer.confirm('确认要批量删除吗？',function(index){
			$.ajax({
				type: 'POST',
				url: 'deleteNewss',
				dataType: 'json',
				traditional:true,
				data: {
				    "idArray": idArray,
				  },
				success: function(data){
					console.log(data.msg);
					if(data.msg == 'success'){
						layer.msg('删除成功!',{icon:1,time:1000});
						setTimeout('window.location.reload()',300);
					}else{
						layer.msg('删除失败!',{icon:1,time:1000});
						setTimeout('window.location.reload()',300);
					}
				},
				error:function(data) {
					console.log(data.msg);
					layer.msg('请求失败!',{icon:1,time:1000});
					setTimeout('window.location.reload()',300);
				},
			});		
		});
	}else{
		layer.msg('请选择要删除的信息!',{icon:1,time:1000});
	}
}
</script>
</body>
</html>
