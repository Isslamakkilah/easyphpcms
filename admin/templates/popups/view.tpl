<html>
<head>
<title>Sent Newsletter - Newsletter ID = <?php echo $MailID; ?></title>

<style type="text/css">

<!--

@import "css/style.css";

</style>


</head>
	<body background="images/popup_bg.jpg" LEFTMARGIN=0 RIGHTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
		<table width="682">
			<tr bgcolor="#C6E3FF">
				<td colspan="2" valign="middle">
					<table width="100%" height="40">
						<tr>
							<td valign="middle" align="center" width="50"><img src="images/send.gif"></td>
							<td valign="middle"><span class="head">Sent Newsletter</span></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td width="150" height="25" valign="middle"><span class="sub">From:</span></td>
				<td valign="middle"><b><?php echo $Author; ?></b></td>
			</tr>
			
			<tr>
				<td height="25" valign="middle"><span class="sub">Date:</span></td>
				<td valign="middle"><b><?php echo $Date; ?></b></td>
			</tr>

			<tr>
				<td height="25" valign="middle"><span class="sub">Subject:</span></td>
				<td valign="middle"><b><?php echo $Subject; ?></b></td>
			</tr>


			<tr>
				<td valign="top"><span class="sub">Content:</span></td>
				<td><table width="100%"><tr><td><?php echo $Content; ?></td></tr></table></td>
			</tr>
		</table>
	</body>
</html>