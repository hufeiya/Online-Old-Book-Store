<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html >
	 <head>
	 <title>用户注册</title>
	 <meta charset="utf-8">
	 <link rel="icon" href="images/favicon.ico">
	 <link rel="shortcut icon" href="images/favicon.ico" />
	 <link rel="stylesheet" href="css/style.css">
	 <link rel="stylesheet" href="css/form.css">
	 <link rel="stylesheet" href="css/newForm.css" type="text/css" media="all" />
	 <script src="js/regist.js"></script>
	 <script src="js/jquery.js"></script>
	 <script src="js/jquery-migrate-1.1.1.js"></script>
	 <script src="js/superfish.js"></script>
	 <script src="js/forms.js"></script>
	 <script src="js/jquery.equalheights.js"></script>
	 <script src="js/jquery.easing.1.3.js"></script>
	 <style type="text/css">
		.fucktag
		{
			position:relative;
			left:400px;
			top: -40px;
		}
	</style>
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
<form id="regist-form" action="myregist" method="post" >
		<fieldset>
		
			<legend>注册</legend>
			
			<label for="uno">账号</label>
			<input type="text" id="uno" name="uno" onblur="checkUno();"/>
	
			<div  id = "info1" class="fucktag"></div>
			<div class="clear" ></div>
			<label for="username">姓名</label>
			<input type="text" id="username" name="username" onblur = "checkUname();"/>
			<div id = "info2" class="fucktag"></div>
			<div class="clear" ></div>
			<label for="password">密码</label>
			<input type="password" id="password" name="password" onblur = "checkUpass();"/>
			<div id = "info3" class="fucktag"></div>
			<div class="clear" ></div>
			<label for="password2">确认密码</label>
			<input type="password" id="password2" name="password2" onblur = "checkUpassSame();"/>
			<div id = "info4" class="fucktag"></div>
			<div class="clear" ></div>
			
			
			
			
			<input type="submit" style="margin: 20px 0 0 287px;" class="button" name="commit" value="注册"/>	
		</fieldset>
	</form>

  	
	<br />
	<br />
  
  </div>
  
</div>
<!--==============================footer=================================-->

<footer>	
  <%@ include file="footer.jsp" %>
</footer>
</body>
</html>