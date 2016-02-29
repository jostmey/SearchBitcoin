<?php

/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-03-14
 * Email: jostmey@gmail.com
 * Purpose: Handle jsonp requests to get the latests items from the queue.
 * License: All rights reserved to 'Jared L. Ostmeyer'.
 */

/**
 * Defines
 */
define('BASE_PATH', dirname(__FILE__).'/..');

/**
 * @var PDO $database
 * @var string $fetch_until determines how far in advance to fetch items in the queue.
 * @var string $fetch_past determines how far back to initiall grab items in the queue. This value only
 *	matters for the first JSONP call.
 */
$database=require BASE_PATH.'/globals/db.php';
$fetch_until='60 SECOND';
$fetch_past='30 SECOND';

try
{
	/**
	 * Tell the browser this is a javascript file and that it should not be cached.
	 */
	header("Content-Type: application/x-javascript");
	header('Cache-Control: no-cache');
	header('Pragma: no-cache');
	header('Expires: -1');

	/**
	 * Validate the parameters being passed through the URL.
	 */
	$old_time=filter_input(INPUT_GET, 'timestamp', FILTER_VALIDATE_INT);
	$callback=filter_input(INPUT_GET, 'callback', FILTER_SANITIZE_STRING);
	if($old_time === false || $old_time === null || $callback === false || $callback === null)
		throw new Exception("Invalid GET/POST data.");

	/**
	 * Timestamps are used to determine which items in the queue have been sent off to the client-side
	 * scripts. If the timestamp of the last item fetched from the queue is not set then set the timestamp
	 * to a value slightly in the past. Also, query the database to get the next timestamp that imposes
	 * an upper-limit on the items to fetch from the queue.
	 */
	if($old_time == -1)
		$old_time=$database->query("SELECT UNIX_TIMESTAMP(NOW() - INTERVAL $fetch_past)")->fetchColumn();
	$new_time=$database->query("SELECT UNIX_TIMESTAMP(NOW() + INTERVAL $fetch_until)")->fetchColumn();

	/**
	 * Retrieve items from the database between the times $old_time and $new_time.
	 */
	$rows=$database->query(
		"SELECT UNIX_TIMESTAMP(time)-UNIX_TIMESTAMP(), product_id, vendor_id, url, title, description, image, price ".
		"FROM QueueItems WHERE time >= FROM_UNIXTIME($old_time) AND time < FROM_UNIXTIME($new_time) ".
		"ORDER BY time ASC"
	);

	/**
	 * Store the results from the database in an array.
	 */
	$items=array();
	if($rows)
		foreach($rows as $row)
		{
			extract($row);
			$domain=parse_url($url);
			$domain=$domain['host'];
			$marketing='none';
			if($domain === 'www.bitcoinworldmarket.com')
			{
				if(!strpos($url, '?'))
					$url=$url.'?affiliateid=4';
				else
					$url=$url.'&affiliateid=4';
				$marketing='affiliate';
			}
			$items[]=array(
				'id'=>$product_id,
				'domain'=>$domain,
				'title'=>utf8_encode($title),
				'description'=>utf8_encode($description),
				'url'=>'http://api.searchbitcoin.com/services/referral?url='.urlencode($url).'&id='.$product_id,
				'image'=>'http://api.searchbitcoin.com/services/image/'.$product_id,
				'price'=>$price,
				'review'=>'http://www.searchbitcoin.com/vendors/review?id='.$vendor_id,
				'marketing'=>$marketing,
				'dt'=>$row[0],
			);
		}

	/**
	 * Encode the information in JSONP format.
	 */
	$json=json_encode(
		array(
			'timestamp'=>$new_time,
			'items'=>$items,
		)
	);
	echo "$callback($json);\n";
}
catch(Exception $exception)
{
	/**
	 * Print error messages straight on the screen.
	 */
	echo $exception->getMessage();
}

