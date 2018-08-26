<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
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
<title>编辑用户</title>
</head>
<body>
<div class="pd-20">
  <div class="Huiform">
    <form id="form-user-edit">
      <table class="table table-bg">
        <tbody>
          <tr>
            <%-- <input type="hidden" name="id" value="${user.id}"/>
            <input type="hidden" name="entrytime" value="${user.entrytime}"/> --%>
            <th width="100" class="text-r">用户名：</th>
            <td><p style="width:200px">${userName}<p></td>
          </tr>
          <tr>
            <th width="100" class="text-r">姓名：</th>
            <td><p style="width:200px">${userRealname}<p></td>
          </tr>
          <tr>
            <th class="text-r">性别：</th>
            <td>
            <c:if test="${userSex == 1}">
                <c:out value="男" escapeXml="true" default="默认值"></c:out>
            </c:if>
            <c:if test="${userSex == 0}">
                <c:out value="女" escapeXml="true" default="默认值"></c:out>
            </c:if>
            <%-- <label>
                <input name="sex" type="radio" id="sex-1" value="1" ${userSex == 1 ?'checked':''}>
                男</label>
              <label>
                <input type="radio" name="sex" value="0" id="sex-2" ${userSex == 0 ?'checked':''}>
                女</label> --%></td>
          </tr>
          <tr>
            <th class="text-r">手机：</th>
            <td><p style="width:200px">${userPhone}<p></td>
          </tr>
          <tr>
            <th class="text-r">邮箱：</th>
            <td><p style="width:200px">${userEmail}<p></td>
          </tr>
          <tr>
            <th class="text-r">创建时间：</th>
            <td><p style="width:200px">${userEntrytime}<p></td>
          </tr>
          <tr>
            <th class="text-r">地址：</th>
            <td><p style="width:200px">${userAddress}<p></td>
          </tr>
          <tr>
            <!-- <th></th>
            <td><button class="btn btn-success radius" type="submit"><i class="icon-ok"></i> 确定</button></td> -->
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
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
</script>
</body>
</html>