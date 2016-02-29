

/**
 * Create table to hold the items for sale.
 */
CREATE TABLE ItemsTest
(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	id_vendor INTEGER NOT NULL,
	url VARCHAR(256) NOT NULL UNIQUE,
	title VARCHAR(256) NOT NULL,
	description VARCHAR(1024) NOT NULL,
	image VARCHAR(256) NOT NULL,
	tags VARCHAR(512),
	price VARCHAR(32),
	priority REAL NOT NULL DEFAULT 1.0,
	status VARCHAR(64) NOT NULL DEFAULT 'active',
	created DATETIME NOT NULL,
	KEY( id_vendor, status, title ),
	KEY( id_vendor, status, image ),
	FULLTEXT(title, description, url)
)
ENGINE = MyISAM;


