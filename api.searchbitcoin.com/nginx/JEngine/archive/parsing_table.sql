/**
 * Author: Jared Ostmeyer
 * Starting Date: 2011-07-22
 * Email: jostmey@gmail.com
 * Purpose: Define database for Search Bitcoin.
 * License: All rights reserved to 'Jared L. Ostmeyer'.
 */

/**
 * Create table to hold the search strings for parsing out the items for sale in each website.
 */
CREATE TABLE ParseStoreRules
(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	id_vendor INTEGER NOT NULL,
	crawl_seed VARCHAR(256) NOT NULL,
	crawl_pattern VARCHAR(256) NOT NULL,
	crawl_frequency SMALLINT NOT NULL DEFAULT 1,
	crawl_page_limit SMALLINT NOT NULL DEFAULT 10,
	index_pattern VARCHAR(256) NOT NULL,
	title_selector VARCHAR(256),
	title_offset INTEGER NOT NULL DEFAULT 0,
	description_selector VARCHAR(256) NOT NULL,
	description_offset INTEGER NOT NULL DEFAULT 0,
	image_selector VARCHAR(256) NOT NULL,
	image_offset INTEGER NOT NULL DEFAULT 0,
	price_selector VARCHAR(256),
	price_offset INTEGER NOT NULL DEFAULT 0,
	category_selector VARCHAR(256),
	category_offset INTEGER NOT NULL DEFAULT 0,
	expiration_selector VARCHAR(256),
	expiration_offset INTEGER NOT NULL DEFAULT 0,
	expiration_pattern VARCHAR(256),
	status VARCHAR(64) NOT NULL DEFAULT 'active',
	created DATETIME NOT NULL
)
ENGINE = MyISAM;

