<?php
	if($page == "login")
	{
		$username = $HTTP_POST_VARS['username'];
		$password = $HTTP_POST_VARS['password'];

		if (isset($HTTP_POST_VARS['login']))
		{
			validate_login($username, $password);
		}
		
		if($err == "auth")
			$stat1 = '<img src="images/error.gif">&nbsp;<span class="errormsg">ERROR: invalid username and/or password. Please try again.</span>';
	}

	if($page == "content")
	{
		global $numPage;
		
		$CatID = $HTTP_POST_VARS['ccategory'];
		$rcategory = $HTTP_POST_VARS['rcategory'];
		$ncategory = $HTTP_POST_VARS['ncategory'];
		$ViewCatID = $HTTP_GET_VARS['ViewCatID'];
		$sortby1 = $HTTP_GET_VARS['sortby1'];
		$index1 = $HTTP_GET_VARS['index1'];
		$entries1 = $HTTP_GET_VARS['entries1'];
		$ArtID = $HTTP_GET_VARS['ArtID'];
		$search = $HTTP_GET_VARS['query'];

		if(empty($ViewCatID))
			$ViewCatID = "0";

		if(empty($sortby1))
			$sortby1 = "Time DESC";

		if(empty($index1))
			$index1 = "1";

		if(empty($entries1))
			$entries1 = "5";

		if(isset($HTTP_POST_VARS['rename']))
		{
			if(checkRenameForm($CatID, $rcategory))
				rename_cat($CatID, $rcategory);
				
		}

		if(isset($HTTP_POST_VARS['empty']))
		{
			if(checkEmptyForm($CatID))
				empty_cat($CatID);
		}
		
		if(isset($HTTP_POST_VARS['delete']))
		{
			if(checkEmptyForm($CatID))
				delete_cat($CatID);
		}
		
		if(isset($HTTP_POST_VARS['create']))
		{
			if(checkCreateCatForm($ncategory))
				create_cat($ncategory);
		}
		
		if($act == "del_art")
		{
			del_article($ArtID);
			header("Location: index.php?page=content&ViewCatID=$ViewCatID&sortby1=$sortby1&entries1=$entries1&index1=$index1&act=del2#art");
		}
		
		if($act == "cre_cat")
		{
			if($err == "reg")
				$stat1 = '<img src="images/error.gif">&nbsp;<span class="errormsg">ERROR: Category name already exists. Please enter a different name.</span>';
			else
				$stat1 = '<img src="images/check.gif">&nbsp;<span class="message">New category has been created. Thank you.';
		}
		
		if($act == "ren_cat")
		{
			if($err == "reg")
				$stat1 = '<img src="images/error.gif">&nbsp;<span class="errormsg">ERROR: Category name already exists. Please enter a different name.</span>';
			else
				$stat1 = '<img src="images/check.gif">&nbsp;<span class="message">Category has been renamed. Thank you.</span>';
		}
		
		if($act == "emp_cat")
		{
			if($err == "null")
				$stat1 = '<img src="images/error.gif">&nbsp;<span class="errormsg">ERROR: Category is already emptied.</span>';
			else
				$stat1 = '<img src="images/check.gif">&nbsp;<span class="message">Category has been emptied. Thank you.</span>';
		}
		
		if($act == "del1")
		{
			$stat1 = '<img src="images/check.gif">&nbsp;<span class="message">Category has been deleted. Thank you.</span>';
		}
		
		if($act == "del2")
		{
			$stat2 = '<img src="images/check.gif">&nbsp;<span class="message">Article has been deleted. Thank you.</span>';
		}
		
		if($act == "add")
		{
			$stat2 = '<img src="images/check.gif">&nbsp;<span class="message">New article has been successfully posted. Thank you.</span>';
		}
		
		if($act == "edit")
		{
			$stat2 = '<table border=0><tr height="10"><td align="center" valign="middle">&nbsp;<img src="images/check.gif">&nbsp;<span class="message">Article has been successfully updated. Thank you.</span></td></tr></table>';
		}
	}

	if($page == "feedback")
	{
		global $numPage1, $numPage2, $numPage3;
		
		$ViewCatID = $HTTP_GET_VARS['ViewCatID'];
		$ContID = $HTTP_GET_VARS['ContID'];
		$MailID = $HTTP_GET_VARS['MailID'];
		
		$search1 = $HTTP_GET_VARS['query1'];
		$search2 = $HTTP_GET_VARS['query2'];
		$search3 = $HTTP_GET_VARS['query3'];
		
		$act1 = $HTTP_GET_VARS['act1'];
		$act2 = $HTTP_GET_VARS['act2'];
		$act3 = $HTTP_GET_VARS['act3'];
		
		$sortby1 = $HTTP_GET_VARS['sortby1'];
		$sortby2 = $HTTP_GET_VARS['sortby2'];
		$sortby3 = $HTTP_GET_VARS['sortby3'];
		
		$index1 = $HTTP_GET_VARS['index1'];
		$index2 = $HTTP_GET_VARS['index2'];
		$index3 = $HTTP_GET_VARS['index3'];
		
		$entries1 = $HTTP_GET_VARS['entries1'];
		$entries2 = $HTTP_GET_VARS['entries2'];
		$entries3 = $HTTP_GET_VARS['entries3'];
		
		$show3 = $HTTP_GET_VARS['show3'];
		
		if(empty($ViewCatID))
			$ViewCatID = "0";
		
		if(empty($sortby1))
			$sortby1 = "Time DESC";
		if(empty($index1))
			$index1 = "1";
		if(empty($entries1))
			$entries1 = "5";
		
		if(empty($sortby2))
			$sortby2 = "Time DESC";
		if(empty($index2))
			$index2 = "1";
		if(empty($entries2))
			$entries2 = "5";
		
		if(empty($sortby3))
			$sortby3 = "Time DESC";
		if(empty($index3))
			$index3 = "1";
		if(empty($entries3))
			$entries3 = "5";
		
		if(empty($show3))
			$show3 = "all";
		
		if($act1 == "del")
		{
			del_contact($ContID);
			header("Location: index.php?page=feedback&ViewCatID=$ViewCatID&sortby1=$sortby1&entries1=$entries1&index1=$index1&act=del1#cont");
		}
		
		
		if($act2 == "del")
		{
			del_mail($MailID);
			header("Location: index.php?page=feedback&ViewCatID=$ViewCatID&sortby2=$sortby2&entries2=$entries2&index2=$index2&act=del2#mail");
		}
		
		if($act3 == "del")
		{
			del_contact($ContID);
			header("Location: index.php?page=feedback&ViewCatID=$ViewCatID&sortby3=$sortby3&entries3=$entries3&index3=$index3&act=del3#fbk");
		}
		
		if($act == "del1")
		{
			$stat1 = '<img src="images/check.gif">&nbsp;<span class="message">Contact has been deleted. Thank you.</span>';
		}
		
		if($act == "del2")
		{
			$stat2 = '<img src="images/check.gif">&nbsp;<span class="message">Mail has been deleted. Thank you.</span>';
		}
		
		if($act == "del3")
		{
			$stat3 = '<img src="images/check.gif">&nbsp;<span class="message">Feedback has been deleted. Thank you.</span>';
		}
		
		if($act == "msg")
		{
			$stat1 = '<img src="images/check.gif">&nbsp;<span class="message">Message has been successfully sent. Thank you.</span>';
		}
		
		if($act == "mail")
		{
			$stat2 = '<img src="images/check.gif">&nbsp;<span class="message">Newsletter has been successfully sent. Thank you.</span>';
		}

		if($act == "reply")
		{
			$stat3 = '<img src="images/check.gif">&nbsp;<span class="message">Reply has been successfully sent. Thank you.</span>';
		}
	}

	if($page == "site")
	{
		if(isset($HTTP_POST_VARS['update']))
		{
			$SiteURL = $HTTP_POST_VARS['SiteURL'];
			$SiteTitle = $HTTP_POST_VARS['SiteTitle'];
			$Slogan = $HTTP_POST_VARS['Slogan'];
			$IntroTitle = $HTTP_POST_VARS['IntroTitle'];
			$IntroText = addslashes($HTTP_POST_VARS['IntroText']);
			$OrgTitle = $HTTP_POST_VARS['OrgTitle'];
			$OrgURL = $HTTP_POST_VARS['OrgURL'];
			$OrgCont = $HTTP_POST_VARS['OrgCont'];
			$OrgDisc = $HTTP_POST_VARS['OrgDisc'];
			
			updateSite($SiteURL, $SiteTitle, $Slogan, $IntroTitle, $IntroText, $OrgTitle, $OrgURL, $OrgCont, $OrgDisc);
		}
		
		else
		{
			$SiteURL = getSiteURL();
			$SiteTitle = getSiteTitle();
			$Slogan = getSlogan();
			$IntroTitle = getIntroTitle();
			$IntroText = getIntroText();
			$OrgTitle = getOrgTitle();
			$OrgURL = getOrgURL();
			$OrgCont = getOrgCont();
			$OrgDisc = getOrgDisc();
		}
		
		
		if(isset($HTTP_POST_VARS['change']))
		{
			$front = $HTTP_POST_VARS['front'];
			$banner = $HTTP_POST_VARS['banner'];
			$left = $HTTP_POST_VARS['left'];
			$right = $HTTP_POST_VARS['right'];
			
			changeGraphics($front, $banner, $left, $right);
		}
		
		else
		{
			$front = getNumFront();
			$banner = getNumBanner();
			$left = getNumLeft();
			$right = getNumRight();
		}
		
		if($act == "upd_site")
		{
			$stat1 = '<img src="images/check.gif">&nbsp;<span class="message">Site details have been successfully updated. Thank you.</span>';
		}
		
		if($act == "upd_grap")
		{
			$stat2 = '<img src="images/check.gif">&nbsp;<span class="message">Graphics details have been successfully updated. Thank you.</span>';
		}
	}

	if($page == "accounts")
	{
		$username_cre = $HTTP_POST_VARS['username_cre'];
		$password_cre = $HTTP_POST_VARS['password_cre'];
		$cpassword_cre = $HTTP_POST_VARS['cpassword_cre'];
		$username_del = $HTTP_POST_VARS['username_del'];
		$password_del = $HTTP_POST_VARS['password_del'];
		$username = $HTTP_POST_VARS['username'];
		$opassword = $HTTP_POST_VARS['opassword'];
		$npassword = $HTTP_POST_VARS['npassword'];
		$cpassword = $HTTP_POST_VARS['cpassword'];

		if (isset($HTTP_POST_VARS['create']))
		{
			if(checkCreateForm($username_cre, $password_cre, $cpassword_cre))
				create_admin($username_cre, $password_cre);
		}

		if (isset($HTTP_POST_VARS['delete']))
		{
			if(checkDeleteForm($username_del, $password_del))
				delete_admin($username_del, $password_del);	
		}
		
		if(isset($HTTP_POST_VARS['update']))
		{
			if(checkPasswordForm($username, $opassword, $npassword, $cpassword))
				change_password($username, $opassword, $npassword);
		}
		
		if($act == "cre")
		{
			if($err == "reg")
				$stat1 = '<img src="images/error.gif">&nbsp;<span class="errormsg">ERROR: Username already taken. Please enter a different username.</span>';
			else
				$stat1 = '<img src="images/check.gif">&nbsp;<span class="message">New account has been successfully created. Thank you.</span>';
		}

		if($act == "del")
		{
			if($err == "pass")
				$stat2 = '<img src="images/error.gif">&nbsp;<span class="errormsg">ERROR: Old password is incorrect. Please try again.</span>';
			else
				$stat2 = '<img src="images/check.gif">&nbsp;<span class="message">Account has been deleted. Thank you.</span>';
		}

		if($act == "upd")
		{
			if($err == "pass")	
				$stat3 = '<img src="images/error.gif">&nbsp;<span class="errormsg">ERROR: Old password is incorrect. Please try again.</span>';
			else
				$stat3 = '<img src="images/check.gif">&nbsp;<span class="message">Password has been changed. Thank you.</span>';
		}
	}
