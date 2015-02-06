<script language="javascript" src="js/content.js"></script>

<?php
	if($browser == 'msie')			
		echo '<fieldset class=icons>
				<legend>';
?>
		<table>
			<tr height="40">
				<td valign="middle"><img src="images/category.gif"></td>
				<td valign="middle"><span class="sub">&nbsp;Categories&nbsp;</span></td>
			</tr>
		</table>

<?php
	if($browser == 'msie')			
		echo '</legend>';
?>
	
	<table width="600" align="center">
		<a name="cat"></a>
		
		<tr><td>Use this form to create and edit Categories of the website</td></tr>
		
		<tr><td height="5">&nbsp;</td></tr>
		
		<tr>
			<td>
				<form method=post name="category" action="index.php?page=content#cat">
					<table width="100%">
						<tr>
							<td width="350">
								<table width="100%" bgcolor="#D4D0C8">
									<tr height="25" bgcolor="#0A246A">
										<td colspan="3" align="center" valign="middle"><font color="#FFFFFF"><b>Edit Categories</b></font></td>
									</tr>
									<tr>
										<td align="left" valign="middle"><span class="element">Category:</span></td>
										<td colspan="2" align="right">
											<select type="text" name="ccategory" style="width:235px;height:20px;">
												<option value="" selected>Please Select</option>
												<?php
													$link = connectToDB();
													$result = mysql_query('select CatID, Cat from category order by CatID');
													
													if(!empty($result)) {										
														$row = mysql_num_rows($result);

														for($i = 1; $i <= $row; $i++)
														{
															$data = mysql_fetch_row($result);
															echo '<option value="'.$data[0].'" ';

															if($CatID == $data[0])
																echo 'selected ';

															echo '>'.$data[0].' - '.$data[1].' ('.getNumArts($data[0]).')</option>';
														}
													}
												?>
											</select>
										</td>
									</tr>
									<tr height="25">
										<td align="left" valign="middle"><span class="element">Rename to:</span></td>
										<td colspan="2" align="right"><input type=text name="rcategory" size="35" value="<?php echo $rcategory; ?>"></td>
									</tr>
									<tr height="25">
										<td width="30%" align="left"><input type="submit" name="rename" value="Rename" onCLick="return confirmRenameCat()"></td>
										<td width="40%" align="center"><input type="submit" name="empty" value="Empty" onCLick="return confirmEmptyCat()"></td>
										<td width="30%" align="right"><input type="submit" name="delete" value="Delete" onCLick="return confirmDeleteCat()"></td>
									</tr>
									<tr height="25">
										<td align="left" valign="middle"><span class="element">New Category:</span></td>
										<td colspan="2" align="right"><input type=text name="ncategory" size="35"></td>
									</tr>
									<tr height="25">
										<td colspan="3" align="right"><input type="submit" name="create" value="Create"></td>
									</tr>
								</table>
							</td>
							<td width="5"></td>
							<td valign="middle" align="left">
								<table width="100%">
									<tr height="25"><td align="left" valign="middle"></td></tr>
									<tr height="25"><td align="left" valign="center"><span class="errormsg"><?php echo $msg1; ?></span></td></tr>
									<tr height="25"><td align="left" valign="middle"><span class="errormsg"><?php echo $msg2; ?></span></td></tr>
									<tr height="25"><td align="left" valign="middle"></td></tr>
									<tr height="25"><td align="left" valign="middle"><span class="errormsg"><?php echo $msg3; ?></span></td></tr>
									<tr height="25"><td align="left" valign="middle"></td></tr>
								</table>
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		
		<tr>
			<td>
				<table with="100%">
					<tr>
						<td width=550 align="left"><?php echo $stat1; ?></td>
						<td align="right"><img src="images/help_off.gif" alt="Help" style="cursor: <?php echo $pointer; ?>" onClick="return popup_help('help.php?topic=content#cat')" onMouseOver=this.src="images/help_on.gif"; onMouseOut=this.src="images/help_off.gif">&nbsp;</td>
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

<a name="art"></a>

<?php
	if($browser == 'msie')			
		echo '<fieldset class=icons>
				<legend>';
?>

		<table>
			<tr height="40">
				<td valign="middle"><img src="images/article.gif"></td>
				<td valign="middle"><span class="sub">&nbsp;Articles&nbsp;</span></td>
			</tr>
		</table>

<?php
	if($browser == 'msie')			
		echo '</legend>';
