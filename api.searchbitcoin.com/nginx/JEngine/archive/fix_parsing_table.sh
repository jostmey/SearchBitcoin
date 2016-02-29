#!/bin/sh
# Author: Jared Ostmeyer
# Date Started: 2011-07-23
# Purpose: Commands for building the new database out of the old database.

# Command to drop tables so that I can start over.
# DROP TABLE ParseStoreRules;

# Create tables for the new MySQL database.
mysql -uroot searchbitcoin < parsing_table.sql

# Insert data from old tables into the new tables.
mysql -uroot searchbitcoin << "EOF"

	INSERT INTO ParseStoreRules ( id_vendor, crawl_seed, crawl_pattern, crawl_frequency, crawl_page_limit, index_pattern, title_selector, title_offset, description_selector, description_offset, image_selector, image_offset, price_selector, price_offset, category_selector, category_offset, expiration_selector, expiration_offset, expiration_pattern, status, created )
		SELECT id, url_seed, SUBSTRING( url_pattern, 2, LENGTH( url_pattern )-2 ), crawl_frequency, 1000, SUBSTRING( url_pattern, 2, LENGTH( url_pattern )-2 ), title_selector, title_offset, description_selector, description_offset, image_selector, image_offset, price_selector, price_offset, category_selector, category_offset, expiration_selector, expiration_offset, expiration_pattern, status, created
			FROM ParsingStoreRules ORDER BY created;

EOF

# Delete the old tables.
#mysql -hmysql.api.searchbitcoin.com -ufq3t2nbpwu5ck -pSfvxeSPgqF3hDaD3fK3 searchbitcoin << "EOF"
#
#	DROP TABLE ParsingStoreRules;
#
#EOF

