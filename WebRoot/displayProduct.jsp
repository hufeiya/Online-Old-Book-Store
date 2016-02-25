<%@page import="com.entity.Product"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html lang="en">
	 <head>
	 <title>商品信息</title>
	 <meta charset="utf-8">
	 <link rel="icon" href="images/favicon.ico">
	 <link rel="shortcut icon" href="images/favicon.ico" />
	 <link rel="stylesheet" href="css/style.css">
	 <link rel="stylesheet" href="css/form.css">
	 <link rel="stylesheet" href="tableLib/jquery.dynatable.css">
	 <script src="js/jquery.js"></script>
	 <script src="js/jquery-migrate-1.1.1.js"></script>
	 <script src="js/superfish.js"></script>
	 <script src="js/forms.js"></script>
	 <script src="js/jquery.equalheights.js"></script>
	 <script src="js/jquery.easing.1.3.js"></script>
	<!-- 为购买按钮创建的css -->	
	 <style type="text/css">
	 	@-webkit-keyframes redPulse 
	 	{
		  from { background-color: #bc330d; -webkit-box-shadow: 0 0 9px #333; }
		  50% { background-color: #e33100; -webkit-box-shadow: 0 0 18px #e33100; }
		  to { background-color: #bc330d; -webkit-box-shadow: 0 0 9px #333; }
		}
		.red.button { -webkit-animation-name: redPulse; -webkit-animation-duration: 
		1s;-webkit-animation-iteration-count: infinite; font-size: 20px ;font-family: cursive;padding: 10px;
		color: white;border-radius: 15px; 
		
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
<br />
<br />
<br />
<br />
  <div class="container_12">
  <div class="grid_6">
	<!-- 显示图片 -->
	<img src="pictures/${product.pphoto}"/>
  </div>

  <div class="grid_5 prefix_1">
   <!-- 显示商品信息 -->
   <div class="table-a">
	<table >
		<tr>
			<td>商品号</td>
			<td>${product.pno}</td>
		</tr>
		<tr>
			<td>商品名</td>
			<td>${product.pname}</td>
		</tr>
		<tr>
			<td>类型</td>
			<td>${product.ptype}</td>
		</tr>
		<tr>
			<td>价格</td>
			<td>${product.pprice}</td>
		</tr>
		<tr>
			<td>品牌</td>
			<td>${product.pbrand}</td>
		</tr>
		<tr>
			<td>生产日期</td>
			<td>${product.pdate}</td>
		</tr>
		<tr>
			<td>生产商</td>
			<td>${product.pproducer}</td>
		</tr>
		<tr>
			<td>介绍</td>
			<td>${product.pintroducer}</td>
		</tr>
	</table>
  </div>
  <br />
  <br />
  <br />

  <a class = "red button" href="buyProduct?pno=${product.pno}">立即购买</a>

  </div>
</div>
</div>
	<!-- 显示商品信息结束 -->

<!--==============================footer=================================-->
<footer>	
  <%@ include file="footer.jsp" %>
</footer>
</body>
</html>