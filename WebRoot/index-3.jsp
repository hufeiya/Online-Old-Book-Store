<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	 <head>
	 <title>登陆</title>
	 <meta charset="utf-8">
	 <link rel="icon" href="images/favicon.ico">
	 <link rel="shortcut icon" href="images/favicon.ico" />
	 <link rel="stylesheet" href="css/style.css">
	 <link rel="stylesheet" href="css/form.css">
	 <link rel="stylesheet" href="css/newForm.css" type="text/css" media="all" />
	 <script src="js/jquery.js"></script>
	 <script src="js/jquery-migrate-1.1.1.js"></script>
	 <script src="js/superfish.js"></script>
	 <script src="js/forms.js"></script>
	 <script src="js/jquery.equalheights.js"></script>
	 <script src="js/jquery.easing.1.3.js"></script>
	 
	 </head>
	 <body>
<!--==============================header=================================-->
 <header> 
  <%@ include file="header.jsp" %>
</header>

<!--=======content================================-->

<div class="content"><div class="ic"></div>
  <div class="container_12">
  	
</head>
<body>
<form id="login-form" action="mylogin" method="post">
		<fieldset>
		
			<legend>Log in</legend>
			
			<label for="username">账号</label>
			<input type="text" id="uno" name="uno"/>
			<div class="clear"></div>
			
			<label for="password">密码</label>
			<input type="password" id="password" name="password"/>
			<div class="clear"></div>
			
			<label for="admin" style="padding: 0;">我是管理员</label>
			<input type="checkbox" id="admin" style="position: relative; top: 3px; margin: 0; " name="admin"/>
			<div class="clear"></div>
			
			<br />
			<%
			if("true".equals(session.getAttribute("responseError")))
			{%>
				<font color="red">
			<% 
			
				out.print("很遗憾，账号或密码错误");
				session.setAttribute("responseError", "false");
			}
			%></font>
			
			<input type="submit" style="margin: -20px 0 0 287px;" class="button" name="commit" value="登陆"/>	
		</fieldset>
	</form>

  	
	<br />
	<br />
	<div>还没有账户？&nbsp&nbsp<a href="regist.jsp">马上注册！</a></div>
  
  </div>
  
</div>
<!--==============================footer=================================-->

<footer>	
  <%@ include file="footer.jsp" %>
</footer>
</body>
</html>