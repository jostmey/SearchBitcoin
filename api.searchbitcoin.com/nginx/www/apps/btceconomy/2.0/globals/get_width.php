<?php

/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-07-10
 * Email: jostmey@gmail.com
 * Purpose: Return the width of the plugin.
 * License: All rights reserved to 'Jared L. Ostmeyer'.
 */

if(($size=filter_input(INPUT_GET, 'width', FILTER_SANITIZE_URL)))
{
	if(is_numeric($size))
		return $size.'px';
	else
		return $size;
}
else
	return '100%';

