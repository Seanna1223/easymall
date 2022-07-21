<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<link href="${ pageContext.request.contextPath }/css/addOrder.css" rel="stylesheet" type="text/css">
	<style type="text/css">
		#l-map{margin-left:500px;height:200px;width:450px;}
	</style>
	<script type="text/javascript" src="//api.map.baidu.com/api?v=3.0&ak=1U51m1QwLB7EGNQqbK77xBr1K7AwA3Az"></script>
</head>
<body>
	<%@ include file = "_head.jsp" %>
	<div class="warp">
		<form action="${pageContext.request.contextPath}/order/addOrder" name="form1" method="post">
			<h3>增加订单</h3>
			<div id="l-map" style="position:absolute;"></div>
			<div id="forminfo" style="margin-bottom:100px;">
			   <div id="r-result">
			<span class="lf" style="font-size:15px">收货地址：</span> 
				<label for="textarea"></label>
				<textarea name="receiverinfo" id="textarea" cols="35" rows="3"></textarea>
			</div>
				<br> 支付方式：<input name="" type="radio" value="1" checked>&nbsp;在线支付
				  	   <input type="hidden" name="cartIds" value="${cartIds }">
			</div>
			<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
			<table width="999" height="80" border="1" cellpadding="0" cellspacing="0" bordercolor="#d8d8d8">
				<tr>
					<th width="250">商品图片</th>
					<th width="250">商品名称</th>
					<th width="150">商品单价</th>
					<th width="150">购买数量</th>
					<th width="200">总价</th>
				</tr>
			<c:set var="sum" value="0"/>
			<c:forEach items="${carts}" var="cart">
			<tr>
				<td><img src="${pageContext.request.contextPath }${cart.imgurl}"
					width="90" height="90" class="prodimg"/></td>
				<td>${cart.name}</td>
				<td>${cart.price}元</td>
				<td>${cart.num}件</td>
				<td>${cart.price*cart.num}元</td>
			</tr>
			<c:set var="sum" value="${sum + cart.price * cart.num }"/>
			</c:forEach>
			</table>
			<div class="Order_price">总价：${sum}元</div>


			<div class="add_orderbox">
				<input name="" type="submit" value="增加订单" class="add_order_but">
			</div>
		</form>
	</div>
	<%@ include file = "_foot.jsp" %>

</body>
</html>

<script type="text/javascript">
	// 百度地图API功能
	function G(id) {
		return document.getElementById(id);
	}

	var map = new BMap.Map("l-map");
	var point = new BMap.Point(116.331398,39.897445);
	map.centerAndZoom(point,12);

	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			getAddress(r.point);
		}
		else {
			alert('failed'+this.getStatus());
		}        
	});
	function getAddress(point){
        var gc = new BMap.Geocoder();
        gc.getLocation(point, function(rs){
            var addComp = rs.addressComponents;
            var textarea =  addComp.province +  addComp.city + addComp.district + addComp.street + addComp.streetNumber;//获取地址
            console.log(textarea);
            var address = document.getElementById("textarea");
            address.value = textarea;
        });
 
    }
	
	//实现地图放大缩小功能
	map.addControl(new BMap.MapTypeControl({
		mapTypes:[
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
        ]}));	  
	map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
	map.enableScrollWheelZoom(true);  
	
	var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
		{"input" : "textarea"
		,"location" : map
	});
	
	//实现输入框搜索定位地图功能
	ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
	var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
		
		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
		G("searchResultPanel").innerHTML = str;
	});

	var myValue;
	ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
	var _value = e.item.value;
		myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
		
		setPlace();
	});

	function setPlace(){
		map.clearOverlays();    //清除地图上所有覆盖物
		function myFun(){
			var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
			map.centerAndZoom(pp, 18);
			map.addOverlay(new BMap.Marker(pp));    //添加标注
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
		  onSearchComplete: myFun
		});
		local.search(myValue);
	}
</script>