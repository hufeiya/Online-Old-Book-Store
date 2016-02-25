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
	<font size="30"><% out.println(session.getAttribute("errorMsg")); %></font>

  	
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