<?php
	$tpl_path = 'templates/front/'.getFrontTpl();
?>
<HTML>
<HEAD>
<TITLE>Welcome to <?php echo getSiteTitle(); ?> Website</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
<script language="JavaScript">
	function MM_preloadImages() { //v3.0
	  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
		var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
		if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
	}

	function MM_swapImgRestore() { //v3.0
	  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
	}

	function MM_findObj(n, d) { //v4.0
	  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
		d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	  if(!x && document.getElementById) x=document.getElementById(n); return x;
	}

	function MM_swapImage() { //v3.0
	  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
	   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
	}
</script>

<style type="text/css">
<!--
	@import "css/style.css";
-->
</style>

</HEAD>
<BODY vlink="#006BD2" alink="#FE57FF" link="#006BD2" text="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('<?php echo $tpl_path ?>/images/but_enter_r.gif'); runSlideShow();">
<TABLE WIDTH="100%" BORDER=0 CELLPADDING=0 CELLSPACING=0  background="<?php echo $tpl_path ?>/images/index_background.gif" align="center">
  <TR>
    <TD bgcolor="#FFFFFF" width="391" height="251" background="<?php echo $tpl_path ?>/images/top_image.jpg" valign="top" align="center">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			  <td width="74" height="74"><a href="http://<?php echo getOrgURL() ?>"><img src="<?php echo $tpl_path ?>/images/logo.gif" align="absmiddle" border="0" alt="Tasmania Online"></a></td>
			  <td valign="middle" align="left"><span class="title"><?php echo getSiteTitle(); ?></span></td>
			</tr>
		</table>
    </TD>
    <TD bgcolor="#FFFFFF">
    	<table width="100%" height="100%">
    		<tr>
    			<td valign="bottom" align="center">&nbsp;<a href="main.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<?php echo $tpl_path ?>/images/but_enter_r.gif',1)"><img src="<?php echo $tpl_path ?>/images/but_enter.gif" name="Image1" width="110" height="15" border="0"></a></td>
    			<td valign="top" align="right"><img src="<?php echo $tpl_path ?>/images/blinktas.gif"></td>

    		</tr>
    	</table>
    </TD>
  </TR>
  <TR>
    <TD rowspan="2" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top"><IMG SRC="<?php echo $tpl_path ?>/images/md_image.jpg" WIDTH=391 HEIGHT=22></td>
        </tr>
        <tr>
          <td valign="top"><img src="<?php echo $tpl_path ?>/images/bottom_image.jpg" width=391 height=211></td>
        </tr>
      </table>
      <br>
    </TD>
    <TD valign="top"></TD>
  </TR>
  <TR>
    <TD valign="top">
		<TABLE width="100%">
			<TR>
				<TD colspan="2" height="120" valign="top" align="right"><IMG SRC="<?php echo $tpl_path ?>/images/front.jpg" width="605" height="105"></TD>
			</TR>
			<TR>
				<TD colspan="2" height="30" valign="top"><span class="cat"><font color="#FFCC00"><b><?php echo getIntroTitle(); ?></b></font></span></TD>
			</TR>
			<TR height="80">
				<TD width="50">&nbsp;</TD>
				<TD valign="top">
					<font color="#FFFFFF"><?php echo getIntroText(); ?></font>
				</TD>
			</TR>
		</TABLE>
    </TD>
  </TR>
</TABLE>

<p><div class="foot" align="center">
  Copyright &copy <?php echo getOrgTitle(); ?>. All rights reserved.<br>
  <a href="admin/">Webmaster</a></div></p>

</BODY>
</HTML>