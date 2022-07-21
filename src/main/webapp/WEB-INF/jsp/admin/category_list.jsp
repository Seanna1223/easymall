<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>分类管理</title>
		<meta charset="gbk"/>
		<link href="${ pageContext.request.contextPath }/css/managestyle2.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<div class="top">
		<h1>分类管理</h1>
	</div>	
	<div class="content">
		<div class="left">			
			<%@ include file = "_left.jsp" %>
		</div>
	<div class="right">	 
	    <a href="${pageContext.request.contextPath}/admin/addcate">添加商品类别</a>	
	</div>
	<table width="800" height="80" border="1" cellpadding="0" cellspacing="0" bordercolor="#d8d8d8">
				<tr>
					<th width="400">类别名称</th>
					<th width="200">修改</th>
					<th width="200">删除类别</th>
				</tr>
				<c:forEach items="${category}" var="cate">
				<tr>
				    <td align="center">${cate.name}</td>
				    <td align="center" ><a href="${pageContext.request.contextPath}/admin/modifyCategory?name=${cate.name}">修改</a></td> <!-- href="${pageContext.request.contextPath}/admin/delcate?description=${cate.description} -->
				    <td align="center"><a href="${pageContext.request.contextPath}/admin/delcate?name=${cate.name}">删除</a>	</td>
				</tr>
				</c:forEach>
			</table>
	</div>


	</body>
</html>