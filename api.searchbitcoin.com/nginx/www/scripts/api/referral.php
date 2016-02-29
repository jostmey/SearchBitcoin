<?php

/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-03-14
 * Email: jostmey@gmail.com
 * Purpose: Redirect URLs.
 * License: All rights reserved to 'Jared L. Ostmeyer'.
 */

/**
 * Defines
 */
define('BASE_PATH', dirname(__FILE__).'/..');

// Attempt to redirect the request.
$url=filter_input(INPUT_GET, 'url', FILTER_VALIDATE_URL);
if($url)
{
	header("HTTP/1.1 302 Found");
	header("Location: $url");
}
else
	header("HTTP/1.1 404 Not Found");

// Store the request in the database.
$id=filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
if(is_numeric($id) && $id >= 1)
{
	@$database=require BASE_PATH.'/globals/db.php';
	@$database->prepare(
		"INSERT INTO FeedbackReferrals ".
		"( id_item, referrer, ip_client, created ) ".
		"VALUES ".
		"( :id_item, :referrer, :ip_client, NOW() )"
	)->execute(
		array(
			':id_item'=>$id,
			':referrer'=>$_SERVER['HTTP_REFERER'],
			':ip_client'=>$_SERVER['REMOTE_ADDR'],
		)
	);
}

