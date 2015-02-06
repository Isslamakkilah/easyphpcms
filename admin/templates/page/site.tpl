<script language="JavaScript">
	function checkForm()
	{
		if(!allDigits(document.graphics.front.value))
		{
			alert("Number must be numeric");
			document.graphics.front.select();
			return false;
		}
	
		if(document.graphics.front.value < 1)
		{
			alert("Value must be from 1");
			document.graphics.front.select();
			return false;
		}
		
		if(!allDigits(document.graphics.banner.value))
		{
			alert("Number must be numeric");
			document.graphics.banner.select();
			return false;
		}
	
		if(document.graphics.banner.value < 1)
		{
			alert("Value must be from 1");
			document.graphics.banner.select();
			return false;
		}
		
		if(!allDigits(document.graphics.left.value))
		{
			alert("Number must be numeric");
			document.graphics.left.select();
			return false;
		}
			
		if(document.graphics.left.value < 1)
		{
			alert("Value must be from 1");
			document.graphics.left.select();
			return false;
		}
		
		if(!allDigits(document.graphics.right.value))
		{
			alert("Number must be numeric");
			document.graphics.right.select();
			return false;
		}
		
		if(document.graphics.right.value < 1)
		{
			alert("Value must be from 1");
			document.graphics.right.select();
			return false;
		}
		
		if(confirmSubmit())
			return true;
		else
			return false;
	}
	
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
	
	function allDigits(str)
	{
		return inValidCharSet(str,"0123456789");
	}
	
	function inValidCharSet(str,charset)
	{
		var result = true;
		for (var i=0;i<str.length;i++)
			if (charset.indexOf(str.substr(i,1))<0)
			{
				result = false;
	
				break;
			}
		return result;
	}
</script>

<a name="site"></a>

<?php
	if($browser == 'msie')			
		echo '<fieldset class=icons>
				<legend>';
?>
		<table>
			<tr height="40">
				<td valign="middle"><img src="images/options.gif"></td>
				<td valign="middle"><span class="sub">&nbsp;Site Options&nbsp;</span></td>
			</tr>
		</table>

<?php
	if($browser == 'msie')			
		echo '</legend>';
