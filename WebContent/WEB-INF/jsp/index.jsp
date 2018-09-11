<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="favicon.ico" >
<!-- <link rel="Shortcut Icon" href="/favicon.ico" /> -->
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<title>成都金融控股企业微信管理系统</title>
</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="#">成都金融控股企业微信管理系统</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml">H-ui</a> 
			<!-- <span class="logo navbar-slogan f-l mr-10 hidden-xs">v3.1</span>  -->
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
				<ul class="cl">
					<li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" onclick="news_add('添加公告','addNewsPage')"><i class="Hui-iconfont">&#xe616;</i> 公告</a></li>
							<li><a href="javascript:;" onclick="photo_add('添加相册','addPhotoPage')"><i class="Hui-iconfont">&#xe613;</i> 相册</a></li>
							<li><a href="javascript:;" onclick="user_add('添加用户','addUserPage','550','510')"><i class="Hui-iconfont">&#xe60d;</i> 用户</a></li>
					</ul>
				</li>
			</ul>
		</nav>
		<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li></li>
				<li class="dropDown dropDown_hover">
					<a href="#" class="dropDown_A">${subject.principal}<i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" onClick="myselfinfo('个人信息','userInfoPage','550','530')">个人信息</a></li>
						<li><a href="javascript:;" onClick="password_edit('修改密码','passwordEditPage','550','330')">修改密码</a></li>
						<li><a href="doLogout">退出</a></li>
				</ul>
			</li>
				<!-- <li id="Hui-msg"> <a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li> -->
				<!-- <li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="默认（黑色）">黑色</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
					</ul>
				</li> -->
			</ul>
		</nav>
	</div>
