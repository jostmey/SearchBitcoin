<?php

/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-05-26
 * Email: jostmey@gmail.com
 * Purpose: Perform search of the database and returns the results.
 * License: All rights reserved to 'Jared L. Ostmeyer'.
 */

/**
 * Defines
 */
define('BASE_PATH', dirname(__FILE__).'/..');

try
{
	/**
	 * Filter the parameters passed through the URL.
	 */
	// Filter the query string.
	if(
		!(
			$query=filter_input(
				INPUT_GET,
				'query',
				FILTER_SANITIZE_STRING,
				FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH
			)
		)
	)
		$query='Hello World';
	// Filter the number of search results.
	if(
		!(
			$number=filter_input(
				INPUT_GET,
				'number',
				FILTER_SANITIZE_NUMBER_INT
			)
		)
	)
		$number=10;
	$number=$number > 15 ? 15 : $number;
	$number=$number < 1 ? 1 : $number;
	// Filter the offset of search results.
	if(
		!(
			$page=filter_input(
				INPUT_GET,
				'page',
				FILTER_SANITIZE_NUMBER_INT
			)
		)
	)
		$page=0;
	$offset=$page*$number;
	// Filter variable indicating if exact matches are required.
	if(
		!(
			$exact=filter_input(
				INPUT_GET,
				'exact',
				FILTER_VALIDATE_BOOLEAN
			)
		)
	)
		$exact=false;
	// Filter the query string.
	if(
		!(
			$order=filter_input(
				INPUT_GET,
				'order',
				FILTER_SANITIZE_STRING,
				FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH
			)
		)
	)
		$order='forward';
	// Filter the format of the result to return.
	if(
		!(
			$format=filter_input(
				INPUT_GET,
				'format',
				FILTER_SANITIZE_STRING,
				FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH
			)
		)
	)
		$format='json';
	// Filter the callback string for use with JSONP.
	$callback=filter_input(
		INPUT_GET,
		'callback',
		FILTER_SANITIZE_STRING,
		FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH
	);
	// Filter variable indicating if debug mode is on.
	if(
		!(
			$debug=filter_input(
				INPUT_GET,
				'debug',
				FILTER_VALIDATE_BOOLEAN
			)
		)
	)
		$debug=false;

	/**
	 * Fetch the search result from the database.
	 */
	@$database=require BASE_PATH.'/globals/db.php';
	$command=$database->prepare(
		"SELECT id, id_vendor, title, description, url, image, price FROM Items ".
		"WHERE status='active' AND MATCH ( title, description, url ) AGAINST ( :query ) ".
		"LIMIT $offset, $number"
	);
	$command->execute(array(':query'=>$query));
	$rows=$command->fetchAll();

	/**
	 * Add in random search results to fill the quota if necessary.
	 */
	if(!$exact && $page == 0 && count($rows) < $number)
	{
		$limit=$number-count($rows);
		$rows=array_merge(
			$rows,
			$database->query(
				"SELECT id, id_vendor, title, description, url, image, price FROM Items ".
				"WHERE status='active' AND ( ( SELECT MAX(priority) FROM Items ) * RAND() ) <= priority ".
				"ORDER BY RAND() LIMIT $limit"
			)->fetchAll()
		);
	}

	/**
	 * Store the results from the database in an array.
	 */
	$items=array();
	if($rows)
		foreach($rows as $row)
		{
			$parse_url=parse_url($row['url']);
			// Add in affiliate marketing links.
			$marketing='none';
			if($parse_url['host'] === 'www.bitcoinworldmarket.com')
			{
				if(!strpos($row['url'], '?'))
					$row['url']=$row['url'].'?affiliateid=4';
				else
					$row['url']=$row['url'].'&affiliateid=4';
				$marketing='affiliate';
			}
			// Add result to array holding all the search results.
			$items[]=array(
				'id'=>$row['id'],
				'id_vendor'=>$row['id_vendor'],
				'domain'=>$parse_url['host'],
				'title'=>utf8_encode($row['title']),
				'description'=>utf8_encode($row['description']),
				'url'=>'http://api.searchbitcoin.com/services/referral?url='.urlencode($row['url']).'&id='.$row['id'],
				'image'=>'http://api.searchbitcoin.com/services/image/'.$row['id'],
				'price'=>$row['price'],
				'review'=>'http://www.searchbitcoin.com/vendors/review?id='.$row['id_vendor'],
				'marketing'=>$marketing,
			);
		}

	/**
	 * Adjust the ordering of the search results if needed.
	 */
	switch($order)
	{
		case 'forward':
			// Do nothing.
			break;
		case 'reverse':
			$items=array_reverse($items);
			break;
		case 'random':
			shuffle($items);
			break;
		default:
			throw new Exception("Invalid arguement for 'order' parameter.");
	}

	/**
	 * Return the result in the requested format.
	 */
	$results=array('items'=>$items);
	switch($format)
	{
		case 'json':
			// Give the proper HTTP header requests.
			header("Content-Type: application/x-javascript");
			header('Cache-Control: no-cache');
			header('Pragma: no-cache');
			header('Expires: -1');
			// Check if the data needs to be padded, and return the result.
			if(isset($callback))
				echo "$callback(".json_encode($results).");\n";
			else
				echo json_encode($results);
		break;
		case 'html':
			?><!DOCTYPE html>
				<html><head></head><body><table border="1"><tbody>
				<?php foreach($items as $item) { ?>
					<tr>
						<td><a href="<?php echo $item['url']; ?>"><?php echo $item['title']; ?></a></td>
						<td><?php echo $item['description']; ?></td>
						<td><img src="<?php echo $item['image']; ?>" height="50px" widht="50px" /></td>
						<td><?php echo $item['price']; ?></td>
						<td><a href="<?php echo $item['review']; ?>">Review</a></td>
						<td><?php echo $item['marketing']; ?></td>
					</tr>
				<?php } ?>
				</tbody></table></body></html>
			<?php
		break;
		default:
			throw new Exception("The data format requested is not currently supported.");
	}

	/**
	 * Now save the search query to the database for analytics.
	 */
	if(!$debug && $offset == 0)
		@$database->prepare(
			"INSERT INTO FeedbackQueries ".
			"( query, referrer, ip_client, created ) ".
			"VALUES ".
			"( :query, :referrer, :ip_client, NOW() )"
		)->execute(
			array(
				':query'=>substr($query, 0, 255),
				':referrer'=>$_SERVER['HTTP_REFERER'],
				':ip_client'=>$_SERVER['REMOTE_ADDR'],
			)
		);
}
catch(Exception $exception)
{
	/**
	 * Print error messages straight on the screen.
	 */
	echo $exception->getMessage();
}

