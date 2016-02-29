/**
 * Author: Jared Ostmeyer
 * Starting Date: 2011-07-22
 * Email: jostmey@gmail.com
 * Purpose: Define database for Search Bitcoin.
 * License: All rights reserved to 'Jared L. Ostmeyer'.
 */

/**
 * Create table to hold the items for sale.
 */
CREATE TABLE Items
(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	id_vendor INTEGER NOT NULL,
	url VARCHAR(256) NOT NULL UNIQUE,
	title VARCHAR(256) NOT NULL,
	description VARCHAR(1024) NOT NULL,
	image VARCHAR(256) NOT NULL,
	tags VARCHAR(512),
	price REAL,
	priority REAL NOT NULL DEFAULT 1.0,
	status VARCHAR(64) NOT NULL DEFAULT 'active',
	created DATETIME NOT NULL,
	FULLTEXT(title, description, url)
)
ENGINE = MyISAM;

/**
 * Table containing vendors that offer merchandise or services.
 */
CREATE TABLE Vendors
(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	id_item INTEGER NOT NULL UNIQUE,
	email_address VARCHAR(256),
	bitcoin_address VARCHAR(256),
	payment_instructions VARCHAR(1024),
	country VARCHAR(256),
	province VARCHAR(256),
	city VARCHAR(256),
	source VARCHAR(256) NOT NULL DEFAULT 'user_submitted',
	created DATETIME NOT NULL
)
ENGINE = MyISAM;

/**
 * Table containing vendors that offer merchandise or services.
 */
CREATE TABLE VendorSubmissions
(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	url VARCHAR(256) NOT NULL,
	title VARCHAR(256) NOT NULL,
	description VARCHAR(1024) NOT NULL,
	image VARCHAR(256) NOT NULL,
	email_address VARCHAR(256),
	bitcoin_address VARCHAR(256),
	payment_instructions VARCHAR(1024),
	country VARCHAR(256),
	province VARCHAR(256),
	city VARCHAR(256),
	tags VARCHAR(512),
	status VARCHAR(256) NOT NULL DEFAULT 'pending',
	created DATETIME NOT NULL
)
ENGINE = MyISAM;

/**
 * Create table to hold the search strings for parsing out the items for sale in each website.
 */
CREATE TABLE ParsingStoreRules
(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	url_seed VARCHAR(256) NOT NULL,
	url_pattern VARCHAR(256) NOT NULL,
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
	crawl_frequency TINYINT NOT NULL DEFAULT 1,
	crawl_memlimit SMALLINT NOT NULL DEFAULT 10,
	status VARCHAR(64) NOT NULL DEFAULT 'active',
	created DATETIME NOT NULL 
)
ENGINE = MyISAM;

/**
 * Create table to hold the URLs where people are redirected.
 */
CREATE TABLE FeedbackVotes
(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	id_item INTEGER NOT NULL,
	vote FLOAT NOT NULL,
	referrer VARCHAR(512),
	ip_client VARCHAR(32),
	created DATETIME NOT NULL
)
ENGINE = MyISAM;

/**
 * Table containing vendors that offer merchandise or services.
 */
CREATE TABLE FeedbackComments
(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	id_item INTEGER NOT NULL,
	comment VARCHAR(1024),
	referrer VARCHAR(512),
	ip_client VARCHAR(32),
	status VARCHAR(64) NOT NULL DEFAULT 'active',
	created DATETIME NOT NULL
)
ENGINE = MyISAM;

/**
 * Create table to hold the URLs where people are redirected.
 */
CREATE TABLE FeedbackReferrals
(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	id_item INTEGER NOT NULL,
	referrer VARCHAR(512),
	ip_client VARCHAR(32),
	created DATETIME NOT NULL
)
ENGINE = MyISAM;

/**
 * Create table to hold peoples search requests.
 */
CREATE TABLE FeedbackQueries
(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	query VARCHAR(256) NOT NULL,
	referrer VARCHAR(512),
	ip_client VARCHAR(32),
	created DATETIME NOT NULL
)
ENGINE = MyISAM;