</div>
</header>
<aside class="Hui-aside">
<div class='menu_dropdown bk_2'>

       <c:forEach items="${userPermissions}" var="up">
       		<c:set var = "P1" value="操作员及权限管理"/> 
           <c:if test="${up.name eq P1}">
               <c:out value="
		<dl id='menu-article'>
			<dt><i class='Hui-iconfont'>&#xe616;</i> 操作员及权限管理<i class='Hui-iconfont menu_dropdown-arrow'>&#xe6d5;</i></dt>
			<dd>
				<ul>" escapeXml="false" default="默认值"></c:out>
           </c:if>
       </c:forEach>
					<c:forEach items="${userPermissions}" var="up">
       		<c:set var = "P1" value="用户管理"/> 
           <c:if test="${up.name eq P1}">
               <c:out value="<li><a data-href='listUserPage' data-title='用户管理' href='javascript:void(0)'>用户管理</a></li>" escapeXml="false" default="默认值"></c:out>
           </c:if>
       </c:forEach>
					<c:forEach items="${userPermissions}" var="up">
       		<c:set var = "P1" value="角色管理"/> 
           <c:if test="${up.name eq P1}">
               <c:out value="<li><a data-href='listRolePage' data-title='角色管理' href='javascript:void(0)'>角色管理</a></li>" escapeXml="false" default="默认值"></c:out>
           </c:if>
       </c:forEach>
					<c:forEach items="${userPermissions}" var="up">
       		<c:set var = "P1" value="权限管理"/> 
           <c:if test="${up.name eq P1}">
               <c:out value="<li><a data-href='listPermissionPage' data-title='权限管理' href='javascript:void(0)'>权限管理</a></li>" escapeXml="false" default="默认值"></c:out>
           </c:if>
       </c:forEach>
			<c:forEach items="${userPermissions}" var="up">
       		<c:set var = "P1" value="操作员及权限管理"/> 
           <c:if test="${up.name eq P1}">
               <c:out value="</ul>
		</dd>
	</dl>" escapeXml="false" default="默认值"></c:out>
           </c:if>
       </c:forEach>
       
       
       <c:forEach items="${userPermissions}" var="up">
       		<c:set var = "P1" value="企业内容发布及管理"/> 
           <c:if test="${up.name eq P1}">
               <c:out value="
               <dl id='menu-picture'>
			<dt><i class='Hui-iconfont'>&#xe613;</i> 企业内容发布及管理<i class='Hui-iconfont menu_dropdown-arrow'>&#xe6d5;</i></dt>
			<dd>
				<ul>" escapeXml="false" default="默认值"></c:out>
           </c:if>
       </c:forEach>
				<c:forEach items="${userPermissions}" var="up">
       		<c:set var = "P1" value="信息内容管理"/> 
           <c:if test="${up.name eq P1}">
               <c:out value="<li><a data-href='listNewsPage' data-title='信息内容管理' href='javascript:void(0)'>信息内容管理</a></li>" escapeXml="false" default="默认值"></c:out>
           </c:if>
       </c:forEach>
       <c:forEach items="${userPermissions}" var="up">
       		<c:set var = "P1" value="信息类型管理"/> 
           <c:if test="${up.name eq P1}">
               <c:out value="<li><a data-href='listNewsTypePage' data-title='信息类型管理' href='javascript:void(0)'>信息类型管理</a></li>" escapeXml="false" default="默认值"></c:out>
           </c:if>
       </c:forEach>
			<c:forEach items="${userPermissions}" var="up">
       		<c:set var = "P1" value="企业内容发布及管理"/> 
           <c:if test="${up.name eq P1}">
               <c:out value="</ul>
		</dd>
	</dl> " escapeXml="false" default="默认值"></c:out>
           </c:if>
       </c:forEach>
       
       
       <c:forEach items="${userPermissions}" var="up">
       		<c:set var = "P1" value="企业相册管理"/> 
           <c:if test="${up.name eq P1}">
               <c:out value="
               <dl id='menu-product'>
			<dt><i class='Hui-iconfont'>&#xe620;</i> 企业相册管理    <i class='Hui-iconfont menu_dropdown-arrow'>&#xe6d5;</i></dt>
			<dd>
			<ul>" escapeXml="false" default="默认值"></c:out>
           </c:if>
       </c:forEach>
 <c:forEach items="${userPermissions}" var="up">
       		<c:set var = "P1" value="相册内容管理"/> 
           <c:if test="${up.name eq P1}">
               <c:out value="
				<li><a data-href='listPhotoPage' data-title='相册内容管理' href='javascript:void(0)'>相册内容管理</a></li>" escapeXml="false" default="默认值"></c:out>
           </c:if>
       </c:forEach>
				<c:forEach items="${userPermissions}" var="up">
       		<c:set var = "P1" value="相册内容管理"/> 
           <c:if test="${up.name eq P1}">
               <c:out value="<li><a data-href='listPhotoTypePage' data-title='相册类型管理' href='javascript:void(0)'>相册类型管理</a></li>" escapeXml="false" default="默认值"></c:out>
           </c:if>
       </c:forEach>
			<c:forEach items="${userPermissions}" var="up">
       		<c:set var = "P1" value="企业相册管理"/> 
           <c:if test="${up.name eq P1}">
               <c:out value="</ul>
		</dd>
	</dl>
               " escapeXml="false" default="默认值"></c:out>
           </c:if>
       </c:forEach>
       
       
       
       <c:forEach items="${userPermissions}" var="up">
       		<c:set var = "P1" value="学习考核管理"/> 
           <c:if test="${up.name eq P1}">
               <c:out value="
               <dl id='menu-comments'>
			<dt><i class='Hui-iconfont'>&#xe622;</i> 学习考核管理<i class='Hui-iconfont menu_dropdown-arrow'>&#xe6d5;</i></dt>
			<dd>
				<ul>
			</ul>
		</dd>
	</dl>
               " escapeXml="false" default="默认值"></c:out>
           </c:if>
       </c:forEach>
       
       
       <c:forEach items="${userPermissions}" var="up">
       		<c:set var = "P1" value="系统管理"/> 
           <c:if test="${up.name eq P1}">
               <c:out value="
               <dl id='menu-system'>
			<dt><i class='Hui-iconfont'>&#xe62e;</i> 系统管理<i class='Hui-iconfont menu_dropdown-arrow'>&#xe6d5;</i></dt>
			<dd>
				<ul>
			</ul>
		</dd>
	</dl>
               " escapeXml="false" default="默认值"></c:out>
           </c:if>
       </c:forEach>
</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="我的桌面" data-href="welcome">我的桌面</span>
					<em></em></li>
		</ul>
	</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="welcome"></iframe>
	</div>
</div>
</section>

<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
$(function(){
	
});
/*个人信息*/
function myselfinfo(title,url,w,h){
	layer_show(title,url,w,h);
}
/*修改密码*/
function password_edit(title,url,w,h){
	layer_show(title,url,w,h);
}

/*公告-添加*/
function news_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-添加*/
function photo_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*用户-添加*/
function user_add(title,url,w,h){
	layer_show(title,url,w,h);
}


</script> 
</body>
</html>