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
	 method="POST" action="${ pageContext.request.contextPath }/admin/updateprod?id=${prod.id }">			
		<fieldset>
		<legend>修改商品</legend>			
<%-- 		<input name="price" value="${prod.price }" display="none"/> --%>
		
		<p>
            <label>商品名:</label>
            <input name="name" value="${prod.name }"/>
            
            
        </p><p>
 
            <label>商品价格:</label>
            <input name="price" value="${prod.price }"/>
            
        </p><p>
            <label>商品类别:</label>
            <select name="category">
<!--             通过循环语句将所有商品类别显示在下拉列表中 -->
					<c:forEach items="${categories}" var="c">
						<option value="${c}">${c}</option>
					</c:forEach>
			</select>
        </p><p>
            <label>库存:</label>
            <input name ="pnum" value="${prod.pnum }"/>
        </p><p>
            <label>图片:</label>
            <input type="file" name="imgurl"/>
        </p><p>
            <label>商品描述:</label>
            <input name="description" value="${prod.description }"/>
        </p><p id="buttons">
        
        
        <input id="reset" type="reset">

            <input id="submit" type="submit" value="修改商品">
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