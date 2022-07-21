<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><!-- qaz -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>销售榜单</title>
		<meta charset="utf-8"/>
		<link href="${ pageContext.request.contextPath }/css/managestyle.css" rel="stylesheet" type="text/css">
		
		
	<!-- 引入jQuery函数库 -->
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-1.4.2.js"></script>
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
			<a href="${pageContext.request.contextPath}/admin/exportExcel">打印Excel</a>
	</div>
	<table width="799" height="80" border="1" cellpadding="0" cellspacing="0" bordercolor="#d8d8d8">
				<tr>
					<th width="276">商品图片</th>
					<th width="247">商品名称</th>
					<th width="231">商品单价</th>
					<th width="232">库存数量</th>
					<th width="232">状态</th>
					<th width="214">销售数量</th>
				</tr>
				<c:forEach items="${products}" var="prod">
				<tr>
					<td><img src="${ pageContext.request.contextPath }${prod.imgurl}" 
					width="90" height="90" class="prodimg" /></td>
					<td>${prod.name }</td>
					<td>${prod.price }元</td>
					<td>${prod.pnum }件</td>
					<td>
					<c:if test="${prod.status==1}">上架</c:if>
					<c:if test="${prod.status==0}"><font color="red">下架</font></c:if>
					</td>
					<td>${prod.soldnum }件</td>
				</tr>				
				</c:forEach>
			</table>
	
	</div>		
	</body>	
</html>