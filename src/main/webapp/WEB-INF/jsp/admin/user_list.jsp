<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>用户管理</title>
		<meta charset="utf-8"/>
		<link href="${ pageContext.request.contextPath }/css/managestyle2.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<div class="top">
		<h1>用户管理</h1>
	</div>	
	<div class="content">
		<div class="left">			
			<%@ include file = "_left.jsp" %>
		</div>
	<table  width="800" height="80" border="1" cellpadding="0" cellspacing="0" bordercolor="#d8d8d8">
				<tr>
					<th width="400">用户名称</th>
					<th width="200">用户类型</th>
					<th width="200">用户管理</th>
				</tr>
				<c:forEach items="${users}" var="user">
				<tr>
				    <td align="center">${user.username}</td>
				    <td align="center"><c:if test="${orderInfo.order.paystate==2}"><font color="orange">已发货</font></c:if>	
				
				    	<c:if test="${user.usertype==0}">
				    		<font color="orange">管理员</font>
				    	</c:if>
				    	<c:if test="${user.usertype==1}">
				    		<font color="green">普通用户</font>
				    	</c:if>
				    </td>
				    <td align="center">
					    <c:if test="${user.usertype==0}">
					    		<a href="${pageContext.request.contextPath}/admin/change21?id=${user.id}">修改为普通用户</a>	
					    </c:if>
					    <c:if test="${user.usertype==1}">
					    		<a href="${pageContext.request.contextPath}/admin/change20?id=${user.id}">修改为超级用户</a>	
				    </c:if>
				    </td>
				</tr>
				</c:forEach>
			</table>
	</div>
	</body>
</html>
