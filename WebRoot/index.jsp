<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	 <head>
	 <title>HOME</title>
	 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	 <link rel="icon" href="images/favicon.ico">
	 <link rel="shortcut icon" href="images/favicon.ico" />
	 <link rel="stylesheet" href="css/style.css">
	 <link rel="stylesheet" href="css/slider.css">
	 <script src="js/jquery.js"></script>
	 <script src="js/jquery-migrate-1.1.1.js"></script>
	 <script src="js/superfish.js"></script>
	 <script src="js/jquery.equalheights.js"></script>
	 <script src="js/jquery.easing.1.3.js"></script>
	 <script src="js/tms-0.4.1.js"></script>
	 <script>
	  $(window).load(function(){
	  $('.slider')._TMS({
			  show:0,
			  pauseOnHover:false,
			  prevBu:'.prev',
			  nextBu:'.next',
			  playBu:false,
			  duration:800,
			  preset:'fade', 
			  pagination:true,//'.pagination',true,'<ul></ul>'
			  pagNums:false,
			  slideshow:8000,
			  numStatus:false,
			  banners:true,
		  waitBannerAnimation:false,
		progressBar:false
	  })  
	  });
	  

	 </script>
	
	 </head>
	 <body>
<!--==============================header=================================-->
 <header> 
  <%@ include file="header.jsp" %>
</header>
<div class="top_block">
 <div class="slider-relative">
	<div class="slider-block">
	  <div class="slider">
		<ul class="items">
		  <li>
		  
		  	<img src="images/slide1.jpg" alt="">
		  	
		  	<a href="http://localhost:8089/OnlineOldBookStore/productDetails?pno=P1009">
			<div class="banner"><br />查看详情<br></a>
 </div>
		  </li>
		  <li><img src="images/slide.jpg" alt="">
			  <a href="http://localhost:8089/OnlineOldBookStore/productDetails?pno=P1010">
			<div class="banner">查看详情<br></a>
		  </li>
		  <li><img src="images/slide2.jpg" alt="">
			  <a href="http://localhost:8089/OnlineOldBookStore/productDetails?pno=P1008">
			<div class="banner">查看详情<br></a>
</div>
		  </li>
		  <li><img src="images/slide3.jpg" alt="">
			  <a href="http://localhost:8089/OnlineOldBookStore/productDetails?pno=P1011">
			<div class="banner">查看详情<br></a>
</div>
		  </li>
		</ul>
	  </div>
	</div>

 </div> 
 <div class="container_12">
   <div class="grid_3">
	 <div class="box"><img src="images/page1_img1.jpg" alt=""><a href="#" class="maxheight">计算机<img src="images/link_bg.png" alt=""></a></div>
   </div>
   <div class="grid_3">
	 <div class="box"><img src="images/page1_img2.jpg" alt=""><a href="#" class="maxheight">小说<img src="images/link_bg.png" alt=""></a></div>
   </div>
   <div class="grid_3">
	 <div class="box"><img src="images/page1_img3.jpg" alt=""><a href="#" class="maxheight">国外名著<img src="images/link_bg.png" alt=""></a></div>
   </div>
   <div class="grid_3">
	 <div class="box"><img src="images/page1_img4.jpg" alt=""><a href="#" class="maxheight">诗歌散文<img src="images/link_bg.png" alt=""></a></div>
   </div>
 </div>
 </div>
<!--=======content================================-->

<div class="content page1"><div class="ic">More Website Templates @ TemplateMonster.com - May 27, 2013!</div>
  <div class="container_12">
	
  </div>
</div>
<!--==============================footer=================================-->

<footer>	
  <%@ include file="footer.jsp" %>
</footer>
</body>
</html>
