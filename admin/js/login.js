function checkForm()
{
	//Prompt if missing userid and password
	if((document.login.username.value == "") && (document.login.password.value == ""))
	{
		alert("Please enter your username and password");
		document.login.username.focus();
		return false;
	}

	//Prompt if missing userid
	if(document.login.username.value == "")
	{
		alert("Please enter your username");
		document.login.username.focus();
		return false;
	}

	//Prompt if missing password
	if(document.login.password.value == "")
	{
		alert("Please enter your password");
		document.login.password.focus();
		return false;
	}

	return true;
}