?>

	<table width="600" align="center">
		<tr><td>This section allows you to post, edit and delete Articles of the website.</td></tr>
		<tr><td height="5">&nbsp;</td></tr>
		<tr>
			<td valign="middle">
				<table width="100%">
					<form name="search" method="get" action="#art">
					<tr>
						<td valign="middle" align"left">
							<input type="hidden" name="page" value="content">
							Search for articles:&nbsp;&nbsp;
							<input type="text" name="query" size="25" value="<?php echo $search; ?>">
						</td>
						<td valign="middle" align="left">
							<input type="submit" value="Search">
						</td>
					</tr>
					</form>
					<tr>
						<td width="60%" valign="middle" align"left">Please select category to view articles by categories:</td>
						<td valign="middle" align="left">
							<select type="text" name="vcategory" style="width:200px;height:20px;" onChange="window.location=('<?php echo "index.php?page=content&ViewCatID="; ?>'+this.options[this.selectedIndex].value+'<?php echo "&sortby=$sortby&entries=$entries"; ?>#art')">
								<option value="0" <?php if($ViewCatID == 0) echo 'selected'; ?>>All Categories (<?php echo getNumArts(0); ?>)</option>
								<?php
									$link = connectToDB();
									$result = mysql_query('select CatID, Cat from category order by CatID');
									$row = mysql_num_rows($result);

									for($i = 1; $i <= $row; $i++)
									{
										$data = mysql_fetch_row($result);
										echo '<option value="'.$data[0].'" ';

										if($ViewCatID == $data[0])
											echo 'selected ';

										echo '>'.$data[0].' - '.$data[1].' ('.getNumArts($data[0]).')</option>';
									}
								?>
							</select>
						</td>
					</tr>
					<tr>
						<td valign="middle" align"left">Please select the number of entries to be displayed:</td>
						<td valign="middle" align="left">
							<select type="text" name="entries" style="width:200px;height:20px;" onChange="window.location=('<?php echo "index.php?page=content&ViewCatID=$ViewCatID&sortby1=$sortby1&entries1="; ?>'+this.options[this.selectedIndex].value)+'#art'">
								<option value="5" <?php if($entries1 == 5) echo 'selected'; ?>>5 entries per page - Default</option>
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
			<td valign="top">
				<table width="100%" bgcolor="#D4D0C8">
					<tr height="25" bgcolor="#0A246A">
						<td colspan="6" align="center" valign="middle"><font color="#FFFFFF"><b>Edit Articles</b></font></td>
					</tr>
					<tr height="25">
						<td width="20" align="center" valign="middle"><a href="index.php?page=content&ViewCatID=<?php echo $ViewCatID; ?>&sortby1=ArtID&entries1=<?php echo $entries1; ?>#art"><?php if($sortby1 == "ArtID") echo '<font color="#DD0000">'; ?><b>ID</b><?php if($sortby1 == "ArtID") echo '</font>'; ?></a></td>
						<td width="70" align="center" valign="middle"><a href="index.php?page=content&ViewCatID=<?php echo $ViewCatID; ?>&sortby1=Author&entries1=<?php echo $entries1; ?>#art"><?php if($sortby1 == "Author") echo '<font color="#DD0000">'; ?><b>Author</b><?php if($sortby1 == "Author") echo '</font>'; ?></a></td>
						<td width="80" align="center" valign="middle"><a href="index.php?page=content&ViewCatID=<?php echo $ViewCatID; ?>&sortby1=Date&entries1=<?php echo $entries1; ?>#art"><?php if($sortby1 == "Date") echo '<font color="#DD0000">'; ?><b>Date</b><?php if($sortby1 == "Date") echo '</font>'; ?></a></td>
						<td width="160" align="center" valign="middle"><a href="index.php?page=content&ViewCatID=<?php echo $ViewCatID; ?>&sortby1=CatID&entries1=<?php echo $entries1; ?>#art"><?php if($sortby1 == "CatID") echo '<font color="#DD0000">'; ?><b>Category</b><?php if($sortby1 == "CatID") echo '</font>'; ?></a></td>
						<td  width="200" align="center" valign="middle"><a href="index.php?page=content&ViewCatID=<?php echo $ViewCatID; ?>&sortby1=ShortTitle&entries1=<?php echo $entries1; ?>#art"><?php if($sortby1 == "ShortTitle") echo '<font color="#DD0000">'; ?><b>Link Name</b><?php if($sortby1 == "ShortTitle") echo '</font>'; ?></a></td>
						<td align="center" valign="middle"><span class="element">Action</span></td>
					</tr>

						<?php displayArticles($ViewCatID, $sortby1, $entries1, $index1, $search); ?>

					<tr height="25">
						<td colspan="6" align="center" valign="middle"><?php pageIndex($page, $ViewCatID, $numPage, $sortby1, $entries1, $index1, "1", "art"); ?></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr><td height="5">&nbsp;</td></tr>
		<tr>
			<td valign="middle" align="center"><input type="button" value="New Article" onClick="return popup_add('popup.php?page=add')"><td>
		</tr>
		<tr height="10">
			<td>
				<table with="100%">
					<tr>
						<td width=550 align="left"><?php echo $stat2; ?></td>
						<td align="right"><img src="images/help_off.gif" alt="Help" style="cursor: <?php echo $pointer; ?>" onClick="return popup_help('help.php?topic=content#art')" onMouseOver=this.src="images/help_on.gif"; onMouseOut=this.src="images/help_off.gif">&nbsp;</td>
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