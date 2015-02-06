<script language="javascript" src="js/register.js"></script>

<script language="javascript">
	function confirmDeleteAcc()
	{
		var agree=confirm("Are you sure to delete this account?");
		if (agree)
			return true ;
		else
			return false ;
	}
</script>

<a name="cre"></a>

<?php
	if($browser == 'msie')			
		echo '<fieldset class=icons>
				<legend>';
?>

		<table>
			<tr height="40">
				<td valign="middle"><img src="images/account.gif"></td>
				<td valign="middle"><span class="sub">&nbsp;Accounts&nbsp;</span></td>
			</tr>
		</table>
<?php
	if($browser == 'msie')			
		echo '</legend>';
?>

	<table width="600" align="center">
		<tr>
			<td>Use this form to create a new admin account.</td>
		</tr>

		<tr><td height="5">&nbsp;</td></tr>

		<tr>
			<td>
				<form method=post name="create" action="index.php?page=accounts#cre">
					<table width="100%">
						<tr>
							<td width="330">
								<table width="100%" bgcolor="#D4D0C8">
									<tr height="25" bgcolor="#0A246A">
										<td colspan="2" align="center"><font color="#FFFFFF"><b>New Account</b></font></td>
									</tr>
									<tr height="25">
										<td width="50%" align="left"><span class="element">Username:</span></td>
										<td align="left"><input type=text name="username_cre" size="25" value="<?php echo $username_cre; ?>"></td>
									</tr>
									<tr height="25">
										<td align="left"><span class="element">Password:</span></td>
										<td align="left"><input type=password name="password_cre" size="25" value="<?php echo $password_cre; ?>"></td>
									</tr>
									<tr height="25">
										<td align="left"><span class="element">Confirmed Password:</span></td>
										<td align="left"><input type=password name="cpassword_cre" size="25" value="<?php echo $cpassword_cre; ?>"></td>
									</tr>
									<tr height="25">
										<td align="left"><input type=submit name="create" value="Create" onClick="return checkCreate()"></td>
										<td align="right"><input type="button" value="Cancel" value="Back" onClick="location.href='index.php'"></td>
									</tr>
								</table>
							</td>
							<td width="5"></td>
							<td valign="middle" align="left">
								<table width="100%">
									<tr height="25"><td align="left" valign="center"></td></tr>
									<tr height="25"><td align="left" valign="middle"><span class="errormsg"><?php echo $msg1; ?></span></td></tr>
									<tr height="25"><td align="left" valign="middle"><span class="errormsg"><?php echo $msg2; ?></span></td></tr>
									<tr height="25"><td align="left" valign="middle"><span class="errormsg"><?php echo $msg3; ?></span></td></tr>
									<tr height="25"><td align="left" valign="middle"></td></tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr height="10">
			<td>
				<table with="100%">
					<tr>
						<td width=550 align="left"><?php echo $stat1; ?></td>
						<td align="right"><img src="images/help_off.gif" alt="Help" style="cursor: <?php echo $pointer; ?>" onClick="return popup_help('help.php?topic=accounts#cre')" onMouseOver=this.src="images/help_on.gif"; onMouseOut=this.src="images/help_off.gif">&nbsp;</td>
						<td align="right"><a href="#top"><img src="images/top.gif" border="0" alt="Go to Top"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

<a name="del"></a>

	<table width="600" align="center">
		<tr>
			<td>Use this form to delete an existing admin account.</td>
		</tr>

		<tr><td height="5">&nbsp;</td></tr>

		<tr>
			<td>
				<form method=post name="delete" action="index.php?page=accounts#del">
					<table width="100%">
						<tr>
							<td width="330">
								<table width="100%" bgcolor="#D4D0C8">
									<tr height="25" bgcolor="#0A246A">
										<td colspan="2" align="center"><font color="#FFFFFF"><b>Delete Account</b></font></td>
									</tr>
									<tr height="25">
										<td width="50%" align="left"><span class="element">Username:</span></td>
										<td align="left">
											<select type="text" name="username_del" style="width:175px;height:20px;">
												<option value="" selected>Please Select</option>
												<?php
													$link = connectToDB();
													$result = mysql_query('select username from admin order by username');
													$row = mysql_num_rows($result);

													for($i = 0; $i < $row; $i++)
													{
														$data = mysql_fetch_row($result);
														echo '<option value="'.$data[0].'" ';

														if($username_del == $data[0])
															echo 'selected ';

														echo '>'.$data[0].'</option>';
													}
												?>
											</select>
										</td>
									</tr>
									<tr height="25">
										<td align="left"><span class="element">Password:</span></td>
										<td align="left"><input type=password name="password_del" size="25" value="<?php echo $password_del; ?>"></td>
									</tr>
									<tr height="25">
										<td align="left"><input type="submit" name="delete" value="Delete" onclick="return confirmDeleteAcc()"></td>
										<td align="right"><input type="button" value="Cancel" value="Back" onClick="location.href='index.php'"></td>
									</tr>
								</table>
							</td>
							<td width="5"></td>
							<td valign="middle" align="left">
								<table width="100%">
									<tr height="25"><td align="left" valign="center"></td></tr>
									<tr height="25"><td align="left" valign="middle"><span class="errormsg"><?php echo $msg4; ?></span></td></tr>
									<tr height="25"><td align="left" valign="middle"><span class="errormsg"><?php echo $msg5; ?></span></td></tr>
									<tr height="25"><td align="left" valign="middle"></td></tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr height="10">
			<td>
				<table with="100%">
					<tr>
						<td width=550 align="left"><?php echo $stat2; ?></td>
						<td align="right"><img src="images/help_off.gif" alt="Help" style="cursor: <?php echo $pointer; ?>" onClick="return popup_help('help.php?topic=accounts#del')" onMouseOver=this.src="images/help_on.gif"; onMouseOut=this.src="images/help_off.gif">&nbsp;</td>
						<td align="right"><a href="#top"><img src="images/top.gif" border="0" alt="Go to Top"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

