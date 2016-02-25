function display(uno,uname,upass)
{
	document.getElementById("regist-form").style.visibility="visible";
	document.getElementById("item6").innerHTML=uno;
	document.getElementById("item9").innerHTML=uname;
	document.getElementById("item12").innerHTML=upass;
}

function closeNav()
{
	document.getElementById("regist-form").style.visibility="hidden";
}