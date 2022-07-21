<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><!-- qaz -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>echars</title>
		<meta charset="utf-8"/>
		<link href="${ pageContext.request.contextPath }/css/managestyle.css" rel="stylesheet" type="text/css">
		
		
	<!-- 引入jQuery函数库 -->
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-1.4.2.js"></script>	
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
	<script type="text/javascript">
	//点击事件需要使用js指令，其他的好像发送不出去请求

	</script>
	</head>
	<body>
	<div class="top">
		<h1>销售榜单</h1>
	</div>	
	<div class="content">
		<div class="left">			
			<%@ include file = "_left.jsp" %>
		</div>
	<div class="right">	
			打印成功！<a href="D:/销售榜单.xls">D:/销售榜单.xls</a>
	</div>

	
	</div>		
	</body>	
</html>