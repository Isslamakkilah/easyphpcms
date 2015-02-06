<?php
	include("include/functions.php");
	$done = false;
	$browser = browser_detection('browser');

	session_start();
	global $message;
	$page = $HTTP_GET_VARS['page'];

	if(empty($HTTP_SESSION_VARS['valid_user']))
		include("templates/popups/authen.tpl");

	else
	{
		if($page == "add")
		{
			$action = "popup.php?page=add";
			$ArtID = $HTTP_GET_VARS['ArtID'];
			$Author = $HTTP_SESSION_VARS['valid_user'];
			$Date = date("Y-m-d");
			$CatID = $HTTP_POST_VARS['CatID'];
			$ShortTitle = $HTTP_POST_VARS['ShortTitle'];
			$LongTitle = $HTTP_POST_VARS['LongTitle'];
			$Content = $HTTP_POST_VARS['Content'];

			if(isset($HTTP_POST_VARS['edit']))
			{
				if(checkEdit($CatID, $ShortTitle, $LongTitle, $Content))
				{
					add_article($Author, $Date, $CatID, $ShortTitle, $LongTitle, $Content);
					$done = true;
				}
			}

			include("templates/popups/edit.tpl");
		}


		if($page == "edit")
		{
			$ArtID = $HTTP_GET_VARS['ArtID'];
			$action = "popup.php?page=edit&ArtID=$ArtID";
			$Date = date("Y-m-d");
			$Author = $HTTP_POST_VARS['Author'];
			$CatID = $HTTP_POST_VARS['CatID'];
			$ShortTitle = $HTTP_POST_VARS['ShortTitle'];
			$LongTitle = $HTTP_POST_VARS['LongTitle'];
			$Content = $HTTP_POST_VARS['Content'];

			if(isset($HTTP_POST_VARS['edit']))
			{
				if(checkEdit($CatID, $ShortTitle, $LongTitle, $Content))
				{
					edit_article($ArtID, $Author, $Date, $CatID, $ShortTitle, $LongTitle, $Content);
					$done = true;
				}
			}

			else
			{

				$link = connectToDB();
				$result = mysql_query('select Author, CatID, ShortTitle, LongTitle, Content from article where ArtID="'.$ArtID.'"');
				$data = mysql_fetch_row($result);
				$Author = $data[0];
				$CatID = $data[1];
				$ShortTitle = $data[2];
				$LongTitle = $data[3];
				$Content = $data[4];
			}

			include("templates/popups/edit.tpl");
		}


		if($page == "mail")
		{
			$Author = $HTTP_SESSION_VARS['valid_user'];
			$Date = date("Y-m-d");
			$ContID = $HTTP_GET_VARS['ContID'];

			if(isset($HTTP_POST_VARS['send']))
			{
				$Address = $HTTP_POST_VARS['Address'];
				$Subject = $HTTP_POST_VARS['Subject'];
				$Content = $HTTP_POST_VARS['Content'];
				$Message = stripslashes($Content);
				$Extra = "From: $Author\r\nReply-to: tvudac@utas.edu.au\r\nContent-Type: text/html";

				if(checkCompose($Address, $Subject, $Content))
				{
					if(send_message($Address, $Subject, $Message, $Extra))
						$done = true;
				}
			}

			else
				$Address = getAddress($ContID);

			include("templates/popups/mail.tpl");
		}


		if($page == "reply")
		{
			$Author = $HTTP_SESSION_VARS['valid_user'];
			$Date = date("Y-m-d");
			$ContID = $HTTP_GET_VARS['ContID'];
			$link = connectToDB();
			$result = mysql_query('select fname, lname, email, feedback from contact where ContID="'.$ContID.'"');
			$data = mysql_fetch_row($result);
			$Address = $data[2];
			$Name = $data[0].'&nbsp;'.$data[1];
			$From = '<a href="mailto:'.$Address.'">'.$Address.'</a>';
			$Feedback = $data[3];

			if(isset($HTTP_POST_VARS['send']))
			{
				$Address = $HTTP_POST_VARS['Address'];
				$Subject = $HTTP_POST_VARS['Subject'];
				$Content = $HTTP_POST_VARS['Content'];
				$Message = stripslashes($Content);

				$Extra = "From: $Author\r\nReply-to: tvudac@utas.edu.au\r\nContent-Type: text/html";

				if(checkCompose($Address, $Subject, $Content))
				{
					if(send_reply($ContID, $Address, $Subject, $Message, $Extra))
						$done = true;
				}
			}

			else
			{
				$Address = $data[2];
				$Subject = 'Re: Your feedback at '.getSiteTitle().' Website';
			}

			include("templates/popups/reply.tpl");
		}


		if($page == "send")
		{
			$Author = $HTTP_SESSION_VARS['valid_user'];
			$Date = date("Y-m-d");

			if(isset($HTTP_POST_VARS['send']))
			{
				$Subject = $HTTP_POST_VARS['Subject'];
				$Content = $HTTP_POST_VARS['Content'];
				$Message = stripslashes($Content);

				if(checkSend($Subject, $Content) && checkRecipients())
				{
					if(send_mail($Author, $Date, $Subject, $Message))
						$done = true;
				}
			}

			include("templates/popups/send.tpl");
		}


		if($page == "view")
		{
			$MailID = $HTTP_GET_VARS['MailID'];
			$link = connectToDB();
			$result = mysql_query('select Author, Date, Subject, Content from mail where MailID="'.$MailID.'"');
			$data = mysql_fetch_row($result);
			$Author = $data[0];
			$Date = displayDate($data[1]);
			$Subject = $data[2];
			$Content = $data[3];

			include("templates/popups/view.tpl");
		}
	}
?>