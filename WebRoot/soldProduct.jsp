<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html lang="en">
	 <head>
	 <title>发布商品</title>
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
<body>
<div class="content"><div class="ic"></div>
  <div class="container_12">
  	


<s:form id="product-form" action="publishProduct" method="post">
		
		<s:textfield name="product.pname" label="商品名"></s:textfield>
		<s:textfield name="product.pbrand" label="品牌"></s:textfield>
		<s:textfield name="product.pprice" label="价格"></s:textfield>
		<s:textfield name="product.pphoto" label="照片"></s:textfield>
		<s:textfield name="product.pproducer" label="生产商"></s:textfield>
		<s:textfield name="product.pdate" label="生产日期"></s:textfield>
		<s:textfield name="product.pintroducer" label="简介"></s:textfield>
		<s:textfield name="product.ptype" label="类型"></s:textfield>
		<s:submit  class="button"  label="发布"/>
	</s:form>

  	
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