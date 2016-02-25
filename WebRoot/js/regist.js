var xmlHttp;
var uno;
var isChecked;
function createXMLHttpRequest()
{
	if(window.ActiveXObject)
	{
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if(window.XMLHttpRequest)
	{
		xmlHttp = new XMLHttpRequest();
	}
}
function isEmpty(x)
{
	if(x.value == "")
	{
		return true;
	}
		
	else
	{
		return false;
	}
}
function checkUno()
{
	uno = document.getElementById("uno");
	if(isEmpty(uno))
	{
		document.getElementById("info1").innerHTML = '账号不能为空';
		return false;
	}
	else
	{
		CheckUnoExited();
		if(isChecked)
			return false;
		else
			return true;
	}
}
function CheckUnoExited()
{
	createXMLHttpRequest();
	xmlHttp.onreadystatechange = handleCheck;
	xmlHttp.open("GET","regist?uno=" + uno.value,true);
	//此处有小bug，但无法修复。bug：账号检验可用后用户又修改成不可用的再提交
	xmlHttp.send(null);
}
function handleCheck()
{
	if(xmlHttp.readyState == 4)
	{
		if(xmlHttp.status == 200)
		{
			document.getElementById("info1").innerHTML = xmlHttp.responseXML.
			getElementsByTagName("message")[0].firstChild.data;
			isChecked = true;
		}
	}
	
}
function checkUname()
{
	var username = document.getElementById("username");
	if(isEmpty(username))
	{
			document.getElementById("info2").innerHTML = "用户姓名不能为空";
			return false;
	}
	else
		return true;
}
function checkUpass()
{
	var password = document.getElementById("password");
	if(isEmpty(password))
	{
		document.getElementById("info3").innerHTML = "密码不能为空";
		return false;
	}
	else 
		return true;
	
}
function checkUpassSame()
{	var password = document.getElementById("password");
	var password2 = document.getElementById("password2");
	if(isEmpty(password2))
	{
		document.getElementById("info4").innerHTML = "确认密码不能为空";
		return false;
	}
	else
	{
		if(password.value != password2.value)
		{
			document.getElementById("info4").innerHTML = "两次密码输入不一致";
			return false;
		}
		else
			return true;
	}
}
function checkAll()
{
	if(checkUno() && checkUname()&& checkUpass() && checkUpassSame())
		return true;
	else
		return false;
}
