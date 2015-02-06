<?php
	include("include/functions.php");

	session_start();
	$topic = $HTTP_GET_VARS['topic'];

	if(empty($HTTP_SESSION_VARS['valid_user']))
		include("templates/popups/authen.tpl");
	else
		include("templates/help/$topic.tpl");
?>