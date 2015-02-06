<?php include("templates/header/header.tpl"); ?>

<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
<!--
function popup_help(url)
{
	newwindow=window.open(url,'help','height=300,width=510 scrollbars=yes');
	if (window.focus) {newwindow.focus()}
	return false;
}

function popup_add(url)
{
	newwindow=window.open(url,'add','height=600,width=680');
	if (window.focus) {newwindow.focus()}
	return false;
}

function popup_edit(url)
{
	newwindow=window.open(url,'edit','height=600,width=680');
	if (window.focus) {newwindow.focus()}
	return false;
}

function popup_mail(url)
{
	newwindow=window.open(url,'reply','height=600,width=680');
	if (window.focus) {newwindow.focus()}
	return false;
}

function popup_send(url)
{
	newwindow=window.open(url,'send','height=600,width=680');
	if (window.focus) {newwindow.focus()}
	return false;
}

function popup_view(url)
{
	newwindow=window.open(url,'view','height=600,width=680 scrollbars=1');
	if (window.focus) {newwindow.focus()}
	return false;
}

function popup_reply(url)
{
	newwindow=window.open(url,'reply','height=600,width=680 scrollbars=1');
	if (window.focus) {newwindow.focus()}
	return false;
}

// -->
</SCRIPT>

<tr>
	<td height="10" colspan="5">&nbsp;</td>
</tr>

<tr>
	<td colspan="5" align="center" valign="middle">
		<?php include("navigation.tpl"); ?>
	</td>
<tr>

<tr>
	<td height="5" colspan="5">&nbsp;</td>
</tr>

<tr>
	<td width="200" valign="top" align="left">
<?php
	if($browser == 'msie')			
		echo '<fieldset class=icons>
				<legend>';
?>
			<table>
				<tr height="40">
					<td valign="middle"><img src="images/help2.gif"></td>
					<td valign="middle"><span class="sub">&nbsp;Help&nbsp;</span></td>

				</tr>
			</table>
<?php
	if($browser == 'msie')			
		echo '</legend>';
?>
			<table width="180" align="center">
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td><img src="images/topic.gif">&nbsp;<a href="help.php?topic=content" onClick="return popup_help('help.php?topic=content')">Content Manager</a></td>
				</tr>
				<tr>
					<td><img src="images/topic.gif">&nbsp;<a href="help.php?topic=feedback" onClick="return popup_help('help.php?topic=feedback')">Feedback Manager</a></td>
				</tr>
				<tr>
					<td><img src="images/topic.gif">&nbsp;<a href="help.php?topic=site" onClick="return popup_help('help.php?topic=site')">Site Options</a></td>
				</tr>
				<tr>
					<td><img src="images/topic.gif">&nbsp;<a href="help.php?topic=accounts" onClick="return popup_help('help.php?topic=accounts')">Admin Accounts</a></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
			</table>

<?php
	if($browser == 'msie')			
		echo '</fieldset><br>
				<fieldset class=icons>
				<legend>';
?>

			<table>
				<tr height="40">
					<td valign="middle"><img src="images/calendar.gif"></td>
					<td valign="middle"><span class="sub">&nbsp;Time and Date&nbsp;</span></td>

				</tr>
			</table>
			
<?php
	if($browser == 'msie')			
		echo '</legend>';
?>

			<table width="180" align="center">
				<tr>
					<td align="center"><iframe src="extra/clock.php" width="160" height="160" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></td>
				</tr>
				<tr>
					<td align="center"><iframe src="extra/calendar.php" width="160" height="160" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></td>
				</tr>
			</table>
<?php
	if($browser == 'msie')			
		echo '</fieldset>';
?>

	</td>
	
	<td width="10">&nbsp;</td>
	
	<td width="630" valign="top" align="left">
	
		<?php 
			if($page != "logout")
			{
				include("templates/$path/page/$page.tpl"); 
			}
		?>
	
	</td>
	
	<td width="10">&nbsp;</td>
	
	<td width="150" background="images/background<?php echo $pic_num; ?>.jpg"></td>
</tr>

<tr>
	<td height="10" colspan="5">&nbsp;</td>
</tr>

<?php include("templates/footer/footer.tpl"); ?>