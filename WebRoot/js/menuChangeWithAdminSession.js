
//点击修改，显示悬浮窗
	function display(uno,uname,upass)
	{
		var fm = document.getElementById("regist-form");
		   if(fm.hidden)
		   {
			   
			   fm.item6.value =  uno;
			   fm.item9.value =  uname;
			   fm.item12.value =  upass;
			   fm.hidden = false;
			   
		   }
	}   
window.onload=function(){
	
	
	
	
	
		//获取文件名
		var strUrl=window.location.href;
		var arrUrl=strUrl.split("/");
		var strPage=arrUrl[arrUrl.length-1];
		var d;
		document.getElementById("regist-form").hidden=true;
		
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
		else if(strPage == "index-3.jsp" || strPage == "index-3.jsp?responseError=true" || strPage == "login?quit=true")
		{
			
			d=document.getElementById('li4');
			//不能用innerHTML，会改变css咕~~(╯﹏╰)b
			d.outerHTML = "<li id = 'li4' ><a href='index-3.jsp'>登陆</a></li>";
			//alert(d.outerHTML);
		}
		else if(strPage == "index-4.jsp" )
		{
			d=document.getElementById('li5');	
		}
		else if(strPage == "mylogin" || strPage == "adminCenter.jsp" || strPage == "regist" || strPage == "adminCenter.jsp?isSucceed=true")
		{
			//显示和隐藏悬浮窗
			
			document.getElementById('main').onclick=function(e){
				   var event = window.event?window.event:e; //window.event: IE---e:火狐
				   var elem = event.srcElement||event.target;  //srcElement:IE--target:火狐
				   var fm = document.getElementById("regist-form");
				   if(!fm.hidden)
				   {
					   
					   if(elem.id != "modify" && elem.id != "regist-form" && elem.id != "item1" && elem.id != "item2" && elem.id != "item3" && elem.id != "item4"&& elem.id != "item5" && 
							   elem.id != "item6" && elem.id != "item7"&& elem.id != "item8"&& elem.id != "item9" && elem.id != "item10" && 
							   elem.id != "item11" && elem.id != "item12"  )
					  {
						   
						   	fm.hidden = true;
					  }
				  }
			}
			d=document.getElementById('li4');
			d.outerHTML = "<li id = 'li4' ><a href='adminCenter.jsp'>管理中心</a></li>";
		}
		if(d != null)
			d.className="current";
		d=document.getElementById('li4');
		d.outerHTML = "<li id = 'li4' ><a href='adminCenter.jsp'>管理中心</a></li>";
	}