function validate(emailad)
{
	var exclude=/[^@\-\.\w]|^[_@\.\-]|[\._\-]{2}|[@\.]{2}|(@)[^@]*\1/;
	var check=/@[\w\-]+\./;
	var checkend=/\.[a-zA-Z]{2,4}$/;
	
	if(emailad == "")
	{
		alert("Please enter an email address");
		document.unsub.email.focus();
		return false;
	}
	
	if(((emailad.search(exclude) != -1)||(emailad.search(check)) == -1)||(emailad.search(checkend) == -1))
	{
		alert("Please enter a valid email address (eg: user@company.com)");
		document.unsub.email.select();
		return false;
	}
	
	return true;
}

function checkForm()
{
	//Check for a valid email entered
	var validEmail = validate(document.unsub.email.value);
	
	if(validEmail == false)
		return false;

	return true;
}
