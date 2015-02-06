<?php
	include("admin/include/functions.php");
	$user_browser = browser_detection('browser');

	if ( $user_browser == 'msie' )
	{
		$browser = "ie";
	}


	@ connectToDB();
	$var = $HTTP_GET_VARS['q'];
	$page = $HTTP_GET_VARS['page'];

	$action = $HTTP_GET_VARS['action'];
	$NumBanner = getNumBanner();
	$NumLeft = getNumLeft();
	$NumRight = getNumRight();
	$banner_pic = rand(1, $NumBanner);


	$body = array(
					"content" => "content.tpl",
					"contact" => "contact.tpl",
					"search" => "search.tpl",
					"unsub" => "unsub.tpl");

	if($page == "contact")
	{
		$left_pic = 'contact';
		$right_pic = 'contact';
		$fname = $HTTP_POST_VARS['fname'];
		$lname = $HTTP_POST_VARS['lname'];
		$email = $HTTP_POST_VARS['email'];
		$address = $HTTP_POST_VARS['address'];
		$phone = $HTTP_POST_VARS['phone'];
		if(isset($HTTP_POST_VARS['news']))
			$news = "Y";
		else
			$news = "N";
		$feedback = str_replace("\n", "<br>", $HTTP_POST_VARS['feedback']);

		if(isset($HTTP_POST_VARS['send']))
		{
			send_feeback($fname, $lname, $email, $address, $phone, $news, $feedback);
			header("Location: main.php?page=contact&action=sent");
		}
	}

	elseif($page == "unsub")
	{
		$left_pic = 'contact';
		$right_pic = 'contact';
		$email = $HTTP_POST_VARS['email'];

		if(isset($HTTP_POST_VARS['unsub']))
		{
			$link = connectToDB();

			$result = mysql_query('select ContID from contact where email="'.$email.'"');
			$row = mysql_fetch_row($result);

			if(empty($row))
				header("Location: main.php?page=unsub&action=fail");

			else
			{
				unsubcribe($email);
				header("Location: main.php?page=unsub&action=done");
			}
		}
	}

	elseif($page == "search")
	{
		$left_pic = 'search';
		$right_pic = 'search';
		$limit = 10;
		$var = $HTTP_GET_VARS['q'];
		$trimmed = trim($var);
		$trimmed_array = explode(" ",$trimmed);


		if ($trimmed == "")
		{
			$resultmsg =  "Search Error. Please enter a search keyword..." ;
		}

		if (!isset($var))
		{
			$resultmsg =  "<p>Search Error</p><p>We don't seem to have a search parameter! </p>" ;
		}

		foreach ($trimmed_array as $trimm)
		{
			$query = "SELECT * FROM article WHERE ShortTitle LIKE \"%$trimm%\" OR LongTitle LIKE  \"%$trimm%\" OR Content LIKE \"%$trimm%\" GROUP BY ArtID";
			$numresults = mysql_query ($query) or die ( "Couldn't execute query" );
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
	}

	else
	{
		$page = "content";

		if(empty($HTTP_GET_VARS['CatID']))
			$CatID = firstCatID();
		else
			$CatID = $HTTP_GET_VARS['CatID'];

		if(empty($HTTP_GET_VARS['ArtID']))
			$ArtID = firstArtID($CatID);
		else
			$ArtID = $HTTP_GET_VARS['ArtID'];

		$left_pic = 'cat'.$CatID.'/left'. rand(1, $NumLeft);

		while($right_pic1 == $right_pic2)
		{
			$right_pic1 = 'cat'.$CatID.'/right'. rand(1, $NumRight);
			$right_pic2 = 'cat'.$CatID.'/right'. rand(1, $NumRight);
		}
	}

	include('templates/main/header/header.tpl');

	include('templates/main/body/'.$body[$page]);

	include('templates/main/footer/footer.tpl');
?>