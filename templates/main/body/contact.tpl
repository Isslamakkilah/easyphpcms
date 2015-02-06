				<TD valign="middle" width="470">
					<table width="100%" height="50" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td valign="top">
								<?php
									if($action == "sent")
										echo '<span class="head">Feedback Sent</span>';

									else echo '<span class="head">Contact Page</span>
												<br><br><span class="msg">Please fill in this form to send your feedback, <font color="#FF0000">*</font> denotes a required field.</span>';
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
						if($action == "sent")
							echo '<table width="550" border="0" cellspacing="5" cellpadding="5" align="center">
									<tr>
										<td valign="top">
											Thank you for contacting us. Your feedback has been sent and we will get back to you as soon as possible. An acknowlegement for your feedback has also been sent to your email address.
										</td>
									</tr>
								</table>';
						else
							echo '<form name="contact" method="post" action="main.php?page=contact">
									<table width="570" border="0" cellspacing="1" cellpadding="3" align="center">
										<tr bgcolor="#6699CC"> 
											<td colspan="2"><font color="#FFFFFF">
												&nbsp;&nbsp;<b>Feedback Form</b></font>
											</td>
										</tr>
										<tr> 
											<td bgcolor="#D9DBDE" width="160">
												<font color="#FF0000">*</font>&nbsp;First Name:
											</td>
											<td bgcolor="#D9DBDE">
												<font face="Verdana"><input type = text name = "fname" size = 25 maxlength = 100 value = ""></font>
											</td>
										</tr>
										<tr> 
											<td bgcolor="#E7E7E7" width="160">
												<font color="#FF0000">*</font>&nbsp;Last Name:
											</td>
											<td bgcolor="#E7E7E7">
												<font face="Verdana"><input type = text name = "lname" size = 25 maxlength = 100 value = ""></font>
											</td>
										</tr>
										<tr> 
											<td bgcolor="#D9DBDE" width="160">
												<font color="#FF0000">*</font>&nbsp;Contact Number:
											</td>
											<td bgcolor="#D9DBDE">
												<font face="Verdana"><input type = text name = "phone" size = 25 maxlength = 100 value = ""></font>
											</td>
										</tr>
										<tr> 
											<td bgcolor="#E7E7E7" width="160">
												<font color="#FF0000">*</font>&nbsp;Email Address:
											</td>
											<td bgcolor="#E7E7E7">
												<font face="Verdana"><input type = text name = "email" size = 60 maxlength = 100 value = ""></font>
											</td>
										</tr>
										<tr> 
											<td bgcolor="#D9DBDE" width="160">
												<font color="#FF0000">*</font>&nbsp;Postal Address:
											</td>
											<td bgcolor="#D9DBDE">
												<font face="Verdana"><input type = text name = "address" size = 60 maxlength = 100 value = ""></font>
											</td>
										</tr>
										<tr> 
											<td bgcolor="#E7E7E7" width="160" valign="top">
												<font color="#FF0000">*</font>&nbsp;Your Message:
											</td>
											<td bgcolor="#E7E7E7">
												<textarea name="feedback" cols="45" rows="8"></textarea>
											</td>
										</tr>
										<tr> 
											<td bgcolor="#D9DBDE" width="160">
												&nbsp;&nbsp;Newsletters Subscription:
											</td>
											<td bgcolor="#D9DBDE">
												<input name="news" type="checkbox" value="Y" checked>&nbsp;&nbsp;Yes, I want to subscribe to newsletters
											</td>
										</tr>
									</table>
									<br>
									<table width="570" border="0" cellspacing="0" cellpadding="0" align="center">
										<tr> 
											<td width="50%" align="left"><input name="send" type="submit" value="Send Feedback" onclick="return checkForm()"></td>
											<td align="right"><input name="reset" type="reset" value="Clear All"></td>
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