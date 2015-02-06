<HTML>
<HEAD>
	<TITLE><?php echo getSiteTitle() ?> - <?php if($page == "content") echo toLink($ArtID); if($page == "contact") echo 'Contact Page'; if($page == "search") echo 'Search Page'; ?></TITLE>
	<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
	<style type="text/css">
	<!--
		@import "css/style.css";
	-->
	</style>

	<script language="JavaScript">
		var slideShowSpeed = 3000
		var crossFadeDuration = 2
		var Pic = new Array() // don't touch this
		
		<?php
			for($i = 1; $i <= $NumLeft; $i++)
				echo 'Pic['.($i - 1).'] = \'images/left/cat'.$CatID.'/left'.$i.'.jpg\'; ';
		?>

		var t
		var j = 0
		var p = Pic.length

		var preLoad = new Array()
		for (i = 0; i < p; i++)
		{
		   preLoad[i] = new Image()
		   preLoad[i].src = Pic[i]
		}

		function runSlideShow(){
		   if (document.all){
			  document.images.SlideShow.style.filter="blendTrans(duration=2)"
			  document.images.SlideShow.style.filter="blendTrans(duration=crossFadeDuration)"
			  document.images.SlideShow.filters.blendTrans.Apply()
		   }
		   document.images.SlideShow.src = preLoad[j].src
		   if (document.all){
			  document.images.SlideShow.filters.blendTrans.Play()
		   }
		   j = j + 1
		   if (j > (p-1)) j=0
		   t = setTimeout('runSlideShow()', slideShowSpeed)
		}
	</script>
	
	<?php
		if($page == "contact")
			echo '<script type="text/javascript" src="js/contact.js"></script>';
		
		if($page == "unsub")
			echo '<script type="text/javascript" src="js/unsub.js"></script>';
	?>

</HEAD>
<BODY LEFTMARGIN=0 RIGHTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 <?php if($page == "content") echo 'onload="runSlideShow();"'; ?>>
	<TABLE width="1000" BORDER=0 CELLPADDING=0 CELLSPACING=0 align="center">
		<TR>
			<TD COLSPAN=3>
			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td width="74" height="74"><a href="http://<?php echo getOrgURL() ?>"><img src="images/logo/logo.gif" align="absmiddle" border="0" alt="Tasmania Online"></a></td>
				  <td valign="middle"><span class="title"><?php echo getSiteTitle(); ?></span></td>
				  <td width="280" background="images/banner/banner_bg.jpg"></td>
				  <td width="303"><img src="images/banner/banner<?php echo $banner_pic; ?>.jpg"></td>
				</tr>
			  </table>
			</TD>
		</TR>

		<TR>
			<TD bgcolor=#999966></TD>
			<TD HEIGHT=26 bgcolor=#999966 valign="middle" align="right">
				<span class="cat"><?php echo getSlogan(); ?></span>
			</TD>
			<TD bgcolor=#999966></TD>
		</TR>
		<TR>
			<TD COLSPAN=3 HEIGHT=17 bgcolor=#DDDDDD valign="middle">
				&nbsp;<a href="index.php"><span class="sub">Home</span></a>&nbsp;
				<?php
				
					if($page == "content")
					{
						echo '<img src="images/common/arrow.gif"><a href="main.php?page=content&CatID='.$CatID.'"><span class="sub">'.toCat($CatID).'</span></a>&nbsp';
						
						if($ArtID > firstArtID($CatID))
							echo '<img src="images/common/arrow.gif"><a href="main.php?page=content&CatID='.$CatID.'&ArtID='.$ArtID.'"><span class="sub">'.toLink($ArtID).'</span></a>&nbsp';
					}

					if($page == "contact")
						echo '<img src="images/common/arrow.gif"><a href="main.php?page=contact"><span class="sub">Contact Page</span></a>&nbsp';

					if($page == "search")
						echo '<img src="images/common/arrow.gif"><a href="main.php?page=search&q='.$var.'"><span class="sub">Search</span></a>&nbsp';

				?>
			</TD>
		</TR>
		
		<TR>
			<TD bgcolor="#CCCCCC" valign="top">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr height="20"><td>&nbsp;</td></tr>
					
					<tr>
						<td align="center">
							<?php displayMenu($CatID, $ArtID, $browser, $page); ?>
						</td>
					</tr>
					
					<tr height="20"><td>&nbsp;</td></tr>
		
					<tr>
					  <td align="center">
						<img src="images/left/<?php echo $left_pic; ?>.jpg" <?php if($page == "content") echo 'name="SlideShow"'; ?> width="180" height="130">
					  </td>
					</tr>
			
					<tr>
					  <td>
					  	<form name="search" method="get">
					  		<input type="hidden" name="page" value="search">
							<table width="185" border="0" cellspacing="0" cellpadding="0" align="center">
								<TR>
									<TD><IMG SRC="images/common/search.gif" WIDTH=144 HEIGHT=29></TD>
								</TR>
								
								<TR height="3"><TD></TD></TR>
								
								<TR>
									<TD>
										<input type="text" name="q" size="27" value="Enter Search Keyword" onFocus="if (this.value == 'Enter Search Keyword') this.value = '';">
									</TD>
								</TR>
								
								<TR height="3"><TD></TD></TR>
								
								<TR>
									<TD align="right"><input type="submit" value="Search"></TD>
								</TR>						
							</table>
						 </form>
					  </td>
					</tr>
			  </table>
			</TD>
			
			<TD valign="top">
				<TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
					<TR>
						<TD><IMG SRC="images/common/content_squares.jpg"></TD>
			