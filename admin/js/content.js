function confirmRenameCat()
{
	var agree=confirm("Are you sure to rename this category?");
	if (agree)
		return true ;
	else
		return false ;
}

function confirmEmptyCat()
{
	var agree=confirm("Are you sure to empty this category?");
	if (agree)
		return true ;
	else
		return false ;
}

function confirmDeleteCat()
{
	var agree=confirm("Are you sure to delete this category?");
	if (agree)
		return true ;
	else
		return false ;
}

function confirmRenameField()
{
	var agree=confirm("Are you sure to rename this field?");
	if (agree)
		return true ;
	else
		return false ;
}

function confirmDeleteField()
{
	var agree=confirm("Are you sure to delete this field?");
	if (agree)
		return true ;
	else
		return false ;
}

function confirmDeleteArt(url)
{
	var agree=confirm("Are you sure to delete this article?");
	if (agree)
	{
		window.location=url;
		return true ;
	}
	else
		return false ;
}