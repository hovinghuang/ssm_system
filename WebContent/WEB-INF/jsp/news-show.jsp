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
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<title>新闻展示</title>

</head>
<body>
<div class="Hui-article">
	<div class="row">
		<div class="panel panel-default col-sm-8 col-md-offset-2"">
			<article class="cl pd-20">
				<div class="page_title">
					<h2>
					${news.title}
					</h2>
				</div>
				<div>
					<span class="l">日期：<strong>${news.createtime}</strong>&nbsp;&nbsp;&nbsp;&nbsp;上传者：<strong>${user_name}</strong></span>
					<span class="r">浏览量：<strong>${news.reading}</strong></span>
				</div>
				<!-- <hr> -->
				<br>
				<div>
				<hr style="height:1px;border:none;border-top:1px solid #5A98DE;" />
				<br>
					${news.content}
				</div>
			</article>
		</div>
		<div class="row">
			<ul class="commentList col-sm-8 col-md-offset-2">
			  <li class="item cl"> <a href="#"><i class="avatar size-L radius"><img alt="" src=""></i></a>
			    <div class="comment-main">
			      <header class="comment-header">
			        <div class="comment-meta"><a class="comment-author" href="#">辉哥</a> 评论于
			          <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20">2014-8-31 15:20</time>
			        </div>
			      </header>
			      <div class="comment-body">
			        <p><a href="#">@某人</a> 你是猴子派来的救兵吗？</p>
			      </div>
			    </div>
			  </li>
			</ul>
		</div>
	</div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/lightbox2/2.8.1/js/lightbox.min.js"></script> 
<script type="text/javascript">

</script>
</body>
</html>