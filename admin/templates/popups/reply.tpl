<html>
<head>
<title>Reply to Feedback - Contact ID = <?php echo $ContID; ?></title>

<style type="text/css">

<!--

@import "css/style.css";

</style>

<script language="JavaScript">
	function confirmSubmit()
	{
		var agree=confirm("Are you sure to submit?");
		if (agree)
		{
			return true ;
		}
		else
			return false ;
	}
	
	function closeMe()
	{
		t = setTimeout("self.close()",1000);
	}
	
	function refreshParent()
	{
		var randomnumber=Math.floor(Math.random()*1001);
		var location = 'index.php?page=feedback&id=' + randomnumber + '&act=reply#fbk';
		
		<?php 
			if ($browser == 'msie')
				echo 'parent.window.opener.location.href(location);';
			else
				echo 'parent.window.opener.location.reload();';
		?>
	}
</script>

<script language="javascript" type="text/javascript" src="extra/editor/tiny_mce.js"></script>

<script language="javascript" type="text/javascript">
	tinyMCE.init({
		mode : "textareas",
		theme : "advanced",
		language : "english",
		editor_css : "extra/editor/css/editor.css",
		force_p_newlines: "false",
		force_br_newlines: "true"
	});
</script>

</head>
	<body background="images/popup_bg.jpg" LEFTMARGIN=0 RIGHTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 <?php if($done == true) echo ' onLoad="closeMe()" onUnload="refreshParent()"'; ?>>
		<table width="682">
			<tr bgcolor="#C6E3FF">
				<td colspan="5" valign="middle">
					<table width="100%" height="40">
						<tr>
							<td valign="middle" align="center" width="50"><img src="images/reply.gif"></td>
							<td valign="middle"><span class="head">Reply to Feedback</span></td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr height="30">
				<td colspan="5" valign="middle" align="center"><?php echo $message; ?></td>
			</tr>

			<tr>
				<td height="25" valign="middle"><span class="sub">From:</span></td>
				<td valign="middle"><b><?php echo $Name; ?></b></td>
				<td></td>
				<td valign="middle"><span class="sub">Email:</span></td>
				<td valign="middle"><b><?php echo $From; ?></b></td>
			</tr>
			
			<tr>
				<td valign="top"><span class="sub">Feedback:</span></td>
				<td colspan="4"><table width="100%"><tr><td><?php echo $Feedback; ?></td></tr></table></td>
			</tr>
			
			<tr height="5">
				<td colspan="5">&nbsp;</td>
			</tr>
			
		<form name="theform" method="post" action="popup.php?page=reply&ContID=<?php echo $ContID; ?>">
			<input type="hidden" name="Author" value="<?php echo $Author; ?>">
			<tr>
				<td width="100" height="25" valign="middle"><span class="sub">From:</span></td>
				<td width="180" valign="middle"><b><?php echo $Author; ?></b></td>
				<td width="20">&nbsp;</td>
				<td width="50" valign="middle"><span class="sub">Date:</span></td>
				<td valign="middle"><b><?php echo displayDate($Date); ?></b></td>
			</tr>

			<tr>
				<td height="25" valign="middle"><span class="sub">Reply To:</span></td>
				<td colspan="4" valign="middle"><input type="text" name="Address" size="93" value="<?php echo $Address; ?>"></td>
			</tr>

			<tr>
				<td height="25" valign="middle"><span class="sub">Subject:</span></td>
				<td colspan="4" valign="middle"><input type="text" name="Subject" size="93" value="<?php echo $Subject; ?>"></td>
			</tr>

			<tr>
				<td valign="top"><span class="sub">Content:</span></td>
				<td colspan="4">
					<textarea name="Content" cols="70" rows="18"><?php echo $Content; ?></textarea>
				</td>
			</tr>

			<tr>
				<td colspan="5" align="right"><input type="submit" name="send" value="Send Message" onClick="return confirmSubmit()"></td>
			</tr>

		</form>
		</table>
	</body>
</html>