?>

<head>
	<title><?php echo $title[$page]; ?></title>

	<style type="text/css">
		<!--
			@import "css/style.css";
		-->
	</style>
	
	<script language="JavaScript">
	
		function rollover(ImageIndex,ImgName)
		{
			document.images[ImageIndex].src = ImgName;
		}
	
		function confirmLogout()
		{
			var agree=confirm("Are you sure to logout?");
			if (agree)
				return true ;
			else
				return false ;
		}
	</script>
</head>

<body LEFTMARGIN=0 RIGHTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 <?php if(empty($user) && ($page == "login")) echo 'onLoad="document.login.username.focus()"'; ?>">

<a name="top"></a>
<table BORDER=0 CELLPADDING=0 CELLSPACING=5 align="center">

	<tr>
		<TD COLSPAN="5">
		  <table border="0" cellspacing="0" cellpadding="0">
			<tr>
			  <td width="74"><img src="images/logo.gif" align="absmiddle" border="0"></td>
			  <td width="343" valign="middle" align="left"><span class="title"><?php echo getSiteTitle(); ?></span></td>
			  <td width="300" background="images/banner_bg.jpg"></td>
			  <td width="303"><img src="images/banner.jpg"></td>
			</tr>
		  </table>
		</TD>
	</tr>
	
	<tr bgcolor="#E0E0E0">
		<td height="25" colspan="5" valign="middle">
			<table width=100%>
				<tr>
					<?php
						if(empty($user))
						{
							echo '<td align=right>
								<a href="'.$path_to_root.'"><b>Site Home</b></a>
								&nbsp;|&nbsp;
								<a href="index.php"><b>Admin Login</b></a>
								&nbsp;|&nbsp;
								<a href="index.php?page=setup"><b>Database Setup</b></a>
								</td>';
						}
						else
						{
							$logTime = getLastLogin($user);
							$curHour = (int) date("H", time());
							
							if($curHour <= 12)
								$session = "morning";
							elseif($curHour <= 18)
								$session = "afternoon";
							else
								$session = "evening";
								
							echo '<td width=50% align=left>Good '.$session.', <span class="msg">'.$user.'</span>. Last login: <span class="msg">'.$logTime.'</span></td>
								<td width=50% align=right><a href="index.php?page=accounts&account='.$user.'#pass"><b>Change Password</b></a>
									&nbsp;|&nbsp;
									<a href="index.php?page=logout" onClick="return confirmLogout()"><b>Logout</b></a>
									&nbsp;|&nbsp;
									<a href="'.$path_to_root.'"><b>Site Home</b></a>
								</td>';
						}
					?>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td colspan="5" valign="middle" align="left" bgcolor="#C6E3FF">
			<table width="100%" height="50">
				<tr>
					<td valign="middle" align="center" width="60"><img src="images/<?php echo $page; ?>.gif"></td>
					<td valign="middle"><span class="head"><?php echo $title[$page]; ?></span></td>
				</tr>
			</table>
		</td>
	</tr>