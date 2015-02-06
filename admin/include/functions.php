<?php

$path_to_root = "./../";

//--------------------------------------------FUNCTIONS FOR DATABASE SETUP PAGE--------------------------------------------

	function getDatabaseInfo()
	{
		include("include/database.php");
		global $username, $password, $host, $database;

		$info = '<span class="sub">'.$database.'@'.$host.'</span>';

		return $info;
	}


	function writeDatabaseInfo($username, $password, $database, $host)
	{
		$file = fopen("include/database.php", "w");

		$values='<?php
		global $username, $password, $host, $database;
		$username = "'.$username.'";
		$password = "'.$password.'";
		$database = "'.$database.'";
		$host = "'. $host.'";
		?>';

		fwrite($file, $values);
		fclose($file);
	}


	function connectToDB()
	{
		include("include/database.php");
		include("admin/include/database.php");
		global $username, $password, $host, $database;

		$link = mysql_connect($host, $username, $password);

		if($link && mysql_select_db($database))
			return $link;
		else
		{
			echo '<html>
					<head>
						<title>DATABASE ERROR</title>
						<style type="text/css">
							<!--
								@import "css/style.css";
							-->
						</style>
					</head>
					<body>
						<table border="1" align="center">
							<tr>
								<td align="center">
									<img src="images/db_error.gif"><br><br>
									<h3>DATABASE ERROR:</h3>
									Could not connect to the MySQL database with supplied agruments.<br>
									  There may be network problems or please check your details and try again.<br>
									  Click the link Database Setup below to connect the web site to your server.<br><br>
									<a href="index.php?page=setup"><b>Database Setup</b></a>
								</td>
							</tr>
						</table>
					</body>
				</html>';
			exit();
			return false;
		}

	}


	function checkExist($table)
	{
		$link = connectToDB();

		$result = mysql_query('describe '.$table);

		if(empty($result))
			return false;
		else
			return true;
	}


	function dropTable($table)
	{
		$link = connectToDB();

		$query = 'DROP TABLE '.$table;
		mysql_query($query);

	}


	function dropDatabase($database)
	{
		$link = connectToDB();

		$query = 'DROP DATABASE '.$database;
		mysql_query($query);

	}


	function createTableAdmin()
	{

		$link = connectToDB();

		mysql_query('CREATE TABLE admin (
				id int(6) NOT NULL PRIMARY KEY auto_increment,
				username varchar(16) NOT NULL,
				password varchar(32) NOT NULL,
				Time int(32) NOT NULL)');

		$crypt_pass = encrypt_pass("admin");

		$result = mysql_query('INSERT INTO admin (id, username, password, Time) values ("1", "admin", "'.$crypt_pass.'", "0")');
	}


	function createTableCategory()
	{
		$link = connectToDB();

		mysql_query('CREATE TABLE category (
				CatID int(6) NOT NULL PRIMARY KEY auto_increment,
				Cat varchar(255) NOT NULL
				)');
		mysql_query('INSERT INTO category (CatID, Cat) values ("1", "Category 1")');
		mysql_query('INSERT INTO category (CatID, Cat) values ("2", "Category 2")');
		mysql_query('INSERT INTO category (CatID, Cat) values ("3", "Category 3")');
		mysql_query('INSERT INTO category (CatID, Cat) values ("4", "Category 4")');
		mysql_query('INSERT INTO category (CatID, Cat) values ("5", "Category 5")');
		mysql_query('INSERT INTO category (CatID, Cat) values ("6", "Category 6")');
	}

	function createTableArticle()
	{
		$link = connectToDB();

		mysql_query('CREATE TABLE article (
				ArtID int(6) NOT NULL PRIMARY KEY auto_increment,
				Author varchar(255) NOT NULL,
				Date date NOT NULL,
				CatID int(6) NOT NULL,
				ShortTitle varchar(255) NOT NULL,
				LongTitle varchar(255) NOT NULL,
				Content text NOT NULL,
				Time int(32) NOT NULL
				)');
	}

	function createTableContact()
	{
		$link = connectToDB();

		mysql_query('CREATE TABLE contact (
				ContID int(16) NOT NULL PRIMARY KEY auto_increment,
				Date date NOT NULL,
				fname varchar(255) NOT NULL,
				lname varchar(255) NOT NULL,
				email varchar(255) NOT NULL,
				address varchar(255) NOT NULL,
				phone varchar(16) NOT NULL,
				news varchar(8) NOT NULL,
				reply varchar(8) NOT NULL,
				feedback text,
				Time int(32) NOT NULL
				)');
	}


	function createTableMail()
	{
		$link = connectToDB();

		mysql_query('CREATE TABLE mail (
				MailID int(6) NOT NULL PRIMARY KEY auto_increment,
				Author varchar(255) NOT NULL,
				Date date NOT NULL,
				Subject varchar(255) NOT NULL,
				Content text NOT NULL,
				Time int(32) NOT NULL
				)');
	}


	function createTableSite()
	{
		$link = connectToDB();

		mysql_query('CREATE TABLE site (
				SiteID int(6) NOT NULL PRIMARY KEY,
				FrontTpl varchar(255) NOT NULL,
				SiteURL varchar(255) NOT NULL,
				SiteTitle varchar(255) NOT NULL,
				Slogan varchar(255) NOT NULL,
				IntroTitle varchar(255) NOT NULL,
				IntroText text NOT NULL,
				OrgTitle varchar(255) NOT NULL,
				OrgURL  varchar(255) NOT NULL,
				OrgCont  varchar(255) NOT NULL,
				OrgDisc  varchar(255) NOT NULL,
				NumBanner int(6) NOT NULL,
				NumLeft int(6) NOT NULL,
				NumRight int(6) NOT NULL
				)');

		mysql_query('INSERT INTO site (SiteID, FrontTpl, SiteURL, SiteTitle, Slogan, IntroTitle, IntroText, OrgTitle, OrgURL, OrgCont, OrgDisc, NumBanner, NumLeft, NumRight) values
			  ("1",
				"business",
				"'.$_SERVER['SERVER_NAME'].'",
				"Website Title",
				"Website Slogan",
				"Welcome Title",
				"Your welcome message is here. Your welcome message is here. Your welcome message is here. Your welcome message is here. Your welcome message is here. Your welcome message is here.",
				"Company Name",
				"www.company.com",
				"www.company.com/contact.html",
				"www.company.com/disclaimer.html",
				"6", "5", "4")');
	}


	function DBSetup()
	{
		if(!checkExist('admin'))
			createTableAdmin();

		if(!checkExist('category'))
			createTableCategory();

		if(!checkExist('article'))
			createTableArticle();

		if(!checkExist('contact'))
			createTableContact();

		if(!checkExist('mail'))
			createTableMail();

		if(!checkExist('site'))
			createTableSite();
	}


//--------------------------------------------FUNCTIONS FOR DISPLAYING INFO----------------------------------------------

	function getNumCats()
	{
		$link = connectToDB();
		$result = mysql_query('select CatID from category');
		if(!empty($result)) $row = mysql_num_rows($result);
		else $row = 0;
		return $row;
	}

	function getNumFlds()
	{
		$link = connectToDB();
		$result = mysql_query('select FieldID from field');
		if(!empty($result)) $row = mysql_num_rows($result);
		else $row = 0;
		return $row;
	}

	function firstCatID()
	{
		$link = connectToDB();
		$result = mysql_query('select CatID from category order by CatID');
		$data = mysql_fetch_row($result);
		return $data[0];
	}


	function firstArtID($CatID)
	{
		$link = connectToDB();
		$result = mysql_query('select ArtID from article where CatID="'.$CatID.'" order by ArtID');
		$data = mysql_fetch_row($result);
		return $data[0];
	}


	function existCat($CatID)
	{
		$link = connectToDB();

		$result = mysql_query('select CatID from category where CatID="'.$CatID.'"');

		if(empty($result))
			return false;
		else
			return true;
	}


	function existArt($ArtID, $CatID)
	{
		$link = connectToDB();

		$result = mysql_query('select ArtID from article where ArtID="'.$ArtID.'" and CatID = "'.$CatID.'"');

		if(empty($result))
			return false;
		else
			return true;
	}


	function catOfArt($ArtID)
	{
		$link = connectToDB();
		$result = mysql_query('select CatID from article where ArtID = "'.$ArtID.'"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}


	function displayMenu($CatID, $ArtID, $browser, $page)
	{
		$ie = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)";
		$ff = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.10) Gecko/20050716 Firefox/1.0.6";

		$link = connectToDB();
		$result1 = mysql_query('select CatID, Cat from category order by CatID');
		$row1 = mysql_num_rows($result1);
		for($i = 1; $i <= $row1; $i++)
		{
			$data1 = mysql_fetch_row($result1);

			$firstPost = firstArtID($data1[0]);

			if(!empty($firstPost))
				$selectArt = ' and ArtID>"'.$firstPost.'"';

			if($browser == "ie")
			{
				echo '<a class="ButtonLink" ';

				if($CatID == $data1[0])
					echo 'style="background: #CCFFFF;" ';

				echo ' href="main.php?page=content&CatID='.$data1[0].'">';

				if($CatID == $data1[0])
					echo '<font color=#FF33CC>';

				echo $data1[1];

				if($CatID == $data1[0])
					echo '</font>';

				echo '</a>';
			}

			else
			{
				echo '<a href="main.php?page=content&CatID='.$data1[0].'"><div class="ButtonLink" ';

				if($CatID != $data1[0])
					echo 'onMouseOver="this.style.backgroundColor=\'#C9C9E4\';" onMouseOut="this.style.backgroundColor=\'#F5F5F5\';" ';

				else
					echo 'style="background: #CCFFFF;"';

				echo '>';

				if($CatID == $data1[0])
					echo '<font color=#FF33CC>';

				echo $data1[1];

				if($CatID == $data1[0])
					echo '</font>';

				echo '</div></a>';
			}

			if(($CatID == $data1[0]) && (!empty($firstPost)))
			{
				$result2 = mysql_query('select ArtID, ShortTitle from article where CatID="'.$data1[0].'"'.$selectArt.' order by ArtID');
				$row2 = mysql_num_rows($result2);

				if(!empty($row2))
				{
					echo '<table width="195" align="center">';

					for($j = 1; $j <= $row2; $j++)
					{
						$data2 = mysql_fetch_row($result2);
						echo '<tr>
							<td width="10" valign="middle" align="center"><img src="images/bullet.gif"></td>
							<td><a href="main.php?page=content&CatID='.$data1[0].'&ArtID='.$data2[0].'">';

						if($ArtID == $data2[0])
							echo '<font color=#F03C00><b>';

						echo stripslashes($data2[1]);

						if($ArtID == $data2[0])
							echo '</font></b>';

						echo '</a></td></tr>';
					}

					echo '</table>';
				}
			}
		}

		if($browser == "ie")
		{
			echo '<a class="ButtonLink" ';

			if($page == contact)
				echo 'style="background: #CCFFFF;" ';

			echo 'href="main.php?page=contact">';

			if($page == contact)
				echo '<font color=#FF33CC> ';

			echo 'Contact Page';

			if($page == contact)
				echo '</font></a>';
		}

		else
		{
			echo '<a href="main.php?page=contact"><div class="ButtonLink" ';

			if($page != contact)
				echo 'onMouseOver="this.style.backgroundColor=\'#C9C9E4\';" onMouseOut="this.style.backgroundColor=\'#F5F5F5\';" ';
			else
				echo 'style="background: #CCFFFF;"';

			echo '>';

			if($page == contact)
				echo '<font color=#FF33CC> ';

			echo 'Contact Page';

			if($page == contact)
				echo '</font>';

			echo '</div></a>';
		}
	}

	function send_feeback($fname, $lname, $email, $address, $phone, $news, $feedback)
	{
		$Date = date("Y-m-d");
		$Time = time();
		$link = connectToDB();
		$result = mysql_query('insert into contact (Date, fname, lname, email, address, phone, news, reply, feedback, Time)
					values ("'.$Date.'", "'.$fname.'", "'.$lname.'", "'.$email.'", "'.$address.'", "'.$phone.'", "'.$news.'", "N", "'.$feedback.'", "'.$Time.'")');

		$Address = $email;
		$Subject = "Your feedback has been received.";
		$Content = file_get_contents("admin/include/subcribe.txt");
		$Extra = "From: webmaster\r\nReply-to: tvudac@utas.edu.au\r\nContent-Type: text/html";

		$sent = @ mail($Address, $Subject, $Content, $Extra);
	}

	function unsubcribe($email)
	{
		$link = connectToDB();
		mysql_query('delete from contact where email="'.$email.'"');

		$Address = $email;
		$Subject = "You have been unsubscribed.";
		$Content = file_get_contents("admin/include/unsubcribe.txt");
		$Extra = "From: webmaster\r\nReply-to: tvudac@utas.edu.au\r\nContent-Type: text/html";

		$sent = @ mail($Address, $Subject, $Content, $Extra);
	}

	function toCatID($Cat)
	{
		$link = connectToDB();
		$result = mysql_query('select CatID from category where Cat = "'.$Cat.'"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}


	function toCat($CatID)
	{
		$link = connectToDB();
		$result = mysql_query('select Cat from category where CatID = "'.$CatID.'"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}

	function toFieldID($Field)
	{
		$link = connectToDB();
		$result = mysql_query('select FieldID from field where Field = "'.$Field.'"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}


	function toField($FieldID)
	{
		$link = connectToDB();
		$result = mysql_query('select Field from field where FieldID = "'.$FieldID.'"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}

	function toLink($ArtID)
	{
		$link = connectToDB();
		$result = mysql_query('select ShortTitle from article where ArtID = "'.$ArtID.'"');
		$data = mysql_fetch_row($result);
		return stripslashes($data[0]);
	}


	function toTitle($ArtID)
	{
		$link = connectToDB();
		$result = mysql_query('select LongTitle from article where ArtID="'.$ArtID.'"');
		$data = mysql_fetch_row($result);
		return stripslashes($data[0]);
	}


	function toContent($ArtID)
	{
		$link = connectToDB();
		$result = mysql_query('select Content from article where ArtID="'.$ArtID.'"');
		$data = mysql_fetch_row($result);
		return stripslashes($data[0]);
	}


	function displayDate($Date)
	{
		$year = substr($Date,0, 4);
		$month = substr($Date, 5, 2);
		$day = substr($Date, -2);
		return date("j M Y", @mktime(0, 0, 0, $month, $day, $year));
	}


	function getUpdate()
	{
		$link = connectToDB();
		$result = mysql_query('select Date from article order by Time desc');
		$data = mysql_fetch_row($result);
		if(!empty($data))
			return displayDate($data[0]);
	}

	function getFrontTpl()
	{
		$link = connectToDB();
		$result = mysql_query('select FrontTpl from site where SiteID="1"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}

	function getSiteURL()
	{
		$link = connectToDB();
		$result = mysql_query('select SiteURL from site where SiteID="1"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}


	function getSiteTitle()
	{
		$link = connectToDB();
		$result = mysql_query('select SiteTitle from site where SiteID="1"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}


	function getSlogan()
	{
		$link = connectToDB();
		$result = mysql_query('select Slogan from site where SiteID="1"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}


	function getIntroTitle()
	{
		$link = connectToDB();
		$result = mysql_query('select IntroTitle from site where SiteID="1"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}


	function getIntroText()
	{
		$link = connectToDB();
		$result = mysql_query('select IntroText from site where SiteID="1"');
		$data = mysql_fetch_row($result);
		return stripslashes($data[0]);
	}


	function getOrgTitle()
	{
		$link = connectToDB();
		$result = mysql_query('select OrgTitle from site where SiteID="1"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}


	function getOrgURL()
	{
		$link = connectToDB();
		$result = mysql_query('select OrgURL from site where SiteID="1"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}


	function getOrgCont()
	{
		$link = connectToDB();
		$result = mysql_query('select OrgCont from site where SiteID="1"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}


	function getOrgDisc()
	{
		$link = connectToDB();
		$result = mysql_query('select OrgDisc from site where SiteID="1"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}


	function getNumFront()
	{
		$link = connectToDB();
		$result = mysql_query('select NumFront from site where SiteID="1"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}


	function getNumBanner()
	{
		$link = connectToDB();
		$result = mysql_query('select NumBanner from site where SiteID="1"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}


	function getNumLeft()
	{
		$link = connectToDB();
		$result = mysql_query('select NumLeft from site where SiteID="1"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}

	function getNumRight()
	{
		$link = connectToDB();
		$result = mysql_query('select NumRight from site where SiteID="1"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}

	function browser_detection( $which_test )
	{
		$browser = '';
		$dom_browser = '';

		$navigator_user_agent = strtolower( $_SERVER['HTTP_USER_AGENT'] );

		if (stristr($navigator_user_agent, "opera"))
		{
			$browser = 'opera';
			$dom_browser = true;
		}

		elseif (stristr($navigator_user_agent, "msie 4"))
		{
			$browser = 'msie4';
			$dom_browser = false;
		}

		elseif (stristr($navigator_user_agent, "msie"))
		{
			$browser = 'msie';
			$dom_browser = true;
		}

		elseif ((stristr($navigator_user_agent, "konqueror")) || (stristr($navigator_user_agent, "safari")))
		{
			$browser = 'safari';
			$dom_browser = true;
		}

		elseif (stristr($navigator_user_agent, "gecko"))
		{
			$browser = 'mozilla';
			$dom_browser = true;
		}

		elseif (stristr($navigator_user_agent, "mozilla/4"))
		{
			$browser = 'ns4';
			$dom_browser = false;
		}

		else
		{
			$dom_browser = false;
			$browser = false;
		}

		if ( $which_test == 'browser' )
		{
			return $browser;
		}
		elseif ( $which_test == 'dom' )
		{
			return $dom_browser;
		}
	}


//--------------------------------------------FUNCTIONS FOR LOGIN PAGE----------------------------------------------


	function encrypt_pass($password)
	{

		$crypt_phrase = 'ThisIsTheEncryptionPhrase';
		return crypt($password, $crypt_phrase);
	}


	function validate_login($username, $password)
	{
		global $message;
		$logged_in = false;

		$link = connectToDB();
		$result = mysql_query('select username, password from admin');
		if(!empty($result)) $row = mysql_num_rows($result);

		for($i = 0; $i < $row; $i++)
		{
			$data = mysql_fetch_row($result);

			//If correct assign the value of userid to the Session variable of userid and goto the home page
			if(($username == $data[0]) && (encrypt_pass($password) == $data[1]))
			{
				$logged_in = true;
				$Time = time();
				$_SESSION['valid_login'] = $Time;
				$_SESSION['valid_user'] = $username;
				header("Location: index.php");
			}
		}

		//If not correct after all, produce error message
		if($logged_in == false)
		{
			header("Location: index.php?err=auth");
		}
	}

	function getLastLogin($username)
	{
		$link = connectToDB();
		$result = mysql_query('select Time from admin where username="'.$username.'"');
		$data = mysql_fetch_row($result);

		if($data[0] == 0)
			$Time = time();
		else
			$Time = $data[0];

		return date("M j, Y, g:i a", $Time);
	}


//--------------------------------------------FUNCTIONS FOR ACCOUNTS AND PASSWORD PAGES----------------------------------------------


	function checkCreateForm($username_cre, $password_cre, $cpassword_cre)
	{
		global $msg1, $msg2, $msg3;

		if(empty($username_cre))
			$msg1 = "Please enter the username";

		if(empty($password_cre))
			$msg2 = "Please enter the password";

		if(empty($cpassword_cre))
			$msg3 = "Please enter the confirmed password";

		if($cpassword_cre != $password_cre)
			$msg3 = "Password and the confirmed password do not match";

		if(empty($msg1) && empty($msg2) && empty($msg3))
			return true;
		else
			return false;
	}

	function checkDeleteForm($username_del, $password_del)
	{
		global $msg4, $msg5;

		if(empty($username_del))
			$msg4 = "Please select a username";

		if(empty($password_del))
			$msg5 = "Please enter the password";

		if(empty($msg4) && empty($msg5))
			return true;
		else
			return false;
	}

	function check_password($username, $password, $act)
	{
		$crypt_pass = encrypt_pass($password);

		$link = connectToDB();

		$result = mysql_query('select password from admin where username = "'.$username.'"');
		$data = mysql_fetch_row($result);

		if ($crypt_pass != $data[0])
		{
			if($act == "del")
				header("Location: index.php?page=accounts&act=del&err=pass#del");

			if($act == "upd")
				header("Location: index.php?page=accounts&act=upd&err=pass#pass");

			return false;
		}
		else
			return true;
	}


	function check_registered($username, $act)
	{
		global $message;

		$link = connectToDB();

		$result = mysql_query('select username from admin');

		if(!empty($result))
			$row = mysql_num_rows($result);

		for($i = 0; $i < $row; $i++)
		{
			$data = mysql_fetch_row($result);

			if ($username == $data[0])
			{
				if($act == "cre")
					header("Location: index.php?page=accounts&act=cre&err=reg#cre");

				return false;
			}
		}
		return true;
	}

	function create_admin($username, $password)
	{
		$crypt_pass = encrypt_pass($password);

		if (check_registered($username, "cre"))
		{
			$link = connectToDB();

			$result = mysql_query('insert into admin (username, password)
						values ("'.$username.'", "'.$crypt_pass.'")');
			header("Location: index.php?page=accounts&act=cre#cre");
		}
	}

	function delete_admin($username, $password)
	{
		if(check_password($username, $password, "del"))
		{
			$link = connectToDB();
			$result = mysql_query('delete from admin where username = "'.$username.'"');
			header("Location: index.php?page=accounts&act=del#del");

			if($username == $_SESSION['valid_user'])
			{
				session_destroy();
				header("Location: index.php");
			}
		}
	}

	function change_password($username, $opassword, $npassword)
	{
		$crypt_pass = encrypt_pass($npassword);

		if(check_password($username, $opassword, "upd"))
		{
			$link = connectToDB();

			$result = mysql_query('update admin set password = "'.$crypt_pass.'" where username = "'.$username.'"');

			header("Location: index.php?page=accounts&act=upd#pass");
		}
	}

	function checkPasswordForm($username, $opassword, $password, $cpassword)
	{
		global $msg6, $msg7, $msg8, $msg9;

		if(empty($username))
			$msg6 = "Please select a username";

		if(empty($opassword))
			$msg7 = "Please enter the old password";

		if(empty($password))
			$msg8 = "Please enter the new password";

		if(empty($cpassword))
			$msg9 = "Please enter the confirmed password";

		if($cpassword != $password)
			$msg9 = "New password and the confirmed password do not match";

		if(empty($msg6) && empty($msg7) && empty($msg8) && empty($msg9))
			return true;
		else
			return false;
	}


//--------------------------------------------FUNCTIONS FOR CONTENT MANAGER PAGE----------------------------------------------

	function check_exist($cat, $act)
	{

		$link = connectToDB();

		$result = mysql_query('select Cat from category');

		if(!empty($result))
			$row = mysql_num_rows($result);

		for($i = 0; $i < $row; $i++)
		{
			$data = mysql_fetch_row($result);

			if ($cat == $data[0])
			{
				if($act == "cre_cat")
					header("Location: index.php?page=content&act=cre_cat&err=reg#cat");

				if($act == "ren_cat")
					header("Location: index.php?page=content&act=ren_cat&err=reg#cat");

				return false;
			}
		}
		return true;
	}

	function create_cat($ncategory)
	{
		if(check_exist($ncategory, "cre_cat"))
		{
			$link = connectToDB();
			$result = mysql_query('insert into category (Cat) values ("'.$ncategory.'")');
			header("Location: index.php?page=content&act=cre_cat#cat");
		}
	}

	function rename_cat($CatID, $rcategory)
	{
		if(check_exist($rcategory, "ren_cat"))
		{
			$Cat = toCat($CatID);
			$link = connectToDB();
			$result = mysql_query('update category set Cat = "'.$rcategory.'" where CatID = "'.$CatID.'"');
			header("Location: index.php?page=content&act=ren_cat#cat");
		}
	}


	function empty_cat($CatID)
	{
		global $message;

		if(getNumArts($CatID) == 0)
			header("Location: index.php?page=content&act=emp_cat&err=null#cat");
		else
		{
			$Cat = toCat($CatID);
			$link = connectToDB();
			$result = mysql_query('delete from article where CatID="'.$CatID.'"');
			header("Location: index.php?page=content&act=emp_cat#cat");
		}
	}


	function delete_cat($CatID)
	{
		global $message;
		$Cat = toCat($CatID);

		$link = connectToDB();
		$result = mysql_query('delete from category where CatID="'.$CatID.'"');
		$result = mysql_query('delete from article where CatID="'.$CatID.'"');
		header("Location: index.php?page=content&act=del1#cat");
	}


	function checkRenameForm($CatID, $rcategory)
	{
		global $msg1, $msg2;

		if(empty($CatID))
			$msg1 = "Please select a category";

		if(empty($rcategory))
			$msg2 = "Please enter the rename category";

		if(empty($msg1) && empty($msg2))
			return true;
		else
			return false;
	}


	function checkEmptyForm($CatID)
	{
		global $msg1;

		if(empty($CatID))
			$msg1 = "Please select a category";

		if(empty($msg1))
			return true;
		else
			return false;
	}


	function checkCreateCatForm($ncategory)
	{
		global $msg3;

		if(empty($ncategory))
			$msg3 = "Please enter a category name";

		if(empty($msg3))
			return true;
		else
			return false;
	}

	function getNumArts($CatID)
	{
		if($CatID > 0)
			$cat = ' where CatID="'.$CatID.'"';

		$link = connectToDB();
		$result = mysql_query('select ArtID from article'.$cat);
		if(!empty($result)) $row = mysql_num_rows($result);
		return $row;
	}

	function checkEdit($CatID, $ShortTitle, $LongTitle, $Content)
	{
		global $message;

		if(!empty($CatID) && !empty($ShortTitle) && !empty($LongTitle) && !empty($Content))
			return true;
		else
		{
			$message = '<img src="images/error.gif">&nbsp;<span class="errormsg">ERROR: Please complete all fields and  try again.</span>';
		}
	}


	function add_article($Author, $Date, $CatID, $ShortTitle, $LongTitle, $Content)
	{
		global $message;
		$Time = time();
		$link = connectToDB();
		mysql_query('insert into article (Author, Date, CatID, ShortTitle, LongTitle, Content, Time) values ("'.$Author.'", "'.$Date.'", "'.$CatID.'", "'.$ShortTitle.'", "'.$LongTitle.'", "'.$Content.'", "'.$Time.'")');
		$message = '<img src="images/check.gif">&nbsp;<span class="message">Your article has been posted. Thank you, <span class="member">'.$Author.'</span>';
	}


	function edit_article($ArtID, $Author, $Date, $CatID, $ShortTitle, $LongTitle, $Content)
	{
		global $message;
		$Time = time();
		$link = connectToDB();
		mysql_query('update article set
				Author = "'.$Author.'",
				Date = "'.$Date.'",
				CatID = "'.$CatID.'",
				ShortTitle = "'.$ShortTitle.'",
				LongTitle = "'.$LongTitle.'",
				Content = "'.$Content.'",
				Time = "'.$Time.'"
				where ArtID = "'.$ArtID.'"');

		$message = '<img src="images/check.gif">&nbsp;<span class="message">Your article has been updated. Thank you, <span class="member">'.$Author.'</span>';

	}


	function displayArticles($ViewCatID, $sortby1, $entries1, $index1, $search)
	{
		global $numPage;

		$sort_select = ' order by '.$sortby1;

		if(empty($search))
		{
			if($ViewCatID != "0")
				$select = ' where CatID="'.$ViewCatID.'"';

			$link = connectToDB();
			$result = mysql_query('select ArtID from article'.$select.$sort_select);

			$row = mysql_num_rows($result);

			if($row == 0)
				echo '<tr height="25" bgcolor="#FFFFFF"><td colspan="6" align="center" valign="middle"><span class="message">There are no articles to display</span></td></tr>';

			else
			{
				if(($row % $entries1) == 0)
					$numPage = $row / $entries1;
				else
					$numPage = floor ($row / $entries1) + 1;

				for($i = 1; $i <= $row; $i++)
				{
					$data = mysql_fetch_row($result);

					if($i >= (($index1 - 1) * $entries1 + 1) && $i <= ($index1 * $entries1))
					{
						$ArtID = $data[0];
						displayArticle($ArtID, $sortby1, $entries1, $index1);
					}
				}
			}
		}

		else
		{
			$var = $search;
			$trimmed = trim($var);
			$trimmed_array = explode(" ",$trimmed);

			if ($trimmed == "")
			{
				$resultmsg =  "<p>Search Error</p><p>Please enter a search keyword...</p>" ;
			}

			if (!isset($var))
			{
				$resultmsg =  "<p>Search Error</p><p>We don't seem to have a search parameter! </p>" ;
			}

			foreach ($trimmed_array as $trimm)
			{
				$query = "SELECT * FROM article WHERE ArtID LIKE \"%$trimm%\" OR CatID LIKE \"%$trimm%\" OR Author LIKE \"%$trimm%\" OR Date LIKE \"%$trimm%\" OR ShortTitle LIKE \"%$trimm%\" OR LongTitle LIKE  \"%$trimm%\" OR Content LIKE \"%$trimm%\" GROUP BY ArtID";

				$numresults = mysql_query($query);
				$row_num_links_main = mysql_num_rows ($numresults);

				$row = mysql_fetch_array ($numresults);

				do
				{
					$adid_array[] = $row[ 'ArtID' ];
				}

				while($row = mysql_fetch_array($numresults));
			}

			$tmparr = array_unique($adid_array);
			$i=0;

			foreach ($tmparr as $v)
			{
				   $newarr[$i] = $v;
				   $i++;
			}

			if(!isset($resultmsg))
  			{
				foreach($newarr as $value)
				{
					$link = connectToDB();
					$query_value = "SELECT * FROM article WHERE ArtID = '$value'";
					$num_value = mysql_query($query_value);
					$row_linkcat= mysql_fetch_array ($num_value);
					$row_num_links= mysql_num_rows ($num_value);
					$ArtID = $row_linkcat['ArtID'];

					if($row_num_links == 0)
						echo '<tr height="25" bgcolor="#FFFFFF"><td colspan="6" align="center" valign="middle"><span class="errormsg">There are no articles matching your search</span></td></tr>';

					else
					{
						for($i = 1; $i <= $row_num_links; $i++)
						{
							if($i >= (($index1 - 1) * $entries1 + 1) && $i <= ($index1 * $entries1))
							{
								displayArticle($ArtID, $sortby1, $entries1, $index1);
							}
						}
					}
				}
			}
		}
	}


	function displayArticle($ArtID, $sortby1, $entries1, $index1)
	{
		$path_to_root = "./../";
		$link = connectToDB();
		$result = mysql_query('select Author, Date, CatID, ShortTitle from article where ArtID = "'.$ArtID.'"');
		$data = mysql_fetch_row($result);

		$Author = $data[0];
		$Date = displayDate($data[1]);
		$Cat = toCat($data[2]);
		$ShortTitle = $data[3];

		$browser = browser_detection('browser');

		if($browser == 'msie')
			$pointer = 'hand';
		else
			$pointer = 'pointer';

		echo '<tr height="30" bgcolor="#FFFFFF">
			<td valign="middle">&nbsp;'.$ArtID.'</td>
			<td valign="middle">&nbsp;'.$Author.'</td>
			<td valign="middle">&nbsp;'.$Date.'</td>
			<td valign="middle">&nbsp;'.$Cat.'</td>
			<td valign="middle">&nbsp;<a href="'.$path_to_root.'main.php?CatID='.$data[2].'&ArtID='.$ArtID.'" target="_blank">'.stripslashes($data[3]).'</a></td>
			<td align="center" valign="middle">
				<table width=100%><tr>
					<td width=50% align=left><img src="images/edit_off.gif" alt="Edit" style="cursor: '.$pointer.'" onClick="return popup_edit(\'popup.php?page=edit&ArtID='.$ArtID.'\')" onMouseOver=this.src="images/edit_on.gif"; onMouseOut=this.src="images/edit_off.gif"></td>
					<td width=50% align=right><img src="images/del_off.gif" alt="Delete" style="cursor: '.$pointer.'" onClick="return confirmDeleteArt(\'index.php?page=content&ViewCatID='.$ViewCatID.'&sortby1='.$sortby1.'&entries1='.$entries1.'&index1='.$index1.'&act=del_art&ArtID='.$ArtID.'\')" onMouseOver=this.src="images/del_on.gif"; onMouseOut=this.src="images/del_off.gif"></td>
				</tr></table>
			</td></tr>';
	}


	function del_article($ArtID)
	{
		$link = connectToDB();
		$result = mysql_query('delete from article where ArtID = "'.$ArtID.'"');
	}




//--------------------------------------------FUNCTIONS FOR FEEDBACK MANAGER PAGE----------------------------------------------

	function getNumSubs()
	{
		$link = connectToDB();
		$result = mysql_query('select ContID from contact where news = "Y"');
		if(!empty($result)) $row = mysql_num_rows($result);
		return $row;
	}

	function displayContacts($sortby1, $entries1, $index1, $search)
	{
		global $numPage1;

		$sort_select = ' order by '.$sortby1;

		if(empty($search))
		{
			$link = connectToDB();
			$result = mysql_query('select ContID from contact'.$sort_select);

			$row = mysql_num_rows($result);

			if($row == 0)
				echo '<tr height="25" bgcolor="#FFFFFF"><td colspan="10" align="center" valign="middle"><span class="message">There are no contacts to display</span></td></tr>';

			else
			{
				if(($row % $entries1) == 0)
					$numPage1 = $row / $entries1;
				else
					$numPage1 = floor ($row / $entries1) + 1;

				for($i = 1; $i <= $row; $i++)
				{
					$data = mysql_fetch_row($result);

					if($i >= (($index1 - 1) * $entries1 + 1) && $i <= ($index1 * $entries1))
					{
						$ContID = $data[0];
						displayContact($ContID, $sortby1, $entries1, $index1);
					}
				}
			}
		}

		else
		{
			$var = $search;
			$trimmed = trim($var);
			$trimmed_array = explode(" ",$trimmed);

			if ($trimmed == "")
			{
				$resultmsg =  "<p>Search Error</p><p>Please enter a search keyword...</p>" ;
			}

			if (!isset($var))
			{
				$resultmsg =  "<p>Search Error</p><p>We don't seem to have a search parameter! </p>" ;
			}

			foreach ($trimmed_array as $trimm)
			{
				$query = "SELECT * FROM contact WHERE ContID LIKE \"%$trimm%\" OR fname LIKE \"%$trimm%\" OR lname LIKE \"%$trimm%\" OR email LIKE \"%$trimm%\" OR address LIKE \"%$trimm%\" OR phone LIKE  \"%$trimm%\" GROUP BY ContID";

				$numresults = mysql_query($query);
				$row_num_links_main = mysql_num_rows ($numresults);

				$row = mysql_fetch_array ($numresults);

				do
				{
					$adid_array[] = $row[ 'ContID' ];
				}

				while($row = mysql_fetch_array($numresults));
			}

			$tmparr = array_unique($adid_array);
			$i=0;

			foreach ($tmparr as $v)
			{
				   $newarr[$i] = $v;
				   $i++;
			}

			if(!isset($resultmsg))
			{
				foreach($newarr as $value)
				{
					$link = connectToDB();
					$query_value = "SELECT * FROM contact WHERE ContID = '$value'";
					$num_value = mysql_query($query_value);
					$row_linkcat= mysql_fetch_array ($num_value);
					$row_num_links= mysql_num_rows ($num_value);
					$ContID = $row_linkcat['ContID'];

					if($row_num_links == 0)
						echo '<tr height="25" bgcolor="#FFFFFF"><td colspan="7" align="center" valign="middle"><span class="errormsg">There are no contacts matching your search</span></td></tr>';

					else
					{
						for($i = 1; $i <= $row_num_links; $i++)
						{
							if($i >= (($index1 - 1) * $entries1 + 1) && $i <= ($index1 * $entries1))
							{
								displayContact($ContID, $ViewCatID, $sortby1, $entries1, $index1);
							}
						}
					}
				}
			}
		}
	}


	function displayContact($ContID, $sortby1, $entries1, $index1)
	{
		$link = connectToDB();
		$result = mysql_query('select fname, lname, email, address, phone from contact where ContID = "'.$ContID.'"');
		$data = mysql_fetch_row($result);
		$fname = $data[0];
		$lname = $data[1];
		$email = '<a href="mailto:'.$data[2].'">'.$data[2].'</a>';
		$address = $data[3];
		$phone =  $data[4];

		$browser = browser_detection('browser');

		if($browser == 'msie')
			$pointer = 'hand';
		else
			$pointer = 'pointer';

		echo '<tr height="30" bgcolor="#FFFFFF">
				<td valign="middle">&nbsp;'.$ContID.'</td>
				<td valign="middle">&nbsp;'.$fname.'</td>
				<td valign="middle">&nbsp;'.$lname.'</td>
				<td valign="middle">&nbsp;'.$email.'</td>
				<td valign="middle">&nbsp;'.$address.'</td>
				<td valign="middle">&nbsp;'.$phone.'</td>
				<td valign="middle" align=center>
					<table width=100%><tr>
						<td width=50% align=left><img src="images/mail_off.gif" alt="Mail" style="cursor: '.$pointer.'" onClick="return popup_mail(\'popup.php?page=mail&ContID='.$ContID.'\')" onMouseOver=this.src="images/mail_on.gif"; onMouseOut=this.src="images/mail_off.gif"></td>
						<td width=50% align=right><img src="images/del_off.gif" alt="Delete" style="cursor: '.$pointer.'" onClick="return confirmDeleteCont(\'index.php?page=feedback&sortby1='.$sortby1.'&entries1='.$entries1.'&index1='.$index1.'&act1=del&ContID='.$ContID.'\')" onMouseOver=this.src="images/del_on.gif"; onMouseOut=this.src="images/del_off.gif"></td></td>
					</tr></table>
				</td></tr>';
	}

	function del_contact($ContID)
	{
		$link = connectToDB();
		$result = mysql_query('delete from contact where ContID = "'.$ContID.'"');
	}


	function checkSend($Subject, $Content)
	{
		global $message;

		if(!empty($Subject) && !empty($Content))
			return true;
		else
		{
			$message = '<img src="images/error.gif">&nbsp;<span class="errormsg">ERROR: Please complete all fields and  try again.</span>';
			return false;
		}
	}

	function checkRecipients()
	{
		global $message;

		$query = 'select ContID from contact where news = "Y"';

		$link = connectToDB();
		mysql_query($query);
		$result = mysql_query($query);
		$row = mysql_fetch_row($result);

		if(!empty($row))
			return true;
		else
		{
			$message = '<img src="images/error.gif">&nbsp;<span class="errormsg">ERROR: There are no subscribers to newsletters. Please try again.</span>';
			return false;
		}
	}

	function checkCompose($Address, $Subject, $Content)
	{
		global $message;

		if(!empty($Address) && !empty($Subject) && !empty($Content))
			return true;
		else
		{
			$message = '<img src="images/error.gif">&nbsp;<span class="errormsg">ERROR: Please complete all fields and  try again.</span>';
		}
	}

	function getAddress($ContID)
	{
		if(empty($ContID))
			return "";

		else
		{
			$link = connectToDB();
			$result = mysql_query('select email from contact where ContID="'.$ContID.'"');
			$data = mysql_fetch_row($result);

			return $data[0];
		}
	}

	function displayNews($sortby2, $entries2, $index2, $search)
	{
		global $numPage2;

		$sort_select = ' order by '.$sortby2;

		if(empty($search))
		{
			$link = connectToDB();
			$result = mysql_query('select MailID from mail'.$sort_select);

			$row = mysql_num_rows($result);

			if($row == 0)
				echo '<tr height="25" bgcolor="#FFFFFF"><td colspan="6" align="center" valign="middle"><span class="message">There are no mails to display</span></td></tr>';

			else
			{
				if(($row % $entries2) == 0)
					$numPage2 = $row / $entries2;
				else
					$numPage2 = floor ($row / $entries2) + 1;

				for($i = 1; $i <= $row; $i++)
				{
					$data = mysql_fetch_row($result);

					if($i >= (($index2 - 1) * $entries2 + 1) && $i <= ($index2 * $entries2))
					{
						$MailID = $data[0];
						displayMail($MailID, $sortby2, $entries2, $index2);
					}
				}
			}
		}

		else
		{
			$var = $search;
			$trimmed = trim($var);
			$trimmed_array = explode(" ",$trimmed);

			if ($trimmed == "")
			{
				$resultmsg =  "<p>Search Error</p><p>Please enter a search keyword...</p>" ;
			}

			if (!isset($var))
			{
				$resultmsg =  "<p>Search Error</p><p>We don't seem to have a search parameter! </p>" ;
			}

			foreach ($trimmed_array as $trimm)
			{
				$query = "SELECT * FROM mail WHERE MailID LIKE \"%$trimm%\" OR Author LIKE \"%$trimm%\" OR Date LIKE \"%$trimm%\" OR Subject LIKE \"%$trimm%\" OR Content LIKE \"%$trimm%\" GROUP BY MailID";

				$numresults = mysql_query($query);
				$row_num_links_main = mysql_num_rows ($numresults);

				$row = mysql_fetch_array ($numresults);

				do
				{
					$adid_array[] = $row[ 'MailID' ];
				}

				while($row = mysql_fetch_array($numresults));
			}

			$tmparr = array_unique($adid_array);
			$i=0;

			foreach ($tmparr as $v)
			{
				   $newarr[$i] = $v;
				   $i++;
			}

			if(!isset($resultmsg))
			{
				foreach($newarr as $value)
				{
					$link = connectToDB();
					$query_value = "SELECT * FROM mail WHERE MailID = '$value'";
					$num_value = mysql_query($query_value);
					$row_linkcat= mysql_fetch_array ($num_value);
					$row_num_links= mysql_num_rows ($num_value);
					$MailID = $row_linkcat['MailID'];

					if($row_num_links == 0)
						echo '<tr height="25" bgcolor="#FFFFFF"><td colspan="7" align="center" valign="middle"><span class="errormsg">There are no newsletter matching your search</span></td></tr>';

					else
					{
						for($i = 1; $i <= $row_num_links; $i++)
						{
							if($i >= (($index2 - 1) * $entries2 + 1) && $i <= ($index2 * $entries2))
							{
								displayMail($MailID, $sortby2, $entries2, $index2);
							}
						}
					}
				}
			}
		}
	}


	function displayMail($MailID, $sortby2, $entries2, $index2)
	{
		$link = connectToDB();
		$result = mysql_query('select Author, Date, Subject from mail where MailID = "'.$MailID.'"');
		$data = mysql_fetch_row($result);

		$Author = $data[0];
		$Date = displayDate($data[1]);

		$Subject = $data[2];

		$browser = browser_detection('browser');

		if($browser == 'msie')
			$pointer = 'hand';
		else
			$pointer = 'pointer';

		echo '<tr height="30" bgcolor="#FFFFFF">
			<td valign="middle">&nbsp;'.$Date.'</td>
			<td valign="middle">&nbsp;'.$Author.'</td>
			<td valign="middle">&nbsp;'.$Subject.'</td>
			<td valign="middle" align="center">
				<table width=100%><tr>
					<td width=50% align=left><img src="images/view_off.gif" alt="View" style="cursor: '.$pointer.'" onClick="return popup_view(\'popup.php?page=view&MailID='.$MailID.'\')" onMouseOver=this.src="images/view_on.gif"; onMouseOut=this.src="images/view_off.gif"></td>
					<td width=50% align=right><img src="images/del_off.gif" alt="Delete" style="cursor: '.$pointer.'" onClick="return confirmDeleteMail(\'index.php?page=feedback&sortby2='.$sortby2.'&entries2='.$entries2.'&index2='.$index2.'&act2=del&MailID='.$MailID.'\')" onMouseOver=this.src="images/del_on.gif"; onMouseOut=this.src="images/del_off.gif"></td>
				</tr></table>
			</td></tr>';
	}

	function displayFeedbacks($sortby3, $entries3, $index3, $show3, $search)
	{
		global $numPage3;

		if($show3 == "new")
			$show_select = 'where reply="N"';

		if($show3 == "rep")
			$show_select = 'where reply="Y"';

		$sort_select = ' order by '.$sortby3;

		if(empty($search))
		{
			$link = connectToDB();
			$result = mysql_query('select ContID from contact '.$show_select.$sort_select);

			$row = mysql_num_rows($result);

			if($row == 0)
				echo '<tr height="25" bgcolor="#FFFFFF"><td colspan="10" align="center" valign="middle"><span class="message">There are no feedbacks to display</span></td></tr>';

			else
			{
				if(($row % $entries3) == 0)
					$numPage3 = $row / $entries3;
				else
					$numPage3 = floor ($row / $entries3) + 1;

				for($i = 1; $i <= $row; $i++)
				{
					$data = mysql_fetch_row($result);

					if($i >= (($index3 - 1) * $entries3 + 1) && $i <= ($index3 * $entries3))
					{
						$ContID = $data[0];
						displayFeedback($ContID, $sortby3, $entries3, $index3, $show3);
					}
				}
			}
		}

		else
		{
			$var = $search;
			$trimmed = trim($var);
			$trimmed_array = explode(" ",$trimmed);

			if ($trimmed == "")
			{
				$resultmsg =  "<p>Search Error</p><p>Please enter a search keyword...</p>" ;
			}

			if (!isset($var))
			{
				$resultmsg =  "<p>Search Error</p><p>We don't seem to have a search parameter! </p>" ;
			}

			foreach ($trimmed_array as $trimm)
			{
				$query = "SELECT * FROM contact WHERE ContID LIKE \"%$trimm%\" OR fname LIKE \"%$trimm%\" OR lname LIKE \"%$trimm%\" OR email LIKE \"%$trimm%\" OR feedback LIKE  \"%$trimm%\" GROUP BY ContID";

				$numresults = mysql_query($query);
				$row_num_links_main = mysql_num_rows ($numresults);

				$row = mysql_fetch_array ($numresults);

				do
				{
					$adid_array[] = $row[ 'ContID' ];
				}

				while($row = mysql_fetch_array($numresults));
			}

			$tmparr = array_unique($adid_array);
			$i=0;

			foreach ($tmparr as $v)
			{
				   $newarr[$i] = $v;
				   $i++;
			}

			if(!isset($resultmsg))
			{
				foreach($newarr as $value)
				{
					$link = connectToDB();
					$query_value = "SELECT * FROM contact WHERE ContID = '$value'";
					$num_value = mysql_query($query_value);
					$row_linkcat= mysql_fetch_array ($num_value);
					$row_num_links= mysql_num_rows ($num_value);
					$ContID = $row_linkcat['ContID'];

					if($row_num_links == 0)
						echo '<tr height="25" bgcolor="#FFFFFF"><td colspan="7" align="center" valign="middle"><span class="errormsg">There are no contacts matching your search</span></td></tr>';

					else
					{
						for($i = 1; $i <= $row_num_links; $i++)
						{
							if($i >= (($index3 - 1) * $entries3 + 1) && $i <= ($index3 * $entries3))
							{
								displayFeedback($ContID, $sortby3, $entries3, $index3, $show3);
							}
						}
					}
				}
			}
		}
	}


	function displayFeedback($ContID, $sortby3, $entries3, $index3, $show3)
	{
		$link = connectToDB();
		$result = mysql_query('select Date, fname, lname, email, news, reply from contact where ContID = "'.$ContID.'"');
		$data = mysql_fetch_row($result);

		$Date = displayDate($data[0]);
		$Name = $data[1].' '.$data[2];
		$Email = '<a href="mailto:'.$data[3].'">'.$data[3].'</a>';

		$browser = browser_detection('browser');

		if($browser == 'msie')
			$pointer = 'hand';
		else
			$pointer = 'pointer';

		echo '<tr height="30" bgcolor="#FFFFFF">';

		echo '<td valign="middle">&nbsp;';
			if($data[5] == "N")
				echo '<b>';
			echo $Date;
			if($data[5] == "N")
				echo '</b>';
		echo '</td>';

		echo '<td valign="middle">&nbsp;';
			if($data[5] == "N")
				echo '<b>';
			echo $Name;
			if($data[5] == "N")
				echo '</b>';
		echo '</td>';

		echo '<td valign="middle">&nbsp;';
			if($data[5] == "N")
				echo '<b>';
			echo $Email;
			if($data[5] == "N")
				echo '</b>';
		echo '</td>';

		echo '<td valign="middle" align="center">&nbsp;';

		if($data[4] == "Y") echo '<img src="images/check.gif">';
		else echo '<img src="images/error.gif">';

		echo'</td>
			<td align="center" valign="middle">
				<table width=100%><tr>
					<td width=50% align=left><img src="images/mail_off.gif" alt="Mail" style="cursor: '.$pointer.'" onClick="return popup_reply(\'popup.php?page=reply&ContID='.$ContID.'\')" onMouseOver=this.src="images/mail_on.gif"; onMouseOut=this.src="images/mail_off.gif"></td>
					<td width=50% align=right><img src="images/del_off.gif" alt="Delete" style="cursor: '.$pointer.'" onClick="return confirmDeleteFbk(\'index.php?page=feedback&sortby3='.$sortby3.'&entries3='.$entries3.'&index3='.$index3.'&show3='.$show3.'&act3=del&ContID='.$ContID.'\')" onMouseOver=this.src="images/del_on.gif"; onMouseOut=this.src="images/del_off.gif"></td>
				</tr></table>
			</td></tr>';
	}

	function send_mail($Author, $Date, $Subject, $Content)
	{
		global $message;
		$Time = time();

		$mail_query = 'select email from contact where news = "Y"';

		$link = connectToDB();
		$result = mysql_query($mail_query);

		while($Email = mysql_fetch_array($result))
		{
			$Address = $Email[0];
			$Extra = "From: $Author\r\nReply-to: tvudac@utas.edu.au\r\nContent-Type: text/html";
			$sent = @ mail($Address, $Subject, $Content, $Extra);
		}

		if($sent == 1)
		{
			mysql_query('insert into mail (Author, Date, Subject, Content, Time) values ("'.$Author.'", "'.$Date.'", "'.$Subject.'", "'.$Content.'", "'.$Time.'")');
			$message = '<img src="images/check.gif">&nbsp;<span class="message">Your message has been sent. Thank you, <span class="member">'.$Author.'</span>';
			return true;
		}

		else
		{
			$message = '<img src="images/error.gif">&nbsp;<span class="errormsg">Your message could not be sent. Please check your server settings and try again.</span>';
			return false;
		}
	}

	function send_message($Address, $Subject, $Content, $Extra)
	{
		global $message;

		$sent = @ mail($Address, $Subject, $Content, $Extra);

		if($sent == 1)
		{
			$message = '<img src="images/check.gif">&nbsp;<span class="message">Your message has been sent. Thank you, <span class="member">'.$Author.'</span>';
			return true;
		}

		else
		{
			$message = '<img src="images/error.gif">&nbsp;<span class="errormsg">Your message could not be sent. Please check your server settings and try again.</span>';
			return false;
		}
	}

	function send_reply($ContID, $Address, $Subject, $Content, $Extra)
	{
		global $message;

		$sent = @ mail($Address, $Subject, $Content, $Extra);

		if($sent == 1)
		{
			$link = connectToDB();
			mysql_query('update contact set reply = "Y" where ContID = "'.$ContID.'"');
			$message = '<img src="images/check.gif">&nbsp;<span class="message">Your reply message has been sent. Thank you, <span class="member">'.$Author.'</span>';
			return true;
		}

		else
		{
			$message = '<img src="images/error.gif">&nbsp;<span class="errormsg">Your message could not be sent. Please check your server settings and try again.</span>';
			return false;
		}
	}

	function del_mail($MailID)
	{
		$link = connectToDB();
		$result = mysql_query('delete from mail where MailID = "'.$MailID.'"');
	}

	function getNumFeedbacks($stat)
	{
		if($stat == "Y")
			$reply = ' and reply="Y"';

		if($stat == "N")
			$reply = ' and reply="N"';

		$link = connectToDB();
		$result = mysql_query('select ContID from contact where feedback != ""'.$reply);

		if(!empty($result))
			$row = mysql_num_rows($result);

		return $row;
	}

	function getEmail($ContID)
	{
		$link = connectToDB();
		$result = mysql_query('select email from contact where ContID="'.$ContID.'"');
		$data = mysql_fetch_row($result);
		return $data[0];
	}



//--------------------------------------------FUNCTIONS FOR SITE MANAGER PAGE----------------------------------------------


	function updateSite($SiteURL, $SiteTitle, $Slogan, $IntroTitle, $IntroText, $OrgTitle, $OrgURL, $OrgCont, $OrgDisc)
	{
		global $message;

		$link = connectToDB();
		mysql_query('update site set
					SiteURL = "'.$SiteURL.'",
					SiteTitle = "'.$SiteTitle.'",
					Slogan = "'.$Slogan.'",
					IntroTitle = "'.$IntroTitle.'",
					IntroText = "'.$IntroText.'",
					OrgTitle = "'.$OrgTitle.'",
					OrgURL = "'.$OrgURL.'",
					OrgCont = "'.$OrgCont.'",
					OrgDisc = "'.$OrgDisc.'"
				where SiteID = "1"');

		header("Location: index.php?page=site&act=upd_site#site");
	}


	function changeGraphics($front, $banner, $left, $right)
	{
		global $message;

		$link = connectToDB();
		mysql_query('update site set
					NumFront = "'.$front.'",
					NumBanner = "'.$banner.'",
					NumLeft = "'.$left.'",
					NumRight = "'.$right.'"
				where SiteID = "1"');

		header("Location: index.php?page=site&act=upd_grap#grap");
	}

//--------------------------------------------FUNCTIONS FOR OTHER FEATURES----------------------------------------------

	function pageIndex($page, $ViewCatID, $numPage, $sortby, $entries, $index, $order, $part)
	{
		$curPage = $_SERVER['HTTP_SELF'].'?page='.$page;
		$pageRange = 5;

		if(isset($ViewCatID))
			$cat = '&ViewCatID='.$ViewCatID;

		$sort = '&sortby'.$order.'='.$sortby;
		$entry = '&entries'.$order.'='.$entries;

		echo '<table width="100%"><tr>';

		if($numPage > 0)
		{
			//Print First
			echo '<td width="5%">&nbsp;</td>';
			echo '<td  width="5%" align=left>';
			if($numPage > 1)
			{
				if($index == 1)
					echo '&nbsp;<b>First</b>&nbsp;';
				else
					echo '&nbsp;<a href="'.$curPage.$cat.$sort.$entry.'&index'.$order.'=1#'.$part.'">First</a>';
			}
			echo '<td>';

			//Calculate current step
			if($index % $pageRange == 0)
				$step = ($index / $pageRange) - 1;
			else
				$step = floor($index / $pageRange);

			//Print Previous Pages
			echo '<td width="20%" align=center>';
			if($step > 0)
			{
				echo '<a href="'.$curPage.$cat.$sort.$entry.'&index'.$order.'='.(($step - 1) * $pageRange + 1).'#'.$part.'">Previous '.$pageRange.' Pages</a>';
			}
			echo '</td>';

			echo '<td width="5%" align="center">';

			if($index > 1)
				echo '<a href="'.$curPage.$cat.$sort.$entry.'&index'.$order.'='.($index - 1).'#'.$part.'">';

			echo'<img src="images/arrow_l.gif" border=0 alt="Previous">';

			if($index < $numPage)
				echo '</a>';

			echo '</td>';

			//Print indexes of current step
			echo '<td width="30%" align=center>';
			for($i = 1; $i <= $pageRange; $i++)
			{
				$pageIndex = $step * $pageRange + $i;

				if($pageIndex <= $numPage)
				{
					if($pageIndex == $index)

						echo '&nbsp;&nbsp;<b>'.$pageIndex.'</b>&nbsp;&nbsp;';
					else
						echo '&nbsp;&nbsp;<a href="'.$curPage.$cat.$sort.$entry.'&index'.$order.'='.$pageIndex.'#'.$part.'">['.$pageIndex.']</a>&nbsp;&nbsp;';
				}
			}
			echo '</td>';

			echo '<td width="5%" align="center">';

			if($index < $numPage)
				echo '<a href="'.$curPage.$cat.$sort.$entry.'&index'.$order.'='.($index + 1).'#'.$part.'">';

			echo'<img src="images/arrow_r.gif" border=0 alt="Next">';

			if($index < $numPage)
				echo '</a>';

			echo '</td>';

			//Print Next Pages
			echo '<td width="20%" align=center>';

			if($step < floor($numPage / $pageRange))
			{
				if($numPage >= (($step + 2) * $pageRange))
				{
					$Next = $pageRange;
					$nextPages = 'Next '.$Next.' Pages';
				}
				elseif(($numPage - (($step + 1) * $pageRange)) > 0)
				{
					$Next = $numPage - (($step + 1) * $pageRange);
					$nextPages = 'Next '.$Next.' Page'.(($Next > 1) ? 's' : '');
				}
				else
					$nextPages = '';

				if($Next > 1)
					echo '<a href="'.$curPage.$cat.$sort.$entry.'&index'.$order.'='.(($step + 1) * $pageRange + 1).'#'.$part.'">'.$nextPages.'</a>';
			}
			echo '</td>';

			//Print Last
			echo '<td  width="5%" align=right>';
			if($numPage > 1)
			{
				if($index == $numPage)
					echo '&nbsp;<b>Last</b>&nbsp;';
				else
					echo '&nbsp;<a href="'.$curPage.$cat.$sort.$entry.'&index'.$order.'='.$numPage.'#'.$part.'">Last</a>';
			}
			echo '<td>';
			echo '<td width="5%">&nbsp;</td>';
		}

		echo '</td></tr></table>';
	}

?>