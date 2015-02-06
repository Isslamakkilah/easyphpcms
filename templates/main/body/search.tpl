				<TD valign="middle" width="470">
					<table width="100%" height="50" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td valign="top">
								<span class="head">Search Results</span>
								<br><br><span class="msg">Here are the search resutls for <font color="#0000FF"><b><?php echo stripslashes($var); ?></b></font>:</span>
							</td>
						</tr>
					</table>
				</TD>
			</TR>
			
			<TR height="10"><TD colspan="2">&nbsp;</TD></TR>

			<TR>
				<TD colspan="2" valign="top">
					<?php
						if(!isset($resultmsg))
						{
							$count = 0;
							echo '<table width="570" border="1" cellspacing="0" cellpadding="0" align="center">
								<tr height="25" bgcolor="#6699CC">
									<td width="30" valign="middle" align="center"><font color="#FFFFFF"><b>#</b></font></td>
									<td width="350" valign="middle" align="center"><font color="#FFFFFF"><b>Article Title</b></font></td>
									<td valign="middle" align="center"><font color="#FFFFFF"><b>Category</b></font></td>
								</tr>';

							foreach($newarr as $value)
							{
								$count ++;

								$query_value = "SELECT * FROM article WHERE ArtID = '$value'";
								$num_value=mysql_query ($query_value);
								$row_linkcat= mysql_fetch_array ($num_value);
								$row_num_links= mysql_num_rows ($num_value);
								$titlehigh = preg_replace ( "'($var)'si" , "<b>\\1</b>" , $row_linkcat[ 'ShortTitle' ] );
								$linkhigh = preg_replace ( "'($var)'si" , "<b>\\1</b>" , $row_linkcat[ 'LongTitle' ] );
								$linkdesc = preg_replace ( "'($var)'si" , "<b>\\1</b>" , $row_linkcat[ 'Content' ] );

								foreach($trimmed_array as $trimm)
								{
									if($trimm != 'b' )
									{
										$titlehigh = preg_replace( "'($trimm)'si" ,  "<b>\\1</b>" , $titlehigh);
										$linkhigh = preg_replace( "'($trimm)'si" , "<b>\\1</b>" , $linkhigh);
										$linkdesc = preg_replace( "'($trimm)'si" ,  "<b>\\1</b>" , $linkdesc);
									}
								}

								if(!empty($linkhigh)) echo '<tr height="25" bgcolor="#E7E7E7">
												<td width="30" valign="middle">&nbsp;'.$count.'</td>
												<td width="350" valign="middle">&nbsp;<a href="main.php?page=content&CatID='.catOfArt($value).'&ArtID='.$value.'&q='.$var.'" target="_blank">'.stripslashes($linkhigh).'</a></td>
												<td valign="middle">&nbsp;<a href="main.php?page=content&CatID='.catOfArt($value).'" target="_blank">'.toCat(catOfArt($value)).'</a></td>
											</tr>';

								else echo '<tr height="25" bgcolor="#E7E7E7"><td colspan="3" valign="middle" align="center">Sorry, there are no articles that exactly match <font color="#0000FF"><b>'.stripslashes($var).'</b></font></td></tr>';
							}

							echo '</table>
								<p align="center"><a href="http://www.google.com/search?hl=en&q='.stripslashes($var).'" target="_blank">Search the web for <b>'.stripslashes($var).'</b> by Google</a></p>';
						}

						else echo '<table width="570" border="1" cellspacing="0" cellpadding="0" align="center">
								<tr height="25" bgcolor="#6699CC">
									<td width="30" valign="middle" align="center"><font color="#FFFFFF"><b>#</b></font></td>
									<td width="350" valign="middle" align="center"><font color="#FFFFFF"><b>Article Title</b></font></td>
									<td valign="middle" align="center"><font color="#FFFFFF"><b>Category</b></font></td>
								</tr>
								<tr height="25" bgcolor="#E7E7E7"><td colspan="3" valign="middle" align="center"><font color="#FF0000">'.$resultmsg.'</font></td></tr>
							</table>';
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
