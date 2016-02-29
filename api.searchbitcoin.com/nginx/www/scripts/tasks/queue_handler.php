<?php

/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-03-14
 * Email: jostmey@gmail.com
 * Purpose: Script generates for the queue and then removes items from the queue that have expired.
 * License: All rights reserved to 'Jared L. Ostmeyer'.
 */

/**
 * Defines
 */
define('BASE_PATH', dirname(__FILE__).'/..');

/**
 * @var PDO $database
 * @var string $generate_until determines how far in advance to fill the queue.
 * @var string $expire_after determines how long to keep items that have passed through the queue.
 * @var integer $query_limit determines the number of items to add in the queue during each query (sets the multiple of
 *	items that are added to the queue at once).
 */
$database=require BASE_PATH.'/globals/db.php';
$generate_until='18 MINUTE';
$expire_after='8 MINUTE';

try
{
	/**
	 * Get the range of time ($min_time to $max_time) that needs to be filled with items in the queue.
	 */
	$last_time=$database->query(
		"SELECT UNIX_TIMESTAMP(MAX(time)) FROM QueueItems"
	)->fetchColumn();
	$cur_time=$database->query(
		"SELECT UNIX_TIMESTAMP()"
	)->fetchColumn();
	$min_time=(!$last_time || $cur_time > $last_time) ? $cur_time : $last_time;
	$max_time=$database->query(
		"SELECT UNIX_TIMESTAMP(NOW() + INTERVAL $generate_until)"
	)->fetchColumn();

	/**
	 * Populate the queue over the range of time ($min_time to $max_time) with items from the database.
	 */
	$cur_time=$min_time+rand(3,6);
	while($cur_time <= $max_time)
	{
		$items=$database->query(
			"SELECT id, id_vendor, title, description, url, image, price ".
			"FROM Items ".
			"WHERE status='active' AND ( ( SELECT MAX(priority) FROM Items ) * RAND() ) <= priority ".
			"ORDER BY RAND()"
		);
		foreach($items as $item)
		{
			extract($item);
			$database->prepare(
				"INSERT INTO QueueItems ".
				"( product_id, vendor_id, url, title, description, image, price, time ) ".
				"VALUES ".
				"( :product_id, :vendor_id, :url, :title, :description, :image, :price, FROM_UNIXTIME( :time ) )"
			)->execute(
				array(
					':product_id'=>$id,
					':vendor_id'=>$id_vendor,
					':url'=>$url,
					':title'=>$title,
					':description'=>$description,
					':image'=>$image,
					':price'=>$price,
					':time'=>$cur_time,
				)
			);
			$cur_time+=rand(3,6);
		}
	}

	/**
	 * Remove items from the queue that have expired.
	 */
	$database->exec(
		"DELETE FROM QueueItems WHERE ".
		"time < NOW() - INTERVAL $expire_after"
	);
}
catch(Exception $exception)
{
	echo $exception->getMessage()."\n";
}