<?php
	if($browser == 'msie')			
		echo '</fieldset><br>';
?>

<a name="pass"></a>

<?php
	if($browser == 'msie')			
		echo '<fieldset class=icons>
				<legend>';
?>

		<table>
			<tr height="40">
				<td valign="middle"><img src="images/password.gif"></td>
				<td valign="middle"><span class="sub">&nbsp;Password&nbsp;</span></td>
			</tr>
		</table>

<?php
	if($browser == 'msie')			
		echo '</legend>';
?>

	<table width="600" align="center">
		<tr>
			<td>Use this form to change the password of any admin user.</td>
		</tr>
		
		<tr><td height="5">&nbsp;</td></tr>
		
		<tr>
			<td>
				<form method=post name="change" action="index.php?page=accounts#pass">
					<table width="100%">
						<tr>
							<td width="330">
								<table width="100%" bgcolor="#D4D0C8">
									<tr height="25" bgcolor="#0A246A">
										<td colspan="2" align="center" valign="middle"><font color="#FFFFFF"><b>Change Password</b></font></td>
									</tr>
									<tr height="25">
										<td width="50%" align="left" valign="middle"><span class="element">Username:</span></td>
										<td align="left" valign="middle">
											<select type="text" name="username" style="width:175px;height:20px;">
												<option value="">Please Select</option>
												<?php
													$link = connectToDB();
													$result = mysql_query('select username from admin order by username');
													$row = mysql_num_rows($result);

													for($i = 0; $i < $row; $i++)
													{
														$data = mysql_fetch_row($result);
														echo '<option value="'.$data[0].'" ';

														if($account == $data[0])
															echo 'selected ';

														if($username == $data[0])
															echo 'selected ';

														echo '>'.$data[0].'</option>';
													}
												?>
											</select>
										</td>
									</tr>
									<tr height="25">
										<td align="left" valign="middle"><span class="element">Old Password:</span></td>
										<td align="left"><input type=password name="opassword" size="25" value="<?php echo $opassword; ?>"></td>
									</tr>
									<tr height="25">
										<td align="left" valign="middle"><span class="element">New Password:</span></td>
										<td align="left" valign="middle"><input type=password name="npassword" size="25" value="<?php echo $npassword; ?>"></td>
									</tr>
									<tr height="25">
										<td align="left" valign="middle"><span class="element">Confirmed Password:</span></td>
										<td align="left" valign="middle"><input type=password name="cpassword" size="25" value="<?php echo $cpassword; ?>"></td>
									</tr>
									<tr height="25">
										<td align="left" valign="middle"><input type="submit" name="update" value="Update"></td>
										<td align="right" valign="middle"><input type="button" value="Cancel" value="Back" onClick="location.href='index.php'"></td>
									</tr>
								</table>
							</td>
							<td width="5"></td>
							<td valign="middle" align="left">
								<table width="100%">
									<tr height="25"><td align="left" valign="middle"></td></tr>
									<tr height="25"><td align="left" valign="middle"><span class="errormsg"><?php echo $msg6; ?></span></td></tr>
									<tr height="25"><td align="left" valign="middle"><span class="errormsg"><?php echo $msg7; ?></span></td></tr>
									<tr height="25"><td align="left" valign="middle"><span class="errormsg"><?php echo $msg8; ?></span></td></tr>
									<tr height="25"><td align="left" valign="middle"><span class="errormsg"><?php echo $msg9; ?></span></td></tr>
									<tr height="25"><td align="left" valign="center"></td></tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr height="10">
			<td>
				<table with="100%">
					<tr>
						<td width=550 align="left"><?php echo $stat3; ?></td>
						<td align="right"><img src="images/help_off.gif" alt="Help" style="cursor: <?php echo $pointer; ?>" onClick="return popup_help('help.php?topic=accounts#pass')" onMouseOver=this.src="images/help_on.gif"; onMouseOut=this.src="images/help_off.gif">&nbsp;</td>
						<td align="right"><a href="#top"><img src="images/top.gif" border="0" alt="Go to Top"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

<?php
	if($browser == 'msie')			
		echo '</fieldset>';
?>
