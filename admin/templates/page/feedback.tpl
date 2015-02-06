<script language="JavaScript">
	function confirmDeleteCont(url)
	{
		var agree=confirm("Are you sure to delete this contact?");
		if (agree)
		{
			window.location=url;
			return true ;
		}
		else
			return false ;
	}
	
	function confirmDeleteMail(url)
	{
		var agree=confirm("Are you sure to delete this mail?");
		if (agree)
		{
			window.location=url;
			return true ;
		}
		else
			return false ;
	}
	
	function confirmDeleteFbk(url)
	{
		var agree=confirm("Are you sure to delete this feedback?");
		if (agree)
		{
			window.location=url;
			return true ;
		}
		else
			return false ;
	}
</script>

<a name="cont"></a>

<?php
	if($browser == 'msie')			
		echo '<fieldset class=icons>
				<legend>';
?>
	<table>
		<tr height="40">
			<td valign="middle"><img src="images/contact.gif"></td>
			<td valign="middle"><span class="sub">&nbsp;Contacts&nbsp;</span></td>
		</tr>
	</table>

<?php
	if($browser == 'msie')			
		echo '</legend>';
?>

	<table width="600" align="center">
		<tr>
			<td>			
				This section allows you to send email and manage all contacts entered via the Contact page.
			</td>
		</tr>
		
		<tr><td height="5">&nbsp;</td></tr>
		
		<tr>
			<td valign="middle">
				<table width="100%">
					<form name="search1" method="get" action="#cont">
					<tr>
						<td valign="middle" align"left">
							<input type="hidden" name="page" value="feedback">
							Search for contacts:&nbsp;&nbsp;
							<input type="text" name="query1" size="25" value="<?php echo $search1; ?>">
						</td>
						<td valign="middle" align="left">
							<input type="submit" value="Search">
						</td>
					</tr>
					</form>
					<tr>
						<td valign="middle" align"left">Please select the number of entries to be displayed:</td>
						<td valign="middle" align="left">
							<select type="text" name="entries" style="width:200px;height:20px;" onChange="window.location=('<?php echo "index.php?page=feedback&sortby1=$sortby1&entries1="; ?>'+this.options[this.selectedIndex].value)+'#cont'">
								<option value="5" <?php if($entries1== 5) echo 'selected'; ?>>5 entries per page - Default</option>
								<option value="10" <?php if($entries1 == 10) echo 'selected'; ?>>10 entries per page</option>
								<option value="15" <?php if($entries1 == 15) echo 'selected'; ?>>15 entries per page</option>
								<option value="20" <?php if($entries1 == 20) echo 'selected'; ?>>20 entries per page</option>
							</select>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr><td height="5">&nbsp;</td></tr>
		
		<tr>
			<td>
				<table width="100%" align="center" bgcolor="#D4D0C8">
					<tr height="25" bgcolor="#0A246A">
						<td colspan="7" align="center" valign="middle"><font color="#FFFFFF"><b>All Contacts</b></font></td>
					</tr>
					
					<tr>
						<td width="10" align="center" valign="middle"><span class="element"><a href="index.php?page=feedback&sortby1=ContID&entries1=<?php echo $entries1; ?>#cont"><?php if($sortby1 == "ContID") echo '<font color="#DD0000">'; ?><b>ID</b><?php if($sortby1 == "ContID") echo '</font>'; ?></a></span></td>
						<td width="70" align="center" valign="middle"><span class="element"><a href="index.php?page=feedback&sortby1=fname&entries1=<?php echo $entries1; ?>#cont"><?php if($sortby1 == "fname") echo '<font color="#DD0000">'; ?><b>First Name</b><?php if($sortby1 == "fname") echo '</font>'; ?></a></span></td>
						<td width="70" align="center" valign="middle"><span class="element"><a href="index.php?page=feedback&sortby1=lname&entries1=<?php echo $entries1; ?>#cont"><?php if($sortby1 == "lname") echo '<font color="#DD0000">'; ?><b>Last Name</b><?php if($sortby1 == "lname") echo '</font>'; ?></a></span></td>
						<td width="150" align="center" valign="middle"><span class="element"><a href="index.php?page=feedback&sortby1=email&entries1=<?php echo $entries1; ?>#cont"><?php if($sortby1 == "email") echo '<font color="#DD0000">'; ?><b>Email</b><?php if($sortby1 == "email") echo '</font>'; ?></a></span></td>
						<td width="150" align="center" valign="middle"><span class="element"><a href="index.php?page=feedback&sortby1=address&entries1=<?php echo $entries1; ?>#cont"><?php if($sortby1 == "address") echo '<font color="#DD0000">'; ?><b>Address</b><?php if($sortby1 == "address") echo '</font>'; ?></a></span></td>
						<td width="80" align="center" valign="middle"><span class="element"><a href="index.php?page=feedback&sortby1=phone&entries1=<?php echo $entries1; ?>#cont"><?php if($sortby1 == "phone") echo '<font color="#DD0000">'; ?><b>Phone</b><?php if($sortby1 == "phone") echo '</font>'; ?></a></span></td>
						<td align="center" valign="middle"><span class="element">Action</span></td>
					</tr>
					
						<?php displayContacts($sortby1, $entries1, $index1, $search1); ?>
					
					<tr height="25">
						<td colspan="7" align="center" valign="middle"><?php pageIndex($page, $ViewCatID, $numPage1, $sortby1, $entries1, $index1, "1", "cont"); ?></td>
					</tr>
					
				</table>
			</td>
		</tr>
		
		<tr><td height="5">&nbsp;</td></tr>
		
		<tr>
			<td valign="middle" align="center"><input type="button" value="New Message" onClick="return popup_mail('popup.php?page=mail')"><td>
		</tr>
		<tr height="10">
			<td>
				<table with="100%">
					<tr>
						<td width=550 align="left"><?php echo $stat1; ?></td>
						<td align="right"><img src="images/help_off.gif" alt="Help" style="cursor: <?php echo $pointer; ?>" onClick="return popup_help('help.php?topic=feedback#cont')" onMouseOver=this.src="images/help_on.gif"; onMouseOut=this.src="images/help_off.gif">&nbsp;</td>
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

