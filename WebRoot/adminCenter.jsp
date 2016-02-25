<%@page import="com.entity.Product"%>
<%@page import="com.entity.Buy"%>
<%@page import="com.entity.Users"%>
<%@page import="com.entity.Administrator"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
	 <head>
	 <title>管理中心</title>
	 <meta charset="utf-8">
	 <link rel="icon" href="images/favicon.ico">
	 <link rel="shortcut icon" href="images/favicon.ico" />
	 <link rel="stylesheet" href="css/style.css">
	 <link rel="stylesheet" href="css/slider.css">
	 <link rel="stylesheet" href="tableLib/jquery.dynatable.css">
	 <link rel="stylesheet" href="css/newForm.css" type="text/css" media="all" />
	 <script src="js/jquery.js"></script>
	 <script src="js/jquery-migrate-1.1.1.js"></script>
	 <script src="js/superfish.js"></script>
	 <script src="js/forms.js"></script>
	 <script src="js/jquery.equalheights.js"></script>
	 <script src="js/jquery.easing.1.3.js"></script> 
	 <script src="tableLib/vendor/jquery-1.7.2.min.js"></script>
	 <script src="tableLib/jquery.dynatable.js"></script>
	 <script src="js/navControl.js"></script> 
	 <script src="js/tab.js"></script> 
	 <style type="text/css">
