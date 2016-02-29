<?php

/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-03-16
 * Email: jostmey@gmail@com
 * Purpose: Load HTML and CSS rules for the plug, and loads additional javascript files.
 * License: All rights reserved to 'Jared L. Ostmeyer'.
 */

/**
 * Tell the browser this is a javascript file and that it should not be cached.
 */
header("Content-Type: application/x-javascript");
header('Cache-Control: no-cache');
header('Pragma: no-cache');
header('Expires: -1');

/**
 * Convert HTML file into javascript code that appears in the page.
 */
ob_start();
echo "<style>";
require_once 'default.css';
require_once 'feed.css';
echo "</style>";
require_once 'feed.html';
$html=ob_get_clean();
echo 'document.write("'.
	addcslashes(
		addslashes(
			$html
		),
		"\t\n\r"
	).
'");';

/**
 * Load script that in turn loads additional javascript files.
 */
require_once 'loader.js';