<a name="mail"></a>

<?php
	if($browser == 'msie')			
		echo '<fieldset class=icons>
				<legend>';
?>
	<table>
		<tr height="40">
			<td valign="middle"><img src="images/send.gif"></td>
			<td valign="middle"><span class="sub">&nbsp;Newsletters&nbsp;</span></td>
		</tr>
	</table>

<?php
	if($browser == 'msie')			
		echo '</legend>';
?>

	<table width="600" align="center">
		<tr>
			<td>			
				This section allows you to send newsletters to visitors who have subscribed. 
			</td>
		</tr>
		
		<tr><td height="5">&nbsp;</td></tr>
		
		<tr>
			<td valign="middle">
				<table width="100%">
					<form name="search2" method="get" action="#mail">
						<tr>
							<td valign="middle" align"left">
								<input type="hidden" name="page" value="feedback">
								Search for newsletters:&nbsp;&nbsp;
								<input type="text" name="query2" size="25" value="<?php echo $search2; ?>">
							</td>
							<td valign="middle" align="left">
								<input type="submit" value="Search">
							</td>
						</tr>
					</form>
					<tr>
						<td valign="middle" align"left">Please select the number of entries to be displayed:</td>
						<td valign="middle" align="left">
							<select type="text" name="entries" style="width:200px;height:20px;" onChange="window.location=('<?php echo "index.php?page=feedback&sortby2=$sortby2&entries2="; ?>'+this.options[this.selectedIndex].value)+'#mail'">
								<option value="5" <?php if($entries2 == 5) echo 'selected'; ?>>5 entries per page - Default</option>
								<option value="10" <?php if($entries2 == 10) echo 'selected'; ?>>10 entries per page</option>
								<option value="15" <?php if($entries2 == 15) echo 'selected'; ?>>15 entries per page</option>
								<option value="20" <?php if($entries2 == 20) echo 'selected'; ?>>20 entries per page</option>
							</select>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr><td height="5">&nbsp;</td></tr>
		
		<tr>
			<td valign="top">
				<table width="100%" bgcolor="#D4D0C8">
					<tr height="25" bgcolor="#0A246A">
						<td colspan="6" align="center" valign="middle"><font color="#FFFFFF"><b>Sent Newsletters</b></font></td>
					</tr>
					<tr height="25">
						<td width="80" align="center" valign="middle"><a href="index.php?page=feedback&sortby2=Date&entries2=<?php echo $entries2; ?>#mail"><?php if($sortby2 == "Date") echo '<font color="#DD0000">'; ?><b>Date</b><?php if($sortby2 == "Date") echo '</font>'; ?></a></td>
						<td width="100" align="center" valign="middle"><a href="index.php?page=feedback&sortby2=Author&entries2=<?php echo $entries2; ?>#mail"><?php if($sortby2 == "Author") echo '<font color="#DD0000">'; ?><b>Author</b><?php if($sortby2 == "Author") echo '</font>'; ?></a></td>
						<td  width="340" align="center" valign="middle"><a href="index.php?page=feedback&sortby2=Subject&entries2=<?php echo $entries2; ?>#mail"><?php if($sortby2 == "Subject") echo '<font color="#DD0000">'; ?><b>Subject</b><?php if($sortby2 == "Subject") echo '</font>'; ?></a></td>
						<td align="center" valign="middle"><span class="element">Action</span></td>
					</tr>

						<?php displayNews($sortby2, $entries2, $index2, $search2); ?>

					<tr height="25">
						<td colspan="6" align="center" valign="middle"><?php pageIndex($page, $ViewCatID, $numPage2, $sortby2, $entries2, $index2, "2", "mail"); ?></td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr><td height="5">&nbsp;</td></tr>
				
		<tr>
			<td valign="middle" align="center"><input type="button" value="New Newsletter" onClick="return popup_send('popup.php?page=send')"><td>
		</tr>
		
		<tr height="10">
			<td>
				<table with="100%">
					<tr>
						<td width=550 align="left"><?php echo $stat2; ?></td>
						<td align="right"><img src="images/help_off.gif" alt="Help" style="cursor: <?php echo $pointer; ?>" onClick="return popup_help('help.php?topic=feedback#mail')" onMouseOver=this.src="images/help_on.gif"; onMouseOut=this.src="images/help_off.gif">&nbsp;</td>
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

