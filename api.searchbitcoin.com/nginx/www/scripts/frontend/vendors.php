<?php

/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-07-27
 * Email: jostmey@gmail.com
 * Purpose: List vendors in the Search Bitcoin database.
 * License: All rights reserved to 'Jared L. Ostmeyer'.
 */

/**
 * Defines
 */
define('BASE_PATH', dirname(__FILE__).'/..');

/**
 * Filter the parameters passed through the URL.
 */
if(
	!(
		$page=filter_input(
			INPUT_GET,
			'page',
			FILTER_SANITIZE_NUMBER_INT
		)
	)
)
	$page=1;

/**
 * Constants.
 */
$limit=10;
$offset=($page-1)*$limit;

/**
 * Fetch the search result from the database.
 */
@$database=require BASE_PATH.'/globals/db.php';
$row=@$database->query("SELECT COUNT(id) FROM Vendors")->fetch();
$count=$row[0];
$rows=$database->query(
	"SELECT Items.id, Items.title, Vendors.url FROM Items, Vendors ".
	"WHERE Items.url = Vendors.url ".
	"ORDER BY priority DESC LIMIT $limit OFFSET $offset"
);

/**
 * Build pagination links.
 */
for($num=1; $num < ceil($count/$limit); $num++)
{
	$url=parse_url($_SERVER['REQUEST_URI']);
	parse_str($url['query'], $query);
	$query['page']=$num;
	$url['query']='?'.http_build_query($query);
	$pages[$num]=implode('', $url);
}

/**
 * Print HTML table.
 */
?>
	<table>
		<tbody><?php foreach($rows as $row) { ?>
			<tr><?php extract($row); ?>
				<td><img src="http://api.searchbitcoin.com/scripts/api/image.php?id=<?php echo $id;?>"/></td>
				<td>
					<div><?php echo $title; ?></div>
					<div><?php echo $url; ?></div>
				</td>
			</tr><? } ?>
		</tbody>
	</table>
	<div><?php foreach($pages as $num=>$url) { ?>
		<span>
			<?php if($num == $page) $style='style="font-weight: bold;"'; else $style=''; ?>
			<a <?php echo $style; ?> href="<?php echo $url; ?>">
				<?php echo $num; ?>
			</a>
		</span>
	<? } ?></div>


