<?php

/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-06-11
 * Email: jostmey@gmail.com
 * Purpose: Download images of items and create a local cache of them.
 * License: All rights reserved to 'Jared L. Ostmeyer'.
 */

/**
 * Attempt to grab the file lock, which is used to ensure that only one instance
 * of the script is running. If the lock cannot be grabbed then safely terminate
 * the script to prevent multiple copies of the script from running simultaneously.
 */
$lock=fopen(__FILE__.'.lock', 'w+') or die;
flock($lock, LOCK_EX | LOCK_NB) or die();

/**
 * Defines
 */
define('BASE_PATH', dirname(__FILE__).'/..');

/**
 * @var PDO $btceconomy
 * @var string $magic_file
 * @var string $dir_image_cache
 * @var string $tmp_file
 */
$btceconomy=require BASE_PATH.'/globals/db.php';
$magic_command=require BASE_PATH.'/globals/magic_command.php';
$dir_image_cache=require BASE_PATH.'/globals/base_path_image_cache.php';
$tmp_file="$dir_image_cache/tmp_image_file";

// Load items from the database.
$items=$btceconomy->query(
	"SELECT id, image FROM Items WHERE status='active'"
);
// Loop through each item in the database.
foreach($items as $item)
{
	extract($item);

	// Encode empty spaces in the URL for the image. This has to be done because many
	// poorly designed websites do not properly encode their image URLs.
	$image=str_replace(
		' ',
		'%20',
		$image
	);

	// Determine the folder that the image will go into.
	$folder=$id%1000;
	$directory="$dir_image_cache/$folder";
	@mkdir($directory);

	// Check if the image has already been cached, and if so then skip this image.
	if(file_exists("$directory/$id.record"))
	{
//		echo "Local cache of the image with id value $id already exists.\n";
		continue;
	}

	// Save image to a temporary file.
	if(!copy($image, $tmp_file))
	{
		echo "Could not download image with id value $id.\n";
		continue;
	}

	// Determine what format the image is in.
	if(!($extension=exec(str_replace('%f', $tmp_file, $magic_command))))
	{
		echo "Could not determine the filetype for the image with id value $id.\n";
		continue;
	}

	// Check that the file is a valid image file.
	if(
		$extension != 'jpeg' &&
		$extension != 'png' &&
		$extension != 'gif'
	)
	{
		echo "The file for image with id value $id is not a valid image file.\n";
		continue;
	}

	// Move the temporary file of the image to its permanent location.
	rename($tmp_file, "$directory/$id.$extension");

	// Get the dimensions of the cached image, and determine how to resize the image
	// into a thumbnail.
	if(!($size=getimagesize("$directory/$id.$extension")))
	{
		echo "Could not resize image with id value $id.\n";
		continue;
	}
	list($width, $height)=$size;
	$scale_factor=($width > $height) ?
			$scale_factor=100.0/$width :
			$scale_factor=100.0/$height;

	// Load the image (so that it can be resized).
	$imagecreate="imagecreatefrom$extension";
	if(!($src=@$imagecreate("$directory/$id.$extension")))
	{
		echo "Failed to open the image with id value $id. Image not resized.\n";
		continue;
	}

	// Scale the image to fit inside a 100px by 100px box.
	if($scale_factor < 1.0)
	{
		$dest=imagecreatetruecolor($width*$scale_factor, $height*$scale_factor);
		// Preserve transparency.
		if($extension === 'gif' or $extension === 'png')
		{
			imagecolortransparent($dest, imagecolorallocatealpha($dest, 0, 0, 0, 127));
			imagealphablending($dest, false);
			imagesavealpha($dest, true);
		}
		imagecopyresampled(
			$dest, $src,
			0, 0, 0, 0,
			$width*$scale_factor, $height*$scale_factor,
			$width, $height
		);
		imagepng($dest, "$directory/{$id}_100-100.png", 9);
	}

	// Scale the image to fit inside a 50px by 50px box.
	$scale_factor=($width > $height) ?
			$scale_factor=50.0/$width :
			$scale_factor=50.0/$height;
	if($scale_factor < 1.0)
		$dest=imagecreatetruecolor($width*$scale_factor, $height*$scale_factor);
	else
		$dest=imagecreatetruecolor($width, $height);
	// Preserve transparency.
	if($extension === 'gif' or $extension === 'png')
	{
		imagecolortransparent($dest, imagecolorallocatealpha($dest, 0, 0, 0, 127));
		imagealphablending($dest, false);
		imagesavealpha($dest, true);
	}
	imagecopyresampled(
		$dest, $src,
		0, 0, 0, 0,
		$width*$scale_factor, $height*$scale_factor,
		$width, $height
	);
	imagepng($dest, "$directory/{$id}_50-50.png", 0);

	// Leave file behind indicating that the image was successfully cached.
	touch("$directory/$id.record");

	echo "Finished caching image with id value $id.\n";
}

/**
 * Release the lock.
 */
if($lock)
	fclose($lock);

