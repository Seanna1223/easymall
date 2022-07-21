<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>添加商品</title>
		<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
		<link href="${ pageContext.request.contextPath }/css/managestyle.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<div class="top">
		<h1>&nbsp;&nbsp;EasyMall商城管理后台</h1>
	</div>	
	<div class="content">
		<div class="left">			
			<%@ include file = "_left.jsp" %>
		</div>
	<div class="right">	
	<div class="addprod">
	<jsp:useBean id="myproducts"  class="easymall.pojo.MyProducts" scope="request" ></jsp:useBean>
	<form  modelAttribute="myproducts"
	 onsubmit="return formobj.checkForm();" 
	  enctype="multipart/form-data"
	 method="POST" action="${ pageContext.request.contextPath }/admin/updatecategory?id=${c.name }">			
		<fieldset>
		<legend>修改分类</legend>			
<%-- 		<input name="price" value="${prod.price }" display="none"/> --%>
		
		<p>
            <label>商品名:</label>
            <input name="name" value="${c.name }"/>
        </p><p>
            <label>描述:</label>
            <input  name="description" value="${c.description }"/>
        </p><p>
        </p><p id="buttons">
        <input id="reset" type="reset">

            <input id="submit" type="submit" value="修改分类">
<!--         </p> -->
    	</fieldset>
<!--     	取出所有验证错误 -->
<%--     	<form:errors path="*"/> --%>

	</form>
	</div>
	</div><!-- right结束 -->
	</div><!-- content结束 -->		
	
	
	</body>
</html>