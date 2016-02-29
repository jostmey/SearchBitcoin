<?php

/**
 * Author: Jared L. Ostmeyer
 * Date Started: 2011-05-22
 * Email: jostmey@gmail.com
 * Purpose: Returns connection to the database containing items for sale in the bitcoin economy.
 * License: All rights reserved to 'Jared L. Ostmeyer'.
 */

return new PDO(
	'mysql:host=localhost;dbname=searchbitcoin',
	'searchbitcoin',
	'JAk22Sdn1L2pswSDqiKxla2',
	array(
		PDO::ATTR_PERSISTENT=>false,
	)
);

