<?php

/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-07-30
 * Email: jostmey@gmail.com
 * Purpose: List information about vendor, and allow readers to leave a review.
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
	if(
		!(
			$id=filter_input(
				INPUT_GET,
				'id',
				FILTER_SANITIZE_NUMBER_INT
			)
		)
	)
		throw new Exception('Vendor ID is missing or invalid.');

	/**
	 * Fetch the search result from the database.
	 */
	@$database=require BASE_PATH.'/globals/db.php';
	$command=@$database->prepare("SELECT id_item, bitcoin_address, payment_instructions, country, province, city FROM Vendors WHERE id=:id");
	$command->execute(array(':id'=>$id));
	$vendor=$command->fetch();
	if(empty($vendor) || !isset($vendor['id_item']))
		throw new Exception('Failed to load vendor from database.');
	$command=@$database->prepare("SELECT id, url, title, description FROM Items WHERE id=:id");
	$command->execute(array(':id'=>$vendor['id_item']));
	$item=$command->fetch();
	if(empty($item) || !isset($item['id']))
		throw new Exception('Failed to load item from database.');

	/**
	 * Create varaibles for the HTML view below.
	 */
	$parse_url=parse_url($item['url']);
	$host=$parse_url['host'];
	extract($item);
	extract($vendor);
	unset($parse_url);
	unset($item);
	unset($vendor);

	/**
	 * Fix character encoding.
	 */
	$title=utf8_encode($title);
	$description=utf8_encode($description);
}
catch(exception $exception)
{
	echo $exception->getMessage();
	return;
}
?>
<div id="reviewMain">

	<div class="reviewHeader">Review This Vendor - <i>Beta</i></div>
	<br/>

	<div class="reviewItem">

		<div id="reviewAttrImage">
			<img src="http://api.searchbitcoin.com/services/image?id=<?php echo $id; ?>&size=large" />
		</div>
		<div class="reviewEntry">
			<span class="reviewTitle">Title:</span> <span id="reviewAttrTitle"><?php echo $title; ?></span>
		</div>
		<div class="reviewEntry">
			<span class="reviewTitle">Link:</span> <span id="reviewAttrUrl"><a href="<?php echo $url; ?>" target="_blank"><?php echo $host; ?></a></span>
		</div>
		<div class="reviewEntry">
			<span class="reviewTitle">Description:</span> <span id="reviewAttrDescription"><?php echo $description; ?></span>
		</div>

	</div>

	<div class="reviewVendor">

		<?php if(!empty($country)) { ?><div class="reviewEntry">
			<span class="reviewTitle">Country:</span> <span id="reviewAttrCountry"><?php echo $country; ?></span>
		</div><?php } ?>

		<?php if(!empty($province)) { ?><div class="reviewEntry">
			<span class="reviewTitle">Province:</span> <span id="reviewAttrProvince"><?php echo $province; ?></span>
		</div><?php } ?>

		<?php if(!empty($city)) { ?><div class="reviewEntry">
			<span class="reviewTitle">City:</span> <span id="reviewAttrCity"><?php echo $city; ?></span>
		</div><?php } ?>

	</div>

	<div class="reviewComments">

		<div id="disqus_thread"></div>
		<script type="text/javascript">
			/* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
			var disqus_shortname = 'searchbitcoin';
			var disqus_identifier = 'id_vendor=<?php echo $id; ?>';
//			var disqus_url = 'http://www.searchbitcoin.com/vendors/review?id=<?php echo $id; ?>';
			/* * * DON'T EDIT BELOW THIS LINE * * */
			(function() {
				var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
				dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
				(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
			})();
		</script>
		<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
		<a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>

	</div>

</div>


