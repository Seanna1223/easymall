<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>欢迎注册EasyMall</title>
		<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/regist.css"/>
		<script  type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery-1.4.2.js"></script>
		<script type="text/javascript">
			/* 点击图片换一张验证码  */
			//浏览器只要发现图片的src地址变化，图片就会变化。
			$(function(){

				
				$("#img").click(function(){
					$(this).attr("src","${ pageContext.request.contextPath }/index/valiImage?time="+new Date().getTime());
				});
				
				//给所有输入框添加失去输入焦点的事件  当失去输入焦点时检查输入是否为空或者两次密码是否一致，或者邮箱格式是否正确。
				$("input[name='username']").blur(function(){
					if(!formobj.checkNull("username", "用户名不能为空！")){
						return false;						
					}else{
						var url="${ pageContext.request.contextPath }/user/checkUser";
						var username=$("input[name='username']").val();
						$.post(url,{"username":username},
							function(data){
								$("#username_msg").html(data);
							}
						);
					}
				});
				$("input[name='password']").blur(function(){
					formobj.checkNull("password", "密码不能为空！");	
					formobj.checkLength("password", "密码不能小于6位！")
					formobj.checkPassword("password","两次密码输入不一致");
				});
				$("input[name='password2']").blur(function(){
					formobj.checkNull("password2", "确认密码不能为空！");
					formobj.checkLength("password2", "密码不能小于6位！")
					formobj.checkPassword("password","两次密码输入不一致");
				});
				$("input[name='nickname']").blur(function(){
					formobj.checkNull("nickname", "昵称不能为空！");
				});
				$("input[name='email']").blur(function(){
					formobj.checkNull("email", "邮箱不能为空！");
					formobj.checkEmail("email", "邮箱格式不正确！");
				});
				$("input[name='emcode']").blur(function(){
					formobj.checkNull("emcode", "激活码不能为空！");
				});
				$("input[name='valistr']").blur(function(){
					formobj.checkNull("valistr", "验证码不能为空！");
				});
				
				$("#btnGetVcode").click(function() {
					var btnGet = document.getElementById("btnGetVcode");
					btnGet.disabled = true;  // 为了防止多次点击
					$.ajax({
						url: "${pageContext.request.contextPath}/user/getcode?email="+$("input[name='email']").val(),
						type: 'post',
						//data: {email: $("input[name='email']").val()},
						dataType: 'text',
						
					});
				});
				
			});
			
			/*注册表单的js校验*/
			var formobj={
					"checkForm":function(){
						//1.非空校验				
						var res1=this.checkNull("username", "用户名不能为空！");
						var res2=this.checkNull("password", "密码不能为空！");
						var res3=this.checkNull("password2", "确认密码不能为空！");
						var res4=this.checkNull("nickname", "昵称不能为空！");
						var res5=this.checkNull("email", "邮箱不能为空！");
						var res6=this.checkNull("valistr", "验证码不能为空！");
						var res7=this.checkPassword("password","两次密码输入不一致");
						var res8=this.checkEmail("email","邮箱格式不正确！");
						var res9=this.checkNull("emcode","激活码不能为空！");
						var res10=this.checkLength("password", "密码不能小于6位！");
						var res11=this.checkLength("password2", "密码不能小于6位！");
						return res1 && res2 && res3 && res4 && res5 && res6 && res7 && res8 && res9 && res10 &&res11;				
					},
				"checkNull":function(name,msg){
					var value=$("input[name='"+name+"']").val();  
					this.setMsg(name,"");
					if(value.trim()==""){
						this.setMsg(name, msg);
						return false;
					}
					return true;
				},
				/* 设置错误提示消息  */
				"setMsg":function(name,msg){
					var $span=$("input[name='"+name+"']").nextAll("span");	
					$span.html(msg);
					$span.css("color","red");
				},
				
				//2.两次密码是否一致校验
				"checkPassword":function(name,msg){
					var pwd=$("input[name='"+name+"2']").val().trim();
					var pwd2=$("input[name='"+name+"']").val().trim();
					
				  	if( pwd!="" && pwd2!=""){
				  		//清空之前的消息。
		//				this.setMsg(name+"2","");
				  		if(pwd!= pwd2){
							this.setMsg(name+"2", msg);
							return false;
						}
				  	}
				  	return true;
				},
				
				"checkLength":function(name,msg){
					var pwd=$("input[name='"+name+"2']").val().trim();
					var pwd2=$("input[name='"+name+"']").val().trim();
					
				  	if( pwd.length<6  || pwd2.length<6){
				
							this.setMsg(name+"2", msg);
							return false;
						
				  	}
				  	return true;
				},
				//3.邮箱格式校验
				"checkEmail":function(name,msg){
					var email=$("input[name='"+name+"']").val().trim();
					var regExp=/^\w+@\w+(\.\w+)+$/;
					if(email!=""){
						if(!regExp.test(email)){
							this.setMsg(name, msg);
							return false;
						}
					}
					return true;
				}
				
				
			};
			</script>
	</head>
	<body>
	<!-- onsubmit事件在表单提交时触发，该事件会根据返回值决定是否提交表单，  
	          如果onsubmit="return true"会继续提交表单，如果onsubmit="return false" 
	          表单将不会提交 
	     onsubmit="" 引号中报错并不是因为代码有问题，而是MyEclipse工具在检查语法认为这个代码有问题。其实没有错误     
	-->
		<form onsubmit="return formobj.checkForm();" action="${ pageContext.request.contextPath }/user/regist" method="POST">
			<h1>欢迎注册EasyMall</h1>
			<table>
				<tr>
					<td colspan="2" style="color:red;text-align:center;"></span>${ msg }</td>
				</tr>
			
				<tr>
					<td class="tds">用户名：</td>
					<td>
						<input type="text" name="username" value="${ param.username }"/>
						<span id="username_msg"></span>
					</td>
					
				</tr>
				<tr>
					<td class="tds">密码：</td>
					<td>
						<input type="password" name="password"  value="${ param.password }"/>
						<span></span>
					</td>
				</tr>
				<tr>
					<td class="tds">确认密码：</td>
					<td>
						<input type="password" name="password2" value="${ param.password2 }"/>
						<span></span>
					</td>
				</tr>
				<tr>
					<td class="tds">昵称：</td>
					<td>
						<input type="text" name="nickname"  value="${ param.nickname }"/>
						<span></span>
					</td>
				</tr>
				<tr>
					<td class="tds">邮箱：</td>
					<td>
						<input type="text" name="email" value="${ param.email }"/>		
						<span></span>
					</td>
				</tr>				
				<tr >
				<td class="tds"></td>
				<td>
                	<input type="text" name="emcode"  style="width:106px;"  value="${param.emcode }"/>
                	<button id="btnGetVcode" style="cursor:pointer" >获取激活码</button>
                	<span></span>
                	</td>
				</tr>
				<tr>
					<td class="tds">验证码：</td>
					<td>
						<input  type="text" name="valistr" value=""/>
						
						<img id="img"  src="${pageContext.request.contextPath }/index/valiImage"/>
						<span></span>
					</td>
				</tr>
				<tr>
					<td class="sub_td" colspan="2" class="tds">
						<input type="submit" value="注册用户"/>						
					</td>
					<td><!-- qaz -->
					<a href="${ pageContext.request.contextPath}/index/login">登录</a>	 &nbsp;	
					</td>
				</tr>
			</table>
		</form>
		
	</body>
</html>