body,ul,li{margin: 0;padding: 0;font: 12px normal "宋体", Arial, Helvetica, sans-serif;list-style: none;}
a{text-decoration: none;color: #000;font-size: 14px;}

#tabbox{ width:600px; overflow:hidden; margin:0 auto;}
.tab_conbox{border-top: none;}
.tab_con{ display:none;}

.tabs{height: 32px;border-bottom:1px solid #999;border-left: 1px solid #999;width: 100%;}
.tabs li{height:31px;line-height:31px;float:left;border:1px solid #999;border-left:none;margin-bottom: -1px;background: #e0e0e0;overflow: hidden;position: relative;}
.tabs li a {display: block;padding: 0 20px;border: 1px solid #fff;outline: none;}
.tabs li a:hover {background: #ccc;}	
.tabs .thistab,.tabs .thistab a:hover{background: #fff;border-bottom: 1px solid #fff;}

.tab_con {padding:12px;font-size: 14px; line-height:175%;}
</style>
	 </head>
	 <body>
<!--==============================header=================================-->
 <header> 
  <%@ include file="header.jsp" %>
  <script>
	$(document).ready(function(){
		$('#users').dynatable();
		$('#bought').dynatable();
		$('#productInfo').dynatable();
  
});
</script>
<!-- 悬浮窗，修改用户和商品时用 -->
<style>
.nav { width:400px; height: 220px; background-color:gray; position:fixed;left:35%;top:25% ;border-radius: 15px; 
	  filter:alpha(opacity=70);  

      
      	}
</style>
</header>

<!--=======content================================-->

<div class="content"><div class="ic"></div>
  <div class="container_12" id="main">
  <%!Administrator admin; %>
  <%//获取会话信息
  admin = (Administrator)session.getAttribute("admin");
  %>
  
  <%//如果修改用户或商品信息成功，弹出对话框
  	if(request.getParameter("isSucceed") != null)
  	{
  %>
  <script type="text/javascript">alert("操作成功！")</script>
  
  <% 		
  	}
  %>
  <% 
  	if(admin == null)
  	{
  		out.print("您尚未登陆或登陆超时，请"+ "<a href = 'index-3.jsp'>重新登陆</a>");
  	}
  	else
  	{
  %><!-- 下面写html语句，用户信息 -->		
  		<div ><h3>欢迎你，<%=admin.getAname() %></h3></div>
  		<a href = "myquit" style="margin-top: 10px;font-size: 20px;position:absolute;right: 10px;top: 358px;">退出</a>
  
  	
			<form id="regist-form" class="nav"action="changeUser" method="post"    >
			  <br id="item1"/>
			  <br id="item2"/>
			<fieldset id="item3">
			
				<legend id="item4">修改用户信息</legend>
				
				<label id="item5" for="uno"><font color="orange">账号</font></label>
				<input id="item6" type="text"  name="uno" readonly style="background-color: gray;"/>
					
				<div id="item7" class="clear" ></div>
				<label id="item8" for="username"><font color="orange">姓名</font></label>
				<input id="item9" type="text" name="username" />
				
				<div id="item10" class="clear" ></div>
				<label id="item11" for="password"><font color="orange">密码</font></label>
				<input id="item12" type="text" name="password" />
				
	
				<input id="item13" type="submit" style="margin: 20px 0 0 287px;" class="button" name="commit" value="确认修改"/>	
			</fieldset>
			<br />
		</form>
		
		
		<ul class="tabs" id="tabs2">
       <li><a href="#">管理用户</a></li>
       <li><a href="#">管理订单</a></li>
       <li><a href="#">管理商品</a></li>
    </ul>
    <ul class="tab_conbox" id="tab_conbox2">
        <li class="tab_con">
          <div class="table-a">
	<table id="users">
	  <thead>
	    <tr>
	      <th>账号</th>
	      <th>姓名</th>
	      <th>密码</th>
	      <th>删除</th>
	      <th>修改</th>
	    </tr>
	  </thead>
	  <tbody>
	    
	      <%
	      	ArrayList<Users> users = (ArrayList<Users>)session.getAttribute("users");
	      	for(Users user : users)
	      	{
	      		out.print("<tr>");
	      		out.print("<td " +"id=\"" + user.getUno() +"\">" + user.getUno() + "</td>");
	      		out.print("<td " +"id=\"" + user.getUname() +"\">" +  user.getUname() + "</td>");
	      		out.print("<td " +"id=\"" + user.getUpass() +"\">" +  user.getUpass() + "</td>");
	      		out.print("<td ><a href=\"deleteUser?deleteuno="+ user.getUno() +"\">删除"+ "</a></td>");
	      		out.print("<td><a id=\"modify\" href=\"javascript:void(0)\" onclick=\"display(\'" +
	      		user.getUno() +"\',\'" +user.getUname() +"\',\'" + user.getUpass() + "\')\">修改"+ "</a></td>");
	      		out.print("</tr>");
	      	}
	      
	      %>
	    </tr>
	  </tbody>
	</table> 	
	</div>
        </li>
            
    
        <li class="tab_con">
        	<div class="table-a">
	<table id="bought">
	  <thead>
	    <tr>
	      <th>订单号</th>
	      <th >商品号</th>
	      <th>买入时间</th>
	      <th>交易状态</th>
	    </tr>
	  </thead>
	  <tbody>
	    
	      <%
	      	ArrayList<Buy> boughts = (ArrayList<Buy>)session.getAttribute("boughts");
	      	for(Buy bought : boughts)
	      	{
	      		out.print("<tr>");
	      		out.print("<td>" + bought.getId() + "</td>");
	      		out.print("<td>" + bought.getProduct().getPno() + "</td>");
	      		out.print("<td>" + bought.getBdate() + "</td>");
	      		out.print("<td>" + bought.getBstate() + "</td>");
	      		out.print("</tr>");
	      	}
	      
	      %>
	    </tr>
	  </tbody>
	</table>
	</div>
        </li>
    
        <li class="tab_con">
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
	      <th>删除</th>
	      <th>修改</th>
	    </tr>
	  </thead>
	  <tbody>
	    
	      <%
	      	ArrayList<Product> products = (ArrayList<Product>)session.getAttribute("products");
	      	for(Product product : products)
	      	{
	      		out.print("<tr>");
	      		out.print("<td><a href = \"product?pno="+ product.getPno()+"\">" +"<img width=\"100\" height=\"100\" src=\"pictures/" + product.getPphoto() + "\"/></a></td>");
	      		out.print("<td><a href = \"product?pno="+ product.getPno()+"\">"+ product.getPno() + "</a></td>");
	      		out.print("<td><a href = \"product?pno="+ product.getPno()+"\">" + product.getPname() + "</a></td>");
	      		out.print("<td>" + product.getPbrand() + "</td>");
	      		out.print("<td>" + product.getPprice() + "</td>");
	      		out.print("<td>" + product.getPproducer() + "</td>");
	      		out.print("<td>" + product.getPdate() + "</td>");
	      		out.print("<td>" + product.getPtype() + "</td>");
	      		out.print("<td><a href=\"#\">删除"+ "</a></td>");
	      		out.print("<td><a href=\"#\">修改"+ "</a></td>");
	      		out.print("</tr>");
	      	}
	      
	      %>
	    </tr>
	  </tbody>
	</table>
	</div>
        </li>
    </ul>
    
	</div>
	<%
  	}
  %>
  
  
  
</div>
<!--==============================footer=================================-->

<footer>	
  <%@ include file="footer.jsp" %>
</footer>
</body>
</html>