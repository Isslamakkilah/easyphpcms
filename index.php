<?php
	include("admin/include/functions.php");

	if($HTTP_GET_VARS['page'] == "setup")
		header("Location: admin/index.php?page=setup");
	else
		include("templates/front/".getFrontTpl()."/front.tpl");
?>