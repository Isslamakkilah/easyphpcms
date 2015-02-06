<?php
	include("include/functions.php");
	session_start();
	$user = $_SESSION['valid_user'];
	$pic_num = rand(1, 3);
	$path_to_root = "./../";
	$browser = browser_detection('browser');

	if($browser == 'msie')
		$pointer = 'hand';
	else
		$pointer = 'pointer';

	$title = array(
						"setup" => "Database Setup",
						"login" => "Administrator - Login",
						"home" => "Administrator - Home",
						"content" => "Content Manager",
						"feedback" => "Feedback Manager",
						"site" => "Site Options",
						"accounts" => "Administrator - Accounts"
					);
	global $stat1, $stat2, $stat3 , $browser_msg, $msg1, $msg2, $msg3, $msg4, $msg5, $msg6, $msg7, $msg8, $msg9;
	$act = $HTTP_GET_VARS['act'];
	$err = $HTTP_GET_VARS['err'];
	$page = $HTTP_GET_VARS['page'];
	$account = $HTTP_GET_VARS['account'];

	if(empty($_SESSION['valid_user']))
	{
		if($page == "setup")
			include("templates/setup.tpl");

		else
		{
			connectToDB();
			$page = "login";
			include("templates/login.tpl");
		}
	}

	else
	{
		if(($page == "content") || ($page == "feedback") || ($page == "site") || ($page == "accounts"))
			include("templates/main.tpl");

		elseif($page == "logout")
		{
			$link = connectToDB();
			$Time = $_SESSION['valid_login'];
			$result = mysql_query('update admin set Time="'.$Time.'" where username="'.$user.'"');
			session_destroy();
			header("Location: index.php");
		}

		else
		{
			$page = "home";
			include("templates/main.tpl");
		}
	}
?>