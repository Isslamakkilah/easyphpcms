				<TD valign="middle" width="470">
					<table width="100%" height="50" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td valign="top">
								<span class="head"><?php echo toTitle($ArtID); ?></span>
			
							</td>
						</tr>
					</table>
				</TD>
			</TR>
			
			<TR height="10"><TD colspan="2">&nbsp;</TD></TR>
			
			<TR>
				<TD colspan="2" valign="top">
					<table width="570" border="0" cellspacing="0" cellpadding="0" align="center">
						<tr>
							<td>
								<?php echo str_replace( "$var", '<span style="background: yellow;"><b>'.$var.'</b></span>', toContent($ArtID)); ?>
							</td>
						</tr>
					</table>
				</TD>
			</TR>
			
			<TR height="10"><TD colspan="2">&nbsp;</TD></TR>
		</TABLE>
	</TD>
	
	<TD valign="top">
		<table width=100%>
			<tr height="20"><td></td></tr>
			<tr><td><IMG SRC="images/right/<?php echo $right_pic1; ?>.jpg"></td></tr>
			<tr height="5"><td></td></tr>
			<tr><td><IMG SRC="images/right/<?php echo $right_pic2; ?>.jpg"></td></tr>
			<tr height="20"><td></td></tr>
		</table>
	</TD>
</TR>