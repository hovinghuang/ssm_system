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
<title>相册管理</title>
</head>
<body>
<div class="pd-20">
  <div class="text-c"><!--  日期范围： -->
  </div>
  <div class="cl pd-5 bg-1 bk-gray mt-20">
  <span class="l"><a href="javascript:;" onclick="photos_del()" class="btn btn-danger radius"><i class="icon-trash"></i> 批量删除</a>
  </div>
  <table class="table table-border table-bordered table-hover table-bg table-sort">
    <thead>
      <tr class="text-l">
        <th width="15"><input type="checkbox" name="" value=""></th>
        <th width="80">ID</th>
        <th width="100">相册名称</th>
        <th width="100">相册描述</th>
        <th width="100">相册类型</th>
        <th width="130">上传用户</th>
        <th width="130">上传时间</th>      
        <th width="100">操作</th>
      </tr>
    </thead>
    <tbody>
     </tbody>
  </table>
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
var searchkey = parent.$("#key").val();
var datemin = parent.$("#datemin").val();
var datemax = parent.$("#datemax").val();
var table =$('.table-sort').dataTable({
	"searching": false,
	"bStateSave": false,//状态保存
    "bInfo": false,
    "iDisplayLength" : 10, //默认显示的记录数
	"lengthChange": false, //是否允许相册自定义显示数量
	"bPaginate": false ,//开启分页功能，如果不开启，将会全部显示
	"processing": true,
    "serverSide": true,
	"ordering":false,
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
        "url": "searchPhotoByKey?key="+searchkey+"&datemin="+datemin+"&datemax="+datemax,
        "type": "POST",
        "dataType":"JSON",
    }, 
    "aoColumns": [
			   {"data":"id"},
               {"data":"id"},
               {"data":"name"},
               {"data":"description"},
               {"data":"phototype"},
               {"data":"uploaduser"},
               {"data":"uploadtime"},
               {"data":"id"}
               ],
    "aoColumnDefs": [
        { 
    	"bSortable": false, 
    	"aTargets": [0,1,2,3,4,5,6,7] 
    	},{
        targets: 0,//指定第一列，从0开始，0表示第一列，1表示第二列……
        render: function(data, type, row, meta) {
            return '<input class="text-c" type="checkbox" id="checkbox_id" name="checklist" value="' + data + '" />';
        }},
        {
        targets: 7,
        render: function (data, type, row, meta) {
        	var e_title = "编辑相册";
        	var e_url = "editPhotoPage?id="+ data;
        	var e_id = data;
        	var e_w = 900;  	
        	var e_h = 700;
            return '<a title="编辑" href="javascript:;" onclick="photo_edit('+'\''+e_title+'\''+','+'\''+e_url+'\''+','+'\''+e_id+'\''+','+'\''+e_w+'\''+','+'\''+e_h+'\''+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> '
            +'<a title="删除" href="javascript:;" onclick="photo_del(this,'+data+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>';
        }
        } 
        ]
	});
/*相册-编辑*/
function photo_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*相册-删除*/
function photo_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'deletePhoto?id='+ id,
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
/*相册-批量删除*/
function photos_del(){
	console.log('/*相册-批量删除*/');
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
				url: 'deletePhotos',
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
		layer.msg('请选择要删除的相册!',{icon:1,time:1000});
	}
}
</script>
</body>
</html>
