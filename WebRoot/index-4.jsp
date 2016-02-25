<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	 <head>
	 <title>CONTACTS</title>
	 <meta charset="utf-8">
	 <link rel="icon" href="images/favicon.ico">
	 <link rel="shortcut icon" href="images/favicon.ico" />
	 <link rel="stylesheet" href="css/style.css">
	 <link rel="stylesheet" href="css/form.css">
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
  <div class="grid_6">
	<h3 class="head2">地址信息</h3>
		  <div class="map">
		  <figure class="">
						<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps/ms?msa=0&amp;msid=203546863038691500623.0004fd18db26436573e32&amp;ie=UTF8&amp;ll=30.236366,120.045632&amp;spn=0,0&amp;t=h&amp;output=embed"></iframe><br /><small>在较大的地图中查看<a href="https://maps.google.com/maps/ms?msa=0&amp;msid=203546863038691500623.0004fd18db26436573e32&amp;ie=UTF8&amp;ll=30.236366,120.045632&amp;spn=0,0&amp;t=h&amp;source=embed" style="color:#0000FF;text-align:left">我保存的地方</a></small>
			 </figure>
			<address>
						  <dl>
							  <dt><p>浙江工业大学<br>
								  留和路288号<br>
								  杭州市西湖区</p>
							  </dt>							
							  <dd><span>电话:</span></dd>
							  <dd><span>传真:</span></dd>

						  </dl> 
					   </address>
					  
		</div>
  </div>
  <div class="grid_5 prefix_1">
	<h3 class="head2">Get In Touch</h3>
	<form id="form">
	<div class="success_wrapper">
	<div class="success">Contact form submitted!<br>
	<strong>We will be in touch soon.</strong> </div></div>
	<fieldset>
	<label class="name">
	<input type="text" value="Name:">
	<br class="clear">
	<span class="error error-empty">*This is not a valid name.</span><span class="empty error-empty">*This field is required.</span> </label>
	<label class="email">
	<input type="text" value="E-mail:">
	<br class="clear">
	<span class="error error-empty">*This is not a valid email address.</span><span class="empty error-empty">*This field is required.</span> </label>
	<label class="phone">
	<input type="tel" value="Phone:">
	<br class="clear">
	<span class="error error-empty">*This is not a valid phone number.</span><span class="empty error-empty">*This field is required.</span> </label>
	<label class="message">
	<textarea>Message:</textarea>
	<br class="clear">
	<span class="error">*The message is too short.</span> <span class="empty">*This field is required.</span> </label>
	<div class="clear"></div>
	<div class="btns"><a data-type="reset" class="btn">clear</a><a data-type="submit" class="btn">send</a>
	
	<div class="clear"></div>
	</div></fieldset></form>
  </div>
  </div>
</div>
<!--==============================footer=================================-->
<footer>	
  <%@ include file="footer.jsp" %>
</footer>
</body>
</html>