				<TD valign="middle" width="470">
					<table width="100%" height="50" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td valign="top">
								<?php
									if($action == "fail")
										echo '<span class="head">Unsubscribe Failed</span>';
									
									elseif($action == "done")
										echo '<span class="head">Unsubscribe Done</span>';
									
									else echo '<span class="head">Unsubscribe</span>
											<br><br><span class="msg">Please fill in this form to unsubcribe, <font color="#FF0000">*</font> denotes a required field.</span>';
								?>
							</td>
						</tr>
					</table>
				</TD>
			</TR>
			
			<TR height="10"><TD colspan="2">&nbsp;</TD></TR>
			
			<TR>
				<TD colspan="2" valign="top" align="center">
					<?php
						if($action == "fail")
							echo '<table width="550" border="0" cellspacing="5" cellpadding="5" align="center">
									<tr>
										<td valign="top">
											The unsubscribe was failed because the email address you have entered is not in our database. Please try again.
										</td>
									</tr>
								</table>
								';
						elseif($action == "done")
							echo '<table width="550" border="0" cellspacing="5" cellpadding="5" align="center">
									<tr>
										<td valign="top">
											You have been unsubscribed from our mailing list and will no longer receive our newsletters. If you wish to subscribe with us again please fill in our <a href="main.php?page=contact">Contact Us</a> form.
										</td>
									</tr>
								</table>';
						else
							echo '<form name="unsub" method="post" action="main.php?page=unsub">
									<table width="570" border="0" cellspacing="1" cellpadding="3" align="center">
										<tr bgcolor="#6699CC"> 
											<td colspan="2"><font color="#FFFFFF">
												<b>Unsubscribe Form</b></font>
											</td>
										</tr>
										<tr> 
											<td bgcolor="#D9DBDE" width="200">
												Email Address&nbsp;<font color="#FF0000">*</font>
											</td>
											<td bgcolor="#D9DBDE">
												<font face="Verdana"><input type = text name = "email" size = 25 maxlength = 100 value = ""></font>
											</td>
										</tr>
										<tr> 
											<td colspan="2" align=right>
												<input name="unsub" type="submit" value="Unsubscribe" onclick="return checkForm()"></td>
											</td>
										</tr>
									</table>
								</form>';
						?>
				</TD>
			</TR>
			
			<TR height="10"><TD colspan="2">&nbsp;</TD></TR>
		</TABLE>
	</TD>
	<TD valign="top">
		<table width=100%>
			<tr height="20"><td></td></tr>
			<tr><td><IMG SRC="images/right/right1.jpg"></td></tr>
			<tr height="5"><td></td></tr>
			<tr><td><IMG SRC="images/right/right2.jpg"></td></tr>
			<tr height="20"><td></td></tr>
		</table>
	</TD>
</TR>