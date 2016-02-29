<?php

/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-05-26
 * Email: jostmey@gmail.com
 * Purpose: Perform search of the database and returns the results.
 * License: All rights reserved to 'Jared L. Ostmeyer'.
 */

try
{
	// Filter the callback string for use with JSONP.
	$callback=filter_input(
		INPUT_GET,
		'callback',
		FILTER_SANITIZE_STRING,
		FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH
	);
	// Filter the number of search results.
	if(
		!(
			$id=filter_input(
				INPUT_GET,
				'id',
				FILTER_SANITIZE_NUMBER_INT
			)
		)
	)
		throw new Exception("The parameter 'id' is missing.");

	/**
	 * Fetch the search result from the database.
	 */
	@$database=require '../globals/db.php';

	$command=@$database->prepare("SELECT id, id_vendor, url, title, description, price FROM Items WHERE id=:id");
	$command->execute(array(':id'=>$id));
	$item=$command->fetch();
	if(empty($item))
		throw new Exception('Failed to load item from the database.');
	$command=@$database->prepare("SELECT id, id_item, payment_instructions, country, province, city FROM Vendors WHERE id=:id");
	$command->execute(array(':id'=>$item['id_vendor']));
	$vendor=$command->fetch();
	if(empty($vendor))
		throw new Exception('Failed to load vendor from the database.');
	if($item['id'] !== $vendor['id_item'])
	{
		$command=@$database->prepare("SELECT id, url, title, description, price FROM Items WHERE id=:id");
		$command->execute(array(':id'=>$vendor['id_item']));
		$item_vendor=$command->fetch();
		if(empty($item_vendor))
			throw new Exception('Failed to load item of vendor from the database.');
	}
	else
	{
		$item_vendor=$item;
		unset($item);
	}

	/**
	 * Put together array containing information about the item.
	 */
	if(isset($item))
	{
		$parse_url=parse_url($item['url']);
		// Add in affiliate marketing links.
		if($parse_url['host'] === 'www.bitcoinworldmarket.com')
		{
			if(!strpos($item['url'], '?'))
				$item['url']=$item['url'].'?affiliateid=4';
			else
				$item['url']=$item['url'].'&affiliateid=4';
		}
		$results['item']=array(
			'id'=>$item['id'],
			'domain'=>$parse_url['host'],
			'url'=>'http://api.searchbitcoin.com/services/referral?url='.urlencode($item['url']).'&id='.$item['id'],
			'image'=>'http://api.searchbitcoin.com/services/image/'.$item['id'],
			'title'=>utf8_encode($item['title']),
			'description'=>utf8_encode($item['description']),
			'price'=>$item['price'],
		);
	}

	/**
	 * Put together array containing information about the vendor.
	 */
	$parse_url=parse_url($item_vendor['url']);
	// Add in affiliate marketing links.
	if($parse_url['host'] === 'www.bitcoinworldmarket.com')
	{
		if(!strpos($item_vendor['url'], '?'))
			$item_vendor['url']=$item_vendor['url'].'?affiliateid=4';
		else
			$item_vendor['url']=$item_vendor['url'].'&affiliateid=4';
	}
	$results['vendor']=array(
		'id'=>$item_vendor['id'],
		'vendor'=>$vendor['id'],
		'domain'=>$parse_url['host'],
		'url'=>'http://api.searchbitcoin.com/services/referral?url='.urlencode($item_vendor['url']).'&id='.$item_vendor['id'],
		'image'=>'http://api.searchbitcoin.com/services/image?id='.$item_vendor['id'],
		'title'=>utf8_encode($item_vendor['title']),
		'description'=>utf8_encode($item_vendor['description']),
		'price'=>$item_vendor['price'],
		'payment_instructions'=>$vendor['payment_instructions'],
		'country'=>$vendor['country'],
		'province'=>$vendor['province'],
		'city'=>$vendor['city'],
	);

	/**
	 * Return the results in JSON format.
	 */
	header("Content-Type: application/x-javascript");
	header('Cache-Control: no-cache');
	header('Pragma: no-cache');
	header('Expires: -1');
	// Check if the data needs to be padded, and return the result.
	if(isset($callback))
		echo "$callback(".json_encode($results).");\n";
	else
		echo json_encode($results);
}
catch(Exception $exception)
{
	/**
	 * Print error messages straight on the screen.
	 */
	echo $exception->getMessage();
}

