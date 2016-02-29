<?php

/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-03-16
 * Email: jostmey@gmail@com
 * Purpose: Load all the code for the plugin into a single document.
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
 * Start output buffering.
 */
ob_start();

/**
 * Combine all the javascript into a single document.
 */
require_once 'jquery.min.js';
require_once 'feed.js';
require_once 'update.js';

/**
 * Cleanup the javascript so that it does not interfere with the rest of the page.
 */
?>$.noConflict();<?php

/**
 * Flush the buffer to the output but rename the jQuery library to prevent a naming conflict.
 */
echo str_replace(
	'jQuery',
	'btceconomyPluginJQuery',
	ob_get_clean()
);

