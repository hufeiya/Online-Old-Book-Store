
<%@page import="com.entity.Product"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
	 <head>
	 <title>ABOUT</title>
	 <meta charset="utf-8">
	 <link rel="icon" href="images/favicon.ico">
	 <link rel="shortcut icon" href="images/favicon.ico" />
	 <link rel="stylesheet" href="css/style.css">
	 <link rel="stylesheet" href="tableLib/jquery.dynatable.css">
	 <script src="js/jquery.js"></script>
	 <script src="js/jquery-migrate-1.1.1.js"></script>
	 <script src="js/superfish.js"></script>
	 <script src="js/jquery.equalheights.js"></script>
	 <script src="js/jquery.easing.1.3.js"></script>
	 <script src="tableLib/vendor/jquery-1.7.2.min.js"></script>
	 <script src="tableLib/jquery.dynatable.js"></script>
	 
	 </head>
	 <body>
<!--==============================header=================================-->
 <header> 
  <%@ include file="header.jsp" %>
   <script>
	$(document).ready(function(){
		$('#productInfo').dynatable();
		
  
});
</script>
</header>
<div class="top_block tb1">
 <div class="container_12">
	<%!ArrayList<Product> products; %>
  <%//获取会话信息
  	products = (ArrayList<Product>)session.getAttribute("products");
  %>
  <% 
  	if(products == null)
  	{
  		out.print("服务器未返回数据(⊙o⊙)…");
  	}
  	else
  	{
  %>		
  		
  		<br />
  <%
  	}
  %>
  	<h3>所有商品</h3>
  	<div class="table-a">
	<table id="productInfo" style="font-size:18px;text-align: center;">
	  <thead>
	    <tr>
	      <th>预览图片</th>
	      <th>商品号</th>
	      <th>商品名称</th>
	      <th>品牌</th>
	      <th>价格</th>
	      <th>生产商</th>
	      <th>生产日期</th>
	      <th>类型</th>	
	    </tr>
	  </thead>
	  <tbody>
	    
	      <%
	      	
	      	for(Product product : products)
	      	{
	      		out.print("<tr>");
	      		out.print("<td><a href = \"productDetails?pno="+ product.getPno()+"\">" +"<img width=\"100\" height=\"100\" src=\"pictures/" + product.getPphoto() + "\"/></a></td>");
	      		out.print("<td><a href = \"productDetails?pno="+ product.getPno()+"\">"+ product.getPno() + "</a></td>");
	      		out.print("<td><a href = \"productDetails?pno="+ product.getPno()+"\">" + product.getPname() + "</a></td>");
	      		out.print("<td>" + product.getPbrand() + "</td>");
	      		out.print("<td>" + product.getPprice() + "</td>");
	      		out.print("<td>" + product.getPproducer() + "</td>");
	      		out.print("<td>" + product.getPdate() + "</td>");
	      		out.print("<td>" + product.getPtype() + "</td>");
	      		out.print("</tr>");
	      	}
	      
	      %>
	    </tr>
	  </tbody>
	</table>
	</div>
  </div>
</div>
<!--=======content================================-->

<div class="content bdt0">
  <div class="container_12">
  
  
  </div>
</div>
<!--==============================footer=================================-->

<footer>	
  <%@ include file="footer.jsp" %>
</footer>
</body>
</html>