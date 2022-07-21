<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><!-- qaz -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>echarts展示</title>
		<meta charset="utf-8"/>
		<link href="${ pageContext.request.contextPath }/css/managestyle.css" rel="stylesheet" type="text/css">
		
		
	<!-- 引入jQuery函数库 -->
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-1.4.2.js"></script>	
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/echarts.js"></script>
	</head>
	<body>
		<div class="top">
			<h1>echarts</h1>
		</div>	
		<div class="content">
			<div class="left">			
				<%@ include file = "_left.jsp" %>
			</div>
			 
			<div>
			
			</div>
 		 <div class="right" id="charts1" style="width: 600px;height:500px;margin-top:50px" >
 		 </div>
 		 <div class="right" id="charts2" style="width: 600px;height:500px;margin-top:50px" >
 		 </div>
 		 <div class="right" id="charts3" style="width: 600px;height:500px;margin-top:50px" >
 		 </div>
 		 <div class="right" id="charts4" style="width: 600px;height:500px;margin-top:50px" >
 		 </div>
		</div>		
	</body>	

	<script type="text/javascript">
	 
 		// 基于准备好的dom，初始化echarts实例
		var myChart1 = echarts.init(document.getElementById('charts1'));	
		var myChart2 = echarts.init(document.getElementById('charts2'));
		var myChart3 = echarts.init(document.getElementById('charts3'));
		var myChart4 = echarts.init(document.getElementById('charts4'));
		// 指定图表的配置项和数据
		var option1 = {
				  title: {
					    text: '2021EasyMall销量分布',
					    subtext: '对比',
					    left: 'center'
					  },
					  tooltip: {
					    trigger: 'item'
					  },
					  legend: {
					    orient: 'vertical',
					    left: 'left'
					  },
					  series: [
					    {
					      name: 'Access From',
					      type: 'pie',
					      radius: '50%',
					      data: [
					    	  <c:forEach items="${entryset}" var="entry"> 
					    	  { value: ${entry.getValue()}, name: ' ${entry.getKey()}'},
					    	  </c:forEach>
					      ],
					      emphasis: {
					        itemStyle: {
					          shadowBlur: 10,
					          shadowOffsetX: 0,
					          shadowColor: 'rgba(0, 0, 0, 0.5)'
					        }
					      }
					    }
					  ]
					}; 

		
		var option2 = {				
  				title: {
  				    text: 'EasyMall各品类定价及销量分布',
  				    subtext: '                                                             ',
  				    left: 'center',
  				    bottom: '-20'
  				  },
				  tooltip: {
					    trigger: 'axis',
					    axisPointer: {
					      // Use axis to trigger tooltip
					      type: 'shadow' // 'shadow' as default; can also be 'line' or 'shadow'
					    }
					  },
					  legend: {},
					  grid: {
					    left: '3%',
					    right: '4%',
					    bottom: '10%',
					    containLabel: true
					  },
					  xAxis: {
					    type: 'value'
					  },
					  yAxis: {
					    type: 'category',
					    data: ['0-100¥', '100-1000¥', '1000-5000¥', '5000以上¥']
					  },
					  series: [
					    {
					      name: '${categories[0]}',
					      type: 'bar',
					      stack: 'total',
					      label: {
					        show: true
					      },
					      emphasis: {
					        focus: 'series'
					      },
					      data: [<c:forEach items="${arr[0]}" var="num"> ${num},</c:forEach>]
					    },
					    {
					      name: '${categories[1]}',
					      type: 'bar',
					      stack: 'total',
					      label: {
					        show: true
					      },
					      emphasis: {
					        focus: 'series'
					      },
					      data: [<c:forEach items="${arr[1]}" var="num"> ${num},</c:forEach>]
					    },
					    {
					      name: '${categories[2]}',
					      type: 'bar',
					      stack: 'total',
					      label: {
					        show: true
					      },
					      emphasis: {
					        focus: 'series'
					      },
					      data: [<c:forEach items="${arr[2]}" var="num"> ${num},</c:forEach>]
					    },
					    {
					      name: '${categories[3]}',
					      type: 'bar',
					      stack: 'total',
					      label: {
					        show: true
					      },
					      emphasis: {
					        focus: 'series'
					      },
					      data: [<c:forEach items="${arr[3]}" var="num"> ${num},</c:forEach>]
					    },
					    {
					      name: '${categories[4]}',
					      type: 'bar',
					      stack: 'total',
					      label: {
					        show: true
					      },
					      emphasis: {
					        focus: 'series'
					      },
					      data: [<c:forEach items="${arr[4]}" var="num"> ${num},</c:forEach>]
					    },
					    {
					      name: '${categories[5]}',
					      type: 'bar',
					      stack: 'total',
					      label: {
					        show: true
					      },
					      emphasis: {
					        focus: 'series'
					      },
					      data: [<c:forEach items="${arr[5]}" var="num"> ${num},</c:forEach>]
					    },
					    {
					      name: '${categories[6]}',
					      type: 'bar',
					      stack: 'total',
					      label: {
					        show: true
					      },
					      emphasis: {
					        focus: 'series'
					      },
					      data: [<c:forEach items="${arr[6]}" var="num"> ${num},</c:forEach>]
					    },
					    {
					      name: '${categories[7]}',
					      type: 'bar',
					      stack: 'total',
					      label: {
					        show: true
					      },
					      emphasis: {
					        focus: 'series'
					      },
					      data: [<c:forEach items="${arr[7]}" var="num"> ${num},</c:forEach>]
					    }
					  ]
					};
		
		var option3 = {
				  title: {
				    text: 'EasyMall各品类销量随定价的变化'
				  },
				  tooltip: {
				    trigger: 'axis'
				  },
				  legend: {
				    data: ['${categoris[0]}', '${categoris[1]}', '${categoris[2]}', '${categoris[3]}', '${categoris[4]}', '${categoris[5]}', '${categoris[6]}' , '${categoris[7]}']
				  },
				  grid: {
				    left: '3%',
				    right: '4%',
				    bottom: '3%',
				    containLabel: true
				  },
				  toolbox: {
				    feature: {
				      saveAsImage: {}
				    }
				  },
				  xAxis: {
				    type: 'category',
				    boundaryGap: false,
				    data: ['0-100¥', '100-1000¥', '1000-5000¥', '5000+¥',]
				  },
				  yAxis: {
				    type: 'value'
				  },
				  series: [
				    {
				    	name: '${categories[0]}',
				      type: 'line',
				      stack: 'Total',
				      data: [<c:forEach items="${arr[0]}" var="num"> ${num},</c:forEach>]
				    },
				    {
				    	name: '${categories[1]}',
				      type: 'line',
				      stack: 'Total',
				      data: [<c:forEach items="${arr[1]}" var="num"> ${num},</c:forEach>]
				    },
				    {
				    	name: '${categories[2]}',
				      type: 'line',
				      stack: 'Total',
				      data: [<c:forEach items="${arr[2]}" var="num"> ${num},</c:forEach>]
				    },
				    {
				    	name: '${categories[3]}',
				      type: 'line',
				      stack: 'Total',
				      data: [<c:forEach items="${arr[3]}" var="num"> ${num},</c:forEach>]
				    },
				    {
				    	name: '${categories[4]}',
				      type: 'line',
				      stack: 'Total',
				      data: [<c:forEach items="${arr[4]}" var="num"> ${num},</c:forEach>]
				    },
				    {
				    	name: '${categories[5]}',
				      type: 'line',
				      stack: 'Total',
				      data: [<c:forEach items="${arr[5]}" var="num"> ${num},</c:forEach>]
				    },
				    {
				    	name: '${categories[6]}',
				      type: 'line',
				      stack: 'Total',
				      data: [<c:forEach items="${arr[6]}" var="num"> ${num},</c:forEach>]
				    },
				    {
				    	name: '${categories[7]}',
				      type: 'line',
				      stack: 'Total',
				      data: [<c:forEach items="${arr[7]}" var="num"> ${num},</c:forEach>]
				    }
				  ]
				};
		var option4 = {
				  title: {
					    text: 'EasyMall订单状态统计',
					    subtext: '对比',
					    left: 'center'
					  },
				  xAxis: {
				    type: 'category',
				    data: ['未支付', '已支付未发货', '已发货未收货', '已收货']
				  },
				  yAxis: {
				    type: 'value'
				  },
				  series: [
				    {
				      data: [${cate[0]}, ${cate[1]}, ${cate[2]}, ${cate[3]}],
				      type: 'bar',
				      showBackground: true,
				      backgroundStyle: {
				        color: 'rgba(180, 180, 180, 0.2)'
				      }
				    }
				  ]
				};
		
		// 使用刚指定的配置项和数据显示图表。
		myChart1.setOption(option1);  
		myChart2.setOption(option2);
		myChart3.setOption(option3);
		myChart4.setOption(option4);
	</script>
</html>



