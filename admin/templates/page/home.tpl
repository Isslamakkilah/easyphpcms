<?php
	if($browser == 'msie')			
		echo '<fieldset class=icons>
				<legend>';
?>
		<table>
			<tr height="40">
				<td valign="middle"><img src="images/content.gif"></td>
				<td valign="middle"><span class="sub">&nbsp;Content Manager&nbsp;</span></td>

			</tr>
		</table>

<?php
	if($browser == 'msie')			
		echo '</legend>';
?>

	<table width="600" align="center">
		<tr>
			<td>
				The content manager page allows you to edit categories. You can also post and edit articles within the categories here. 
			</td>
		</tr>
		<tr height="5">
			<td></td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" value="Content Manager" onClick="location.href='index.php?page=content'"> 
			</td>
		</tr>
	</table>

<?php
	if($browser == 'msie')			
		echo '</fieldset><br>
			<fieldset class=icons>
				<legend>';
?>

		<table>
			<tr height="40">
				<td valign="middle"><img src="images/feedback.gif"></td>
				<td valign="middle"><span class="sub">&nbsp;Feeback Manager&nbsp;</span></td>

			</tr>
		</table>

<?php
	if($browser == 'msie')			
		echo '</legend>';
?>
	
	<table width="600" align="center">
		<tr>
			<td>
				The feedback manager page allows you to view visitors' feedback, respond to feedbacks and send information on interested fields. 
			</td>
		</tr>
		<tr height="5">
			<td></td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" value="Feedback Manager" onClick="location.href='index.php?page=feedback'"> 
			</td>
		</tr>
	</table>

<?php
	if($browser == 'msie')			
		echo '</fieldset><br>
			<fieldset class=icons>
				<legend>';
?>
		<table>
			<tr height="40">
				<td valign="middle"><img src="images/site.gif"></td>
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
				The site manager page allows you to change the site-specific details such as titles, welcome message, header and footer sections. 
			</td>
		</tr>
		<tr height="5">
			<td></td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" value="Site Options" onClick="location.href='index.php?page=site'"> 
			</td>
		</tr>
	</table>

<?php
	if($browser == 'msie')			
		echo '</fieldset><br>
			<fieldset class=icons>
				<legend>';
?>

		<table>
			<tr height="40">
				<td valign="middle"><img src="images/accounts.gif"></td>
				<td valign="middle"><span class="sub">&nbsp;Accounts&nbsp;</span></td>

			</tr>
		</table>

<?php
	if($browser == 'msie')			
		echo '</legend>';
?>

	<table width="600" align="center">
		<tr>
			<td>
				The accounts page allows you to create a new admin account, delete existing admin accounts and change password of any admin account
			</td>
		</tr>
		<tr height="5">
			<td></td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" value="Admin Accounts" onClick="location.href='index.php?page=accounts'"> 
			</td>
		</tr>
	</table>

<?php
	if($browser == 'msie')			
		echo '</fieldset>';
?>