?>

	<table width="600" align="center">
		<tr>
			<td>			
				To update the site-specific details please edit this form and press the Update button.<br>For URLs please enter the location only and <b>do not</b> include the protocol part (eg. <b>http://</b>).
			</td>
		</tr>
		
		<tr><td height="5">&nbsp;</td></tr>
		
		<tr>
			<td>
				<form method=post name="site" action="index.php?page=site">
					<table width="100%" bgcolor="#D4D0C8">
						<tr height="25" bgcolor="#0A246A">
							<td colspan="2" align="center"><font color="#FFFFFF"><b>Site Details</b></font></td>
						</tr>

						<tr height="25">
							<td width="260" valign="middle"><span class="element">Site URL:</span></td>
							<td valign="middle" align="right"><input type="text" size="70" name="SiteURL" value="<?php echo $SiteURL; ?>"></td>
						</tr>
						
						<tr height="25">
							<td valign="middle"><span class="element">Site Title:</span></td>
							<td valign="middle" align="right"><input type="text" size="70" name="SiteTitle" value="<?php echo $SiteTitle; ?>"></td>
						</tr>
						
						<tr height="25">
							<td valign="middle"><span class="element">Slogan:</span></td>
							<td valign="middle" align="right"><input type="text" size="70" name="Slogan" value="<?php echo $Slogan; ?>"></td>
						</tr>
						
						<tr height="25">
							<td valign="middle"><span class="element">Introduction Title:</span></td>
							<td valign="middle" align="right"><input type="text" size="70" name="IntroTitle" value="<?php echo $IntroTitle; ?>"></td>
						</tr>
						
						<tr>
							<td valign="middle"><span class="element">Introduction Text:</span></td>
							<td valign="middle" align="right"><textarea name="IntroText" cols="53" rows="8"><?php echo $IntroText; ?></textarea></td>
						</tr>
						
						<tr height="25">
							<td valign="middle"><span class="element">Org Title:</span></td>
							<td valign="middle" align="right"><input type="text" size="70" name="OrgTitle" value="<?php echo $OrgTitle; ?>"></td>
						</tr>
						
						<tr height="25">
							<td valign="middle"><span class="element">Org URL:</span></td>
							<td valign="middle" align="right"><input type="text" size="70" name="OrgURL" value="<?php echo $OrgURL; ?>"></td>
						</tr>
						
						<tr height="25">
							<td valign="middle"><span class="element">Contact URL:</span></td>
							<td valign="middle" align="right"><input type="text" size="70" name="OrgCont" value="<?php echo $OrgCont; ?>"></td>
						</tr>
						
						<tr height="25">
							<td valign="middle"><span class="element">Disclaimer URL:</span></td>
							<td valign="middle" align="right"><input type="text" size="70" name="OrgDisc" value="<?php echo $OrgDisc; ?>"></td>
						</tr>
						
						<tr height="25">
							<td valign="middle" align="left"><input type="submit" name="update" value="Update" onclick="return confirmSubmit()"></td>
							<td valign="middle" align="right"><input type="button" value="Cancel" value="Back" onClick="location.href='index.php'"></td>
						</tr>
					</table>				
				</form>
			</td>
		</tr>
		<tr height="10">
			<td align="center">
				<table with="100%">
					<tr>
						<td width=550 align="left"><?php echo $stat1; ?></td>
						<td align="right"><img src="images/help_off.gif" alt="Help" style="cursor: <?php echo $pointer; ?>" onClick="return popup_help('help.php?topic=site#site')" onMouseOver=this.src="images/help_on.gif"; onMouseOut=this.src="images/help_off.gif">&nbsp;</td>
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


<a name="grap"></a>

<?php
	if($browser == 'msie')			
		echo '<fieldset class=icons>
				<legend>';
?>

		<table>
			<tr height="40">
				<td valign="middle"><img src="images/graphics.gif"></td>
				<td valign="middle"><span class="sub">&nbsp;Site Graphics&nbsp;</span></td>
			</tr>
		</table>

<?php
	if($browser == 'msie')			
		echo '</legend>';
?>
	
	<table width="600" align="center">
		<tr>
			<td>			
				Update this section <b>only</b> if you want to <b>change</b> the number of graphics to be used in the web site. Consult online help or manual for more information. 
			</td>
		</tr>
		
		<tr><td height="5">&nbsp;</td></tr>
		
		<tr>
			<td>
				<form method=post name="graphics" action="index.php?page=site">
					<table width="100%" bgcolor="#D4D0C8">
						<tr height="25" bgcolor="#0A246A">
							<td colspan="4" align="center"><font color="#FFFFFF"><b>Site Graphics</b></font></td>
						</tr>

						<tr height="25">
							<td width="25%" valign="middle">
								<span class="element">Front:&nbsp;&nbsp;</span><input type="text" name="front" size="5" value="<?php echo $front; ?>"> 
							</td>
							<td width="25%" valign="middle">
								<span class="element">Banner:&nbsp;&nbsp;</span><input type="text" name="banner" size="5" value="<?php echo $banner; ?>"> 
							</td>
							<td width="25%" valign="middle">
								<span class="element">Left:&nbsp;&nbsp;</span><input type="text" name="left" size="5" value="<?php echo $left; ?>"> 
							</td>
							<td width="25%" valign="middle">
								<span class="element">Right:&nbsp;&nbsp;</span><input type="text" name="right" size="5" value="<?php echo $right; ?>"> 
							</td>
						</tr>
						<tr height="25">
							<td valign="middle" align="left"><input type="submit" name="change" value="Update" onclick="return checkForm()"></td>
							<td colspan="2"></td>
							<td valign="middle" align="right"><input type="button" value="Cancel" value="Back" onClick="location.href='index.php'"></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr height="10">
			<td align="center">
				<table with="100%">
					<tr>
						<td width=550 align="left"><?php echo $stat2; ?></td>
						<td align="right"><img src="images/help_off.gif" alt="Help" style="cursor: <?php echo $pointer; ?>" onClick="return popup_help('help.php?topic=site#grap')" onMouseOver=this.src="images/help_on.gif"; onMouseOut=this.src="images/help_off.gif">&nbsp;</td>
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