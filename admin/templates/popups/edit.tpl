<html>
<head>
<title><?php if(empty($ArtID)) echo 'New Article'; else echo 'Edit Article - Article ID = '.$ArtID; ?></title>

<style type="text/css">

<!--

@import "css/style.css";

</style>

<script language="JavaScript">
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
	
	function closeMe()
	{
		t = setTimeout("self.close()",1000);
	}
	
	function refreshParent()
	{
		var randomnumber=Math.floor(Math.random()*1001);
		var location = 'index.php?page=content&id=' + randomnumber + '&act=<?php echo $page; ?>#art';
		
		<?php 
			if ($browser == 'msie')
				echo 'parent.window.opener.location.href(location);';
			else
				echo 'parent.window.opener.location.reload();';
		?>
	}
</script>

<script language="javascript" type="text/javascript" src="extra/editor/tiny_mce.js"></script>

<script language="javascript" type="text/javascript">
	tinyMCE.init({
		mode : "textareas",
		theme : "advanced",
		language : "english",
		editor_css : "extra/editor/css/editor.css",
		force_p_newlines: "false",
		force_br_newlines: "true"
	});
</script>

</head>
	<body background="images/popup_bg.jpg" LEFTMARGIN=0 RIGHTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 <?php if($done == true) echo ' onLoad="closeMe()" onUnload="refreshParent()"'; ?>>
		<form name="theform" method="post" action="<?php echo $action; ?>">
			<input type="hidden" name="Author" value="<?php echo $Author; ?>">
			<table>
				<tr bgcolor="#C6E3FF">
					<td colspan="5" valign="middle">
						<table width="100%" height="40">
							<tr>
								<td valign="middle" align="center" width="50"><?php if(empty($ArtID)) echo '<img src="images/add.gif">'; else echo '<img src="images/edit.gif">'; ?></td>
								<td valign="middle"><span class="head"><?php if(empty($ArtID)) echo 'New Article'; else echo 'Edit Article'; ?></span></td>
							</tr>
						</table>
					</td>
				</tr>
				
				<tr height="30">
					<td colspan="5" valign="middle" align="center"><?php echo $message; ?></td>
				</tr>
				
				<tr>
					<td width="100" height="25" valign="middle"><span class="sub">Author:</span></td>
					<td width="180" valign="middle"><b><?php echo $Author; ?></b></td>
					<td width="20">&nbsp;</td>
					<td width="120" valign="middle"><span class="sub">Date:</span></td>
					<td valign="middle"><b><?php echo displayDate($Date); ?></b></td>
				</tr>
				
				<tr>
					<td height="25" valign="middle"><span class="sub">Category:</span></td>
					<td valign="middle">
						<select type="text" name="CatID" style="width:202px;height:20px;">
							<option value="" selected>Please Select</option>
							<?php
								$link = connectToDB();
								$result = mysql_query('select CatID, Cat from category order by CatID');
								$row = mysql_num_rows($result);

								for($i = 0; $i < $row; $i++)
								{
									$data = mysql_fetch_row($result);
									echo '<option value="'.$data[0].'" ';
									if($CatID == $data[0])
										echo 'selected ';
									echo '>'.$data[0].' - '.$data[1].'</option>';
								}
							?>
						</select>
					</td>
					<td>&nbsp;</td>
					<td valign="middle"><span class="sub">Link Name:</span></td>
					<td valign="middle"><input type=text name="ShortTitle" size=34 value="<?php echo $ShortTitle; ?>">
				</tr>

				<tr>
					<td height="25" valign="middle"><span class="sub">Article Title:</span></td>
					<td colspan="4" valign="middle"><input type=text name="LongTitle" size=93 value="<?php echo $LongTitle; ?>">
				</tr>
				

				<tr>
					<td valign="top"><span class="sub">Content:</span></td>
					<td colspan="4">
						<textarea name="Content" cols="70" rows="22"><?php echo $Content; ?></textarea>
					</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td colspan=3 valign=top>
						<div class=foot>
							<ul>
								<li>Link Name should not exceed 25 characters</li>
								<li>Article Title should not exceed 75 characters</li>
							</ul>
						</div>
					</td>
					<td align="right" valign=middle><input type="submit" name="edit" value=<?php if(empty($ArtID)) echo "Submit"; else echo "Update"; ?> onClick="return confirmSubmit()"></td>
				</tr>
				
			</table>
		</form>
	</body>
</html>