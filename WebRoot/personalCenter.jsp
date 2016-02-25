<%@page import="com.entity.Sell"%>
<%@page import="com.entity.Buy"%>
<%@page import="com.entity.Users"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
	 <head>
	 <title>个人中心</title>
	 <meta charset="utf-8">
	 <link rel="icon" href="images/favicon.ico">
	 <link rel="shortcut icon" href="images/favicon.ico" />
	 <link rel="stylesheet" href="css/style.css">
	 <link rel="stylesheet" href="css/slider.css">
	 <link rel="stylesheet" href="tableLib/jquery.dynatable.css">
	 <script src="js/jquery.js"></script>
	 <script src="js/jquery-migrate-1.1.1.js"></script>
	 <script src="js/superfish.js"></script>
	 <script src="js/forms.js"></script>
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
		$('#bought').dynatable();
		$('#sold').dynatable();
  
});
</script>
</header>

<!--=======content================================-->

<div class="content"><div class="ic"></div>
  <div class="container_12">
  <%!Users user; %>
  <%//获取会话信息
  	user = (Users)session.getAttribute("user");
  %>
  <% 
  	if(user == null)
  	{
  		out.print("您尚未登陆或登陆超时，请"+ "<a href = 'index-3.jsp'>重新登陆</a>");
  	}
  	else
  	{
  %><!-- 下面写html语句，用户信息 -->		
  		<div ><h3>欢迎你，<%=user.getUname()%></h3></div>
  		<a href = "refresh" style="margin-top: 10px;font-size: 20px;position:absolute;right: 200px;top: 358px;">刷新</a>
  		<a href = "soldProduct.jsp" style="margin-top: 10px;font-size: 20px;position:absolute;right: 80px;top: 358px;">发布商品</a>
  		<a href = "myquit" style="margin-top: 10px;font-size: 20px;position:absolute;right: 10px;top: 358px;">退出</a>
  
  	<h3>买入的订单</h3>
  	<div class="table-a">
	<table id="bought">
	  <thead>
	    <tr>
	      <th>订单号</th>
	      <th>商品号</th>
	      <th>买入时间</th>
	      <th>交易状态</th>
	    </tr>
	  </thead>
	  <tbody>
	    
	      <%
	      	Set<Buy> boughts = user.getBuies();
	      	if (boughts != null){
	      		for(Buy bought : boughts)
		      	{
		      		out.print("<tr>");
		      		out.print("<td>" + bought.getId() + "</td>");
		      		out.print("<td><a href = \"productDetails?pno=" + bought.getProduct().getPno()+ "\"/a>" +  bought.getProduct().getPno()+ "</td>");
		      		out.print("<td>" + bought.getBdate() + "</td>");
		      		out.print("<td>" + bought.getBstate()+ "</td>");
		      		out.print("</tr>");
		      	}
	      	}
	      	
	      
	      %>
	    </tr>
	  </tbody>
	</table>
	<h3>卖出的订单</h3>
	<table id="sold">
	  <thead>
	    <tr>
	      <th>订单号</th>
	      <th>商品号</th>
	      <th>上架/卖出时间</th>
	      <th>交易状态</th>
	      <th>操作</th>
	    </tr>
	  </thead>
	  <tbody>
	    
	      <%
	      	Set<Sell> solds = user.getSells();
	      	if (solds != null){
		      	for(Sell sold : solds)
		      	{
		      		out.print("<tr>");
		      		out.print("<td>" + sold.getId() + "</td>");
		      		out.print("<td><a href = \"productDetails?pno=" + sold.getProduct().getPno()+ "\"/a>" + sold.getProduct().getPno()+"</td>");
		      		out.print("<td>" + sold.getSdate() + "</td>");
		      		out.print("<td>" + sold.getSstate()+ "</td>");
		      		out.print("<td><a href=\"removeProduct?pno=" + sold.getProduct().getPno() +"\">" + "删除"+ "</a></td>");
		      		out.print("</tr>");
		      	}
	      	}
	      	
	      
	      %>
	    </tr>
	  </tbody>
	</table>
	</div>
	<%
  	}
  %>
  </div>
  
</div>
<!--==============================footer=================================-->

<footer>	
  <%@ include file="footer.jsp" %>
</footer>
</body>
</html>