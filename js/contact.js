function allDigits(str)
{
	return inValidCharSet(str,"0123456789");
}

function inValidCharSet(str,charset)
{
	var result = true;
	for (var i=0;i<str.length;i++)
		if (charset.indexOf(str.substr(i,1))<0)
		{
			result = false;

			break;
		}
	return result;
}

function validate(emailad)
{
	var exclude=/[^@\-\.\w]|^[_@\.\-]|[\._\-]{2}|[@\.]{2}|(@)[^@]*\1/;
	var check=/@[\w\-]+\./;
	var checkend=/\.[a-zA-Z]{2,4}$/;
	if(emailad == "")
	{
		alert("Please enter an email address");
		document.contact.email.focus();
		return false;
	}
	
	if(((emailad.search(exclude) != -1)||(emailad.search(check)) == -1)||(emailad.search(checkend) == -1))
	{
		alert("Please enter a valid email address (eg: user@company.com)");
		document.contact.email.select();
		return false;
	}
	
	return true;
}

function checkForm()
{
	//Prompt if missing First Name
	if(document.contact.fname.value == "")
	{
		alert("Please enter your First Name");
		document.contact.fname.focus();
		return false;
	}
	
	//Prompt if missing Last Name
	if(document.contact.lname.value == "")
	{
		alert("Please enter your Last Name");
		document.contact.lname.focus();
		return false;
	}
	
	//Prompt if missing Phone Number
	if(document.contact.phone.value == "")
	{
		alert("Please enter your Phone Number");
		document.contact.phone.focus();
		return false;
	}
	
	//Check for a valid email entered
	var validEmail = validate(document.contact.email.value);
	if(validEmail == false)
		return false;
	
	//Prompt if missing Address
	if(document.contact.address.value == "")
	{
		alert("Please enter your Address");
		document.contact.address.focus();
		return false;
	}
	
	//Prompt if missing Feedback
	if(document.contact.feedback.value == "")
	{
		alert("Please enter your Message");
		document.contact.feedback.focus();
		return false;
	}

	return true;
}