<a name="fbk"></a>

<?php
	if($browser == 'msie')			
		echo '<fieldset class=icons>
				<legend>';
?>
	<table>
		<tr height="40">
			<td valign="middle"><img src="images/reply.gif"></td>
			<td valign="middle"><span class="sub">&nbsp;Feedbacks&nbsp;</span></td>
		</tr>
	</table>

<?php
	if($browser == 'msie')			
		echo '</legend>';
?>

	<table width="600" align="center">
		<tr>
			<td>			
				This section allows you to manage and reply to contacts with feedbacks entered via the Contact page.
			</td>
		</tr>
		
		<tr><td height="5">&nbsp;</td></tr>
		
		<tr>
			<td valign="middle">
				<table width="100%">
					<form name="search3" method="get" action="#fbk">
						<tr>
							<td valign="middle" align"left">
								<input type="hidden" name="page" value="feedback">
								Search for feedbacks:&nbsp;&nbsp;
								<input type="text" name="query3" size="25" value="<?php echo $search3; ?>">
							</td>
							<td valign="middle" align="left">
								<input type="submit" value="Search">
							</td>
						</tr>
					</form>
					<tr>
						<td valign="middle" align"left">Please select the type of feedbacks to be displayed:</td>
						<td valign="middle" align="left">
							<select type="text" name="show3" style="width:200px;height:20px;" onChange="window.location=('<?php echo "index.php?page=feedback&sortby3=$sortby3&entries3=$entries3&show3="; ?>'+this.options[this.selectedIndex].value)+'#fbk'">
								<option value="all" <?php if($show3 == "all") echo 'selected'; ?>>All feedbacks (<?php echo getNumFeedbacks("A") ?>)</option>
								<option value="new" <?php if($show3 == "new") echo 'selected'; ?>>- Unreplied feedbacks only (<?php echo getNumFeedbacks("N") ?>)</option>
								<option value="rep" <?php if($show3 == "rep") echo 'selected'; ?>>- Replied feedbacks only (<?php echo getNumFeedbacks("Y") ?>)</option>
							</select>
						</td>
					</tr>
					<tr>
						<td valign="middle" align"left">Please select the number of entries to be displayed:</td>
						<td valign="middle" align="left">
							<select type="text" name="entries" style="width:200px;height:20px;" onChange="window.location=('<?php echo "index.php?page=feedback&show3=$show3&sortby3=$sortby3&entries3="; ?>'+this.options[this.selectedIndex].value)+'#fbk'">
								<option value="5" <?php if($entries3 == 5) echo 'selected'; ?>>5 entries per page - Default</option>
								<option value="10" <?php if($entries3 == 10) echo 'selected'; ?>>10 entries per page</option>
								<option value="15" <?php if($entries3 == 15) echo 'selected'; ?>>15 entries per page</option>
								<option value="20" <?php if($entries3 == 20) echo 'selected'; ?>>20 entries per page</option>
							</select>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr><td height="5">&nbsp;</td></tr>
		
		<tr>
			<td valign="top">
				<table width="100%" bgcolor="#D4D0C8">
					<tr height="25" bgcolor="#0A246A">
						<td colspan="10" align="center" valign="middle"><font color="#FFFFFF"><b>Manage Feedbacks</b></font></td>
					</tr>
					<tr height="25">
						<td width="80" align="center" valign="middle"><a href="index.php?page=feedback&sortby3=Date&entries3=<?php echo $entries3; ?>#fbk"><?php if($sortby3 == "Date") echo '<font color="#DD0000">'; ?><b>Date</b><?php if($sortby3 == "Date") echo '</font>'; ?></a></td>
						<td width="170" align="center" valign="middle"><a href="index.php?page=feedback&sortby3=fname&entries3=<?php echo $entries3; ?>#fbk"><?php if($sortby3 == "fname") echo '<font color="#DD0000">'; ?><b>Name</b><?php if($sortby3 == "fname") echo '</font>'; ?></a></td>
						<td width="250" align="center" valign="middle"><a href="index.php?page=feedback&sortby3=email&entries3=<?php echo $entries3; ?>#fbk"><?php if($sortby3 == "email") echo '<font color="#DD0000">'; ?><b>Email</b><?php if($sortby3 == "email") echo '</font>'; ?></a></td>
						<td width="20" align="center" valign="middle"><a href="index.php?page=feedback&sortby3=news&entries3=<?php echo $entries3; ?>#fbk"><?php if($sortby3 == "news") echo '<font color="#DD0000">'; ?><b>News</b><?php if($sortby3 == "news") echo '</font>'; ?></a></td>
						<td align="center" valign="middle"><span class="element">Action</span></td>
					</tr>

						<?php displayFeedbacks($sortby3, $entries3, $index3, $show3, $search3); ?>

					<tr height="25">
						<td colspan="10" align="center" valign="middle"><?php pageIndex($page, $ViewCatID, $numPage3, $sortby3, $entries3, $index3, "3", "fbk"); ?></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="10">
			<td align="center">
				<table with="100%">
					<tr>
						<td width=550 align="left"><?php echo $stat3; ?></td>
						<td align="right"><img src="images/help_off.gif" alt="Help" style="cursor: <?php echo $pointer; ?>" onClick="return popup_help('help.php?topic=feedback#fbk')" onMouseOver=this.src="images/help_on.gif"; onMouseOut=this.src="images/help_off.gif">&nbsp;</td>
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