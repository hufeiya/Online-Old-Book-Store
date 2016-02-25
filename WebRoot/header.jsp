<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/backtotop.css">
	

<%
	if(session.getAttribute("user") != null )
	{
%><!-- 此处添加js，为了保持动态菜单 -->
<script
	src="js/menuChangeWithSession.js">	
</script>
<%
	}
	else if (session.getAttribute("admin") != null)
	{
%>
		<script
			src="js/menuChangeWithAdminSession.js">	
		</script>
<%
	}else
	{
%>
		<script src="js/menuChange.js"></script>
<%
	}	
%>	

</head>
<body>
	<div class="container_12">
	<div class="grid_12"> 
	<h1><a href="index.jsp"><img src="images/logo.png" alt="旧书摊——浙江工业大学"></a> </h1><div class="clear"></div>
	
		 <div class="menu_block">
		   <nav  class="" >
			<ul class="sf-menu">
				   <li id = "li1" ><a href="index.jsp">主页</a></li>
				   <li id = "li2" class="with_ul"><a href="listProducts">闲逛</a>
				  <!-- <ul>
						 <li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
						
					 </ul> --> 
					 </li>
				   <li id = "li3" ><a href="index-2.jsp">分类</a></li>
				   <li id = "li4" ><a href="index-3.jsp">登陆</a></li>
				   <li id = "li5" ><a href="index-4.jsp">留言</a></li>
				 </ul>
			  </nav>
		   <div class="clear"></div>
		   </div>
		   <div class="clear"></div>
	  </div>
	</div>
</body>
</html>