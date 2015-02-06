<?php include("templates/$path/header/header.tpl"); ?>

<script language="javascript" src="js/login.js"></script>

<tr>
	<td height="20"></td>
</tr>

<tr>
	<td colspan="5" valign="top" align="center">
		<span class="sub">Please Login</span>
	</td>
</tr>

<tr>
	<td colspan="5" height="10"></td>
</tr>
<tr>
	<td colspan="5" align="center">
		<table width="480" align="center">
			<tr>
				<td>
					Administrator please login using your username and password. After you login, you will be able to change the website content and manage visitor feedbacks.
				</td>
			</tr>
		</table>
	</td>
</tr>

<tr>
	<td colspan="5" height="10"></td>
</tr>

<tr>
	<td colspan="5" align="center">
		<form method=post name="login" action="index.php?page=login">
			<table width="250" bgcolor="#D4D0C8">
				<tr bgcolor="#0A246A">
					<td colspan=2 align="center"><font color=#FFFFFF><b>Login Form</b></font></td>
				</tr>
				<tr>
					<td width=25% align="center"><span class="element">Username:</span></td>
					<td align="center"><input type=text name="username" size="25"></td>
				</tr>
				<tr>
					<td width=25% align="center"><span class="element">Password:</span></td>
					<td align="center"><input type=password name="password" size="25"></td>
				</tr>
				<tr>
					<td colspan=2 align="right"><input type=submit name="login" value="Login" onClick="return checkForm()"></td>
				</tr>
			</table>
		</form>
	</td>
</tr>

<tr>
	<td colspan="5" align="center"><?php echo $stat1; ?></td>
</tr>

<?php include("templates/$path/footer/footer.tpl"); ?>