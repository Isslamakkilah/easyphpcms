<?php
	$month = $HTTP_GET_VARS['month'];
	$year = $HTTP_GET_VARS['year'];

	if(empty($month) && empty($year))
	{
		$month = date("n");
		$year = date("Y");
	}

	if($month == 0)
		$month = 12;

	if($month == 13)
		$month = 1;

	//display the calendar on the page
	function display_calendar($month, $year)

	{
		$curPage = $_SERVER['HTTP_SELF'];

		if($month == 0)
			$month = 12;

		if($month == 13)
			$month = 1;

		echo '<table border=0 cellpadding=0 cellspacing=0 width=160>
				<tr>
					<td colspan=3 bgcolor=#D9D9D9 height=1></td>
				</tr>
				<tr>
					<td bgcolor=#D9D9D9 width=1></td>
					<td bgcolor=#FFFFFF height=5></td>
					<td bgcolor=#D9D9D9 width=1></td>
				</tr>
				<tr>
					<td bgcolor=#D9D9D9 width=1></td>
					<td>
						<table border=0 cellpadding=0 cellspacing=0 width=158>

							<tr>
								<td align=right width=17 height=17>
									<a href="'.$curPage.'?month='.($month-1).'&year='.(($month == 1) ? ($year - 1) : $year).'"><img src="img/arrow_left.gif" border=0 align=absmiddle alt="Last month"></a></td>
								<td align=center width=56 height=17>
									<font style="font-size:11px;"><b>'.$month.'/'.$year.'</b></font></td>
								<td width=17 height=17>
									<a href="'.$curPage.'?month='.($month+1).'&year='.(($month == 12) ? ($year + 1) : $year).'"><img src="img/arrow_right.gif" border=0 align=absmiddle alt="Next month"></a></td>
								<td rowspan=2 width=33 height=18><img src="img/daily_on.gif" style="cursor:hand;" border=0></td>
								<td rowspan=2 width=35 height=18><img src="img/weekly_off.gif" style="cursor:hand;" border=0></td>
							</tr>
							<tr>
								<td colspan=3 height=1 bgcolor=#C1C1C1></td>
							</tr>
						</table>';

		print_calendar($month, $year);

		echo '</td>
					<td bgcolor=#D9D9D9 width=1></td>
				</tr>
				<tr>
						<td bgcolor=#D9D9D9 width=1></td>
						<td bgcolor=#FFFFFF height=10></td>
						<td bgcolor=#D9D9D9 width=1></td>
				</tr>
				<tr>
						<td colspan=3 bgcolor=#D9D9D9 height=1></td>
				</tr>
		</table>';
	}

	//display the calendar of the current date and year with supplied values for month and year
	function print_calendar($month, $year)
	{
		//set current date
		$date = date("j");


		//setup current month
		$cal_month = generate_month_calendar($month, $year);	// get array of month calendar
		$total_week = sizeof($cal_month);


		echo '<table cellpadding=0 cellspacing=0 border=0 width=157>
			  <tr><td colspan=7 height=3></td></tr>
			  <tr><td align=center width=24 height=19><font color=red>S</font></td><td align=center width=22><font color=#4D4D4D>M</font></td><td align=center width=22><font color=#4D4D4D>T</font></td><td align=center width=22><font color=#4D4D4D>W</font></td><td align=center width=22><font color=#4D4D4D>T</font></td><td align=center width=22><font color=#4D4D4D>F</font></td><td align=center width=23><font color=blue>S</font></td></tr>
			  <tr><td colspan=7 height=1 background="img/spot.gif"></td></tr>
			  <tr><td colspan=7 height=4></td></tr>';


		//print the elements of the array of current month
		for($i = 0; $i < $total_week; $i++)
		{
			echo '<tr>';
			for($j = 0; $j < 7; $j++)
			{
				echo '<td align=center>';
				if($cal_month[$i][$j] > 0)
				{
					$InDate = date('Y-m-d', mktime(0, 0, 0, $month, $cal_month[$i][$j], $year));


					if(blogDay($InDate))
						echo '<a href="index.php?Date='.$InDate.'" target="_top"><u>';


					if($cal_month[$i][$j] == $date)
						echo '<span class="date">';


					if($j == 0)
					{
						echo '<font color="red">'.$cal_month[$i][$j].'</font>';
					}
					elseif($j == 6)
					{
						echo '<font color="blue">'.$cal_month[$i][$j].'</font>';
					}
					else
					{
						echo $cal_month[$i][$j];
					}


					if($cal_month[$i][$j] == $date)
						echo '</span>';


					if(blogDay($InDate))
						echo '</u></a>';
				}
				else
					echo '&nbsp;';
				echo '</td>';
			}
			echo '</tr>';
		}
		echo '</table>';
	}


	//create the array of the month of the year
	function generate_month_calendar($month, $year)
	{
		$first_day = mktime(1, 1, 1, $month, 1, $year);		// first day of current month
		$first_day_week = date("w", $first_day);		// set number of a day of week at current month
		$last_day_month = date("t", $first_day);    		// set last day of current month
		$total_block = $first_day_week + $last_day_month;	// number od block (including space in front of 1)
		$total_line = ceil($total_block / 7);			// total line number


		for($week = 0; $week < $total_line; $week++)
		{
			$week_first = $week * 7 + 1;	// temporary day of first week
			$week_last = $week_first + 7;	// temporary day of last week




			$i = 0;
			for($tmp_day = $week_first; $tmp_day < $week_last; $tmp_day++)
			{	// days
				$day = $tmp_day - $first_day_week;




				if($day > 0 && $day <= $last_day_month)


					$array_month[$week][$i] = $day;
				else
					$array_month[$week][$i] = 0;
				$i++;
			}	// end of day in a week
		} // end of week


		return $array_month;
	}

	function blogDay($InDate)
	{
		/* $link = connectToDB();

		$result = mysql_query('select BlogID from blog where Date = "'.$InDate.'"');
		$row = mysql_num_rows($result);

		if($row >= 1)
			return true;
		else
			return false; */
	}



	echo '<html>
		  <head>
		  	<title></title>
			<style type="text/css">@import "css/style.css";</style>
		  </head>
		  <body>
			<table border=0 cellpadding=0 cellspacing=0 width=160>
			<tr>
				<td colspan=3 bgcolor=#D9D9D9 height=1></td>
			</tr>
			<tr>
				<td bgcolor=#D9D9D9 width=1></td>
				<td bgcolor=#FFFFFF height=5></td>
				<td bgcolor=#D9D9D9 width=1></td>
			</tr>
			<tr>
				<td bgcolor=#D9D9D9 width=1></td>
				<td>
					<table border=0 cellpadding=0 cellspacing=0 width=158>

						<tr>
							<td align=right width=17 height=17>
								<a href="calendar.php?month='.($month-1).'&year='.(($month == 1) ? ($year - 1) : $year).'"><img src="images/arrow_left.gif" border=0 align=absmiddle alt="Previous Month"></a></td>
							<td align=center width=56 height=17>
								<font style="font-size:11px;"><b>'.$month.'/'.$year.'</b></font></td>
							<td width=17 height=17>
								<a href="calendar.php?month='.($month+1).'&year='.(($month == 12) ? ($year + 1) : $year).'"><img src="images/arrow_right.gif" border=0 align=absmiddle alt="Next Month"></a></td>
							<td rowspan=2 width=33 height=18><img src="images/daily_on.gif" style="cursor:hand;" border=0></td>
							<td rowspan=2 width=35 height=18><img src="images/weekly_off.gif" style="cursor:hand;" border=0></td>
						</tr>
						<tr>
							<td colspan=3 height=1 bgcolor=#C1C1C1></td>
						</tr>
					</table>';

	print_calendar($month, $year);

	echo '</td>
				<td bgcolor=#D9D9D9 width=1></td>
			</tr>
			<tr>
					<td bgcolor=#D9D9D9 width=1></td>
					<td bgcolor=#FFFFFF height=10></td>
					<td bgcolor=#D9D9D9 width=1></td>
			</tr>
			<tr>
					<td colspan=3 bgcolor=#D9D9D9 height=1></td>
			</tr>
		</table></body></html>';
?>