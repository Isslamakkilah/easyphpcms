<?php
	$DBinfo = getDatabaseInfo();
	$act = $HTTP_GET_VARS['act'];
	$err = $HTTP_GET_VARS['err'];

	if(isset($HTTP_POST_VARS['connect']))
	{
		$username = $HTTP_POST_VARS['username'];
		$password = $HTTP_POST_VARS['password'];
		$database = $HTTP_POST_VARS['database'];
		$host = $HTTP_POST_VARS['host'];

		@ $link = mysql_connect($host, $username, $password);

		if(!$link)
		{
			header("Location: index.php?page=setup&err=db");
		}

		else
		{
			writeDatabaseInfo($username, $password, $database, $host);
			
			$DBinfo = getDatabaseInfo();
			
			if(isset($HTTP_POST_VARS['reset']))
			{
				dropTable('admin');
				dropTable('category');
				dropTable('article');
				dropTable('contact');
				dropTable('mail');
				dropTable('site');
				
				DBSetup();
				header("Location: index.php?page=setup&act=reset");
			}
			
			else
			{
				DBSetup();
				header("Location: index.php?page=setup&act=connect");
			}
		}
	}
	
	if($err == "db")
		$message = '<table border=1><tr height="10"><td align="center" valign="middle"><img src="images/error.gif">
				  <span class="errormsg">ERROR: Could not connect to the database with supplied information.</span>
				</td></tr></table>';	
	if($act == "reset")
		$message = '<table border=1><tr height="10"><td align="center" valign="middle">&nbsp;<img src="images/check.gif">&nbsp;<span class="message">Database '.$DBinfo.' is now connected and all tables have been reset to default.</span></td></tr></table>';
	
	if($act == "connect")
		$message = '<table border=1><tr height="10"><td align="center" valign="middle">&nbsp;<img src="images/check.gif">&nbsp;<span class="message">Database '.$DBinfo.' is now connected and all tables have been setup.</span></td></tr></table>';

?>

<html>
<head>
	<title>Database Setup</title>

	<style type="text/css">
		<!--
			@import "css/style.css";
		-->
	</style>
	
	<script language="javascript">
		function confirmReset()
		{
			if(document.db.reset.checked)
			{
				var agree=confirm("Are you sure to reset the database, all existing tables will be overwritten?");
				if (agree)
					return true ;
				else
					return false ;
			}
			else
				return true ;
		}
	</script>
</head>

<body LEFTMARGIN=0 RIGHTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 onLoad="document.db.username.focus()">

	<table BORDER=0 CELLPADDING=0 CELLSPACING=5 align="center">
		<tr>
			<td>
			  <table border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td width="74"><img src="images/logo.gif" align="absmiddle" border="0"></td>
				  <td width="343" valign="middle" align="left"><span class="title">Easy PHP CMS</span></td>
				  <td width="300" background="images/banner_bg.jpg"></td>
				  <td width="303"><img src="images/banner.jpg"></td>
				</tr>
			  </table>
			</td>
		</tr>

		<tr bgcolor="#E0E0E0">
			<td height="25" align="right" valign="middle">
				<table>
					<tr>
						<td><a href="<?php echo $path_to_root; ?>"><b>Site Home</b></a></td>
						<td width="10" align="center">|</td>
						<td><a href="index.php"><b>Admin Login</b></a></td>
						<td width="10" align="center">|</td>
						<td><a href="index.php?page=setup"><b>Database Setup</b></a></td>
					</tr>
				</table>
			</td>
		</tr>

		<tr>
			<td valign="middle" align="left" bgcolor="#C6E3FF">
				<table width="100%" height="50">
					<tr>
						<td valign="middle" align="center" width="60"><img src="images/<?php echo $page; ?>.gif"></td>
						<td valign="middle"><span class="head">Database Setup</span></td>
					</tr>
				</table>
			</td>
		</tr>

		<tr>
			<td height="10">&nbsp;</td>
		</tr>

		<tr>
			<td valign="top" align="center">
				<span class="sub">Database Setup</span>
			</td>
		</tr>

		<tr>
			<td height="10">&nbsp;</td>
		</tr>

		<tr>
			<td align="center">
				<table width="550">
					<tr>
						<td>
							This page allows you to quickly connect the website to your database. Before using this page please make sure that the file <b>include/database.php</b> has a <b>777</b> permision.<br><br>
							
							Please enter the database information of your host in the form below then press <b>Connect</b>. Check the checkbox if you want to reset all database tables to the default values.
						</td>
					</tr>
				</table>
			</td>
		</tr>

		<tr>
			<td height="10">&nbsp;</td>
		</tr>

		<tr>
			<td align="center">
				<form name=db method=post action="index.php?page=setup">
					<table bgcolor="#D4D0C8">
						<tr>
							<td colspan=2 bgcolor="#0A246A" align=center><font color=#FFFFFF><b>Database Setup</b></font></td>
						</tr>
						<tr>
							<td width="90" align=left><span class="element">Username:</span></td>
							<td align=right><input type=text size=30 name="username"></td>
						</tr>
						<tr>
							<td align=left><span class="element">Password:</span></td>
							<td align=right><input size=30 type=password name="password"></td>
						</tr>
						<tr>
							<td align=left><span class="element">Database:</span></td>
							<td align=right><input size=30 type=text name="database"></td>
						</tr>
						<tr>
							<td align=left><span class="element">Host name:</span></td>
							<td align=right><input size=30 type=text name="host"></td>
						</tr>
						<tr>
							<td colspan="2" valign="middle"><input type="checkbox" name="reset">&nbsp<span class="element">Reset database to default</span></td>
						</tr>
						<tr>
							<td colspan="2" align=right><input type=submit name=connect value="Connect" onClick="return confirmReset()"></td>
						</tr>
					</table>
				</form
			</td>
		</tr>

		<tr>
			<td align="center">Currently connected database: <?php echo $DBinfo; ?></td>
		</tr>

		<tr>
			<td height="10">&nbsp;</td>
		</tr>
		
		<tr>
			<td align="center"><?php echo $message; ?></td>
		</tr>

		<tr>
			<td bgcolor="#999966" height="20" align="center" valign="middle">
				<span class="foot"><font color="White">Copyright &copy by Dac-Thong Vu. All rights reserved</font></span>
			</td>
		</tr>
	</table>
</body>
</html>