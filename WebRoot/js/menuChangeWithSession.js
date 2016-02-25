window.onload=function(){
	

		//获取文件名
		var strUrl=window.location.href;
		var arrUrl=strUrl.split("/");
		var strPage=arrUrl[arrUrl.length-1];
		var d;
		//清空原有样式
		d=document.getElementById('li1');
		d.className = "";
		d=document.getElementById('li2');
		d.className = "";
		d=document.getElementById('li3');
		d.className = "";
		d=document.getElementById('li4');
		d.className = "";
		d=document.getElementById('li5');
		d.className = "";
		d = null;
		if(strPage == "index.jsp")
		{
			d=document.getElementById('li1');
		}
		else if(strPage == "index-1.jsp" || strPage == "product")
		{
			d=document.getElementById('li2');	
		}
		else if(strPage == "index-2.jsp")
		{
			d=document.getElementById('li3');	
		}
		else if(strPage == "index-3.jsp" || strPage == "index-3.jsp?responseError=true")
		{
			
			d=document.getElementById('li4');
			//不能用innerHTML，会改变css咕~~(╯﹏╰)b
			d.outerHTML = "<li id = 'li4' ><a href='index-3.jsp'>登陆</a></li>";
			//alert(d.outerHTML);
		}
		else if(strPage == "index-4.jsp")
		{
			d=document.getElementById('li5');	
		}
		else if(strPage == "mylogin" || strPage == "personalCenter.jsp" || strPage == "regist")
		{
			d=document.getElementById('li4');
			d.outerHTML = "<li id = 'li4' ><a href='personalCenter.jsp'>个人中心</a></li>";
		}
		
		d.className="current";
		d=document.getElementById('li4');
		d.outerHTML = "<li id = 'li4' ><a href='personalCenter.jsp'>个人中心</a></li>";
	}