DROP TABLE IF EXISTS AreaGroupBlockTypes;

CREATE TABLE IF NOT EXISTS `AreaGroupBlockTypes` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `btID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`arHandle`,`gID`,`uID`,`btID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS AreaGroups;

CREATE TABLE IF NOT EXISTS `AreaGroups` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `agPermissions` varchar(64) NOT NULL,
  PRIMARY KEY (`cID`,`arHandle`,`gID`,`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS Areas;

CREATE TABLE IF NOT EXISTS `Areas` (
  `arID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `arOverrideCollectionPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `arInheritPermissionsFromAreaOnCID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arID`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

INSERT INTO Areas VALUES(1,1,'Header Nav',0,0)
 ,(2,1,'Header',0,0)
 ,(3,1,'Sidebar',0,0)
 ,(4,1,'Main',0,0)
 ,(5,2,'Header Nav',0,0)
 ,(6,2,'Header',0,0)
 ,(7,2,'Sidebar',0,0)
 ,(8,2,'Main',0,0)
 ,(9,64,'Header Nav',0,0)
 ,(10,64,'Header',0,0)
 ,(11,64,'Sidebar',0,0)
 ,(12,64,'Main',0,0)
 ,(13,65,'Header Nav',0,0)
 ,(14,65,'Header',0,0)
 ,(15,65,'Main',0,0)
 ,(16,66,'Blog Post Header',0,0)
 ,(17,66,'Main',0,0)
 ,(18,66,'Blog Post More',0,0)
 ,(19,66,'Blog Post Footer',0,0)
 ,(20,66,'Header Nav',0,0)
 ,(21,66,'Header',0,0)
 ,(22,66,'Sidebar',0,0)
 ,(96,74,'Top Right',0,0)
 ,(95,77,'Footer 2',0,0)
 ,(91,77,'Sidebar',0,0)
 ,(90,77,'Header',0,0)
 ,(89,77,'Header Nav',0,0)
 ,(83,76,'Header Nav',0,0)
 ,(82,75,'Footer 2',0,0)
 ,(78,75,'Sidebar',0,0)
 ,(77,75,'Header',0,0)
 ,(76,75,'Header Nav',0,0)
 ,(39,71,'Header Nav',0,0)
 ,(40,71,'Header',0,0)
 ,(41,71,'Sidebar',0,0)
 ,(42,71,'Main',0,0)
 ,(127,79,'Top Right',0,0)
 ,(126,79,'Blog Post Footer',0,0)
 ,(125,79,'Sidebar',0,0)
 ,(124,79,'Blog Post More',0,0)
 ,(123,79,'Main',0,0)
 ,(50,13,'Main',0,0)
 ,(58,36,'Global',0,0)
 ,(59,1,'Top Right',0,0)
 ,(60,1,'Footer 1',0,0)
 ,(61,1,'Footer 2',0,0)
 ,(62,1,'Sidebar Nav',0,0)
 ,(63,1,'Slogan',0,0)
 ,(64,1,'Footer',0,0)
 ,(65,1,'Teaser',0,0)
 ,(66,1,'Sidebar Footer 1',0,0)
 ,(67,1,'Sidebar Footer 2',0,0)
 ,(68,1,'Sidebar Footer 3',0,0)
 ,(69,1,'Sidebar Footer 4',0,0)
 ,(81,75,'Footer 1',0,0)
 ,(80,75,'Main',0,0)
 ,(79,75,'Top Right',0,0)
 ,(94,77,'Footer 1',0,0)
 ,(93,77,'Main',0,0)
 ,(92,77,'Top Right',0,0)
 ,(84,76,'Header',0,0)
 ,(85,76,'Top Right',0,0)
 ,(86,76,'Main',0,0)
 ,(87,76,'Footer 1',0,0)
 ,(88,76,'Footer 2',0,0)
 ,(97,74,'Header Nav',0,0)
 ,(98,74,'Header',0,0)
 ,(99,74,'Footer 1',0,0)
 ,(100,74,'Footer 2',0,0)
 ,(101,71,'Top Right',0,0)
 ,(102,71,'Footer 1',0,0)
 ,(103,71,'Footer 2',0,0)
 ,(130,76,'Sidebar',0,0)
 ,(129,79,'Footer 2',0,0)
 ,(128,79,'Footer 1',0,0)
 ,(122,79,'Blog Post Header',0,0)
 ,(121,79,'Header',0,0)
 ,(120,79,'Header Nav',0,0);

DROP TABLE IF EXISTS AttributeKeyCategories;

CREATE TABLE IF NOT EXISTS `AttributeKeyCategories` (
  `akCategoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akCategoryHandle` varchar(255) NOT NULL,
  `akCategoryAllowSets` smallint(4) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`akCategoryID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO AttributeKeyCategories VALUES(1,'collection',0,NULL)
 ,(2,'user',0,NULL)
 ,(3,'file',0,NULL);

DROP TABLE IF EXISTS AttributeKeys;

CREATE TABLE IF NOT EXISTS `AttributeKeys` (
  `akID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akHandle` varchar(255) NOT NULL,
  `akName` varchar(255) NOT NULL,
  `akIsSearchable` tinyint(1) NOT NULL DEFAULT '0',
  `akIsSearchableIndexed` tinyint(1) NOT NULL DEFAULT '0',
  `akIsAutoCreated` tinyint(1) NOT NULL DEFAULT '0',
  `akIsColumnHeader` tinyint(1) NOT NULL DEFAULT '0',
  `akIsEditable` tinyint(1) NOT NULL DEFAULT '0',
  `atID` int(10) unsigned DEFAULT NULL,
  `akCategoryID` int(10) unsigned DEFAULT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`akID`),
  UNIQUE KEY `akHandle` (`akHandle`,`akCategoryID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO AttributeKeys VALUES(1,'meta_title','Meta Title',1,0,0,0,1,1,1,0)
 ,(2,'meta_description','Meta Description',1,0,0,0,1,2,1,0)
 ,(3,'meta_keywords','Meta Keywords',1,0,0,0,1,2,1,0)
 ,(4,'exclude_nav','Exclude From Nav',1,0,0,0,1,3,1,0)
 ,(5,'exclude_page_list','Exclude From Page List',1,0,0,0,1,3,1,0)
 ,(6,'header_extra_content','Header Extra Content',1,0,0,0,1,2,1,0)
 ,(7,'exclude_search_index','Exclude From Search Index',1,0,0,0,1,3,1,0)
 ,(8,'exclude_sitemapxml','Exclude From sitemap.xml',1,0,0,0,1,3,1,0)
 ,(9,'width','Width',1,0,1,0,0,6,3,0)
 ,(10,'height','Height',1,0,1,0,0,6,3,0)
 ,(11,'tags','Tags',0,0,0,0,1,8,1,0);

DROP TABLE IF EXISTS AttributeSetKeys;

CREATE TABLE IF NOT EXISTS `AttributeSetKeys` (
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `asID` int(10) unsigned NOT NULL DEFAULT '0',
  `displayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`akID`,`asID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS AttributeSets;

CREATE TABLE IF NOT EXISTS `AttributeSets` (
  `asID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asName` varchar(255) DEFAULT NULL,
  `asHandle` varchar(255) NOT NULL,
  `akCategoryID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`asID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS AttributeTypeCategories;

CREATE TABLE IF NOT EXISTS `AttributeTypeCategories` (
  `atID` int(10) unsigned NOT NULL DEFAULT '0',
  `akCategoryID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`atID`,`akCategoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO AttributeTypeCategories VALUES(1,1)
 ,(1,2)
 ,(1,3)
 ,(2,1)
 ,(2,2)
 ,(2,3)
 ,(3,1)
 ,(3,2)
 ,(3,3)
 ,(4,1)
 ,(4,2)
 ,(4,3)
 ,(5,1)
 ,(6,1)
 ,(6,2)
 ,(6,3)
 ,(7,1)
 ,(7,3)
 ,(8,1)
 ,(8,2)
 ,(8,3)
 ,(9,2);

DROP TABLE IF EXISTS AttributeTypes;

CREATE TABLE IF NOT EXISTS `AttributeTypes` (
  `atID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `atHandle` varchar(255) NOT NULL,
  `atName` varchar(255) NOT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`atID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO AttributeTypes VALUES(1,'text','Text',0)
 ,(2,'textarea','Text Area',0)
 ,(3,'boolean','Checkbox',0)
 ,(4,'date_time','Date/Time',0)
 ,(5,'image_file','Image/File',0)
 ,(6,'number','Number',0)
 ,(7,'rating','Rating',0)
 ,(8,'select','Select',0)
 ,(9,'address','Address',0);

DROP TABLE IF EXISTS AttributeValues;

CREATE TABLE IF NOT EXISTS `AttributeValues` (
  `avID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akID` int(10) unsigned DEFAULT NULL,
  `avDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uID` int(10) unsigned DEFAULT NULL,
  `atID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

INSERT INTO AttributeValues VALUES(1,9,'2011-06-24 22:52:16',1,6)
 ,(2,10,'2011-06-24 22:52:16',1,6)
 ,(3,9,'2011-06-24 22:52:16',1,6)
 ,(4,10,'2011-06-24 22:52:16',1,6)
 ,(5,9,'2011-06-24 22:52:16',1,6)
 ,(6,10,'2011-06-24 22:52:16',1,6)
 ,(7,9,'2011-06-24 22:52:16',1,6)
 ,(8,10,'2011-06-24 22:52:16',1,6)
 ,(9,9,'2011-06-24 22:52:16',1,6)
 ,(10,10,'2011-06-24 22:52:16',1,6)
 ,(61,4,'2011-06-25 09:06:52',1,3)
 ,(60,3,'2011-06-25 09:06:52',1,2)
 ,(59,2,'2011-06-25 09:06:52',1,2)
 ,(58,1,'2011-06-25 09:06:52',1,1)
 ,(116,9,'2011-06-25 21:09:21',1,6)
 ,(117,10,'2011-06-25 21:09:22',1,6)
 ,(19,11,'2011-06-24 22:52:16',1,8)
 ,(49,4,'2011-06-25 08:46:56',1,3)
 ,(48,3,'2011-06-25 08:46:56',1,2)
 ,(47,2,'2011-06-25 08:46:56',1,2)
 ,(46,1,'2011-06-25 08:46:56',1,1)
 ,(53,4,'2011-06-25 08:51:19',1,3)
 ,(52,3,'2011-06-25 08:51:19',1,2)
 ,(51,2,'2011-06-25 08:51:19',1,2)
 ,(50,1,'2011-06-25 08:51:19',1,1)
 ,(32,1,'2011-06-24 22:52:16',1,1)
 ,(33,2,'2011-06-24 22:52:16',1,2)
 ,(34,3,'2011-06-24 22:52:16',1,2)
 ,(35,4,'2011-06-24 22:52:16',1,3)
 ,(74,1,'2011-06-25 18:58:29',1,1)
 ,(73,4,'2011-06-25 18:55:33',1,3)
 ,(72,3,'2011-06-25 18:55:33',1,2)
 ,(71,2,'2011-06-25 18:55:33',1,2)
 ,(70,1,'2011-06-25 18:55:32',1,1)
 ,(78,1,'2011-06-25 18:58:58',1,1)
 ,(77,4,'2011-06-25 18:58:30',1,3)
 ,(76,3,'2011-06-25 18:58:30',1,2)
 ,(75,2,'2011-06-25 18:58:29',1,2)
 ,(79,2,'2011-06-25 18:58:58',1,2)
 ,(83,2,'2011-06-25 19:00:42',1,2)
 ,(82,1,'2011-06-25 19:00:41',1,1)
 ,(81,4,'2011-06-25 18:58:59',1,3)
 ,(80,3,'2011-06-25 18:58:59',1,2)
 ,(84,3,'2011-06-25 19:00:42',1,2)
 ,(85,4,'2011-06-25 19:00:42',1,3)
 ,(86,1,'2011-06-25 19:01:12',1,1)
 ,(87,2,'2011-06-25 19:01:12',1,2)
 ,(88,3,'2011-06-25 19:01:12',1,2)
 ,(89,4,'2011-06-25 19:01:12',1,3)
 ,(90,9,'2011-06-25 19:17:52',1,6)
 ,(91,10,'2011-06-25 19:17:53',1,6)
 ,(92,9,'2011-06-25 19:27:17',1,6)
 ,(93,10,'2011-06-25 19:27:17',1,6)
 ,(94,9,'2011-06-25 19:29:25',1,6)
 ,(95,10,'2011-06-25 19:29:25',1,6)
 ,(96,1,'2011-06-25 19:54:32',1,1)
 ,(97,2,'2011-06-25 19:54:32',1,2)
 ,(98,3,'2011-06-25 19:54:33',1,2)
 ,(99,4,'2011-06-25 19:54:33',1,3)
 ,(100,1,'2011-06-25 19:59:17',1,1)
 ,(101,2,'2011-06-25 19:59:17',1,2)
 ,(102,3,'2011-06-25 19:59:17',1,2)
 ,(103,4,'2011-06-25 19:59:17',1,3)
 ,(104,1,'2011-06-25 20:01:10',1,1)
 ,(105,2,'2011-06-25 20:01:10',1,2)
 ,(106,3,'2011-06-25 20:01:10',1,2)
 ,(107,4,'2011-06-25 20:01:11',1,3)
 ,(108,1,'2011-06-25 20:01:50',1,1)
 ,(109,2,'2011-06-25 20:01:50',1,2)
 ,(110,3,'2011-06-25 20:01:50',1,2)
 ,(111,4,'2011-06-25 20:01:50',1,3)
 ,(112,1,'2011-06-25 20:03:28',1,1)
 ,(113,2,'2011-06-25 20:03:29',1,2)
 ,(114,3,'2011-06-25 20:03:29',1,2)
 ,(115,4,'2011-06-25 20:03:30',1,3);

DROP TABLE IF EXISTS BlockRelations;

CREATE TABLE IF NOT EXISTS `BlockRelations` (
  `brID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `originalBID` int(10) unsigned NOT NULL DEFAULT '0',
  `relationType` varchar(50) NOT NULL,
  PRIMARY KEY (`brID`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

INSERT INTO BlockRelations VALUES(32,100,90,'DUPLICATE')
 ,(31,99,98,'DUPLICATE')
 ,(30,98,15,'DUPLICATE')
 ,(37,114,50,'DUPLICATE')
 ,(38,115,100,'DUPLICATE')
 ,(39,116,47,'DUPLICATE')
 ,(40,117,116,'DUPLICATE')
 ,(41,118,107,'DUPLICATE')
 ,(23,91,88,'DUPLICATE')
 ,(29,97,86,'DUPLICATE')
 ,(36,112,91,'DUPLICATE');

DROP TABLE IF EXISTS BlockTypes;

CREATE TABLE IF NOT EXISTS `BlockTypes` (
  `btID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `btHandle` varchar(32) NOT NULL,
  `btName` varchar(128) NOT NULL,
  `btDescription` text,
  `btActiveWhenAdded` tinyint(1) NOT NULL DEFAULT '1',
  `btCopyWhenPropagate` tinyint(1) NOT NULL DEFAULT '0',
  `btIncludeAll` tinyint(1) NOT NULL DEFAULT '0',
  `btIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  `btInterfaceWidth` int(10) unsigned NOT NULL DEFAULT '400',
  `btInterfaceHeight` int(10) unsigned NOT NULL DEFAULT '400',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`btID`),
  UNIQUE KEY `btHandle` (`btHandle`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

INSERT INTO BlockTypes VALUES(1,'content','Content','HTML/WYSIWYG Editor Content.',1,0,0,0,580,400,0)
 ,(2,'html','HTML','For adding HTML by hand.',1,0,0,0,600,465,0)
 ,(3,'autonav','Auto-Nav','Creates navigation trees and sitemaps.',1,0,0,0,500,350,0)
 ,(4,'external_form','External Form','Include external forms in the filesystem and place them on pages.',1,0,0,0,300,200,0)
 ,(5,'form','Form','Build simple forms and surveys.',1,0,0,0,420,430,0)
 ,(6,'page_list','Page List','List pages based on type, area.',1,0,0,0,500,350,0)
 ,(7,'file','File','Link to files stored in the asset library.',1,0,0,0,300,250,0)
 ,(8,'image','Image','Adds images and onstates from the library to pages.',1,0,0,0,300,440,0)
 ,(9,'flash_content','Flash Content','Embeds SWF files, including flash detection.',1,0,0,0,300,240,0)
 ,(10,'guestbook','Guestbook','Adds blog-style comments (a guestbook) to your page.',1,0,1,0,300,260,0)
 ,(11,'slideshow','Slideshow','Display a running loop of images.',1,0,0,0,550,400,0)
 ,(12,'search','Search','Add a search box to your site.',1,0,0,0,400,170,0)
 ,(13,'google_map','Google Map','Enter an address and a Google Map of that location will be placed in your page.',1,0,0,0,400,220,0)
 ,(14,'video','Video Player','Embeds uploaded video into a web page. Supports AVI, WMV, Quicktime/MPEG4 and FLV formats.',1,0,0,0,300,200,0)
 ,(15,'rss_displayer','RSS Displayer','Fetch, parse and display the contents of an RSS or Atom feed.',1,0,0,0,400,170,0)
 ,(16,'youtube','Youtube Video','Embeds a Youtube Video in your web page.',1,0,0,0,400,170,0)
 ,(17,'survey','Survey','Provide a simple survey, along with results in a pie chart format.',1,0,1,0,420,300,0)
 ,(18,'date_nav','Date Navigation','A collapsible date based navigation tree',1,0,0,0,500,350,0)
 ,(19,'next_previous','Next & Previous Nav','Navigate through sibling pages.',1,0,0,0,430,300,0)
 ,(20,'tags','Tags','List pages based on type, area.',1,0,0,0,500,350,0);

DROP TABLE IF EXISTS Blocks;

CREATE TABLE IF NOT EXISTS `Blocks` (
  `bID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bName` varchar(60) DEFAULT NULL,
  `bDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bDateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bFilename` varchar(32) DEFAULT NULL,
  `bIsActive` varchar(1) NOT NULL DEFAULT '1',
  `btID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

INSERT INTO Blocks VALUES(1,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','header_menu.php','1',3,1)
 ,(2,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL,'1',11,1)
 ,(3,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL,'1',3,1)
 ,(116,NULL,'2011-06-25 21:03:18','2011-06-25 21:03:18',NULL,'1',2,1)
 ,(114,NULL,'2011-06-25 20:13:50','2011-06-25 20:13:50',NULL,'1',1,1)
 ,(115,NULL,'2011-06-25 20:15:59','2011-06-25 20:15:59',NULL,'1',6,1)
 ,(7,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','header_menu.php','1',3,1)
 ,(8,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL,'1',8,1)
 ,(9,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL,'1',3,1)
 ,(10,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','header_menu.php','1',3,1)
 ,(11,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL,'1',8,1)
 ,(12,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','header_menu.php','1',3,1)
 ,(13,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL,'1',8,1)
 ,(14,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','breadcrumb.php','1',3,1)
 ,(15,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL,'1',1,1)
 ,(16,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL,'1',1,1)
 ,(17,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL,'1',10,1)
 ,(18,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL,'1',18,1)
 ,(47,NULL,'2011-06-25 09:23:16','2011-06-25 09:23:16',NULL,'1',2,1)
 ,(23,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL,'1',20,1)
 ,(50,NULL,'2011-06-25 09:39:50','2011-06-25 09:41:49',NULL,'1',1,1)
 ,(118,NULL,'2011-06-25 21:10:15','2011-06-25 21:10:15',NULL,'1',1,1)
 ,(28,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL,'1',18,1)
 ,(29,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','tag_cloud','1',12,1)
 ,(30,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','blog_index.php','1',6,1)
 ,(100,NULL,'2011-06-25 19:02:59','2011-06-25 19:03:12',NULL,'1',6,1)
 ,(99,NULL,'2011-06-25 19:00:16','2011-06-25 19:00:16',NULL,'1',1,1)
 ,(98,NULL,'2011-06-25 18:56:29','2011-06-25 18:56:29',NULL,'1',1,1)
 ,(102,NULL,'2011-06-25 19:07:03','2011-06-25 19:07:03',NULL,'1',1,1)
 ,(103,NULL,'2011-06-25 19:08:17','2011-06-25 19:08:32',NULL,'1',1,1)
 ,(104,NULL,'2011-06-25 19:09:03','2011-06-25 19:09:03',NULL,'1',1,1)
 ,(105,NULL,'2011-06-25 19:14:11','2011-06-25 19:14:12',NULL,'1',1,1)
 ,(40,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL,'1',19,1)
 ,(41,'My_Site_Name','2011-06-24 22:52:16','2011-06-24 22:52:16',NULL,'1',1,1)
 ,(117,NULL,'2011-06-25 21:05:08','2011-06-25 21:06:52',NULL,'1',2,1)
 ,(59,NULL,'2011-06-25 09:47:35','2011-06-25 09:47:35',NULL,'1',1,1)
 ,(64,NULL,'2011-06-25 14:27:26','2011-06-25 14:27:26',NULL,'1',1,1)
 ,(66,NULL,'2011-06-25 14:31:04','2011-06-25 14:31:05',NULL,'1',1,1)
 ,(70,NULL,'2011-06-25 16:10:56','2011-06-25 16:10:56',NULL,'1',1,1)
 ,(69,NULL,'2011-06-25 16:07:50','2011-06-25 16:08:08',NULL,'1',1,1)
 ,(71,NULL,'2011-06-25 16:14:18','2011-06-25 16:14:18',NULL,'1',1,1)
 ,(73,NULL,'2011-06-25 16:17:22','2011-06-25 16:17:22',NULL,'1',1,1)
 ,(74,NULL,'2011-06-25 16:19:03','2011-06-25 16:19:03',NULL,'1',1,1)
 ,(75,NULL,'2011-06-25 16:24:41','2011-06-25 16:24:41',NULL,'1',1,1)
 ,(76,NULL,'2011-06-25 16:27:08','2011-06-25 16:27:08',NULL,'1',5,1)
 ,(77,NULL,'2011-06-25 16:31:22','2011-06-25 16:31:22',NULL,'1',1,1)
 ,(78,NULL,'2011-06-25 16:32:37','2011-06-25 16:32:37',NULL,'1',1,1)
 ,(79,NULL,'2011-06-25 16:36:44','2011-06-25 16:36:56',NULL,'1',1,1)
 ,(80,NULL,'2011-06-25 16:40:52','2011-06-25 16:41:24',NULL,'1',1,1)
 ,(81,NULL,'2011-06-25 16:44:21','2011-06-25 16:48:16',NULL,'1',1,1)
 ,(82,NULL,'2011-06-25 16:47:04','2011-06-25 16:50:06',NULL,'1',1,1)
 ,(83,NULL,'2011-06-25 16:59:40','2011-06-25 16:59:40',NULL,'1',1,1)
 ,(84,NULL,'2011-06-25 17:01:44','2011-06-25 17:12:32',NULL,'1',1,1)
 ,(85,NULL,'2011-06-25 17:02:52','2011-06-25 17:02:52',NULL,'1',1,1)
 ,(86,NULL,'2011-06-25 17:04:19','2011-06-25 17:04:19',NULL,'1',1,1)
 ,(88,NULL,'2011-06-25 17:10:29','2011-06-25 17:10:29',NULL,'1',1,1)
 ,(90,NULL,'2011-06-25 18:33:48','2011-06-25 18:33:48',NULL,'1',6,1)
 ,(91,NULL,'2011-06-25 18:40:14','2011-06-25 18:40:14',NULL,'1',1,1)
 ,(93,NULL,'2011-06-25 18:43:39','2011-06-25 18:43:39',NULL,'1',1,1)
 ,(94,NULL,'2011-06-25 18:44:01','2011-06-25 18:44:01',NULL,'1',1,1)
 ,(96,NULL,'2011-06-25 18:46:14','2011-06-25 18:46:14',NULL,'1',1,1)
 ,(97,NULL,'2011-06-25 18:48:04','2011-06-25 18:48:04',NULL,'1',1,1)
 ,(107,NULL,'2011-06-25 19:19:00','2011-06-25 19:32:03',NULL,'1',1,1)
 ,(109,NULL,'2011-06-25 19:36:47','2011-06-25 19:36:47',NULL,'1',1,1)
 ,(110,NULL,'2011-06-25 19:39:02','2011-06-25 19:39:02',NULL,'1',1,1)
 ,(112,NULL,'2011-06-25 20:04:18','2011-06-25 20:04:19',NULL,'1',1,1);

DROP TABLE IF EXISTS CollectionAttributeValues;

CREATE TABLE IF NOT EXISTS `CollectionAttributeValues` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`akID`,`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO CollectionAttributeValues VALUES(1,16,1,96)
 ,(1,16,2,97)
 ,(1,16,3,98)
 ,(1,16,4,99)
 ,(1,17,1,96)
 ,(1,17,2,97)
 ,(1,17,3,98)
 ,(1,17,4,99)
 ,(1,18,1,96)
 ,(1,18,2,97)
 ,(1,18,3,98)
 ,(1,18,4,99)
 ,(1,19,1,96)
 ,(1,19,2,97)
 ,(1,19,3,98)
 ,(1,19,4,99)
 ,(1,20,1,96)
 ,(1,20,2,97)
 ,(1,20,3,98)
 ,(1,20,4,99)
 ,(66,1,11,19)
 ,(71,2,1,32)
 ,(71,2,2,33)
 ,(71,2,3,34)
 ,(71,2,4,35)
 ,(71,3,1,32)
 ,(71,3,2,33)
 ,(71,3,3,34)
 ,(71,3,4,35)
 ,(71,4,1,32)
 ,(71,4,2,33)
 ,(71,4,3,34)
 ,(71,4,4,35)
 ,(71,5,1,32)
 ,(71,5,2,33)
 ,(71,5,3,34)
 ,(71,5,4,35)
 ,(71,6,1,32)
 ,(71,6,2,33)
 ,(71,6,3,34)
 ,(71,6,4,35)
 ,(71,7,1,32)
 ,(71,7,2,33)
 ,(71,7,3,34)
 ,(71,7,4,35)
 ,(71,8,1,32)
 ,(71,8,2,33)
 ,(71,8,3,34)
 ,(71,8,4,35)
 ,(71,9,1,32)
 ,(71,9,2,33)
 ,(71,9,3,34)
 ,(71,9,4,35)
 ,(71,10,1,112)
 ,(71,10,2,113)
 ,(71,10,3,114)
 ,(71,10,4,115)
 ,(71,11,1,112)
 ,(71,11,2,113)
 ,(71,11,3,114)
 ,(71,11,4,115)
 ,(71,12,1,112)
 ,(71,12,2,113)
 ,(71,12,3,114)
 ,(71,12,4,115)
 ,(75,2,1,46)
 ,(75,2,2,47)
 ,(75,2,3,48)
 ,(75,2,4,49)
 ,(75,3,1,46)
 ,(75,3,2,47)
 ,(75,3,3,48)
 ,(75,3,4,49)
 ,(75,4,1,46)
 ,(75,4,2,47)
 ,(75,4,3,48)
 ,(75,4,4,49)
 ,(75,5,1,108)
 ,(75,5,2,109)
 ,(75,5,3,110)
 ,(75,5,4,111)
 ,(76,2,1,50)
 ,(76,2,2,51)
 ,(76,2,3,52)
 ,(76,2,4,53)
 ,(76,3,1,50)
 ,(76,3,2,51)
 ,(76,3,3,52)
 ,(76,3,4,53)
 ,(76,4,1,50)
 ,(76,4,2,51)
 ,(76,4,3,52)
 ,(76,4,4,53)
 ,(76,5,1,104)
 ,(76,5,2,105)
 ,(76,5,3,106)
 ,(76,5,4,107)
 ,(77,11,1,58)
 ,(77,11,2,59)
 ,(77,11,3,60)
 ,(77,11,4,61)
 ,(77,12,1,100)
 ,(77,12,2,101)
 ,(77,12,3,102)
 ,(77,12,4,103)
 ,(77,13,1,100)
 ,(77,13,2,101)
 ,(77,13,3,102)
 ,(77,13,4,103)
 ,(79,2,1,70)
 ,(79,2,2,71)
 ,(79,2,3,72)
 ,(79,2,4,73)
 ,(79,3,1,74)
 ,(79,3,2,75)
 ,(79,3,3,76)
 ,(79,3,4,77)
 ,(79,4,1,78)
 ,(79,4,2,79)
 ,(79,4,3,80)
 ,(79,4,4,81)
 ,(79,5,1,82)
 ,(79,5,2,83)
 ,(79,5,3,84)
 ,(79,5,4,85)
 ,(79,6,1,86)
 ,(79,6,2,87)
 ,(79,6,3,88)
 ,(79,6,4,89);

DROP TABLE IF EXISTS CollectionSearchIndexAttributes;

CREATE TABLE IF NOT EXISTS `CollectionSearchIndexAttributes` (
  `cID` int(11) unsigned NOT NULL DEFAULT '0',
  `ak_meta_title` text,
  `ak_meta_description` text,
  `ak_meta_keywords` text,
  `ak_exclude_nav` tinyint(4) DEFAULT '0',
  `ak_exclude_page_list` tinyint(4) DEFAULT '0',
  `ak_header_extra_content` text,
  `ak_exclude_search_index` tinyint(4) DEFAULT '0',
  `ak_exclude_sitemapxml` tinyint(4) DEFAULT '0',
  `ak_tags` text,
  PRIMARY KEY (`cID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO CollectionSearchIndexAttributes VALUES(2,NULL,NULL,NULL,0,0,NULL,0,0,NULL)
 ,(1,'Search bitcoin','Find everything that is available for sale in the bitcoin community.','bitcoin, search, find, aggregate, shop, store, merchandise, products, services, classifieds, advertisement',0,0,NULL,0,0,NULL)
 ,(65,NULL,NULL,NULL,0,0,NULL,0,0,NULL)
 ,(42,NULL,NULL,NULL,0,0,NULL,0,0,NULL)
 ,(67,'','','',0,0,NULL,0,0,NULL)
 ,(68,'','','',1,0,NULL,0,0,NULL)
 ,(66,NULL,NULL,NULL,0,0,NULL,0,0,'\n')
 ,(69,'','','',0,0,NULL,0,0,NULL)
 ,(70,'','','',0,0,NULL,0,0,NULL)
 ,(71,'Search Bitcoin Blog','Stay tuned to our blog to learn about the exciting things that are just around the corner.','Bitcoin, search, blog, promotion, public announcements',0,0,NULL,0,0,NULL)
 ,(72,'','','',0,0,NULL,0,0,'\nsample\nHello World\n')
 ,(73,'','','',0,0,NULL,0,0,'\nsample\n')
 ,(75,'Contact Us','Contact us as search bitcoin','Bitcoins, contact',0,0,NULL,0,0,NULL)
 ,(76,'Chamber of Commerce','We are helping to build the bitcoin chamber of commerce by providing our database of bitcoin businesses to the public.','Bitcoin, Chamber of Commerce, Businesses, Directory, Listing',0,0,NULL,0,0,NULL)
 ,(78,NULL,NULL,NULL,0,0,NULL,0,0,NULL)
 ,(79,'Indexing bitcoin websites','Search bitcoin aggregates content','bitcoin, aggregate, index, crawl, blog',0,0,NULL,0,0,NULL)
 ,(77,'Learn about bitcoins','Introduction to bitcoins for those that are new to the concept of this digital currency.','bitcoins, introduction, learn more, get started',0,0,NULL,0,0,NULL);

DROP TABLE IF EXISTS CollectionVersionAreaLayouts;

CREATE TABLE IF NOT EXISTS `CollectionVersionAreaLayouts` (
  `cvalID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned DEFAULT '0',
  `cvID` int(10) unsigned DEFAULT '0',
  `arHandle` varchar(255) DEFAULT NULL,
  `layoutID` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(10) DEFAULT '1000',
  `areaNameNumber` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`cvalID`),
  KEY `areaLayoutsIndex` (`cID`,`cvID`,`arHandle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS CollectionVersionAreaStyles;

CREATE TABLE IF NOT EXISTS `CollectionVersionAreaStyles` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `csrID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`arHandle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS CollectionVersionBlockPermissions;

CREATE TABLE IF NOT EXISTS `CollectionVersionBlockPermissions` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `cbgPermissions` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`cID`,`cvID`,`bID`,`gID`,`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS CollectionVersionBlockStyles;

CREATE TABLE IF NOT EXISTS `CollectionVersionBlockStyles` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `csrID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO CollectionVersionBlockStyles VALUES(1,18,1,'Header Nav',0)
 ,(1,17,1,'Header Nav',0)
 ,(1,17,64,'Header',0)
 ,(1,17,59,'Sidebar',0)
 ,(1,18,64,'Header',0)
 ,(1,18,74,'Main',0)
 ,(1,17,114,'Sidebar',0)
 ,(75,3,3,'Sidebar',0)
 ,(76,1,10,'Header Nav',0)
 ,(76,1,11,'Header',0)
 ,(76,2,10,'Header Nav',0)
 ,(75,1,3,'Sidebar',0)
 ,(75,1,2,'Header',0)
 ,(75,1,1,'Header Nav',0)
 ,(75,2,2,'Header',0)
 ,(75,2,1,'Header Nav',0)
 ,(75,3,1,'Header Nav',0)
 ,(75,2,3,'Sidebar',0)
 ,(71,1,1,'Header Nav',0)
 ,(71,1,2,'Header',0)
 ,(71,1,3,'Sidebar',0)
 ,(71,2,1,'Header Nav',0)
 ,(71,2,2,'Header',0)
 ,(79,1,40,'Blog Post Footer',0)
 ,(79,1,18,'Sidebar',0)
 ,(79,1,16,'Blog Post More',0)
 ,(79,1,15,'Main',0)
 ,(79,1,14,'Blog Post Header',0)
 ,(79,1,13,'Header',0)
 ,(79,1,12,'Header Nav',0)
 ,(79,3,18,'Sidebar',0)
 ,(79,2,12,'Header Nav',0)
 ,(79,1,17,'Blog Post Footer',0)
 ,(79,1,23,'Sidebar',0)
 ,(79,2,17,'Blog Post Footer',0)
 ,(79,2,40,'Blog Post Footer',0)
 ,(79,3,12,'Header Nav',0)
 ,(79,2,18,'Sidebar',0)
 ,(79,2,98,'Main',0)
 ,(79,3,14,'Blog Post Header',0)
 ,(79,3,98,'Main',0)
 ,(79,3,40,'Blog Post Footer',0)
 ,(79,2,23,'Sidebar',0)
 ,(79,4,40,'Blog Post Footer',0)
 ,(79,4,14,'Blog Post Header',0)
 ,(79,4,18,'Sidebar',0)
 ,(79,4,12,'Header Nav',0)
 ,(79,3,23,'Sidebar',0)
 ,(79,3,17,'Blog Post Footer',0)
 ,(79,5,12,'Header Nav',0)
 ,(79,4,23,'Sidebar',0)
 ,(79,4,17,'Blog Post Footer',0)
 ,(79,4,98,'Main',0)
 ,(79,2,14,'Blog Post Header',0)
 ,(1,17,93,'Sidebar',0)
 ,(1,17,66,'Main',0)
 ,(1,17,94,'Sidebar',0)
 ,(1,17,47,'Main',0)
 ,(1,17,74,'Main',0)
 ,(1,18,59,'Sidebar',0)
 ,(1,18,93,'Sidebar',0)
 ,(1,18,66,'Main',0)
 ,(1,18,94,'Sidebar',0)
 ,(1,18,47,'Main',0)
 ,(1,18,114,'Sidebar',0)
 ,(71,12,1,'Header Nav',0)
 ,(71,12,83,'Sidebar',0)
 ,(1,19,1,'Header Nav',0)
 ,(71,12,112,'Header',0)
 ,(71,12,110,'Sidebar',0)
 ,(71,12,85,'Sidebar',0)
 ,(1,19,74,'Main',0)
 ,(1,19,64,'Header',0)
 ,(71,12,84,'Sidebar',0)
 ,(71,12,97,'Sidebar',0)
 ,(71,12,115,'Main',0)
 ,(1,19,93,'Sidebar',0)
 ,(1,19,66,'Main',0)
 ,(1,20,1,'Header Nav',0)
 ,(1,19,114,'Sidebar',0)
 ,(1,19,94,'Sidebar',0)
 ,(77,13,1,'Header Nav',0)
 ,(1,19,59,'Sidebar',0)
 ,(1,19,116,'Main',0)
 ,(1,20,64,'Header',0)
 ,(1,20,94,'Sidebar',0)
 ,(1,20,114,'Sidebar',0)
 ,(1,20,74,'Main',0)
 ,(77,13,70,'Sidebar',0)
 ,(77,13,69,'Sidebar',0)
 ,(1,20,59,'Sidebar',0)
 ,(77,13,105,'Header',0)
 ,(1,20,117,'Main',2)
 ,(1,20,93,'Sidebar',0)
 ,(1,20,66,'Main',0)
 ,(79,5,99,'Main',0)
 ,(79,5,23,'Sidebar',0)
 ,(79,5,17,'Blog Post Footer',0)
 ,(79,6,12,'Header Nav',0)
 ,(79,5,40,'Blog Post Footer',0)
 ,(79,5,14,'Blog Post Header',0)
 ,(79,5,18,'Sidebar',0)
 ,(71,5,1,'Header Nav',0)
 ,(79,6,99,'Main',0)
 ,(79,6,40,'Blog Post Footer',0)
 ,(79,6,18,'Sidebar',0)
 ,(79,6,14,'Blog Post Header',0)
 ,(71,5,83,'Sidebar',0)
 ,(71,5,88,'Header',0)
 ,(71,5,84,'Sidebar',0)
 ,(71,5,85,'Sidebar',0)
 ,(71,5,86,'Sidebar',0)
 ,(71,6,1,'Header Nav',0)
 ,(71,6,83,'Sidebar',0)
 ,(71,6,90,'Main',0)
 ,(71,6,84,'Sidebar',0)
 ,(71,6,85,'Sidebar',0)
 ,(71,6,86,'Sidebar',0)
 ,(71,6,91,'Header',0)
 ,(77,13,118,'Main',0)
 ,(77,13,73,'Sidebar',0)
 ,(77,13,71,'Sidebar',0)
 ,(77,13,96,'Sidebar',0)
 ,(71,7,1,'Header Nav',0)
 ,(71,7,83,'Sidebar',0)
 ,(71,7,90,'Main',0)
 ,(71,7,91,'Header',0)
 ,(71,7,84,'Sidebar',0)
 ,(71,7,85,'Sidebar',0)
 ,(79,6,17,'Blog Post Footer',0)
 ,(71,7,97,'Sidebar',0)
 ,(79,6,23,'Sidebar',0)
 ,(71,8,1,'Header Nav',0)
 ,(71,8,83,'Sidebar',0)
 ,(76,3,10,'Header Nav',0)
 ,(71,8,91,'Header',0)
 ,(71,8,84,'Sidebar',0)
 ,(71,8,85,'Sidebar',0)
 ,(71,8,97,'Sidebar',0)
 ,(71,8,100,'Main',0)
 ,(77,11,1,'Header Nav',0)
 ,(77,11,69,'Sidebar',0)
 ,(77,11,105,'Header',0)
 ,(76,4,10,'Header Nav',0)
 ,(77,11,70,'Sidebar',0)
 ,(77,11,71,'Sidebar',0)
 ,(77,11,96,'Sidebar',0)
 ,(77,11,73,'Sidebar',0)
 ,(77,11,107,'Main',0)
 ,(76,4,102,'Sidebar',0)
 ,(76,4,103,'Header',0)
 ,(76,4,104,'Main',0)
 ,(1,16,1,'Header Nav',0)
 ,(1,16,74,'Main',0)
 ,(77,12,1,'Header Nav',0)
 ,(1,16,64,'Header',0)
 ,(1,16,50,'Sidebar',0)
 ,(1,16,47,'Main',0)
 ,(1,16,94,'Sidebar',0)
 ,(1,16,93,'Sidebar',0)
 ,(1,16,66,'Main',0)
 ,(1,16,59,'Sidebar',0)
 ,(77,12,69,'Sidebar',0)
 ,(77,12,105,'Header',0)
 ,(77,12,107,'Main',0)
 ,(77,12,70,'Sidebar',0)
 ,(77,12,71,'Sidebar',0)
 ,(77,12,96,'Sidebar',0)
 ,(77,12,73,'Sidebar',0)
 ,(76,5,10,'Header Nav',0)
 ,(76,5,102,'Sidebar',0)
 ,(76,5,103,'Header',0)
 ,(76,5,104,'Main',0)
 ,(76,5,109,'Sidebar',0)
 ,(75,5,1,'Header Nav',0)
 ,(75,5,75,'Header',0)
 ,(75,5,78,'Main',0)
 ,(75,5,79,'Sidebar',0)
 ,(75,5,76,'Main',0)
 ,(75,5,80,'Sidebar',0)
 ,(75,5,77,'Main',0)
 ,(75,5,81,'Sidebar',0)
 ,(75,5,82,'Sidebar',0)
 ,(71,10,1,'Header Nav',0)
 ,(71,10,83,'Sidebar',0)
 ,(71,10,91,'Header',0)
 ,(71,10,100,'Main',0)
 ,(71,10,110,'Sidebar',0)
 ,(71,10,85,'Sidebar',0)
 ,(71,10,84,'Sidebar',0)
 ,(71,10,97,'Sidebar',0)
 ,(71,11,1,'Header Nav',0)
 ,(71,11,83,'Sidebar',0)
 ,(71,11,100,'Main',0)
 ,(71,11,110,'Sidebar',0)
 ,(71,11,85,'Sidebar',0)
 ,(71,11,84,'Sidebar',0)
 ,(71,11,97,'Sidebar',0)
 ,(71,11,112,'Header',0);

DROP TABLE IF EXISTS CollectionVersionBlocks;

CREATE TABLE IF NOT EXISTS `CollectionVersionBlocks` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `cbDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `isOriginal` varchar(1) NOT NULL DEFAULT '0',
  `cbOverrideAreaPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `cbIncludeAll` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  KEY `cbIncludeAll` (`cbIncludeAll`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO CollectionVersionBlocks VALUES(2,1,1,'Header Nav',0,'1',0,0)
 ,(2,1,2,'Header',0,'1',0,0)
 ,(2,1,3,'Sidebar',0,'1',0,0)
 ,(1,17,1,'Header Nav',0,'0',0,0)
 ,(71,12,1,'Header Nav',0,'0',0,0)
 ,(1,17,74,'Main',0,'0',0,0)
 ,(1,17,64,'Header',0,'0',0,0)
 ,(1,18,1,'Header Nav',0,'0',0,0)
 ,(64,1,7,'Header Nav',0,'1',0,0)
 ,(64,1,8,'Header',0,'1',0,0)
 ,(64,1,9,'Sidebar',0,'1',0,0)
 ,(65,1,10,'Header Nav',0,'1',0,0)
 ,(65,1,11,'Header',0,'1',0,0)
 ,(66,1,12,'Header Nav',0,'1',0,0)
 ,(66,1,13,'Header',0,'1',0,0)
 ,(66,1,14,'Blog Post Header',0,'1',0,0)
 ,(66,1,15,'Main',0,'1',0,0)
 ,(66,1,16,'Blog Post More',0,'1',0,0)
 ,(66,1,17,'Blog Post Footer',1,'1',0,1)
 ,(66,1,18,'Sidebar',0,'1',0,0)
 ,(1,18,94,'Sidebar',1,'0',0,0)
 ,(1,18,66,'Main',2,'0',0,0)
 ,(1,18,93,'Sidebar',2,'0',0,0)
 ,(1,18,74,'Main',0,'0',0,0)
 ,(1,18,114,'Sidebar',0,'0',0,0)
 ,(1,18,47,'Main',1,'0',0,0)
 ,(66,1,23,'Sidebar',1,'1',0,0)
 ,(76,1,11,'Header',0,'0',0,0)
 ,(75,3,3,'Sidebar',0,'0',0,0)
 ,(1,19,1,'Header Nav',0,'0',0,0)
 ,(76,2,10,'Header Nav',0,'0',0,0)
 ,(1,18,59,'Sidebar',3,'0',0,0)
 ,(71,12,83,'Sidebar',0,'0',0,0)
 ,(75,1,3,'Sidebar',0,'0',0,0)
 ,(75,1,2,'Header',0,'0',0,0)
 ,(75,1,1,'Header Nav',0,'0',0,0)
 ,(75,2,3,'Sidebar',0,'0',0,0)
 ,(75,2,2,'Header',0,'0',0,0)
 ,(75,2,1,'Header Nav',0,'0',0,0)
 ,(76,1,10,'Header Nav',0,'0',0,0)
 ,(75,3,1,'Header Nav',0,'0',0,0)
 ,(71,1,1,'Header Nav',0,'0',0,0)
 ,(71,1,2,'Header',0,'0',0,0)
 ,(71,1,3,'Sidebar',0,'0',0,0)
 ,(71,2,1,'Header Nav',0,'0',0,0)
 ,(71,2,2,'Header',0,'0',0,0)
 ,(71,2,28,'Sidebar',0,'1',0,0)
 ,(71,2,29,'Sidebar',1,'1',0,0)
 ,(71,2,30,'Main',0,'1',0,0)
 ,(79,1,40,'Blog Post Footer',0,'0',0,0)
 ,(79,1,18,'Sidebar',0,'0',0,0)
 ,(79,1,16,'Blog Post More',0,'0',0,0)
 ,(79,1,15,'Main',0,'0',0,0)
 ,(79,1,14,'Blog Post Header',0,'0',0,0)
 ,(79,1,13,'Header',0,'0',0,0)
 ,(79,1,12,'Header Nav',0,'0',0,0)
 ,(79,2,18,'Sidebar',0,'0',0,0)
 ,(79,2,98,'Main',0,'1',0,0)
 ,(79,3,12,'Header Nav',0,'0',0,0)
 ,(79,1,17,'Blog Post Footer',1,'0',0,0)
 ,(79,1,23,'Sidebar',1,'0',0,0)
 ,(79,2,12,'Header Nav',0,'0',0,0)
 ,(79,3,14,'Blog Post Header',0,'0',0,0)
 ,(79,2,14,'Blog Post Header',0,'0',0,0)
 ,(79,2,17,'Blog Post Footer',1,'0',0,0)
 ,(79,3,18,'Sidebar',0,'0',0,0)
 ,(79,2,23,'Sidebar',1,'0',0,0)
 ,(79,4,17,'Blog Post Footer',1,'0',0,0)
 ,(79,4,98,'Main',0,'0',0,0)
 ,(79,4,40,'Blog Post Footer',0,'0',0,0)
 ,(79,4,18,'Sidebar',0,'0',0,0)
 ,(79,6,12,'Header Nav',0,'0',0,0)
 ,(79,5,40,'Blog Post Footer',0,'0',0,0)
 ,(79,4,23,'Sidebar',1,'0',0,0)
 ,(79,5,12,'Header Nav',0,'0',0,0)
 ,(79,5,14,'Blog Post Header',0,'0',0,0)
 ,(79,5,18,'Sidebar',0,'0',0,0)
 ,(79,6,40,'Blog Post Footer',0,'0',0,0)
 ,(79,6,18,'Sidebar',0,'0',0,0)
 ,(79,6,14,'Blog Post Header',0,'0',0,0)
 ,(79,5,99,'Main',0,'1',0,0)
 ,(79,5,23,'Sidebar',1,'0',0,0)
 ,(66,1,40,'Blog Post Footer',0,'1',0,0)
 ,(79,5,17,'Blog Post Footer',1,'0',0,0)
 ,(79,2,40,'Blog Post Footer',0,'0',0,0)
 ,(79,4,14,'Blog Post Header',0,'0',0,0)
 ,(79,4,12,'Header Nav',0,'0',0,0)
 ,(79,3,23,'Sidebar',1,'0',0,0)
 ,(79,3,17,'Blog Post Footer',1,'0',0,0)
 ,(79,3,98,'Main',0,'0',0,0)
 ,(79,3,40,'Blog Post Footer',0,'0',0,0)
 ,(71,8,83,'Sidebar',0,'0',0,0)
 ,(71,8,1,'Header Nav',0,'0',0,0)
 ,(79,6,23,'Sidebar',1,'0',0,0)
 ,(79,6,17,'Blog Post Footer',1,'0',0,0)
 ,(79,6,99,'Main',0,'0',0,0)
 ,(36,2,41,'Global',0,'1',0,0)
 ,(1,18,64,'Header',0,'0',0,0)
 ,(1,17,114,'Sidebar',0,'1',0,0)
 ,(1,17,59,'Sidebar',3,'0',0,0)
 ,(1,17,47,'Main',1,'0',0,0)
 ,(1,17,94,'Sidebar',1,'0',0,0)
 ,(1,17,66,'Main',2,'0',0,0)
 ,(1,17,93,'Sidebar',2,'0',0,0)
 ,(71,12,85,'Sidebar',2,'0',0,0)
 ,(71,12,110,'Sidebar',1,'0',0,0)
 ,(71,12,112,'Header',0,'0',0,0)
 ,(71,12,97,'Sidebar',4,'0',0,0)
 ,(1,19,114,'Sidebar',0,'0',0,0)
 ,(1,19,74,'Main',0,'0',0,0)
 ,(1,19,64,'Header',0,'0',0,0)
 ,(71,12,115,'Main',0,'1',0,0)
 ,(71,12,84,'Sidebar',3,'0',0,0)
 ,(1,20,64,'Header',0,'0',0,0)
 ,(1,19,116,'Main',1,'1',0,0)
 ,(1,19,59,'Sidebar',3,'0',0,0)
 ,(1,19,93,'Sidebar',2,'0',0,0)
 ,(1,20,1,'Header Nav',0,'0',0,0)
 ,(1,19,94,'Sidebar',1,'0',0,0)
 ,(1,19,66,'Main',2,'0',0,0)
 ,(1,20,94,'Sidebar',1,'0',0,0)
 ,(1,20,74,'Main',0,'0',0,0)
 ,(1,20,114,'Sidebar',0,'0',0,0)
 ,(77,13,105,'Header',0,'0',0,0)
 ,(77,13,1,'Header Nav',0,'0',0,0)
 ,(1,20,66,'Main',2,'0',0,0)
 ,(1,20,93,'Sidebar',2,'0',0,0)
 ,(1,20,117,'Main',1,'1',0,0)
 ,(1,20,59,'Sidebar',3,'0',0,0)
 ,(77,13,69,'Sidebar',0,'0',0,0)
 ,(77,13,118,'Main',0,'1',0,0)
 ,(77,13,73,'Sidebar',4,'0',0,0)
 ,(77,13,71,'Sidebar',2,'0',0,0)
 ,(75,4,1,'Header Nav',0,'0',0,0)
 ,(77,13,96,'Sidebar',3,'0',0,0)
 ,(77,13,70,'Sidebar',1,'0',0,0)
 ,(75,4,75,'Header',0,'1',0,0)
 ,(75,4,76,'Main',1,'1',0,0)
 ,(75,4,77,'Main',2,'1',0,0)
 ,(75,4,78,'Main',0,'1',0,0)
 ,(75,4,79,'Sidebar',0,'1',0,0)
 ,(75,4,80,'Sidebar',1,'1',0,0)
 ,(75,4,81,'Sidebar',2,'1',0,0)
 ,(75,4,82,'Sidebar',3,'1',0,0)
 ,(71,3,1,'Header Nav',0,'0',0,0)
 ,(71,4,1,'Header Nav',0,'0',0,0)
 ,(71,3,28,'Sidebar',0,'0',0,0)
 ,(71,3,30,'Main',0,'0',0,0)
 ,(71,3,29,'Sidebar',1,'0',0,0)
 ,(71,4,88,'Header',0,'1',0,0)
 ,(71,4,83,'Sidebar',0,'1',0,0)
 ,(71,4,84,'Sidebar',1,'1',0,0)
 ,(71,4,85,'Sidebar',2,'1',0,0)
 ,(71,4,86,'Sidebar',3,'1',0,0)
 ,(76,3,102,'Sidebar',0,'1',0,0)
 ,(71,8,100,'Main',0,'1',0,0)
 ,(71,8,97,'Sidebar',3,'0',0,0)
 ,(71,8,85,'Sidebar',2,'0',0,0)
 ,(76,3,10,'Header Nav',0,'0',0,0)
 ,(71,8,91,'Header',0,'0',0,0)
 ,(71,8,84,'Sidebar',1,'0',0,0)
 ,(71,5,1,'Header Nav',0,'0',0,0)
 ,(76,3,103,'Header',0,'1',0,0)
 ,(76,3,104,'Main',0,'1',0,0)
 ,(71,5,83,'Sidebar',0,'0',0,0)
 ,(71,5,88,'Header',0,'0',0,0)
 ,(71,5,84,'Sidebar',1,'0',0,0)
 ,(71,5,85,'Sidebar',2,'0',0,0)
 ,(71,5,86,'Sidebar',3,'0',0,0)
 ,(71,5,90,'Main',0,'1',0,0)
 ,(71,6,1,'Header Nav',0,'0',0,0)
 ,(71,6,83,'Sidebar',0,'0',0,0)
 ,(71,6,90,'Main',0,'0',0,0)
 ,(71,6,84,'Sidebar',1,'0',0,0)
 ,(71,6,85,'Sidebar',2,'0',0,0)
 ,(71,6,86,'Sidebar',3,'0',0,0)
 ,(71,6,91,'Header',0,'1',0,0)
 ,(71,7,1,'Header Nav',0,'0',0,0)
 ,(71,7,83,'Sidebar',0,'0',0,0)
 ,(71,7,90,'Main',0,'0',0,0)
 ,(71,7,91,'Header',0,'0',0,0)
 ,(71,7,84,'Sidebar',1,'0',0,0)
 ,(71,7,85,'Sidebar',2,'0',0,0)
 ,(71,7,97,'Sidebar',3,'1',0,0)
 ,(77,11,1,'Header Nav',0,'0',0,0)
 ,(77,11,69,'Sidebar',0,'0',0,0)
 ,(77,11,105,'Header',0,'0',0,0)
 ,(77,11,70,'Sidebar',1,'0',0,0)
 ,(77,11,71,'Sidebar',2,'0',0,0)
 ,(77,11,96,'Sidebar',3,'0',0,0)
 ,(77,11,73,'Sidebar',4,'0',0,0)
 ,(77,11,107,'Main',0,'1',0,0)
 ,(76,4,10,'Header Nav',0,'0',0,0)
 ,(76,4,102,'Sidebar',0,'0',0,0)
 ,(76,4,103,'Header',0,'0',0,0)
 ,(76,4,104,'Main',0,'0',0,0)
 ,(76,4,109,'Sidebar',1,'1',0,0)
 ,(71,9,1,'Header Nav',0,'0',0,0)
 ,(71,9,83,'Sidebar',0,'0',0,0)
 ,(71,9,91,'Header',0,'0',0,0)
 ,(71,9,100,'Main',0,'0',0,0)
 ,(71,9,84,'Sidebar',3,'0',0,0)
 ,(71,9,85,'Sidebar',2,'0',0,0)
 ,(71,9,97,'Sidebar',4,'0',0,0)
 ,(71,9,110,'Sidebar',1,'1',0,0)
 ,(1,16,1,'Header Nav',0,'0',0,0)
 ,(1,16,74,'Main',0,'0',0,0)
 ,(77,12,1,'Header Nav',0,'0',0,0)
 ,(1,16,64,'Header',0,'0',0,0)
 ,(1,16,50,'Sidebar',0,'0',0,0)
 ,(1,16,47,'Main',1,'0',0,0)
 ,(1,16,94,'Sidebar',1,'0',0,0)
 ,(1,16,93,'Sidebar',2,'0',0,0)
 ,(1,16,66,'Main',2,'0',0,0)
 ,(1,16,59,'Sidebar',3,'0',0,0)
 ,(77,12,69,'Sidebar',0,'0',0,0)
 ,(77,12,105,'Header',0,'0',0,0)
 ,(77,12,107,'Main',0,'0',0,0)
 ,(77,12,70,'Sidebar',1,'0',0,0)
 ,(77,12,71,'Sidebar',2,'0',0,0)
 ,(77,12,96,'Sidebar',3,'0',0,0)
 ,(77,12,73,'Sidebar',4,'0',0,0)
 ,(76,5,10,'Header Nav',0,'0',0,0)
 ,(76,5,102,'Sidebar',0,'0',0,0)
 ,(76,5,103,'Header',0,'0',0,0)
 ,(76,5,104,'Main',0,'0',0,0)
 ,(76,5,109,'Sidebar',1,'0',0,0)
 ,(75,5,1,'Header Nav',0,'0',0,0)
 ,(75,5,75,'Header',0,'0',0,0)
 ,(75,5,78,'Main',0,'0',0,0)
 ,(75,5,79,'Sidebar',0,'0',0,0)
 ,(75,5,76,'Main',1,'0',0,0)
 ,(75,5,80,'Sidebar',1,'0',0,0)
 ,(75,5,77,'Main',2,'0',0,0)
 ,(75,5,81,'Sidebar',2,'0',0,0)
 ,(75,5,82,'Sidebar',3,'0',0,0)
 ,(71,10,1,'Header Nav',0,'0',0,0)
 ,(71,10,83,'Sidebar',0,'0',0,0)
 ,(71,10,91,'Header',0,'0',0,0)
 ,(71,10,100,'Main',0,'0',0,0)
 ,(71,10,110,'Sidebar',1,'0',0,0)
 ,(71,10,85,'Sidebar',2,'0',0,0)
 ,(71,10,84,'Sidebar',3,'0',0,0)
 ,(71,10,97,'Sidebar',4,'0',0,0)
 ,(71,11,1,'Header Nav',0,'0',0,0)
 ,(71,11,83,'Sidebar',0,'0',0,0)
 ,(71,11,100,'Main',0,'0',0,0)
 ,(71,11,110,'Sidebar',1,'0',0,0)
 ,(71,11,85,'Sidebar',2,'0',0,0)
 ,(71,11,84,'Sidebar',3,'0',0,0)
 ,(71,11,97,'Sidebar',4,'0',0,0)
 ,(71,11,112,'Header',0,'1',0,0);

DROP TABLE IF EXISTS CollectionVersions;

CREATE TABLE IF NOT EXISTS `CollectionVersions` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `cvName` text,
  `cvHandle` varchar(64) DEFAULT NULL,
  `cvDescription` text,
  `cvDatePublic` datetime DEFAULT NULL,
  `cvDateCreated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cvComments` varchar(255) DEFAULT NULL,
  `cvIsApproved` tinyint(1) NOT NULL DEFAULT '0',
  `cvIsNew` tinyint(1) NOT NULL DEFAULT '0',
  `cvAuthorUID` int(10) unsigned DEFAULT NULL,
  `cvApproverUID` int(10) unsigned DEFAULT NULL,
  `cvActivateDatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`cID`,`cvID`),
  KEY `cvIsApproved` (`cvIsApproved`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO CollectionVersions VALUES(2,1,NULL,NULL,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,1,NULL)
 ,(5,1,'Login','login',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(6,1,'Register','register',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(7,1,'Profile','profile',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(8,1,'Edit','edit',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(10,1,'Avatar','avatar',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(11,1,'Messages','messages',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(12,1,'Friends','friends',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(13,1,'Page Not Found','page_not_found',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(14,1,'Page Forbidden','page_forbidden',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(15,1,'Dashboard','dashboard',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(16,1,'Sitemap','sitemap','Whole world at a glance.','2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(17,1,'Full Sitemap','full',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(18,1,'Flat View','explore',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(19,1,'Page Search','search',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(20,1,'Access','access',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(21,1,'File Manager','files','All documents and images.','2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(22,1,'Search','search',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(23,1,'Attributes','attributes',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(24,1,'Sets','sets',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(25,1,'Access','access',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(26,1,'Reports','reports','Get data from forms and logs.','2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(27,1,'Form Results','forms','Get submission data.','2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(28,1,'Surveys','surveys',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(29,1,'Logs','logs',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(30,1,'Users and Groups','users','Add and manage people.','2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(31,1,'Find Users','search',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(32,1,'Add User','add',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(33,1,'Groups','groups',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(34,1,'User Attributes','attributes',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(35,1,'Login & Registration','registration',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(36,1,'Scrapbook','scrapbook','Share content across your site.','2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(37,1,'Pages and Themes','pages','Reskin your site.','2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(38,1,'Themes','themes','Reskin your site.','2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(39,1,'Add','add',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(40,1,'Inspect','inspect',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(41,1,'Customize','customize',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(42,1,'Marketplace','marketplace',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(43,1,'Page Types','types','What goes in your site.','2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(44,1,'Attributes','attributes',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(45,1,'Single Pages','single',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(46,1,'Add Functionality','install','Install addons & themes.','2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(47,1,'System & Maintenance','system','Backup, cleanup and update.','2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(48,1,'Jobs','jobs',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(49,1,'Backup & Restore','backup',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(50,1,'Update','update',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(51,1,'Notifications','notifications',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(52,1,'Sitewide Settings','settings','Secure and setup your site.','2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(53,1,'Email','mail','Enable post via email and other settings.','2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(54,1,'Marketplace','marketplace',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(55,1,'Download File','download_file',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(63,1,NULL,'uID=1',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,NULL,NULL,NULL)
 ,(64,1,'',NULL,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,NULL,NULL,NULL)
 ,(65,1,'',NULL,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,NULL,1,NULL)
 ,(66,1,'',NULL,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,NULL,1,NULL)
 ,(1,19,'Bitcoin Merchandise','bitcoin-merchandise','','2011-06-24 22:52:00','2011-06-25 21:03:15','0.1',0,0,1,1,NULL)
 ,(71,12,'Blog','blog','','2011-06-24 22:52:00','2011-06-25 20:15:58','0.1',1,0,1,1,NULL)
 ,(75,2,'Contact Us','contact-us','Help us improve this website. We welcome questions, criticisms, and general comments about the search bitcoin.','2011-06-25 08:43:00','2011-06-25 08:46:55','New Version 2',0,0,1,1,NULL)
 ,(75,1,'Contact Us','contact-us','Help us improve this website. We welcome questions, criticisms, and general comments about the search bitcoin.','2011-06-25 08:43:00','2011-06-25 08:46:54','Initial Version',0,0,1,NULL,NULL)
 ,(71,1,'Blog','blog','','2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',0,0,1,NULL,NULL)
 ,(71,2,'Blog','blog','','2011-06-24 22:52:16','2011-06-24 22:52:16','Version 2',0,0,1,1,NULL)
 ,(79,1,'Aggregating','aggregating','First of all, let me welcome you to search bitcoin. We at search bitcoin are working hard to index all the bitcoin websites on the web. It is aggregate all the bitcoin products and services offered by the bitcoin community to give you a bird\'s eye view of the state of the economy, and to help you find the stuff you are looking for. This is a tremendously difficult project, but we are making headway. Already we\'ve added just over 100 businesses to our directory, and indexed several thousand items of merchandise offered through these stores. Stay tuned for exciting things to come!','2011-06-25 18:49:00','2011-06-25 18:55:24','Initial Version',0,0,1,NULL,NULL)
 ,(74,1,'Members','members',NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16','Initial Version',1,0,1,NULL,NULL)
 ,(79,2,'Aggregating','aggregating','First of all, let me welcome you to search bitcoin. We at search bitcoin are working hard to index all the bitcoin websites on the web. It is aggregate all the bitcoin products and services offered by the bitcoin community to give you a bird\'s eye view of the state of the economy, and to help you find the stuff you are looking for. This is a tremendously difficult project, but we are making headway. Already we\'ve added just over 100 businesses to our directory, and indexed several thousand items of merchandise offered through these stores. Stay tuned for exciting things to come!','2011-06-25 18:49:00','2011-06-25 18:55:26','0.1',0,0,1,1,NULL)
 ,(36,2,'Scrapbook','scrapbook','Share content across your site.','2011-06-24 22:52:16','2011-06-24 22:52:16','New Version 2',0,1,1,NULL,NULL)
 ,(1,18,'Bitcoin Merchandise','bitcoin-merchandise','','2011-06-24 22:52:00','2011-06-25 20:14:40','0.1',0,0,1,1,NULL)
 ,(75,3,'Contact Us','contact-us','Help us improve this website. We welcome questions, criticisms, and general comments about the search bitcoin.','2011-06-25 08:43:00','2011-06-25 08:49:39','Version 3',0,0,1,1,NULL)
 ,(76,1,'Business Directory','business-directory','','2011-06-25 08:50:00','2011-06-25 08:51:17','Initial Version',0,0,1,NULL,NULL)
 ,(76,2,'Business Directory','business-directory','','2011-06-25 08:50:00','2011-06-25 08:51:18','New Version 2',0,0,1,1,NULL)
 ,(1,20,'Bitcoin Merchandise','bitcoin-merchandise','','2011-06-24 22:52:00','2011-06-25 21:04:37','0.1',1,0,1,1,NULL)
 ,(77,13,'Learn About Bitcoins','learn-about-bitcoins','','2011-06-25 09:06:00','2011-06-25 21:10:12','Version 13',1,0,1,1,NULL)
 ,(75,4,'Contact Us','contact-us','Help us improve this website. We welcome questions, criticisms, and general comments about the search bitcoin.','2011-06-25 08:43:00','2011-06-25 16:20:22','0.1',0,0,1,1,NULL)
 ,(71,3,'Blog','blog','','2011-06-24 22:52:16','2011-06-25 16:53:06','0.1',0,0,1,1,NULL)
 ,(71,4,'Blog','blog','','2011-06-24 22:52:16','2011-06-25 16:59:40','0.1',0,0,1,1,NULL)
 ,(71,5,'Blog','blog','','2011-06-24 22:52:16','2011-06-25 18:33:47','0.1',0,0,1,1,NULL)
 ,(71,6,'Blog','blog','','2011-06-24 22:52:16','2011-06-25 18:40:12','0.1',0,0,1,1,NULL)
 ,(71,7,'Blog','blog','','2011-06-24 22:52:16','2011-06-25 18:48:02','0.1',0,0,1,1,NULL)
 ,(79,3,'Aggregating the Btcoin Economy','aggregating','First of all, let me welcome you to search bitcoin. We at search bitcoin are working hard to index all the bitcoin websites on the web. It is aggregate all the bitcoin products and services offered by the bitcoin community to give you a bird\'s eye view of the state of the economy, and to help you find the stuff you are looking for. This is a tremendously difficult project, but we are making headway. Already we\'ve added just over 100 businesses to our directory, and indexed several thousand items of merchandise offered through these stores. Stay tuned for exciting things to come!','2011-06-25 18:49:00','2011-06-25 18:58:27','New Version 3',0,0,1,1,NULL)
 ,(79,4,'Aggregating the Btcoin Economy','aggregating','F F First of all, let me welcome you to search bitcoin. We at search bitcoin are working hard to index all the bitcoin websites on the web. It is aggregate all the bitcoin products and services offered by the bitcoin community to give you a bird\'s eye view of the state of the economy, and to help you find the stuff you are looking for. This is a tremendously difficult project, but we are making headway. Already we\'ve added just over 100 businesses to our directory, and indexed several thousand items of merchandise offered through these stores. Stay tuned for exciting things to come!','2011-06-25 18:49:00','2011-06-25 18:58:50','New Version 4',0,0,1,1,NULL)
 ,(79,5,'Aggregating the Btcoin Economy','aggregating','First of all, let us welcome you to search bitcoin. We at search bitcoin are working hard to index all the bitcoin websites on the web. It is aggregate all the bitcoin products and services offered by the bitcoin community to give you a bird\'s eye view of the state of the economy, and to help you find the stuff you are looking for. This is a tremendously difficult project, but we are making headway. Already we\'ve added just over 100 businesses to our directory, and indexed several thousand items of merchandise offered through these stores. Stay tuned for exciting things to come!','2011-06-25 18:49:00','2011-06-25 19:00:14','New Version 5',0,0,1,1,NULL)
 ,(79,6,'Aggregating the Btcoin Economy','aggregating-the-btcoin-economy','First of all, let us welcome you to search bitcoin. We at search bitcoin are working hard to index all the bitcoin websites on the web. It is aggregate all the bitcoin products and services offered by the bitcoin community to give you a bird\'s eye view of the state of the economy, and to help you find the stuff you are looking for. This is a tremendously difficult project, but we are making headway. Already we\'ve added just over 100 businesses to our directory, and indexed several thousand items of merchandise offered through these stores. Stay tuned for exciting things to come!','2011-06-25 18:49:00','2011-06-25 19:01:11','New Version 6',1,0,1,1,NULL)
 ,(71,8,'Blog','blog','','2011-06-24 22:52:16','2011-06-25 19:02:55','0.1',0,0,1,1,NULL)
 ,(76,3,'Business Directory','business-directory','','2011-06-25 08:50:00','2011-06-25 19:04:41','Version 3',0,0,1,1,NULL)
 ,(77,11,'Learn About Bitcoins','learn-about-bitcoins','','2011-06-25 09:06:00','2011-06-25 19:18:58','0.1',0,0,1,1,NULL)
 ,(76,4,'Business Directory','business-directory','','2011-06-25 08:50:00','2011-06-25 19:36:46','0.1',0,0,1,1,NULL)
 ,(71,9,'Blog','blog','','2011-06-24 22:52:16','2011-06-25 19:39:00','0.1',0,0,1,1,NULL)
 ,(1,16,'Bitcoin Merchandise','bitcoin-merchandise','','2011-06-24 22:52:00','2011-06-25 19:50:21','Version 16',0,0,1,1,NULL)
 ,(77,12,'Learn About Bitcoins','learn-about-bitcoins','','2011-06-25 09:06:00','2011-06-25 19:59:14','New Version 12',0,0,1,1,NULL)
 ,(76,5,'Business Directory','business-directory','','2011-06-25 08:50:00','2011-06-25 20:01:07','New Version 5',1,0,1,1,NULL)
 ,(75,5,'Contact Us','contact-us','Help us improve this website. We welcome questions, criticisms, and general comments about the search bitcoin.','2011-06-25 08:43:00','2011-06-25 20:01:47','New Version 5',1,0,1,1,NULL)
 ,(71,10,'Blog','blog','','2011-06-24 22:52:00','2011-06-25 20:03:24','New Version 10',0,0,1,1,NULL)
 ,(1,17,'Bitcoin Merchandise','bitcoin-merchandise','','2011-06-24 22:52:00','2011-06-25 20:13:49','0.1',0,0,1,1,NULL)
 ,(71,11,'Blog','blog','','2011-06-24 22:52:00','2011-06-25 20:04:15','Version 11',0,0,1,1,NULL);

DROP TABLE IF EXISTS Collections;

CREATE TABLE IF NOT EXISTS `Collections` (
  `cID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cDateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cHandle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cID`),
  KEY `cDateModified` (`cDateModified`),
  KEY `cDateAdded` (`cDateAdded`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

INSERT INTO Collections VALUES(1,'2011-06-24 22:52:16','2011-06-25 21:06:59','home')
 ,(2,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL)
 ,(5,'2011-06-24 22:52:16','2011-06-24 22:52:16','login')
 ,(6,'2011-06-24 22:52:16','2011-06-24 22:52:16','register')
 ,(7,'2011-06-24 22:52:16','2011-06-24 22:52:16','profile')
 ,(8,'2011-06-24 22:52:16','2011-06-24 22:52:16','edit')
 ,(10,'2011-06-24 22:52:16','2011-06-24 22:52:16','avatar')
 ,(11,'2011-06-24 22:52:16','2011-06-24 22:52:16','messages')
 ,(12,'2011-06-24 22:52:16','2011-06-24 22:52:16','friends')
 ,(13,'2011-06-24 22:52:16','2011-06-24 22:52:16','page_not_found')
 ,(14,'2011-06-24 22:52:16','2011-06-24 22:52:16','page_forbidden')
 ,(15,'2011-06-24 22:52:16','2011-06-24 22:52:16','dashboard')
 ,(16,'2011-06-24 22:52:16','2011-06-24 22:52:16','sitemap')
 ,(17,'2011-06-24 22:52:16','2011-06-24 22:52:16','full')
 ,(18,'2011-06-24 22:52:16','2011-06-24 22:52:16','explore')
 ,(19,'2011-06-24 22:52:16','2011-06-24 22:52:16','search')
 ,(20,'2011-06-24 22:52:16','2011-06-24 22:52:16','access')
 ,(21,'2011-06-24 22:52:16','2011-06-24 22:52:16','files')
 ,(22,'2011-06-24 22:52:16','2011-06-24 22:52:16','search')
 ,(23,'2011-06-24 22:52:16','2011-06-24 22:52:16','attributes')
 ,(24,'2011-06-24 22:52:16','2011-06-24 22:52:16','sets')
 ,(25,'2011-06-24 22:52:16','2011-06-24 22:52:16','access')
 ,(26,'2011-06-24 22:52:16','2011-06-24 22:52:16','reports')
 ,(27,'2011-06-24 22:52:16','2011-06-24 22:52:16','forms')
 ,(28,'2011-06-24 22:52:16','2011-06-24 22:52:16','surveys')
 ,(29,'2011-06-24 22:52:16','2011-06-24 22:52:16','logs')
 ,(30,'2011-06-24 22:52:16','2011-06-24 22:52:16','users')
 ,(31,'2011-06-24 22:52:16','2011-06-24 22:52:16','search')
 ,(32,'2011-06-24 22:52:16','2011-06-24 22:52:16','add')
 ,(33,'2011-06-24 22:52:16','2011-06-24 22:52:16','groups')
 ,(34,'2011-06-24 22:52:16','2011-06-24 22:52:16','attributes')
 ,(35,'2011-06-24 22:52:16','2011-06-24 22:52:16','registration')
 ,(36,'2011-06-24 22:52:16','2011-06-24 22:52:16','scrapbook')
 ,(37,'2011-06-24 22:52:16','2011-06-24 22:52:16','pages')
 ,(38,'2011-06-24 22:52:16','2011-06-24 22:52:16','themes')
 ,(39,'2011-06-24 22:52:16','2011-06-24 22:52:16','add')
 ,(40,'2011-06-24 22:52:16','2011-06-24 22:52:16','inspect')
 ,(41,'2011-06-24 22:52:16','2011-06-24 22:52:16','customize')
 ,(42,'2011-06-24 22:52:16','2011-06-24 22:52:16','marketplace')
 ,(43,'2011-06-24 22:52:16','2011-06-24 22:52:16','types')
 ,(44,'2011-06-24 22:52:16','2011-06-24 22:52:16','attributes')
 ,(45,'2011-06-24 22:52:16','2011-06-24 22:52:16','single')
 ,(46,'2011-06-24 22:52:16','2011-06-24 22:52:16','install')
 ,(47,'2011-06-24 22:52:16','2011-06-24 22:52:16','system')
 ,(48,'2011-06-24 22:52:16','2011-06-24 22:52:16','jobs')
 ,(49,'2011-06-24 22:52:16','2011-06-24 22:52:16','backup')
 ,(50,'2011-06-24 22:52:16','2011-06-24 22:52:16','update')
 ,(51,'2011-06-24 22:52:16','2011-06-24 22:52:16','notifications')
 ,(52,'2011-06-24 22:52:16','2011-06-24 22:52:16','settings')
 ,(53,'2011-06-24 22:52:16','2011-06-24 22:52:16','mail')
 ,(54,'2011-06-24 22:52:16','2011-06-24 22:52:16','marketplace')
 ,(55,'2011-06-24 22:52:16','2011-06-24 22:52:16','download_file')
 ,(63,'2011-06-24 22:52:16','2011-06-24 22:52:16','uID=1')
 ,(64,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL)
 ,(65,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL)
 ,(66,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL)
 ,(77,'2011-06-25 09:06:51','2011-06-25 21:10:29','learn-about-bitcoins')
 ,(76,'2011-06-25 08:51:17','2011-06-25 20:01:12','business-directory')
 ,(75,'2011-06-25 08:46:54','2011-06-25 20:01:51','contact-us')
 ,(71,'2011-06-24 22:52:16','2011-06-25 20:16:08','blog')
 ,(79,'2011-06-25 18:55:24','2011-06-25 19:01:12','aggregating')
 ,(74,'2011-06-24 22:52:16','2011-06-24 22:52:16','members');

DROP TABLE IF EXISTS Config;

CREATE TABLE IF NOT EXISTS `Config` (
  `cfKey` varchar(64) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cfValue` longtext,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cfKey`,`uID`),
  KEY `uID` (`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO Config VALUES('SITE','2011-06-24 22:52:18','Search Bitcoin',0,0)
 ,('SITE_APP_VERSION','2011-06-24 22:52:18','5.4.1',0,0)
 ,('SITE_DEBUG_LEVEL','2011-06-24 22:52:18','1',0,0)
 ,('ENABLE_LOG_EMAILS','2011-06-24 22:52:18','1',0,0)
 ,('ENABLE_LOG_ERRORS','2011-06-24 22:52:18','1',0,0)
 ,('FULL_PAGE_CACHE_GLOBAL','2011-06-24 22:52:18','0',0,0)
 ,('ENABLE_MARKETPLACE_SUPPORT','2011-06-24 22:52:41','1',0,0)
 ,('APP_VERSION_LATEST','2011-06-25 06:36:00','5.4.1.1',0,0)
 ,('MARKETPLACE_SITE_TOKEN','2011-06-25 08:30:42','AVyo8DG0ZWgbNH1WzD88Daf5fwnXwLcCeocE72nRpp7F5PTIklpl4HXNelePJuQk',0,0)
 ,('MARKETPLACE_SITE_URL_TOKEN','2011-06-25 08:30:42','jsfahyz62gzyrqccm68sbd0d',0,0)
 ,('CONTENTS_TXT_EDITOR_MODE','2011-06-25 15:23:59','SIMPLE',0,0)
 ,('CONTENTS_TXT_EDITOR_WIDTH','2011-06-25 15:23:59','580',0,0)
 ,('CONTENTS_TXT_EDITOR_HEIGHT','2011-06-25 15:23:59','400',0,0)
 ,('STATISTICS_TRACK_PAGE_VIEWS','2011-06-25 20:06:03','0',0,0);

DROP TABLE IF EXISTS CustomStylePresets;

CREATE TABLE IF NOT EXISTS `CustomStylePresets` (
  `cspID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cspName` varchar(255) NOT NULL,
  `csrID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cspID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS CustomStyleRules;

CREATE TABLE IF NOT EXISTS `CustomStyleRules` (
  `csrID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `css_id` varchar(128) DEFAULT NULL,
  `css_class` varchar(128) DEFAULT NULL,
  `css_serialized` text,
  `css_custom` text,
  PRIMARY KEY (`csrID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO CustomStyleRules VALUES(1,'','','a:20:{s:11:\"font_family\";s:7:\"inherit\";s:5:\"color\";s:0:\"\";s:9:\"font_size\";s:0:\"\";s:11:\"line_height\";s:0:\"\";s:10:\"text_align\";s:6:\"center\";s:16:\"background_color\";s:0:\"\";s:12:\"border_style\";s:4:\"none\";s:12:\"border_color\";s:0:\"\";s:12:\"border_width\";s:1:\"0\";s:15:\"border_position\";s:4:\"full\";s:10:\"margin_top\";s:0:\"\";s:12:\"margin_right\";s:0:\"\";s:13:\"margin_bottom\";s:0:\"\";s:11:\"margin_left\";s:0:\"\";s:11:\"padding_top\";s:0:\"\";s:13:\"padding_right\";s:0:\"\";s:14:\"padding_bottom\";s:0:\"\";s:12:\"padding_left\";s:0:\"\";s:16:\"background_image\";s:1:\"0\";s:17:\"background_repeat\";s:9:\"no-repeat\";}','')
 ,(2,'','','a:20:{s:11:\"font_family\";s:7:\"inherit\";s:5:\"color\";s:0:\"\";s:9:\"font_size\";s:0:\"\";s:11:\"line_height\";s:0:\"\";s:10:\"text_align\";s:0:\"\";s:16:\"background_color\";s:0:\"\";s:12:\"border_style\";s:4:\"none\";s:12:\"border_color\";s:0:\"\";s:12:\"border_width\";s:1:\"0\";s:15:\"border_position\";s:4:\"full\";s:10:\"margin_top\";s:0:\"\";s:12:\"margin_right\";s:0:\"\";s:13:\"margin_bottom\";s:0:\"\";s:11:\"margin_left\";s:0:\"\";s:11:\"padding_top\";s:0:\"\";s:13:\"padding_right\";s:0:\"\";s:14:\"padding_bottom\";s:0:\"\";s:12:\"padding_left\";s:0:\"\";s:16:\"background_image\";s:1:\"0\";s:17:\"background_repeat\";s:9:\"no-repeat\";}','');

DROP TABLE IF EXISTS DashboardHomepage;

CREATE TABLE IF NOT EXISTS `DashboardHomepage` (
  `dbhID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dbhModule` varchar(255) NOT NULL,
  `dbhDisplayName` varchar(255) DEFAULT NULL,
  `dbhDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dbhID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO DashboardHomepage VALUES(1,'activity','Site Activity',0,0)
 ,(2,'reports','Statistics',0,0)
 ,(3,'help','Help',0,0)
 ,(4,'news','Latest News',0,0)
 ,(5,'notes','Notes',0,0);

DROP TABLE IF EXISTS DownloadStatistics;

CREATE TABLE IF NOT EXISTS `DownloadStatistics` (
  `dsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fID` int(10) unsigned NOT NULL,
  `fvID` int(10) unsigned NOT NULL,
  `uID` int(10) unsigned NOT NULL,
  `rcID` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS FileAttributeValues;

CREATE TABLE IF NOT EXISTS `FileAttributeValues` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`,`fvID`,`akID`,`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO FileAttributeValues VALUES(6,1,9,90)
 ,(6,1,10,91)
 ,(7,1,9,92)
 ,(7,1,10,93)
 ,(7,2,9,94)
 ,(7,2,10,95)
 ,(8,1,9,116)
 ,(8,1,10,117);

DROP TABLE IF EXISTS FilePermissionFileTypes;

CREATE TABLE IF NOT EXISTS `FilePermissionFileTypes` (
  `fsID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `extension` varchar(32) NOT NULL,
  PRIMARY KEY (`fsID`,`gID`,`uID`,`extension`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS FilePermissions;

CREATE TABLE IF NOT EXISTS `FilePermissions` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `canRead` int(4) NOT NULL DEFAULT '0',
  `canWrite` int(4) NOT NULL DEFAULT '0',
  `canAdmin` int(4) NOT NULL DEFAULT '0',
  `canSearch` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`,`gID`,`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS FileSearchIndexAttributes;

CREATE TABLE IF NOT EXISTS `FileSearchIndexAttributes` (
  `fID` int(11) unsigned NOT NULL DEFAULT '0',
  `ak_width` decimal(14,4) DEFAULT '0.0000',
  `ak_height` decimal(14,4) DEFAULT '0.0000',
  PRIMARY KEY (`fID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO FileSearchIndexAttributes VALUES(1,800.0000,192.0000)
 ,(2,800.0000,192.0000)
 ,(3,800.0000,192.0000)
 ,(4,800.0000,215.0000)
 ,(5,800.0000,192.0000)
 ,(6,225.0000,225.0000)
 ,(7,199.0000,100.0000)
 ,(8,128.0000,128.0000);

DROP TABLE IF EXISTS FileSetFiles;

CREATE TABLE IF NOT EXISTS `FileSetFiles` (
  `fsfID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fID` int(10) unsigned NOT NULL,
  `fsID` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fsDisplayOrder` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fsfID`),
  KEY `fID` (`fID`),
  KEY `fsID` (`fsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS FileSetPermissions;

CREATE TABLE IF NOT EXISTS `FileSetPermissions` (
  `fsID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `canRead` int(4) DEFAULT NULL,
  `canWrite` int(4) DEFAULT NULL,
  `canAdmin` int(4) DEFAULT NULL,
  `canAdd` int(4) DEFAULT NULL,
  `canSearch` int(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`fsID`,`gID`,`uID`),
  KEY `canRead` (`canRead`),
  KEY `canWrite` (`canWrite`),
  KEY `canAdmin` (`canAdmin`),
  KEY `canSearch` (`canSearch`),
  KEY `canAdd` (`canAdd`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO FileSetPermissions VALUES(0,1,0,10,0,0,0,0)
 ,(0,2,0,10,0,0,0,0)
 ,(0,3,0,10,10,10,10,10);

DROP TABLE IF EXISTS FileSetSavedSearches;

CREATE TABLE IF NOT EXISTS `FileSetSavedSearches` (
  `fsID` int(10) unsigned NOT NULL DEFAULT '0',
  `fsSearchRequest` text,
  `fsResultColumns` text,
  PRIMARY KEY (`fsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS FileSets;

CREATE TABLE IF NOT EXISTS `FileSets` (
  `fsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fsName` varchar(64) NOT NULL,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `fsType` int(4) NOT NULL,
  `fsOverrideGlobalPermissions` int(4) DEFAULT NULL,
  PRIMARY KEY (`fsID`),
  KEY `fsOverrideGlobalPermissions` (`fsOverrideGlobalPermissions`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS FileStorageLocations;

CREATE TABLE IF NOT EXISTS `FileStorageLocations` (
  `fslID` int(10) unsigned NOT NULL DEFAULT '0',
  `fslName` varchar(255) NOT NULL,
  `fslDirectory` varchar(255) NOT NULL,
  PRIMARY KEY (`fslID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS FileVersionLog;

CREATE TABLE IF NOT EXISTS `FileVersionLog` (
  `fvlID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvUpdateTypeID` int(3) unsigned NOT NULL DEFAULT '0',
  `fvUpdateTypeAttributeID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fvlID`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

INSERT INTO FileVersionLog VALUES(38,8,1,4,0)
 ,(37,8,1,3,0)
 ,(34,8,1,5,9)
 ,(33,7,2,5,10)
 ,(36,8,1,2,0)
 ,(35,8,1,5,10)
 ,(32,7,2,5,9)
 ,(31,7,2,1,0)
 ,(21,6,1,5,9)
 ,(22,6,1,5,10)
 ,(23,6,1,2,0)
 ,(24,6,1,3,0)
 ,(25,6,1,4,0)
 ,(26,7,1,5,9)
 ,(27,7,1,5,10)
 ,(28,7,1,2,0)
 ,(29,7,1,3,0)
 ,(30,7,1,4,0);

DROP TABLE IF EXISTS FileVersions;

CREATE TABLE IF NOT EXISTS `FileVersions` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvFilename` varchar(255) NOT NULL,
  `fvPrefix` varchar(12) DEFAULT NULL,
  `fvGenericType` int(3) unsigned NOT NULL DEFAULT '0',
  `fvSize` int(20) unsigned NOT NULL DEFAULT '0',
  `fvTitle` varchar(255) DEFAULT NULL,
  `fvDescription` text,
  `fvTags` varchar(255) DEFAULT NULL,
  `fvIsApproved` int(10) unsigned NOT NULL DEFAULT '1',
  `fvDateAdded` datetime DEFAULT NULL,
  `fvApproverUID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvAuthorUID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvActivateDatetime` datetime DEFAULT NULL,
  `fvHasThumbnail1` int(1) NOT NULL DEFAULT '0',
  `fvHasThumbnail2` int(1) NOT NULL DEFAULT '0',
  `fvHasThumbnail3` int(1) NOT NULL DEFAULT '0',
  `fvExtension` varchar(32) DEFAULT NULL,
  `fvType` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`,`fvID`),
  KEY `fvExtension` (`fvType`),
  KEY `fvTitle` (`fvTitle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO FileVersions VALUES(8,1,'love_bitcoins.png','311309061361',1,6997,'love_bitcoins.png','We love bitcoins','\nBitcoins\n',1,'2011-06-25 21:09:21',1,1,'2011-06-25 21:09:21',1,1,0,'png',1)
 ,(7,2,'14860288809_kt8Hb.jpg','851309055365',1,9075,'Screenshot.png','Screenshot of bitcoin software','\nbitcoin software\n',1,'2011-06-25 19:29:25',1,1,'2011-06-25 19:27:17',1,1,0,'jpg',1)
 ,(6,1,'bitcoin.png','541309054672',1,62434,'bitcoin.png','Bitcoin logo','\nbitcoin\n',1,'2011-06-25 19:17:52',1,1,'2011-06-25 19:17:52',1,1,0,'png',1)
 ,(7,1,'Screenshot.png','921309055237',1,77510,'Screenshot.png','Screenshot of bitcoin software','\nbitcoin software\n',0,'2011-06-25 19:27:17',1,1,'2011-06-25 19:27:17',1,1,0,'png',1);

DROP TABLE IF EXISTS Files;

CREATE TABLE IF NOT EXISTS `Files` (
  `fID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fDateAdded` datetime DEFAULT NULL,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `fslID` int(10) unsigned NOT NULL DEFAULT '0',
  `ocID` int(10) unsigned NOT NULL,
  `fOverrideSetPermissions` int(1) NOT NULL DEFAULT '0',
  `fPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fID`,`uID`,`fslID`),
  KEY `fOverrideSetPermissions` (`fOverrideSetPermissions`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO Files VALUES(8,'2011-06-25 21:09:21',1,0,77,0,NULL)
 ,(6,'2011-06-25 19:17:52',1,0,77,0,NULL)
 ,(7,'2011-06-25 19:27:17',1,0,77,0,NULL);

DROP TABLE IF EXISTS Groups;

CREATE TABLE IF NOT EXISTS `Groups` (
  `gID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gName` varchar(128) NOT NULL,
  `gDescription` varchar(255) NOT NULL,
  `gUserExpirationIsEnabled` int(1) NOT NULL DEFAULT '0',
  `gUserExpirationMethod` varchar(12) DEFAULT NULL,
  `gUserExpirationSetDateTime` datetime DEFAULT NULL,
  `gUserExpirationInterval` int(10) unsigned NOT NULL DEFAULT '0',
  `gUserExpirationAction` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`gID`),
  UNIQUE KEY `gName` (`gName`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO Groups VALUES(1,'Guest','The guest group represents unregistered visitors to your site.',0,NULL,NULL,0,NULL)
 ,(2,'Registered Users','The registered users group represents all user accounts.',0,NULL,NULL,0,NULL)
 ,(3,'Administrators','',0,NULL,NULL,0,NULL);

DROP TABLE IF EXISTS Jobs;

CREATE TABLE IF NOT EXISTS `Jobs` (
  `jID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jName` varchar(100) NOT NULL,
  `jDescription` varchar(255) NOT NULL,
  `jDateInstalled` datetime DEFAULT NULL,
  `jDateLastRun` datetime DEFAULT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `jLastStatusText` varchar(255) DEFAULT NULL,
  `jLastStatusCode` smallint(4) NOT NULL DEFAULT '0',
  `jStatus` varchar(14) NOT NULL DEFAULT 'ENABLED',
  `jHandle` varchar(255) NOT NULL,
  `jNotUninstallable` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`jID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO Jobs VALUES(1,'Index Search Engine','Index the site to allow searching to work quickly and accurately.','2011-06-24 22:52:16','2011-06-24 22:52:16',0,'Index updated. 2 pages required reindexing.',0,'ENABLED','index_search',1)
 ,(2,'Generate Sitemap File','Generate the sitemap.xml file that search engines use to crawl your site.','2011-06-24 22:52:16','2011-06-24 22:52:16',0,'Sitemap XML File Saved.',0,'ENABLED','generate_sitemap',0)
 ,(3,'Process Email Posts','Polls an email account and grabs private messages/postings that are sent there..','2011-06-24 22:52:16','2011-06-24 22:52:16',0,'The Job was run successfully.',0,'ENABLED','process_email',0);

DROP TABLE IF EXISTS JobsLog;

CREATE TABLE IF NOT EXISTS `JobsLog` (
  `jlID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jID` int(10) unsigned NOT NULL,
  `jlMessage` varchar(255) NOT NULL,
  `jlTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jlError` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`jlID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS LayoutPresets;

CREATE TABLE IF NOT EXISTS `LayoutPresets` (
  `lpID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lpName` varchar(128) NOT NULL,
  `layoutID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lpID`),
  UNIQUE KEY `layoutID` (`layoutID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS Layouts;

CREATE TABLE IF NOT EXISTS `Layouts` (
  `layoutID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `layout_rows` int(5) NOT NULL DEFAULT '3',
  `layout_columns` int(3) NOT NULL DEFAULT '3',
  `spacing` int(3) NOT NULL DEFAULT '3',
  `breakpoints` varchar(255) NOT NULL DEFAULT '',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layoutID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS Logs;

CREATE TABLE IF NOT EXISTS `Logs` (
  `logID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logType` varchar(64) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `logText` longtext,
  `logIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`logID`),
  KEY `logType` (`logType`),
  KEY `logIsInternal` (`logIsInternal`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS MailImporters;

CREATE TABLE IF NOT EXISTS `MailImporters` (
  `miID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `miHandle` varchar(64) NOT NULL,
  `miServer` varchar(255) DEFAULT NULL,
  `miUsername` varchar(255) DEFAULT NULL,
  `miPassword` varchar(255) DEFAULT NULL,
  `miEncryption` varchar(32) DEFAULT NULL,
  `miIsEnabled` int(1) NOT NULL DEFAULT '0',
  `miEmail` varchar(255) DEFAULT NULL,
  `miPort` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`miID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO MailImporters VALUES(1,'private_message',NULL,NULL,NULL,NULL,0,NULL,0,0);

DROP TABLE IF EXISTS MailValidationHashes;

CREATE TABLE IF NOT EXISTS `MailValidationHashes` (
  `mvhID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `miID` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `mHash` varchar(128) NOT NULL,
  `mDateGenerated` int(10) unsigned NOT NULL DEFAULT '0',
  `mDateRedeemed` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`mvhID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS Packages;

CREATE TABLE IF NOT EXISTS `Packages` (
  `pkgID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pkgName` varchar(255) NOT NULL,
  `pkgHandle` varchar(64) NOT NULL,
  `pkgDescription` text,
  `pkgDateInstalled` datetime NOT NULL,
  `pkgIsInstalled` tinyint(1) NOT NULL DEFAULT '1',
  `pkgVersion` varchar(32) DEFAULT NULL,
  `pkgAvailableVersion` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pkgID`),
  UNIQUE KEY `pkgHandle` (`pkgHandle`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO Packages VALUES(1,'Featuring Theme','theme_featuring','Installs Featuring theme.','2011-06-25 08:31:27',1,'1.0',NULL)
 ,(2,'Simple Blue','theme_simple_blue','Install the theme Simple Blue, a clean and simple two column theme.','2011-06-25 08:32:16',1,'1.1',NULL)
 ,(3,'Innovation Theme','theme_innovation','Installs Innovation theme.','2011-06-25 08:32:52',1,'1.0',NULL)
 ,(4,'Solutions Theme','theme_solutions','Installs Solutions theme.','2011-06-25 08:33:12',1,'1.0',NULL)
 ,(5,'ZenLike','cannonf700_zenlike','A free, lightweight, tableless, fluid W3C-compliant website design by NodeThirtyThree Design. Converted by www.rynomediaonline.com','2011-06-25 08:34:17',1,'1.02',NULL)
 ,(6,'Speech Bubbles','theme_speech_bubbles','Installs Speech Bubbles theme','2011-06-25 08:35:45',1,'1.0.4',NULL)
 ,(7,'Neuphoric','theme_neuphoric','Installs the Neuphoric theme.','2011-06-25 08:36:26',1,'1.0',NULL)
 ,(8,'Column Cruiser','theme_column_cruiser','Installs Column Cruiser theme.','2011-06-25 08:37:18',1,'1.1',NULL);

DROP TABLE IF EXISTS PagePaths;

CREATE TABLE IF NOT EXISTS `PagePaths` (
  `ppID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned DEFAULT '0',
  `cPath` text,
  `ppIsCanonical` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ppID`),
  KEY `cID` (`cID`),
  KEY `ppIsCanonical` (`ppIsCanonical`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

INSERT INTO PagePaths VALUES(1,5,'/login','1')
 ,(2,6,'/register','1')
 ,(3,7,'/profile','1')
 ,(4,8,'/profile/edit','1')
 ,(6,10,'/profile/avatar','1')
 ,(7,11,'/profile/messages','1')
 ,(8,12,'/profile/friends','1')
 ,(9,13,'/page_not_found','1')
 ,(10,14,'/page_forbidden','1')
 ,(11,15,'/dashboard','1')
 ,(12,16,'/dashboard/sitemap','1')
 ,(13,17,'/dashboard/sitemap/full','1')
 ,(14,18,'/dashboard/sitemap/explore','1')
 ,(15,19,'/dashboard/sitemap/search','1')
 ,(16,20,'/dashboard/sitemap/access','1')
 ,(17,21,'/dashboard/files','1')
 ,(18,22,'/dashboard/files/search','1')
 ,(19,23,'/dashboard/files/attributes','1')
 ,(20,24,'/dashboard/files/sets','1')
 ,(21,25,'/dashboard/files/access','1')
 ,(22,26,'/dashboard/reports','1')
 ,(23,27,'/dashboard/reports/forms','1')
 ,(24,28,'/dashboard/reports/surveys','1')
 ,(25,29,'/dashboard/reports/logs','1')
 ,(26,30,'/dashboard/users','1')
 ,(27,31,'/dashboard/users/search','1')
 ,(28,32,'/dashboard/users/add','1')
 ,(29,33,'/dashboard/users/groups','1')
 ,(30,34,'/dashboard/users/attributes','1')
 ,(31,35,'/dashboard/users/registration','1')
 ,(32,36,'/dashboard/scrapbook','1')
 ,(33,37,'/dashboard/pages','1')
 ,(34,38,'/dashboard/pages/themes','1')
 ,(35,39,'/dashboard/pages/themes/add','1')
 ,(36,40,'/dashboard/pages/themes/inspect','1')
 ,(37,41,'/dashboard/pages/themes/customize','1')
 ,(38,42,'/dashboard/pages/themes/marketplace','1')
 ,(39,43,'/dashboard/pages/types','1')
 ,(40,44,'/dashboard/pages/attributes','1')
 ,(41,45,'/dashboard/pages/single','1')
 ,(42,46,'/dashboard/install','1')
 ,(43,47,'/dashboard/system','1')
 ,(44,48,'/dashboard/system/jobs','1')
 ,(45,49,'/dashboard/system/backup','1')
 ,(46,50,'/dashboard/system/update','1')
 ,(47,51,'/dashboard/system/notifications','1')
 ,(48,52,'/dashboard/settings','1')
 ,(49,53,'/dashboard/settings/mail','1')
 ,(50,54,'/dashboard/settings/marketplace','1')
 ,(51,55,'/download_file','1')
 ,(119,77,'/learn-about-bitcoins','1')
 ,(112,75,'/contact-us','1')
 ,(117,71,'/blog','1')
 ,(118,79,'/blog/aggregating-the-btcoin-economy','1')
 ,(66,74,'/members','1')
 ,(111,76,'/business-directory','1');

DROP TABLE IF EXISTS PagePermissionPageTypes;

CREATE TABLE IF NOT EXISTS `PagePermissionPageTypes` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`gID`,`uID`,`ctID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS PagePermissions;

CREATE TABLE IF NOT EXISTS `PagePermissions` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `cgPermissions` varchar(32) DEFAULT NULL,
  `cgStartDate` datetime DEFAULT NULL,
  `cgEndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`cID`,`gID`,`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO PagePermissions VALUES(5,1,0,'r',NULL,NULL)
 ,(5,2,0,'r',NULL,NULL)
 ,(6,1,0,'r',NULL,NULL)
 ,(15,3,0,'r:wa:adm',NULL,NULL)
 ,(1,1,0,'r',NULL,NULL)
 ,(1,3,0,'r:rv:wa:db:av:dc:adm',NULL,NULL);

DROP TABLE IF EXISTS PageSearchIndex;

CREATE TABLE IF NOT EXISTS `PageSearchIndex` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text,
  `cName` varchar(255) DEFAULT NULL,
  `cDescription` text,
  `cPath` text,
  `cDatePublic` datetime DEFAULT NULL,
  `cDateLastIndexed` datetime DEFAULT NULL,
  `cDateLastSitemapped` datetime DEFAULT NULL,
  PRIMARY KEY (`cID`),
  KEY `cDateLastIndexed` (`cDateLastIndexed`),
  KEY `cDateLastSitemapped` (`cDateLastSitemapped`),
  FULLTEXT KEY `cName` (`cName`),
  FULLTEXT KEY `cDescription` (`cDescription`),
  FULLTEXT KEY `content` (`content`),
  FULLTEXT KEY `content2` (`cName`,`cDescription`,`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO PageSearchIndex VALUES(1,' Bitcoin Classifieds: A leader in online ads where you can find merchandise for sale for bitcoins.  Welcome to search bitcoin, the website dedicated to helping you find merchandise and services available in the bitcoin community.  This plugin is part of our mission to help make the bitcoin community more accessible to the general public. Numerous sites currently use it to help support the bitcoin economy, and so can you. The plugin can easily be added to almost any website using the&nbsp;embed button&nbsp;in the plugin.   We are building a search engine that focuses on bitcoin merchandise and services. Check out the items we have found in our live feed.   Bidding Pond: This was the first website where people could place bids in bitcoins on used merchandise. It is essentially eBay for bitcoins.   The Trade Page: The trade page is a community driven wikipedia style page where people list their bitcoin website. It is arguably the most comprehensive directory listing of bitcoins products and services.  There are many great websites for finding merchandise in the bitcoin community. Here are just a few. \r\n\r\n  ','Bitcoin Merchandise','',NULL,'2011-06-24 22:52:00','2011-06-25 21:07:00',NULL)
 ,(42,'','Marketplace',NULL,'/dashboard/pages/themes/marketplace','2011-06-24 22:52:16','2011-06-24 22:52:16',NULL)
 ,(77,'There are many other great websites that can help you get started. Here are a few.  Bitcoin.org: Use this website to download the latest version of the bitcoin software, and to get your first bitcoin address. The software is free to use and open source.   My Bitcoin: The quickest way to get a bitcoin address is to use a bitcoin bank, which will run the bitcoin software for you on their servers. My bitcoin was the first online bitcoin bank.   Trade Hill: Trade hill is another commonly used exchange where people buy and sell bitcoins online.   Mt Gox: Mt Gox was the first online bitcoin exchange where people could go to buy and sell bitcoins.&nbsp;  Are you new to bitcoins? If so, then you\'ve found a great place to start.  Bitcoins are one of the few true digital currencies in existence, and although the technology behind bitcoins is complex, the currency is simple to use. Bitcoins are unique in that they have been designed with security in mind, can be traded online as easily as emails are sent, and are decentralized so that no authority can undermine the transactions. \r\n So what do people use bitcoins for? Well, you can see from our search page that you can use bitcoins to buy essentially any commidity or service that you can buy with traditional money. In fact, there are hundreds of businesses that collectively offer tens of thousands of products, and these numbers grow each day at an exponential rate. \r\n So how do you get bitcoins? The first step is to download the bitcoin software. The program is easy to install. Once you install it, you will be given a bitcoin address. This is kind of like an email address that is for receiving money online. A typical bitcoin address looks something like ours (17gcmYY8Q7nPagk4zKRwjtgxrUvvBcFhDr). The bitcoin software may take awhile to sync with the rest of the bitcoin network. If you don\'t want to wait this long, you can use any of the online bitcoin banks, which will operate the bitcoin software for you, to quickly get your first bitcoin address. \r\n Once you have setup a bitcoin account, you can use the bitcoin faucet to get your first&nbsp;bit-change for free. The bit-change will be sent to your account and saved in your computer (all coins are saved into a special file called the wallet file). If you want more bitcoins you will probably have to purchase them from an exchange. The exchanges are websites where people can buy and sell bitcoins. I suggest that you sign-up at an exchange now, because it typically can take up to a week to verify your account. \r\n You can also use the bitcoin software to generate new bitcoins. Wait! You can just print off new money in this currency? Well, yes, but it becomes harder to generate new bitcoins as more and more are made. This is on purpose, to ensure a limited supply of bitcoins. In fact, there is a limit on the total number of bitcoins that can be generated. I recommend against trying to generate new bitcoins, unless you have a high-end model computer. Otherwise, you may be waiting around for a long time.  ','Learn About Bitcoins','','/learn-about-bitcoins','2011-06-25 09:06:00','2011-06-25 21:10:30',NULL)
 ,(66,' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vel tellus lectus, scelerisque faucibus nunc. Curabitur lacus nibh, eleifend vel porttitor in, bibendum quis tortor. Curabitur eros ligula, scelerisque ac ultricies a, dictum ac tellus. Mauris id tellus tortor. Proin a sollicitudin libero. Nam pellentesque commodo magna, nec mattis elit pulvinar id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris orci dui, adipiscing sit amet bibendum vel, sodales sed purus. Donec fringilla odio vel enim cursus luctus quis semper leo. Donec rhoncus odio ac elit dignissim lobortis. \r\n &nbsp;   Duis dapibus nibh eu arcu viverra tempor. Fusce auctor sapien eu mauris malesuada vel euismod orci vulputate. Curabitur at orci id quam mollis rhoncus vitae volutpat urna. Nam eget sapien at neque mollis varius sed vitae ipsum. Vestibulum commodo, eros sit amet sagittis cursus, massa mi lacinia lorem, vel pellentesque sapien purus eu lacus. Pellentesque mollis gravida enim. Fusce mi odio, elementum ut fermentum a, pharetra in quam. Mauris sed vestibulum sapien. In sit amet faucibus diam. Proin lectus quam, sodales ut posuere non, viverra a nibh. Aenean sollicitudin, diam eu elementum rutrum, nisi ante pretium mi, ut tristique ante tellus non ligula. Nam diam turpis, viverra non volutpat vel, scelerisque vel neque. In pretium, libero et vulputate varius, libero nulla blandit ligula, tincidunt egestas leo mi eu nisi. Mauris nunc augue, cursus vel viverra non, feugiat in enim. In eget dignissim est. Donec dictum leo in libero tincidunt sollicitudin hendrerit elit placerat. Aliquam vitae nunc diam, non vulputate nibh. Quisque tincidunt, dui ut rutrum feugiat, libero lorem interdum sapien, eget pharetra mi ligula ut lectus. Pellentesque consequat mollis est viverra malesuada. \r\n Curabitur eget quam vitae tellus blandit congue a sed lectus. Nunc ultrices lacus dignissim felis venenatis varius placerat eros dapibus. Nulla facilisi. Vivamus sodales accumsan convallis. Mauris congue tempus feugiat. Proin elementum fringilla leo, sit amet pretium nisl imperdiet interdum. Suspendisse volutpat cursus eros, nec porta est laoreet at. Sed porttitor suscipit augue, eu molestie justo faucibus et. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus faucibus mi vel tortor consequat eget rutrum nisl ultrices. Praesent et lacinia augue. Phasellus id est id enim ultricies placerat. Etiam porta enim eu enim convallis sed eleifend metus faucibus. In ac lobortis eros. Pellentesque felis turpis, cursus sed imperdiet non, viverra vel diam. Donec vel orci mi, placerat egestas purus. Vestibulum vel diam id magna suscipit accumsan. Quisque risus felis, sagittis non iaculis id, tempus in arcu. Donec tempus metus neque. Proin malesuada dui a tortor pretium tincidunt quis at ligula. \r\n Nam laoreet faucibus purus ac pretium. Aenean euismod diam adipiscing erat semper quis sodales elit tristique. Vestibulum vel tellus eu lorem porttitor aliquet. Vestibulum bibendum viverra cursus. Aenean sit amet magna odio, convallis imperdiet metus. Duis condimentum posuere vulputate. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed vitae elit ut sapien vestibulum tempor sit amet ac tortor. Donec ligula nulla, varius id ornare id, vestibulum non felis. Nullam neque erat, tristique a eleifend pellentesque, eleifend sit amet ipsum. In eget urna nibh. Phasellus scelerisque, magna ac feugiat ultricies, risus dolor volutpat quam, in rutrum nunc ante id sem. Fusce interdum scelerisque fermentum. \r\n &nbsp;  ','',NULL,NULL,'2011-06-24 22:52:16','2011-06-24 22:52:16',NULL)
 ,(75,'We love hearing from our users. We welcome your suggestions, criticisms, and questions.  You can also email us directory at jared@bitcoinbulletin.com.   Use the online form to send us a message. We will get back to you as quickly as possible.  Here are the names of some of the biggest players in the bitcoin community.  Satoshi Nakamoto: Satoshi is the founder of bitcoin and the author of the initial bitcoin software. No one really knows who he or she is because Satoshi has preferred to remain anonymous.   Gavin Andresen: Gavin is the current lead developer for the bitcoin software.   Bruce Wagner: Bruce is the bitcoin media guru. He loves to talk about bitcoins, and if he is not already on the phone he will answer your call.  ','Contact Us','Help us improve this website. We welcome questions, criticisms, and general comments about the search bitcoin.','/contact-us','2011-06-25 08:43:00','2011-06-25 20:01:52',NULL)
 ,(76,'There are many great websites where you can find other bitcoins businesses. Here are a few of them. We are committed to the development of a Bitcoin Chamber of Commerce. To that end we are offering our entire database of all the businesses we have found that accept bitcoins.  Stay tuned. This page is under construction.   Bitsites: Bitsites is the equivalent of Yelp for bitcoin businesses. We are currently in the process of sharing our database of bitcoin businesses with them.  ','Business Directory','','/business-directory','2011-06-25 08:50:00','2011-06-25 20:01:13',NULL)
 ,(71,'There are lots of great places to hosting discussions about bitcoins. Here are some of the popular ones.  Bitcoin Blogger: One of the first blogs about bitcoins.   The Bitcoin Forums: The best place to talk with other people in the bitcoin community.   Witcoin: A social media website dedicated to bitcoins.   Bitcoin Bulletin: The bitcoin bulletin, among other things, helps to promote the bitcoin economy with their Meet the Trader interviews.  Stay tuned to learn about the exciting things that are just around the corner. ','Blog','','/blog','2011-06-24 22:52:00','2011-06-25 20:16:09',NULL)
 ,(79,' First of all, let us welcome you to search bitcoin. We at search bitcoin are working hard to index all the bitcoin websites on the web. It is aggregate all the bitcoin products and services offered by the bitcoin community to give you a bird\'s eye view of the state of the economy, and to help you find the stuff you are looking for. This is a tremendously difficult project, but we are making headway. Already we\'ve added just over 100 businesses to our directory, and indexed several thousand items of merchandise offered through these stores. Stay tuned for exciting things to come!  ','Aggregating the Btcoin Economy','First of all, let us welcome you to search bitcoin. We at search bitcoin are working hard to index all the bitcoin websites on the web. It is aggregate all the bitcoin products and services offered by the bitcoin community to give you a bird\'s eye view of the state of the economy, and to help you find the stuff you are looking for. This is a tremendously difficult project, but we are making headway. Already we\'ve added just over 100 businesses to our directory, and indexed several thousand items of merchandise offered through these stores. Stay tuned for exciting things to come!','/blog/aggregating-the-btcoin-economy','2011-06-25 18:49:00','2011-06-25 19:01:12',NULL);

DROP TABLE IF EXISTS PageStatistics;

CREATE TABLE IF NOT EXISTS `PageStatistics` (
  `pstID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pstID`),
  KEY `cID` (`cID`),
  KEY `date` (`date`),
  KEY `uID` (`uID`)
) ENGINE=MyISAM AUTO_INCREMENT=529 DEFAULT CHARSET=utf8;

INSERT INTO PageStatistics VALUES(1,1,'2011-06-24','2011-06-24 22:52:42',1)
 ,(2,1,'2011-06-24','2011-06-24 22:52:59',1)
 ,(3,1,'2011-06-24','2011-06-24 22:53:28',1)
 ,(4,1,'2011-06-24','2011-06-24 22:53:49',1)
 ,(5,1,'2011-06-24','2011-06-24 22:58:27',1)
 ,(6,1,'2011-06-24','2011-06-24 22:59:59',1)
 ,(7,1,'2011-06-24','2011-06-24 23:00:14',1)
 ,(8,1,'2011-06-25','2011-06-25 06:34:59',0)
 ,(9,1,'2011-06-25','2011-06-25 06:35:14',0)
 ,(10,5,'2011-06-25','2011-06-25 06:35:20',0)
 ,(11,5,'2011-06-25','2011-06-25 06:35:40',0)
 ,(12,1,'2011-06-25','2011-06-25 06:35:42',1)
 ,(13,15,'2011-06-25','2011-06-25 06:35:55',1)
 ,(14,1,'2011-06-25','2011-06-25 06:36:06',0)
 ,(15,1,'2011-06-25','2011-06-25 06:36:10',0)
 ,(16,5,'2011-06-25','2011-06-25 08:23:41',0)
 ,(17,5,'2011-06-25','2011-06-25 08:23:43',0)
 ,(18,1,'2011-06-25','2011-06-25 08:23:44',1)
 ,(19,1,'2011-06-25','2011-06-25 08:24:21',1)
 ,(20,1,'2011-06-25','2011-06-25 08:26:49',1)
 ,(21,1,'2011-06-25','2011-06-25 08:27:08',1)
 ,(22,1,'2011-06-25','2011-06-25 08:27:10',1)
 ,(23,15,'2011-06-25','2011-06-25 08:28:48',1)
 ,(24,37,'2011-06-25','2011-06-25 08:28:52',1)
 ,(25,38,'2011-06-25','2011-06-25 08:28:52',1)
 ,(26,46,'2011-06-25','2011-06-25 08:29:01',1)
 ,(27,54,'2011-06-25','2011-06-25 08:29:07',1)
 ,(28,54,'2011-06-25','2011-06-25 08:30:42',1)
 ,(29,46,'2011-06-25','2011-06-25 08:30:43',1)
 ,(30,46,'2011-06-25','2011-06-25 08:30:53',1)
 ,(31,46,'2011-06-25','2011-06-25 08:31:36',1)
 ,(32,46,'2011-06-25','2011-06-25 08:31:38',1)
 ,(33,38,'2011-06-25','2011-06-25 08:32:18',1)
 ,(34,46,'2011-06-25','2011-06-25 08:32:29',1)
 ,(35,46,'2011-06-25','2011-06-25 08:32:35',1)
 ,(36,46,'2011-06-25','2011-06-25 08:32:42',1)
 ,(37,46,'2011-06-25','2011-06-25 08:33:01',1)
 ,(38,46,'2011-06-25','2011-06-25 08:33:30',1)
 ,(39,46,'2011-06-25','2011-06-25 08:33:33',1)
 ,(40,46,'2011-06-25','2011-06-25 08:33:43',1)
 ,(41,46,'2011-06-25','2011-06-25 08:33:53',1)
 ,(42,46,'2011-06-25','2011-06-25 08:34:04',1)
 ,(43,38,'2011-06-25','2011-06-25 08:34:22',1)
 ,(44,46,'2011-06-25','2011-06-25 08:35:26',1)
 ,(45,38,'2011-06-25','2011-06-25 08:35:48',1)
 ,(46,46,'2011-06-25','2011-06-25 08:36:09',1)
 ,(47,46,'2011-06-25','2011-06-25 08:36:41',1)
 ,(48,46,'2011-06-25','2011-06-25 08:36:50',1)
 ,(49,46,'2011-06-25','2011-06-25 08:37:03',1)
 ,(50,46,'2011-06-25','2011-06-25 08:37:07',1)
 ,(51,38,'2011-06-25','2011-06-25 08:37:21',1)
 ,(52,38,'2011-06-25','2011-06-25 08:38:17',1)
 ,(53,38,'2011-06-25','2011-06-25 08:38:21',1)
 ,(54,1,'2011-06-25','2011-06-25 08:38:24',1)
 ,(55,1,'2011-06-25','2011-06-25 08:38:38',1)
 ,(56,69,'2011-06-25','2011-06-25 08:41:08',1)
 ,(57,69,'2011-06-25','2011-06-25 08:41:12',1)
 ,(58,69,'2011-06-25','2011-06-25 08:41:42',1)
 ,(59,69,'2011-06-25','2011-06-25 08:42:11',1)
 ,(60,1,'2011-06-25','2011-06-25 08:42:15',1)
 ,(61,67,'2011-06-25','2011-06-25 08:42:34',1)
 ,(62,67,'2011-06-25','2011-06-25 08:42:35',1)
 ,(63,67,'2011-06-25','2011-06-25 08:42:49',1)
 ,(64,69,'2011-06-25','2011-06-25 08:43:22',1)
 ,(65,69,'2011-06-25','2011-06-25 08:43:23',1)
 ,(66,69,'2011-06-25','2011-06-25 08:43:35',1)
 ,(67,69,'2011-06-25','2011-06-25 08:43:40',1)
 ,(68,1,'2011-06-25','2011-06-25 08:43:50',1)
 ,(69,75,'2011-06-25','2011-06-25 08:46:57',1)
 ,(70,1,'2011-06-25','2011-06-25 08:47:25',1)
 ,(71,1,'2011-06-25','2011-06-25 08:48:00',1)
 ,(72,67,'2011-06-25','2011-06-25 08:48:03',1)
 ,(73,67,'2011-06-25','2011-06-25 08:48:18',1)
 ,(74,15,'2011-06-25','2011-06-25 08:48:29',1)
 ,(75,16,'2011-06-25','2011-06-25 08:48:40',1)
 ,(76,17,'2011-06-25','2011-06-25 08:48:40',1)
 ,(77,75,'2011-06-25','2011-06-25 08:49:33',1)
 ,(78,15,'2011-06-25','2011-06-25 08:50:14',1)
 ,(79,1,'2011-06-25','2011-06-25 08:50:21',1)
 ,(80,76,'2011-06-25','2011-06-25 08:51:20',1)
 ,(81,15,'2011-06-25','2011-06-25 08:51:36',1)
 ,(82,16,'2011-06-25','2011-06-25 08:51:39',1)
 ,(83,17,'2011-06-25','2011-06-25 08:51:39',1)
 ,(84,76,'2011-06-25','2011-06-25 08:51:50',1)
 ,(85,15,'2011-06-25','2011-06-25 08:52:03',1)
 ,(86,16,'2011-06-25','2011-06-25 08:52:07',1)
 ,(87,17,'2011-06-25','2011-06-25 08:52:07',1)
 ,(88,1,'2011-06-25','2011-06-25 08:52:33',1)
 ,(89,1,'2011-06-25','2011-06-25 08:52:42',1)
 ,(90,15,'2011-06-25','2011-06-25 08:53:12',1)
 ,(91,16,'2011-06-25','2011-06-25 08:53:16',1)
 ,(92,17,'2011-06-25','2011-06-25 08:53:16',1)
 ,(93,1,'2011-06-25','2011-06-25 08:53:20',1)
 ,(94,15,'2011-06-25','2011-06-25 08:53:38',1)
 ,(95,16,'2011-06-25','2011-06-25 08:53:40',1)
 ,(96,17,'2011-06-25','2011-06-25 08:53:40',1)
 ,(97,15,'2011-06-25','2011-06-25 08:54:02',1)
 ,(98,16,'2011-06-25','2011-06-25 08:54:06',1)
 ,(99,17,'2011-06-25','2011-06-25 08:54:07',1)
 ,(100,1,'2011-06-25','2011-06-25 08:54:32',1)
 ,(101,15,'2011-06-25','2011-06-25 08:55:41',1)
 ,(102,16,'2011-06-25','2011-06-25 08:55:45',1)
 ,(103,17,'2011-06-25','2011-06-25 08:55:45',1)
 ,(104,17,'2011-06-25','2011-06-25 08:55:53',1)
 ,(105,17,'2011-06-25','2011-06-25 08:56:00',1)
 ,(106,18,'2011-06-25','2011-06-25 08:56:03',1)
 ,(107,1,'2011-06-25','2011-06-25 08:56:33',1)
 ,(108,5,'2011-06-25','2011-06-25 08:57:18',1)
 ,(109,1,'2011-06-25','2011-06-25 08:57:18',0)
 ,(110,1,'2011-06-25','2011-06-25 09:01:45',0)
 ,(111,5,'2011-06-25','2011-06-25 09:02:05',0)
 ,(112,5,'2011-06-25','2011-06-25 09:02:08',0)
 ,(113,1,'2011-06-25','2011-06-25 09:02:09',1)
 ,(114,5,'2011-06-25','2011-06-25 09:02:32',1)
 ,(115,1,'2011-06-25','2011-06-25 09:02:32',0)
 ,(116,1,'2011-06-25','2011-06-25 09:03:06',0)
 ,(117,5,'2011-06-25','2011-06-25 09:03:12',0)
 ,(118,5,'2011-06-25','2011-06-25 09:03:14',0)
 ,(119,1,'2011-06-25','2011-06-25 09:03:14',1)
 ,(120,15,'2011-06-25','2011-06-25 09:03:45',1)
 ,(121,16,'2011-06-25','2011-06-25 09:03:48',1)
 ,(122,17,'2011-06-25','2011-06-25 09:03:48',1)
 ,(123,1,'2011-06-25','2011-06-25 09:03:52',1)
 ,(124,17,'2011-06-25','2011-06-25 09:03:56',1)
 ,(125,18,'2011-06-25','2011-06-25 09:03:59',1)
 ,(126,1,'2011-06-25','2011-06-25 09:04:15',1)
 ,(127,1,'2011-06-25','2011-06-25 09:04:31',1)
 ,(128,67,'2011-06-25','2011-06-25 09:04:34',1)
 ,(129,75,'2011-06-25','2011-06-25 09:04:37',1)
 ,(130,75,'2011-06-25','2011-06-25 09:04:40',1)
 ,(131,15,'2011-06-25','2011-06-25 09:04:43',1)
 ,(132,16,'2011-06-25','2011-06-25 09:04:47',1)
 ,(133,17,'2011-06-25','2011-06-25 09:04:47',1)
 ,(134,18,'2011-06-25','2011-06-25 09:04:51',1)
 ,(135,17,'2011-06-25','2011-06-25 09:04:52',1)
 ,(136,18,'2011-06-25','2011-06-25 09:06:06',1)
 ,(137,17,'2011-06-25','2011-06-25 09:06:25',1)
 ,(138,1,'2011-06-25','2011-06-25 09:06:29',1)
 ,(139,77,'2011-06-25','2011-06-25 09:06:52',1)
 ,(140,15,'2011-06-25','2011-06-25 09:07:00',1)
 ,(141,16,'2011-06-25','2011-06-25 09:07:03',1)
 ,(142,17,'2011-06-25','2011-06-25 09:07:04',1)
 ,(143,18,'2011-06-25','2011-06-25 09:07:30',1)
 ,(144,17,'2011-06-25','2011-06-25 09:07:38',1)
 ,(145,76,'2011-06-25','2011-06-25 09:07:58',1)
 ,(146,17,'2011-06-25','2011-06-25 09:08:02',1)
 ,(147,1,'2011-06-25','2011-06-25 09:09:56',1)
 ,(148,1,'2011-06-25','2011-06-25 09:10:00',1)
 ,(149,15,'2011-06-25','2011-06-25 09:10:13',1)
 ,(150,16,'2011-06-25','2011-06-25 09:10:16',1)
 ,(151,17,'2011-06-25','2011-06-25 09:10:16',1)
 ,(152,16,'2011-06-25','2011-06-25 09:10:16',1)
 ,(153,17,'2011-06-25','2011-06-25 09:10:17',1)
 ,(154,18,'2011-06-25','2011-06-25 09:10:19',1)
 ,(155,74,'2011-06-25','2011-06-25 09:10:30',1)
 ,(156,1,'2011-06-25','2011-06-25 09:10:42',1)
 ,(157,1,'2011-06-25','2011-06-25 09:11:05',1)
 ,(158,77,'2011-06-25','2011-06-25 09:11:35',1)
 ,(159,77,'2011-06-25','2011-06-25 09:11:41',1)
 ,(160,1,'2011-06-25','2011-06-25 09:11:56',1)
 ,(161,76,'2011-06-25','2011-06-25 09:12:00',1)
 ,(162,75,'2011-06-25','2011-06-25 09:12:09',1)
 ,(163,71,'2011-06-25','2011-06-25 09:12:12',1)
 ,(164,76,'2011-06-25','2011-06-25 09:12:25',1)
 ,(165,77,'2011-06-25','2011-06-25 09:12:28',1)
 ,(166,77,'2011-06-25','2011-06-25 09:12:56',1)
 ,(167,77,'2011-06-25','2011-06-25 09:12:58',1)
 ,(168,77,'2011-06-25','2011-06-25 09:13:01',1)
 ,(169,76,'2011-06-25','2011-06-25 09:13:03',1)
 ,(170,75,'2011-06-25','2011-06-25 09:13:05',1)
 ,(171,1,'2011-06-25','2011-06-25 09:13:06',1)
 ,(172,1,'2011-06-25','2011-06-25 09:13:18',1)
 ,(173,71,'2011-06-25','2011-06-25 09:13:21',1)
 ,(174,75,'2011-06-25','2011-06-25 09:13:23',1)
 ,(175,75,'2011-06-25','2011-06-25 09:13:25',1)
 ,(176,76,'2011-06-25','2011-06-25 09:13:27',1)
 ,(177,77,'2011-06-25','2011-06-25 09:13:28',1)
 ,(178,1,'2011-06-25','2011-06-25 09:13:30',1)
 ,(179,1,'2011-06-25','2011-06-25 09:13:31',1)
 ,(180,77,'2011-06-25','2011-06-25 09:19:59',1)
 ,(181,1,'2011-06-25','2011-06-25 09:20:04',1)
 ,(182,1,'2011-06-25','2011-06-25 09:38:59',1)
 ,(183,1,'2011-06-25','2011-06-25 09:39:12',1)
 ,(184,1,'2011-06-25','2011-06-25 09:43:25',1)
 ,(185,1,'2011-06-25','2011-06-25 09:43:31',1)
 ,(186,1,'2011-06-25','2011-06-25 09:44:29',1)
 ,(187,1,'2011-06-25','2011-06-25 09:44:43',1)
 ,(188,15,'2011-06-25','2011-06-25 09:48:37',1)
 ,(189,16,'2011-06-25','2011-06-25 09:48:46',1)
 ,(190,17,'2011-06-25','2011-06-25 09:48:46',1)
 ,(191,77,'2011-06-25','2011-06-25 09:49:28',1)
 ,(192,5,'2011-06-25','2011-06-25 09:57:22',1)
 ,(193,1,'2011-06-25','2011-06-25 09:57:22',0)
 ,(194,5,'2011-06-25','2011-06-25 14:24:47',0)
 ,(195,5,'2011-06-25','2011-06-25 14:24:50',0)
 ,(196,1,'2011-06-25','2011-06-25 14:24:51',1)
 ,(197,1,'2011-06-25','2011-06-25 14:25:00',1)
 ,(198,1,'2011-06-25','2011-06-25 14:25:06',1)
 ,(199,1,'2011-06-25','2011-06-25 14:25:09',1)
 ,(200,1,'2011-06-25','2011-06-25 14:31:23',1)
 ,(201,77,'2011-06-25','2011-06-25 14:31:30',1)
 ,(202,77,'2011-06-25','2011-06-25 14:31:43',1)
 ,(203,15,'2011-06-25','2011-06-25 14:38:32',1)
 ,(204,16,'2011-06-25','2011-06-25 14:38:36',1)
 ,(205,17,'2011-06-25','2011-06-25 14:38:37',1)
 ,(206,47,'2011-06-25','2011-06-25 14:38:53',1)
 ,(207,48,'2011-06-25','2011-06-25 14:38:54',1)
 ,(208,26,'2011-06-25','2011-06-25 14:39:02',1)
 ,(209,27,'2011-06-25','2011-06-25 14:39:02',1)
 ,(210,21,'2011-06-25','2011-06-25 14:39:05',1)
 ,(211,22,'2011-06-25','2011-06-25 14:39:05',1)
 ,(212,16,'2011-06-25','2011-06-25 14:39:08',1)
 ,(213,17,'2011-06-25','2011-06-25 14:39:08',1)
 ,(214,30,'2011-06-25','2011-06-25 14:39:20',1)
 ,(215,31,'2011-06-25','2011-06-25 14:39:21',1)
 ,(216,30,'2011-06-25','2011-06-25 14:39:22',1)
 ,(217,31,'2011-06-25','2011-06-25 14:39:22',1)
 ,(218,34,'2011-06-25','2011-06-25 14:39:30',1)
 ,(219,52,'2011-06-25','2011-06-25 14:39:32',1)
 ,(220,52,'2011-06-25','2011-06-25 14:39:51',1)
 ,(221,52,'2011-06-25','2011-06-25 14:39:51',1)
 ,(222,52,'2011-06-25','2011-06-25 14:39:59',1)
 ,(223,52,'2011-06-25','2011-06-25 14:39:59',1)
 ,(224,52,'2011-06-25','2011-06-25 14:40:00',1)
 ,(225,52,'2011-06-25','2011-06-25 14:40:01',1)
 ,(226,1,'2011-06-25','2011-06-25 14:40:06',1)
 ,(227,1,'2011-06-25','2011-06-25 14:40:13',1)
 ,(228,77,'2011-06-25','2011-06-25 14:40:40',1)
 ,(229,77,'2011-06-25','2011-06-25 14:41:21',1)
 ,(230,77,'2011-06-25','2011-06-25 14:41:23',1)
 ,(231,77,'2011-06-25','2011-06-25 14:41:24',1)
 ,(232,77,'2011-06-25','2011-06-25 14:42:12',1)
 ,(233,77,'2011-06-25','2011-06-25 14:42:18',1)
 ,(234,15,'2011-06-25','2011-06-25 14:42:47',1)
 ,(235,52,'2011-06-25','2011-06-25 14:42:54',1)
 ,(236,52,'2011-06-25','2011-06-25 14:43:01',1)
 ,(237,52,'2011-06-25','2011-06-25 14:43:06',1)
 ,(238,52,'2011-06-25','2011-06-25 14:43:07',1)
 ,(239,52,'2011-06-25','2011-06-25 14:43:22',1)
 ,(240,52,'2011-06-25','2011-06-25 14:43:22',1)
 ,(241,1,'2011-06-25','2011-06-25 14:43:31',1)
 ,(242,1,'2011-06-25','2011-06-25 14:43:51',1)
 ,(243,77,'2011-06-25','2011-06-25 14:43:55',1)
 ,(244,77,'2011-06-25','2011-06-25 14:43:57',1)
 ,(245,15,'2011-06-25','2011-06-25 14:51:33',1)
 ,(246,52,'2011-06-25','2011-06-25 14:51:38',1)
 ,(247,52,'2011-06-25','2011-06-25 14:51:48',1)
 ,(248,52,'2011-06-25','2011-06-25 14:51:48',1)
 ,(249,1,'2011-06-25','2011-06-25 14:51:57',1)
 ,(250,77,'2011-06-25','2011-06-25 14:52:04',1)
 ,(251,15,'2011-06-25','2011-06-25 15:23:45',1)
 ,(252,52,'2011-06-25','2011-06-25 15:23:49',1)
 ,(253,52,'2011-06-25','2011-06-25 15:23:58',1)
 ,(254,52,'2011-06-25','2011-06-25 15:23:59',1)
 ,(255,1,'2011-06-25','2011-06-25 15:24:02',1)
 ,(256,77,'2011-06-25','2011-06-25 15:24:09',1)
 ,(257,1,'2011-06-25','2011-06-25 16:06:14',1)
 ,(258,77,'2011-06-25','2011-06-25 16:17:37',1)
 ,(259,1,'2011-06-25','2011-06-25 16:17:41',1)
 ,(260,77,'2011-06-25','2011-06-25 16:18:00',1)
 ,(261,76,'2011-06-25','2011-06-25 16:18:10',1)
 ,(262,1,'2011-06-25','2011-06-25 16:18:34',1)
 ,(263,1,'2011-06-25','2011-06-25 16:18:47',1)
 ,(264,15,'2011-06-25','2011-06-25 16:19:48',1)
 ,(265,16,'2011-06-25','2011-06-25 16:19:52',1)
 ,(266,17,'2011-06-25','2011-06-25 16:19:52',1)
 ,(267,75,'2011-06-25','2011-06-25 16:20:34',1)
 ,(268,15,'2011-06-25','2011-06-25 16:20:53',1)
 ,(269,16,'2011-06-25','2011-06-25 16:20:56',1)
 ,(270,17,'2011-06-25','2011-06-25 16:20:56',1)
 ,(271,1,'2011-06-25','2011-06-25 16:21:00',1)
 ,(272,15,'2011-06-25','2011-06-25 16:21:09',1)
 ,(273,16,'2011-06-25','2011-06-25 16:21:12',1)
 ,(274,17,'2011-06-25','2011-06-25 16:21:12',1)
 ,(275,75,'2011-06-25','2011-06-25 16:21:16',1)
 ,(276,15,'2011-06-25','2011-06-25 16:21:35',1)
 ,(277,16,'2011-06-25','2011-06-25 16:21:39',1)
 ,(278,17,'2011-06-25','2011-06-25 16:21:40',1)
 ,(279,1,'2011-06-25','2011-06-25 16:21:46',1)
 ,(280,15,'2011-06-25','2011-06-25 16:21:56',1)
 ,(281,16,'2011-06-25','2011-06-25 16:22:02',1)
 ,(282,17,'2011-06-25','2011-06-25 16:22:02',1)
 ,(283,77,'2011-06-25','2011-06-25 16:22:07',1)
 ,(284,77,'2011-06-25','2011-06-25 16:22:13',1)
 ,(285,15,'2011-06-25','2011-06-25 16:22:23',1)
 ,(286,16,'2011-06-25','2011-06-25 16:22:29',1)
 ,(287,17,'2011-06-25','2011-06-25 16:22:30',1)
 ,(288,75,'2011-06-25','2011-06-25 16:22:38',1)
 ,(289,15,'2011-06-25','2011-06-25 16:27:48',1)
 ,(290,16,'2011-06-25','2011-06-25 16:27:52',1)
 ,(291,17,'2011-06-25','2011-06-25 16:27:53',1)
 ,(292,18,'2011-06-25','2011-06-25 16:27:58',1)
 ,(293,75,'2011-06-25','2011-06-25 16:28:06',1)
 ,(294,75,'2011-06-25','2011-06-25 16:50:27',1)
 ,(295,71,'2011-06-25','2011-06-25 16:50:32',1)
 ,(296,76,'2011-06-25','2011-06-25 16:50:54',1)
 ,(297,77,'2011-06-25','2011-06-25 16:50:57',1)
 ,(298,77,'2011-06-25','2011-06-25 16:51:06',1)
 ,(299,77,'2011-06-25','2011-06-25 16:51:11',1)
 ,(300,76,'2011-06-25','2011-06-25 16:51:15',1)
 ,(301,75,'2011-06-25','2011-06-25 16:51:20',1)
 ,(302,77,'2011-06-25','2011-06-25 16:51:35',1)
 ,(303,1,'2011-06-25','2011-06-25 16:51:43',1)
 ,(304,1,'2011-06-25','2011-06-25 16:52:01',1)
 ,(305,1,'2011-06-25','2011-06-25 16:52:05',1)
 ,(306,77,'2011-06-25','2011-06-25 16:52:11',1)
 ,(307,77,'2011-06-25','2011-06-25 16:52:15',1)
 ,(308,76,'2011-06-25','2011-06-25 16:52:24',1)
 ,(309,75,'2011-06-25','2011-06-25 16:52:29',1)
 ,(310,71,'2011-06-25','2011-06-25 16:52:49',1)
 ,(311,71,'2011-06-25','2011-06-25 16:52:56',1)
 ,(312,71,'2011-06-25','2011-06-25 16:58:07',1)
 ,(313,73,'2011-06-25','2011-06-25 16:58:11',1)
 ,(314,71,'2011-06-25','2011-06-25 16:58:33',1)
 ,(315,71,'2011-06-25','2011-06-25 16:58:40',1)
 ,(316,71,'2011-06-25','2011-06-25 17:08:57',1)
 ,(317,71,'2011-06-25','2011-06-25 17:16:43',1)
 ,(318,77,'2011-06-25','2011-06-25 17:17:34',1)
 ,(319,1,'2011-06-25','2011-06-25 17:17:37',1)
 ,(320,75,'2011-06-25','2011-06-25 17:17:47',1)
 ,(321,5,'2011-06-25','2011-06-25 17:17:56',1)
 ,(322,1,'2011-06-25','2011-06-25 17:17:56',0)
 ,(323,77,'2011-06-25','2011-06-25 17:17:58',0)
 ,(324,76,'2011-06-25','2011-06-25 17:18:01',0)
 ,(325,71,'2011-06-25','2011-06-25 17:18:04',0)
 ,(326,77,'2011-06-25','2011-06-25 17:18:08',0)
 ,(327,1,'2011-06-25','2011-06-25 17:18:11',0)
 ,(328,76,'2011-06-25','2011-06-25 17:18:17',0)
 ,(329,77,'2011-06-25','2011-06-25 17:18:21',0)
 ,(330,1,'2011-06-25','2011-06-25 17:18:22',0)
 ,(331,76,'2011-06-25','2011-06-25 17:18:27',0)
 ,(332,71,'2011-06-25','2011-06-25 17:18:49',0)
 ,(333,71,'2011-06-25','2011-06-25 17:18:49',0)
 ,(334,76,'2011-06-25','2011-06-25 17:18:52',0)
 ,(335,77,'2011-06-25','2011-06-25 17:18:53',0)
 ,(336,1,'2011-06-25','2011-06-25 17:18:55',0)
 ,(337,76,'2011-06-25','2011-06-25 18:28:28',0)
 ,(338,1,'2011-06-25','2011-06-25 18:28:35',0)
 ,(339,75,'2011-06-25','2011-06-25 18:28:50',0)
 ,(340,77,'2011-06-25','2011-06-25 18:28:54',0)
 ,(341,5,'2011-06-25','2011-06-25 18:29:47',0)
 ,(342,5,'2011-06-25','2011-06-25 18:29:49',0)
 ,(343,1,'2011-06-25','2011-06-25 18:29:49',1)
 ,(344,77,'2011-06-25','2011-06-25 18:29:57',1)
 ,(345,77,'2011-06-25','2011-06-25 18:30:18',1)
 ,(346,77,'2011-06-25','2011-06-25 18:31:22',1)
 ,(347,71,'2011-06-25','2011-06-25 18:31:29',1)
 ,(348,71,'2011-06-25','2011-06-25 18:31:33',1)
 ,(349,78,'2011-06-25','2011-06-25 18:32:01',1)
 ,(350,71,'2011-06-25','2011-06-25 18:32:35',1)
 ,(351,71,'2011-06-25','2011-06-25 18:32:39',1)
 ,(352,71,'2011-06-25','2011-06-25 18:34:03',1)
 ,(353,72,'2011-06-25','2011-06-25 18:34:07',1)
 ,(354,71,'2011-06-25','2011-06-25 18:34:27',1)
 ,(355,1,'2011-06-25','2011-06-25 18:34:33',1)
 ,(356,77,'2011-06-25','2011-06-25 18:34:37',1)
 ,(357,1,'2011-06-25','2011-06-25 18:34:45',1)
 ,(358,77,'2011-06-25','2011-06-25 18:37:59',1)
 ,(359,76,'2011-06-25','2011-06-25 18:38:04',1)
 ,(360,75,'2011-06-25','2011-06-25 18:38:06',1)
 ,(361,71,'2011-06-25','2011-06-25 18:38:10',1)
 ,(362,71,'2011-06-25','2011-06-25 18:38:14',1)
 ,(363,71,'2011-06-25','2011-06-25 18:40:26',1)
 ,(364,72,'2011-06-25','2011-06-25 18:40:54',1)
 ,(365,71,'2011-06-25','2011-06-25 18:40:59',1)
 ,(366,75,'2011-06-25','2011-06-25 18:41:02',1)
 ,(367,77,'2011-06-25','2011-06-25 18:41:10',1)
 ,(368,77,'2011-06-25','2011-06-25 18:41:20',1)
 ,(369,77,'2011-06-25','2011-06-25 18:41:50',1)
 ,(370,1,'2011-06-25','2011-06-25 18:41:53',1)
 ,(371,1,'2011-06-25','2011-06-25 18:43:27',1)
 ,(372,1,'2011-06-25','2011-06-25 18:44:11',1)
 ,(373,77,'2011-06-25','2011-06-25 18:44:15',1)
 ,(374,77,'2011-06-25','2011-06-25 18:44:51',1)
 ,(375,77,'2011-06-25','2011-06-25 18:45:29',1)
 ,(376,77,'2011-06-25','2011-06-25 18:45:33',1)
 ,(377,77,'2011-06-25','2011-06-25 18:45:58',1)
 ,(378,77,'2011-06-25','2011-06-25 18:46:43',1)
 ,(379,75,'2011-06-25','2011-06-25 18:46:47',1)
 ,(380,71,'2011-06-25','2011-06-25 18:47:28',1)
 ,(381,71,'2011-06-25','2011-06-25 18:47:50',1)
 ,(382,15,'2011-06-25','2011-06-25 18:48:25',1)
 ,(383,16,'2011-06-25','2011-06-25 18:48:29',1)
 ,(384,17,'2011-06-25','2011-06-25 18:48:30',1)
 ,(385,1,'2011-06-25','2011-06-25 18:49:18',1)
 ,(386,71,'2011-06-25','2011-06-25 18:49:23',1)
 ,(387,71,'2011-06-25','2011-06-25 18:49:35',1)
 ,(388,79,'2011-06-25','2011-06-25 18:55:34',1)
 ,(389,79,'2011-06-25','2011-06-25 18:56:51',1)
 ,(390,71,'2011-06-25','2011-06-25 18:57:08',1)
 ,(391,15,'2011-06-25','2011-06-25 18:57:14',1)
 ,(392,16,'2011-06-25','2011-06-25 18:57:19',1)
 ,(393,17,'2011-06-25','2011-06-25 18:57:19',1)
 ,(394,79,'2011-06-25','2011-06-25 18:57:29',1)
 ,(395,17,'2011-06-25','2011-06-25 18:57:33',1)
 ,(396,1,'2011-06-25','2011-06-25 18:59:06',1)
 ,(397,71,'2011-06-25','2011-06-25 18:59:11',1)
 ,(398,15,'2011-06-25','2011-06-25 18:59:17',1)
 ,(399,16,'2011-06-25','2011-06-25 18:59:21',1)
 ,(400,17,'2011-06-25','2011-06-25 18:59:21',1)
 ,(401,1,'2011-06-25','2011-06-25 18:59:29',1)
 ,(402,71,'2011-06-25','2011-06-25 18:59:33',1)
 ,(403,79,'2011-06-25','2011-06-25 18:59:37',1)
 ,(404,79,'2011-06-25','2011-06-25 18:59:54',1)
 ,(405,15,'2011-06-25','2011-06-25 19:00:20',1)
 ,(406,16,'2011-06-25','2011-06-25 19:00:25',1)
 ,(407,17,'2011-06-25','2011-06-25 19:00:25',1)
 ,(408,79,'2011-06-25','2011-06-25 19:01:17',1)
 ,(409,5,'2011-06-25','2011-06-25 19:01:25',1)
 ,(410,1,'2011-06-25','2011-06-25 19:01:25',0)
 ,(411,71,'2011-06-25','2011-06-25 19:01:27',0)
 ,(412,79,'2011-06-25','2011-06-25 19:01:29',0)
 ,(413,71,'2011-06-25','2011-06-25 19:01:33',0)
 ,(414,1,'2011-06-25','2011-06-25 19:01:48',0)
 ,(415,75,'2011-06-25','2011-06-25 19:02:00',0)
 ,(416,5,'2011-06-25','2011-06-25 19:02:04',0)
 ,(417,5,'2011-06-25','2011-06-25 19:02:06',0)
 ,(418,1,'2011-06-25','2011-06-25 19:02:06',1)
 ,(419,71,'2011-06-25','2011-06-25 19:02:10',1)
 ,(420,71,'2011-06-25','2011-06-25 19:02:16',1)
 ,(421,71,'2011-06-25','2011-06-25 19:03:29',1)
 ,(422,76,'2011-06-25','2011-06-25 19:03:35',1)
 ,(423,77,'2011-06-25','2011-06-25 19:03:38',1)
 ,(424,1,'2011-06-25','2011-06-25 19:03:45',1)
 ,(425,71,'2011-06-25','2011-06-25 19:03:48',1)
 ,(426,1,'2011-06-25','2011-06-25 19:03:52',1)
 ,(427,1,'2011-06-25','2011-06-25 19:03:56',1)
 ,(428,75,'2011-06-25','2011-06-25 19:03:59',1)
 ,(429,71,'2011-06-25','2011-06-25 19:04:02',1)
 ,(430,75,'2011-06-25','2011-06-25 19:04:06',1)
 ,(431,76,'2011-06-25','2011-06-25 19:04:10',1)
 ,(432,76,'2011-06-25','2011-06-25 19:04:13',1)
 ,(433,15,'2011-06-25','2011-06-25 19:04:20',1)
 ,(434,16,'2011-06-25','2011-06-25 19:04:23',1)
 ,(435,17,'2011-06-25','2011-06-25 19:04:23',1)
 ,(436,76,'2011-06-25','2011-06-25 19:04:58',1)
 ,(437,1,'2011-06-25','2011-06-25 19:05:14',1)
 ,(438,76,'2011-06-25','2011-06-25 19:09:21',1)
 ,(439,1,'2011-06-25','2011-06-25 19:09:26',1)
 ,(440,77,'2011-06-25','2011-06-25 19:09:31',1)
 ,(441,76,'2011-06-25','2011-06-25 19:09:39',1)
 ,(442,76,'2011-06-25','2011-06-25 19:13:17',1)
 ,(443,76,'2011-06-25','2011-06-25 19:13:48',1)
 ,(444,77,'2011-06-25','2011-06-25 19:13:54',1)
 ,(445,77,'2011-06-25','2011-06-25 19:14:01',1)
 ,(446,77,'2011-06-25','2011-06-25 19:14:38',1)
 ,(447,77,'2011-06-25','2011-06-25 19:16:07',1)
 ,(448,77,'2011-06-25','2011-06-25 19:16:10',1)
 ,(449,55,'2011-06-25','2011-06-25 19:19:30',1)
 ,(450,55,'2011-06-25','2011-06-25 19:19:38',1)
 ,(451,55,'2011-06-25','2011-06-25 19:19:42',1)
 ,(452,55,'2011-06-25','2011-06-25 19:20:03',1)
 ,(453,55,'2011-06-25','2011-06-25 19:20:04',1)
 ,(454,55,'2011-06-25','2011-06-25 19:20:05',1)
 ,(455,55,'2011-06-25','2011-06-25 19:20:32',1)
 ,(456,55,'2011-06-25','2011-06-25 19:20:35',1)
 ,(457,55,'2011-06-25','2011-06-25 19:20:41',1)
 ,(458,55,'2011-06-25','2011-06-25 19:20:46',1)
 ,(459,55,'2011-06-25','2011-06-25 19:20:51',1)
 ,(460,55,'2011-06-25','2011-06-25 19:21:31',1)
 ,(461,55,'2011-06-25','2011-06-25 19:26:22',1)
 ,(462,55,'2011-06-25','2011-06-25 19:29:43',1)
 ,(463,55,'2011-06-25','2011-06-25 19:30:01',1)
 ,(464,55,'2011-06-25','2011-06-25 19:31:01',1)
 ,(465,55,'2011-06-25','2011-06-25 19:31:02',1)
 ,(466,55,'2011-06-25','2011-06-25 19:31:07',1)
 ,(467,55,'2011-06-25','2011-06-25 19:31:08',1)
 ,(468,55,'2011-06-25','2011-06-25 19:31:19',1)
 ,(469,52,'2011-06-25','2011-06-25 19:31:50',1)
 ,(470,77,'2011-06-25','2011-06-25 19:31:54',1)
 ,(471,55,'2011-06-25','2011-06-25 19:32:00',1)
 ,(472,55,'2011-06-25','2011-06-25 19:32:00',1)
 ,(473,55,'2011-06-25','2011-06-25 19:32:02',1)
 ,(474,55,'2011-06-25','2011-06-25 19:32:02',1)
 ,(475,77,'2011-06-25','2011-06-25 19:32:47',1)
 ,(476,1,'2011-06-25','2011-06-25 19:32:50',1)
 ,(477,75,'2011-06-25','2011-06-25 19:32:52',1)
 ,(478,71,'2011-06-25','2011-06-25 19:32:55',1)
 ,(479,1,'2011-06-25','2011-06-25 19:33:00',1)
 ,(480,1,'2011-06-25','2011-06-25 19:33:07',1)
 ,(481,1,'2011-06-25','2011-06-25 19:34:34',1)
 ,(482,77,'2011-06-25','2011-06-25 19:34:42',1)
 ,(483,76,'2011-06-25','2011-06-25 19:34:44',1)
 ,(484,75,'2011-06-25','2011-06-25 19:34:48',1)
 ,(485,1,'2011-06-25','2011-06-25 19:34:51',1)
 ,(486,76,'2011-06-25','2011-06-25 19:34:53',1)
 ,(487,76,'2011-06-25','2011-06-25 19:35:01',1)
 ,(488,76,'2011-06-25','2011-06-25 19:37:03',1)
 ,(489,77,'2011-06-25','2011-06-25 19:37:12',1)
 ,(490,71,'2011-06-25','2011-06-25 19:37:14',1)
 ,(491,71,'2011-06-25','2011-06-25 19:37:31',1)
 ,(492,71,'2011-06-25','2011-06-25 19:39:33',1)
 ,(493,1,'2011-06-25','2011-06-25 19:39:38',1)
 ,(494,77,'2011-06-25','2011-06-25 19:39:45',1)
 ,(495,76,'2011-06-25','2011-06-25 19:39:50',1)
 ,(496,77,'2011-06-25','2011-06-25 19:40:44',1)
 ,(497,1,'2011-06-25','2011-06-25 19:41:03',1)
 ,(498,75,'2011-06-25','2011-06-25 19:42:58',1)
 ,(499,1,'2011-06-25','2011-06-25 19:48:17',1)
 ,(500,1,'2011-06-25','2011-06-25 19:48:32',1)
 ,(501,1,'2011-06-25','2011-06-25 19:50:09',1)
 ,(502,1,'2011-06-25','2011-06-25 19:50:14',1)
 ,(503,15,'2011-06-25','2011-06-25 19:50:33',1)
 ,(504,1,'2011-06-25','2011-06-25 19:51:15',1)
 ,(505,16,'2011-06-25','2011-06-25 19:51:17',1)
 ,(506,17,'2011-06-25','2011-06-25 19:51:18',1)
 ,(507,16,'2011-06-25','2011-06-25 19:51:20',1)
 ,(508,17,'2011-06-25','2011-06-25 19:51:20',1)
 ,(509,1,'2011-06-25','2011-06-25 19:54:12',1)
 ,(510,1,'2011-06-25','2011-06-25 19:55:03',1)
 ,(511,77,'2011-06-25','2011-06-25 19:55:06',1)
 ,(512,1,'2011-06-25','2011-06-25 20:03:35',1)
 ,(513,71,'2011-06-25','2011-06-25 20:03:41',1)
 ,(514,71,'2011-06-25','2011-06-25 20:03:45',1)
 ,(515,15,'2011-06-25','2011-06-25 20:04:28',1)
 ,(516,16,'2011-06-25','2011-06-25 20:04:31',1)
 ,(517,17,'2011-06-25','2011-06-25 20:04:32',1)
 ,(518,20,'2011-06-25','2011-06-25 20:04:36',1)
 ,(519,21,'2011-06-25','2011-06-25 20:04:46',1)
 ,(520,22,'2011-06-25','2011-06-25 20:04:46',1)
 ,(521,52,'2011-06-25','2011-06-25 20:04:57',1)
 ,(522,16,'2011-06-25','2011-06-25 20:05:28',1)
 ,(523,17,'2011-06-25','2011-06-25 20:05:29',1)
 ,(524,20,'2011-06-25','2011-06-25 20:05:31',1)
 ,(525,52,'2011-06-25','2011-06-25 20:05:33',1)
 ,(526,52,'2011-06-25','2011-06-25 20:05:38',1)
 ,(527,52,'2011-06-25','2011-06-25 20:05:43',1)
 ,(528,52,'2011-06-25','2011-06-25 20:06:03',1);

DROP TABLE IF EXISTS PageThemeStyles;

CREATE TABLE IF NOT EXISTS `PageThemeStyles` (
  `ptID` int(10) unsigned NOT NULL DEFAULT '0',
  `ptsHandle` varchar(128) NOT NULL,
  `ptsValue` longtext,
  `ptsType` varchar(32) NOT NULL,
  PRIMARY KEY (`ptID`,`ptsHandle`,`ptsType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS PageThemes;

CREATE TABLE IF NOT EXISTS `PageThemes` (
  `ptID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ptHandle` varchar(64) NOT NULL,
  `ptName` varchar(255) DEFAULT NULL,
  `ptDescription` text,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ptID`),
  UNIQUE KEY `ptHandle` (`ptHandle`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO PageThemes VALUES(1,'default','Plain Yogurt\n','Plain Yogurt is Concrete\'s default theme.',0)
 ,(2,'greensalad','Green Salad Theme\n','This is Concrete\'s Green Salad site theme.',0)
 ,(3,'dark_chocolate','Dark Chocolate\n','Dark Chocolate is Concrete\'s default theme in black.',0)
 ,(4,'featuring','Featuring\r\n','Featuring the featuring theme.',1)
 ,(5,'simple_blue','Simple Blue\r\n','A clean and simple two column theme that can be easily customized.',2)
 ,(6,'innovation','innovation\r\n','Innovation Theme',3)
 ,(7,'solutions','ideal design for your business enterprise',NULL,4)
 ,(8,'zenlike','ZenLike 1.0\r\n','A free, lightweight, tableless, fluid W3C-compliant website design by NodeThirtyThree Design. All photos came from PDPhoto and the background texture is from Mayang\'s texture site. You\'re free to dissect, manipulate and use it to your heart\'s content.',5)
 ,(9,'bubbles','Chat\n','A theme designed for contact us pages.',6)
 ,(10,'neuphoric','Neuphoric\n','A green and white theme',7)
 ,(11,'column_cruiser','Column Cruiser\n','Column Cruiser - liquid column theme - based on YAML www.yaml.de - modified by Ron Nitzsche | www.concrete5.info',8);

DROP TABLE IF EXISTS PageTypeAttributes;

CREATE TABLE IF NOT EXISTS `PageTypeAttributes` (
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ctID`,`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO PageTypeAttributes VALUES(1,1)
 ,(1,2)
 ,(1,3)
 ,(1,4)
 ,(2,1)
 ,(2,2)
 ,(2,3)
 ,(2,4)
 ,(3,1)
 ,(3,2)
 ,(3,3)
 ,(3,4)
 ,(4,1)
 ,(4,2)
 ,(4,3)
 ,(4,4);

DROP TABLE IF EXISTS PageTypes;

CREATE TABLE IF NOT EXISTS `PageTypes` (
  `ctID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctHandle` varchar(32) NOT NULL,
  `ctIcon` varchar(128) DEFAULT NULL,
  `ctName` varchar(90) NOT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ctID`),
  UNIQUE KEY `ctHandle` (`ctHandle`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO PageTypes VALUES(1,'right_sidebar','template3.png','Right Sidebar',0)
 ,(2,'left_sidebar','template1.png','Left Sidebar',0)
 ,(3,'full','main.png','Full Width',0)
 ,(4,'blog_entry','template2.png','Blog Entry',0);

DROP TABLE IF EXISTS Pages;

CREATE TABLE IF NOT EXISTS `Pages` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  `cIsTemplate` varchar(1) NOT NULL DEFAULT '0',
  `uID` int(10) unsigned DEFAULT NULL,
  `cIsCheckedOut` tinyint(1) NOT NULL DEFAULT '0',
  `cCheckedOutUID` int(10) unsigned DEFAULT NULL,
  `cCheckedOutDatetime` datetime DEFAULT NULL,
  `cCheckedOutDatetimeLastEdit` datetime DEFAULT NULL,
  `cPendingAction` varchar(6) DEFAULT NULL,
  `cPendingActionDatetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cPendingActionUID` int(10) unsigned DEFAULT NULL,
  `cPendingActionTargetCID` int(10) unsigned DEFAULT NULL,
  `cOverrideTemplatePermissions` tinyint(1) NOT NULL DEFAULT '1',
  `cInheritPermissionsFromCID` int(10) unsigned NOT NULL DEFAULT '0',
  `cInheritPermissionsFrom` varchar(8) NOT NULL DEFAULT 'PARENT',
  `cFilename` varchar(255) DEFAULT NULL,
  `cPointerID` int(10) unsigned NOT NULL DEFAULT '0',
  `cPointerExternalLink` varchar(255) DEFAULT NULL,
  `cPointerExternalLinkNewWindow` tinyint(1) NOT NULL DEFAULT '0',
  `cChildren` int(10) unsigned NOT NULL DEFAULT '0',
  `cDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `cParentID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `ptID` int(10) unsigned NOT NULL DEFAULT '0',
  `cCacheFullPageContent` int(4) NOT NULL DEFAULT '-1',
  `cCacheFullPageContentOverrideLifetime` varchar(32) NOT NULL DEFAULT '0',
  `cCacheFullPageContentLifetimeCustom` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`),
  KEY `cParentID` (`cParentID`),
  KEY `cCheckedOutUID` (`cCheckedOutUID`),
  KEY `cPointerID` (`cPointerID`),
  KEY `uID` (`uID`),
  KEY `ctID` (`ctID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO Pages VALUES(1,1,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,1,'OVERRIDE',NULL,0,NULL,0,12,0,0,0,5,-1,'0',0)
 ,(2,1,'1',NULL,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,0,'PARENT',NULL,0,NULL,0,0,0,0,0,0,-1,'0',0)
 ,(5,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,5,'OVERRIDE','/login.php',0,NULL,0,0,0,1,0,5,-1,'0',0)
 ,(6,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,6,'OVERRIDE','/register.php',0,NULL,0,0,3,1,0,5,-1,'0',0)
 ,(7,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,1,'PARENT','/profile/view.php',0,NULL,0,4,4,1,0,5,-1,'0',0)
 ,(8,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,1,'PARENT','/profile/edit.php',0,NULL,0,0,0,7,0,5,-1,'0',0)
 ,(10,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,1,'PARENT','/profile/avatar.php',0,NULL,0,0,1,7,0,5,-1,'0',0)
 ,(11,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,1,'PARENT','/profile/messages.php',0,NULL,0,0,2,7,0,5,-1,'0',0)
 ,(12,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,1,'PARENT','/profile/friends.php',0,NULL,0,0,3,7,0,5,-1,'0',0)
 ,(13,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,1,'PARENT','/page_not_found.php',0,NULL,0,0,6,1,0,5,-1,'0',0)
 ,(14,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,1,'PARENT','/page_forbidden.php',0,NULL,0,0,7,1,0,5,-1,'0',0)
 ,(15,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'OVERRIDE','/dashboard/view.php',0,NULL,0,9,8,1,0,5,-1,'0',0)
 ,(16,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/sitemap/view.php',0,NULL,0,4,0,15,0,5,-1,'0',0)
 ,(17,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/sitemap/full.php',0,NULL,0,0,0,16,0,5,-1,'0',0)
 ,(18,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/sitemap/explore.php',0,NULL,0,0,1,16,0,5,-1,'0',0)
 ,(19,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/sitemap/search.php',0,NULL,0,0,2,16,0,5,-1,'0',0)
 ,(20,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/sitemap/access.php',0,NULL,0,0,3,16,0,5,-1,'0',0)
 ,(21,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/files/view.php',0,NULL,0,4,1,15,0,5,-1,'0',0)
 ,(22,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/files/search.php',0,NULL,0,0,0,21,0,5,-1,'0',0)
 ,(23,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/files/attributes.php',0,NULL,0,0,1,21,0,5,-1,'0',0)
 ,(24,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/files/sets.php',0,NULL,0,0,2,21,0,5,-1,'0',0)
 ,(25,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/files/access.php',0,NULL,0,0,3,21,0,5,-1,'0',0)
 ,(26,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/reports.php',0,NULL,0,3,2,15,0,5,-1,'0',0)
 ,(27,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/reports/forms.php',0,NULL,0,0,0,26,0,5,-1,'0',0)
 ,(28,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/reports/surveys.php',0,NULL,0,0,1,26,0,5,-1,'0',0)
 ,(29,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/reports/logs.php',0,NULL,0,0,2,26,0,5,-1,'0',0)
 ,(30,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/users/view.php',0,NULL,0,5,3,15,0,5,-1,'0',0)
 ,(31,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/users/search.php',0,NULL,0,0,0,30,0,5,-1,'0',0)
 ,(32,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/users/add.php',0,NULL,0,0,1,30,0,5,-1,'0',0)
 ,(33,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/users/groups.php',0,NULL,0,0,2,30,0,5,-1,'0',0)
 ,(34,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/users/attributes.php',0,NULL,0,0,3,30,0,5,-1,'0',0)
 ,(35,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/users/registration.php',0,NULL,0,0,4,30,0,5,-1,'0',0)
 ,(36,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/scrapbook/view.php',0,NULL,0,0,4,15,0,5,-1,'0',0)
 ,(37,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/pages/view.php',0,NULL,0,4,5,15,0,5,-1,'0',0)
 ,(38,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/pages/themes/view.php',0,NULL,0,4,0,37,0,5,-1,'0',0)
 ,(39,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/pages/themes/add.php',0,NULL,0,0,0,38,0,5,-1,'0',0)
 ,(40,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/pages/themes/inspect.php',0,NULL,0,0,1,38,0,5,-1,'0',0)
 ,(41,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/pages/themes/customize.php',0,NULL,0,0,2,38,0,5,-1,'0',0)
 ,(42,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','0',0,NULL,0,0,3,38,0,5,-1,'0',0)
 ,(43,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/pages/types/view.php',0,NULL,0,0,1,37,0,5,-1,'0',0)
 ,(44,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/pages/attributes.php',0,NULL,0,0,2,37,0,5,-1,'0',0)
 ,(45,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/pages/single.php',0,NULL,0,0,3,37,0,5,-1,'0',0)
 ,(46,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/install.php',0,NULL,0,0,6,15,0,5,-1,'0',0)
 ,(47,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/system/view.php',0,NULL,0,4,7,15,0,5,-1,'0',0)
 ,(48,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/system/jobs.php',0,NULL,0,0,0,47,0,5,-1,'0',0)
 ,(49,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/system/backup.php',0,NULL,0,0,1,47,0,5,-1,'0',0)
 ,(50,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/system/update.php',0,NULL,0,0,2,47,0,5,-1,'0',0)
 ,(51,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/system/notifications.php',0,NULL,0,0,3,47,0,5,-1,'0',0)
 ,(52,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/settings/view.php',0,NULL,0,2,8,15,0,5,-1,'0',0)
 ,(53,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/settings/mail/view.php',0,NULL,0,0,0,52,0,5,-1,'0',0)
 ,(54,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,15,'PARENT','/dashboard/settings/marketplace.php',0,NULL,0,0,1,52,0,5,-1,'0',0)
 ,(55,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,1,'PARENT','/download_file.php',0,NULL,0,0,9,1,0,5,-1,'0',0)
 ,(64,2,'1',NULL,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,0,'PARENT',NULL,0,NULL,0,0,0,0,0,0,-1,'0',0)
 ,(65,3,'1',NULL,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,0,'PARENT',NULL,0,NULL,0,0,0,0,0,0,-1,'0',0)
 ,(66,4,'1',NULL,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,0,'PARENT',NULL,0,NULL,0,0,0,0,0,0,-1,'0',0)
 ,(75,1,'0',1,0,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00',NULL,NULL,1,1,'PARENT',NULL,0,NULL,0,0,2,1,0,5,-1,'0',0)
 ,(71,1,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,1,'PARENT',NULL,0,NULL,0,1,3,1,0,5,-1,'0',0)
 ,(74,0,'0',1,0,NULL,NULL,NULL,NULL,'2011-06-24 22:52:16',NULL,NULL,1,1,'PARENT','/members.php',0,NULL,0,0,4,1,0,5,-1,'0',0)
 ,(76,1,'0',1,0,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00',NULL,NULL,1,1,'PARENT',NULL,0,NULL,0,0,1,1,0,5,-1,'0',0)
 ,(77,1,'0',1,0,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00',NULL,NULL,1,1,'PARENT',NULL,0,NULL,0,0,0,1,0,5,-1,'0',0)
 ,(79,4,'0',1,0,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00',NULL,NULL,1,1,'PARENT',NULL,0,NULL,0,0,0,71,0,5,-1,'0',0);

DROP TABLE IF EXISTS PileContents;

CREATE TABLE IF NOT EXISTS `PileContents` (
  `pcID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pID` int(10) unsigned NOT NULL DEFAULT '0',
  `itemID` int(10) unsigned NOT NULL DEFAULT '0',
  `itemType` varchar(64) NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `displayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pcID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS Piles;

CREATE TABLE IF NOT EXISTS `Piles` (
  `pID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uID` int(10) unsigned DEFAULT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `state` varchar(64) NOT NULL,
  PRIMARY KEY (`pID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO Piles VALUES(1,1,1,'2011-06-25 09:43:34',NULL,'READY');

DROP TABLE IF EXISTS SignupRequests;

CREATE TABLE IF NOT EXISTS `SignupRequests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipFrom` int(10) unsigned NOT NULL DEFAULT '0',
  `date_access` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_ipFrom` (`ipFrom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS SystemNotifications;

CREATE TABLE IF NOT EXISTS `SystemNotifications` (
  `snID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `snTypeID` int(3) unsigned NOT NULL DEFAULT '0',
  `snURL` text,
  `snURL2` text,
  `snDateTime` datetime NOT NULL,
  `snIsArchived` int(1) NOT NULL DEFAULT '0',
  `snIsNew` int(1) NOT NULL DEFAULT '0',
  `snTitle` varchar(255) DEFAULT NULL,
  `snDescription` text,
  `snBody` text,
  PRIMARY KEY (`snID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO SystemNotifications VALUES(1,10,'/concrete/index.php/dashboard/system/update/',NULL,'2011-06-25 06:36:00',0,0,'A new version of concrete5 is now available.','','\n<h2>5.4.1.1</h2>\n\n<h3>Feature Updates</h3>\n\n<ul>\n<li>Better file upload details box. Remove the blank metadata since some of that can be imported. Instead use the bulk metadata tools. Fix bulk metadata tools so that they do a better job showing multiple values.</li>\n<li>Add an \"install packages\" task permission and set it to the Administrators group.</li>\n</ul>\n\n<h3>Bug Fixes</h3>\n\n<ul>\n<li>Fix the task permissions so that administrators the group have access to them.</li>\n<li>Fix issue with upgrading from 5.3.3.1 to 5.4.1</li>\n<li>Made single pages uncacheable unless explicitly cached in the page properties.</li>\n<li>Fixing JavaScript error in TinyMCE with the image editor window</li>\n<li>Including cPath, cvName and atSelectOptionID in indexes on their tables</li>\n<li>Advanced permissions: Click permissions tab on the top of the page, close it, then click on the block, and you\'re unable to add users/groups</li>\n<li>Lack of \"default 0\" on ocID column in Files table was causing problems in Windows.</li>\n<li>Fixed bug when CollectionAttributeKey::getByID would return a valid attribute even if akID was NOT a collection attribute key</li>\n<li>Fixed bug in presentation of search block where multiple search blocks on a page would display search results on both.</li>\n<li>Fixed bug when uploading a file in IE resulting in a blank page.</li>\n<li>Fixed bug where user could not be updated in Internet Explorer</li>\n<li>Fixed bug where date nav \"under another page\" option didn\'t work.</li>\n<li>Fixed bug in select attribute when server didn\'t have the JSON extension installed (resulting in no page add or edit button being displayed at certain points.)</li>\n<li>Fixed javascript errors when working with select attribute types in IE</li>\n<li>Added EmulateIE8 to IE7 to get it to work better in the dashboard</li>\n<li>Improved file sets list view in IE7</li>\n<li>No longer installing broken marketplace themes page (that you couldn\'t navigate to using the menus but would show in the sitemap when clicking \"show system pages\")</li>\n<li>Better button display in non-default uses of TinyMCE</li>\n<li>Create blog_entry page type on upgrade</li>\n<li>When duplicating a file, make sure that the new file is the one that gets the metadata change if any metadata is tweaked</li>\n<li>http://www.concrete5.org/developers/bugs/5-4-1/edit-multiple-user-properties/#84118</li>\n<li>Search block\'s default simple search now can handle indexed attributes</li>\n<li>Adding a trailing slash on the end of a secondary URL will now correctly route to the original post</li>\n<li>Better unique ID generation when dealing with presets on design</li>\n</ul>\n\n\n')
 ,(2,11,'http://www.concrete5.org/about/blog/totally-random-web-show/totally-random-live-6-24/',NULL,'2011-06-24 14:02:00',0,0,'Totally Random Live 6/24','Weekly live news show about the concrete5 CMS','Weekly live news show about the concrete5 CMS')
 ,(3,11,'http://www.concrete5.org/about/blog/add-on-releases/add-on-approved-clevyr-nav/',NULL,'2011-06-23 17:10:00',0,0,'Add-on Approved: Clevyr Nav','<p>Easy Drag and Drop Concrete5 Navigation and Menu builder.</p><p><a href=\"http://www.concrete5.org/marketplace/addons/clevyr-nav/\">View this item in the marketplace.</a></p>','<p>Easy Drag and Drop Concrete5 Navigation and Menu builder.</p><p><a href=\"http://www.concrete5.org/marketplace/addons/clevyr-nav/\">View this item in the marketplace.</a></p>')
 ,(4,11,'http://www.concrete5.org/about/blog/add-on-releases/add-on-approved-extended-faq/',NULL,'2011-06-23 17:05:00',0,0,'Add-on Approved: Extended FAQ','<p>Simple FAQ block that doens\'t create a page for each entry. With accordion and list template.</p><p><a href=\"http://www.concrete5.org/marketplace/addons/extended-faq/\">View this item in the marketplace.</a></p>','<p>Simple FAQ block that doens\'t create a page for each entry. With accordion and list template.</p><p><a href=\"http://www.concrete5.org/marketplace/addons/extended-faq/\">View this item in the marketplace.</a></p>')
 ,(5,11,'http://www.concrete5.org/about/blog/add-on-releases/add-on-approved-gallerybox-social-image-sharing/',NULL,'2011-06-23 17:00:00',0,1,'Add-on Approved: GalleryBox Social Image Sharing','<p>GalleryBox adds Flickr-like functionality to your site. Users can upload images to their own galleries allowing others to comment and add notes.</p><p><a href=\"http://www.concrete5.org/marketplace/addons/gallerybox/\">View this item in the marketplace.</a></p>','<p>GalleryBox adds Flickr-like functionality to your site. Users can upload images to their own galleries allowing others to comment and add notes.</p><p><a href=\"http://www.concrete5.org/marketplace/addons/gallerybox/\">View this item in the marketplace.</a></p>')
 ,(6,11,'http://www.concrete5.org/about/blog/add-on-releases/add-on-approved-twitcasting-live-status/',NULL,'2011-06-23 16:54:32',0,1,'Add-on Approved: Twitcasting Live Status','<p>It displays online/offline status of your desired Twitcasting channel to tell your site visitor to attract to view your live cast.</p><p><a href=\"http://www.concrete5.org/marketplace/addons/twitcasting-live-status/\">View this item in the marketplace.</a></p>','<p>It displays online/offline status of your desired Twitcasting channel to tell your site visitor to attract to view your live cast.</p><p><a href=\"http://www.concrete5.org/marketplace/addons/twitcasting-live-status/\">View this item in the marketplace.</a></p>');

DROP TABLE IF EXISTS TaskPermissionUserGroups;

CREATE TABLE IF NOT EXISTS `TaskPermissionUserGroups` (
  `tpID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `canRead` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tpID`,`gID`,`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS TaskPermissions;

CREATE TABLE IF NOT EXISTS `TaskPermissions` (
  `tpID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tpHandle` varchar(255) DEFAULT NULL,
  `tpName` varchar(255) DEFAULT NULL,
  `tpDescription` text,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tpID`),
  UNIQUE KEY `tpHandle` (`tpHandle`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO TaskPermissions VALUES(1,'access_task_permissions','Change Task Permissions','',0)
 ,(2,'access_sitemap','Access Sitemap and Page Search','',0)
 ,(3,'access_user_search','Access User Search','',0)
 ,(4,'access_group_search','Access Group Search','',0)
 ,(5,'access_page_defaults','Change Content on Page Type Default Pages','',0)
 ,(6,'backup','Perform Full Database Backups','',0)
 ,(7,'sudo','Sign in as User','',0)
 ,(8,'uninstall_packages','Uninstall Packages','',0);

DROP TABLE IF EXISTS UserAttributeKeys;

CREATE TABLE IF NOT EXISTS `UserAttributeKeys` (
  `akID` int(10) unsigned NOT NULL,
  `uakProfileDisplay` tinyint(1) NOT NULL DEFAULT '0',
  `uakMemberListDisplay` tinyint(1) NOT NULL DEFAULT '0',
  `uakProfileEdit` tinyint(1) NOT NULL DEFAULT '1',
  `uakProfileEditRequired` tinyint(1) NOT NULL DEFAULT '0',
  `uakRegisterEdit` tinyint(1) NOT NULL DEFAULT '0',
  `uakRegisterEditRequired` tinyint(1) NOT NULL DEFAULT '0',
  `displayOrder` int(10) unsigned DEFAULT '0',
  `uakIsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserAttributeValues;

CREATE TABLE IF NOT EXISTS `UserAttributeValues` (
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uID`,`akID`,`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserBannedIPs;

CREATE TABLE IF NOT EXISTS `UserBannedIPs` (
  `ipFrom` int(10) unsigned NOT NULL DEFAULT '0',
  `ipTo` int(10) unsigned NOT NULL DEFAULT '0',
  `banCode` int(1) unsigned NOT NULL DEFAULT '1',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `isManual` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipFrom`,`ipTo`),
  KEY `ipFrom` (`ipFrom`),
  KEY `ipTo` (`ipTo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserGroups;

CREATE TABLE IF NOT EXISTS `UserGroups` (
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `ugEntered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uID`,`gID`),
  KEY `uID` (`uID`),
  KEY `gID` (`gID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserOpenIDs;

CREATE TABLE IF NOT EXISTS `UserOpenIDs` (
  `uID` int(10) unsigned NOT NULL,
  `uOpenID` varchar(255) NOT NULL,
  PRIMARY KEY (`uOpenID`),
  KEY `uID` (`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserPrivateMessages;

CREATE TABLE IF NOT EXISTS `UserPrivateMessages` (
  `msgID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uAuthorID` int(10) unsigned NOT NULL DEFAULT '0',
  `msgDateCreated` datetime NOT NULL,
  `msgSubject` varchar(255) NOT NULL,
  `msgBody` text,
  `uToID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msgID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserPrivateMessagesTo;

CREATE TABLE IF NOT EXISTS `UserPrivateMessagesTo` (
  `msgID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `uAuthorID` int(10) unsigned NOT NULL DEFAULT '0',
  `msgMailboxID` int(11) NOT NULL,
  `msgIsNew` int(1) NOT NULL DEFAULT '0',
  `msgIsUnread` int(1) NOT NULL DEFAULT '0',
  `msgIsReplied` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`msgID`,`uID`,`uAuthorID`),
  KEY `uID` (`uID`),
  KEY `uAuthorID` (`uAuthorID`),
  KEY `msgFolderID` (`msgMailboxID`),
  KEY `msgIsNew` (`msgIsNew`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserSearchIndexAttributes;

CREATE TABLE IF NOT EXISTS `UserSearchIndexAttributes` (
  `uID` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserValidationHashes;

CREATE TABLE IF NOT EXISTS `UserValidationHashes` (
  `uvhID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uID` int(10) unsigned DEFAULT NULL,
  `uHash` varchar(64) NOT NULL,
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `uDateGenerated` int(10) unsigned NOT NULL DEFAULT '0',
  `uDateRedeemed` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uvhID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS Users;

CREATE TABLE IF NOT EXISTS `Users` (
  `uID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uName` varchar(64) NOT NULL,
  `uEmail` varchar(64) NOT NULL,
  `uPassword` varchar(255) NOT NULL,
  `uIsActive` varchar(1) NOT NULL DEFAULT '0',
  `uIsValidated` tinyint(4) NOT NULL DEFAULT '-1',
  `uIsFullRecord` tinyint(1) NOT NULL DEFAULT '1',
  `uDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uHasAvatar` tinyint(1) NOT NULL DEFAULT '0',
  `uLastOnline` int(10) unsigned NOT NULL DEFAULT '0',
  `uLastLogin` int(10) unsigned NOT NULL DEFAULT '0',
  `uPreviousLogin` int(10) unsigned NOT NULL DEFAULT '0',
  `uNumLogins` int(10) unsigned NOT NULL DEFAULT '0',
  `uTimezone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uID`),
  UNIQUE KEY `uName` (`uName`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO Users VALUES(1,'admin','jostmey@gmail.com','c730553085ec729d27a310336d124e42','1',-1,1,'2011-06-24 22:52:18',0,1309061759,1309060965,1309058138,11,NULL);

DROP TABLE IF EXISTS UsersFriends;

CREATE TABLE IF NOT EXISTS `UsersFriends` (
  `ufID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uID` int(10) unsigned DEFAULT NULL,
  `status` varchar(64) NOT NULL,
  `friendUID` int(10) unsigned DEFAULT NULL,
  `uDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ufID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atAddress;

CREATE TABLE IF NOT EXISTS `atAddress` (
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `country` varchar(4) DEFAULT NULL,
  `postal_code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atAddressCustomCountries;

CREATE TABLE IF NOT EXISTS `atAddressCustomCountries` (
  `atAddressCustomCountryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `country` varchar(5) NOT NULL,
  PRIMARY KEY (`atAddressCustomCountryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atAddressSettings;

CREATE TABLE IF NOT EXISTS `atAddressSettings` (
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `akHasCustomCountries` int(1) NOT NULL DEFAULT '0',
  `akDefaultCountry` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atBoolean;

CREATE TABLE IF NOT EXISTS `atBoolean` (
  `avID` int(10) unsigned NOT NULL,
  `value` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO atBoolean VALUES(61,0)
 ,(49,0)
 ,(53,0)
 ,(35,0)
 ,(73,0)
 ,(77,0)
 ,(81,0)
 ,(85,0)
 ,(89,0)
 ,(99,0)
 ,(103,0)
 ,(107,0)
 ,(111,0)
 ,(115,0);

DROP TABLE IF EXISTS atBooleanSettings;

CREATE TABLE IF NOT EXISTS `atBooleanSettings` (
  `akID` int(10) unsigned NOT NULL,
  `akCheckedByDefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atDateTime;

CREATE TABLE IF NOT EXISTS `atDateTime` (
  `avID` int(10) unsigned NOT NULL,
  `value` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atDateTimeSettings;

CREATE TABLE IF NOT EXISTS `atDateTimeSettings` (
  `akID` int(10) unsigned NOT NULL,
  `akDateDisplayMode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atDefault;

CREATE TABLE IF NOT EXISTS `atDefault` (
  `avID` int(10) unsigned NOT NULL,
  `value` longtext,
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO atDefault VALUES(60,'')
 ,(59,'')
 ,(58,'')
 ,(52,'')
 ,(48,'')
 ,(47,'')
 ,(46,'Contact Us')
 ,(51,'')
 ,(50,'')
 ,(32,'')
 ,(33,'')
 ,(34,'')
 ,(71,'Search bitcoin aggregates content')
 ,(70,'Indexing bitcoin websites')
 ,(72,'bitcoin, aggregate, index, crawl, blog')
 ,(74,'Indexing bitcoin websites')
 ,(75,'Search bitcoin aggregates content')
 ,(76,'bitcoin, aggregate, index, crawl, blog')
 ,(78,'Indexing bitcoin websites')
 ,(79,'Search bitcoin aggregates content')
 ,(80,'bitcoin, aggregate, index, crawl, blog')
 ,(82,'Indexing bitcoin websites')
 ,(83,'Search bitcoin aggregates content')
 ,(84,'bitcoin, aggregate, index, crawl, blog')
 ,(86,'Indexing bitcoin websites')
 ,(87,'Search bitcoin aggregates content')
 ,(88,'bitcoin, aggregate, index, crawl, blog')
 ,(96,'Search bitcoin')
 ,(97,'Find everything that is available for sale in the bitcoin community.')
 ,(98,'bitcoin, search, find, aggregate, shop, store, merchandise, products, services, classifieds, advertisement')
 ,(100,'Learn about bitcoins')
 ,(101,'Introduction to bitcoins for those that are new to the concept of this digital currency.')
 ,(102,'bitcoins, introduction, learn more, get started')
 ,(104,'Chamber of Commerce')
 ,(105,'We are helping to build the bitcoin chamber of commerce by providing our database of bitcoin businesses to the public.')
 ,(106,'Bitcoin, Chamber of Commerce, Businesses, Directory, Listing')
 ,(108,'Contact Us')
 ,(109,'Contact us as search bitcoin')
 ,(110,'Bitcoins, contact')
 ,(112,'Search Bitcoin Blog')
 ,(113,'Stay tuned to our blog to learn about the exciting things that are just around the corner.')
 ,(114,'Bitcoin, search, blog, promotion, public announcements');

DROP TABLE IF EXISTS atFile;

CREATE TABLE IF NOT EXISTS `atFile` (
  `avID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atNumber;

CREATE TABLE IF NOT EXISTS `atNumber` (
  `avID` int(10) unsigned NOT NULL,
  `value` decimal(14,4) DEFAULT '0.0000',
  PRIMARY KEY (`avID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO atNumber VALUES(1,800.0000)
 ,(2,192.0000)
 ,(3,800.0000)
 ,(4,192.0000)
 ,(5,800.0000)
 ,(6,192.0000)
 ,(7,800.0000)
 ,(8,215.0000)
 ,(9,800.0000)
 ,(10,192.0000)
 ,(90,225.0000)
 ,(91,225.0000)
 ,(92,796.0000)
 ,(93,400.0000)
 ,(94,199.0000)
 ,(95,100.0000)
 ,(116,128.0000)
 ,(117,128.0000);

DROP TABLE IF EXISTS atSelectOptions;

CREATE TABLE IF NOT EXISTS `atSelectOptions` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akID` int(10) unsigned DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `displayOrder` int(10) unsigned DEFAULT NULL,
  `isEndUserAdded` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO atSelectOptions VALUES(1,11,'sample',0,1)
 ,(2,11,'Hello World',1,1);

DROP TABLE IF EXISTS atSelectOptionsSelected;

CREATE TABLE IF NOT EXISTS `atSelectOptionsSelected` (
  `avID` int(10) unsigned NOT NULL,
  `atSelectOptionID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`avID`,`atSelectOptionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atSelectSettings;

CREATE TABLE IF NOT EXISTS `atSelectSettings` (
  `akID` int(10) unsigned NOT NULL,
  `akSelectAllowMultipleValues` tinyint(1) NOT NULL DEFAULT '0',
  `akSelectOptionDisplayOrder` varchar(255) NOT NULL DEFAULT 'display_asc',
  `akSelectAllowOtherValues` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO atSelectSettings VALUES(11,1,'display_asc',1);

DROP TABLE IF EXISTS atTextareaSettings;

CREATE TABLE IF NOT EXISTS `atTextareaSettings` (
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `akTextareaDisplayMode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`akID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btContentFile;

CREATE TABLE IF NOT EXISTS `btContentFile` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT NULL,
  `fileLinkText` varchar(255) DEFAULT NULL,
  `filePassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btContentImage;

CREATE TABLE IF NOT EXISTS `btContentImage` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT '0',
  `fOnstateID` int(10) unsigned DEFAULT '0',
  `maxWidth` int(10) unsigned DEFAULT '0',
  `maxHeight` int(10) unsigned DEFAULT '0',
  `externalLink` varchar(255) DEFAULT NULL,
  `altText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO btContentImage VALUES(8,4,0,0,0,'','')
 ,(11,2,0,0,0,'','')
 ,(13,1,0,0,0,'','');

DROP TABLE IF EXISTS btContentLocal;

CREATE TABLE IF NOT EXISTS `btContentLocal` (
  `bID` int(10) unsigned NOT NULL,
  `content` longtext,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO btContentLocal VALUES(114,'<h5>There are many great websites for finding merchandise in the bitcoin community. Here are just a few.</h5>')
 ,(116,'<script type=\"text/javascript\" src=\"http://api.bitcoinbulletin.com/btceconomy\"></script>')
 ,(117,'<div style=\"width: 450px; margin-left: auto; margin-right: auto;\">\r\n<script type=\"text/javascript\" src=\"http://api.bitcoinbulletin.com/btceconomy\"></script>\r\n</div>')
 ,(118,'<p><img style=\"float: right;\" src=\"{CCM:FID_8}\" alt=\"love_bitcoins.png\" width=\"128\" height=\"128\" />Bitcoins are one of the few true digital currencies in existence, and although the technology behind bitcoins is complex, the currency is simple to use. Bitcoins are unique in that they have been designed with security in mind, can be traded online as easily as emails are sent, and are decentralized so that no authority can undermine the transactions.</p>\r\n<p>So what do people use bitcoins for? Well, you can see from our <a title=\"Bitcoin Merchandise\" href=\"{CCM:CID_1}\">search page</a> that you can use bitcoins to buy essentially any commidity or service that you can buy with traditional money. In fact, there are hundreds of businesses that collectively offer tens of thousands of products, and these numbers grow each day at an exponential rate.</p>\r\n<p>So how do you get bitcoins? The first step is to download the bitcoin software. The program is easy to install. Once you install it, you will be given a bitcoin address. This is kind of like an email address that is for receiving money online. A typical bitcoin address looks something like ours (<em>17gcmYY8Q7nPagk4zKRwjtgxrUvvBcFhDr)</em>. The bitcoin software may take awhile to sync with the rest of the bitcoin network. If you don\'t want to wait this long, you can use any of the online bitcoin banks, which will operate the bitcoin software for you, to quickly get your first bitcoin address.</p>\r\n<p>Once you have setup a bitcoin account, you can use the <a title=\"Get some free bitcoins\" href=\"http://freebitcoins.appspot.com/\">bitcoin faucet</a> to get your first&nbsp;<em>bit-change</em> for free. The bit-change will be sent to your account and saved in your computer (all coins are saved into a special file called the wallet file). If you want more bitcoins you will probably have to purchase them from an <a title=\"Directory of bitcoin exhanges.\" href=\"http://en.bitcoin.it/wiki/Buying_bitcoins\">exchange</a>. The exchanges are websites where people can buy and sell bitcoins. I suggest that you sign-up at an exchange now, because it typically can take up to a week to verify your account.</p>\r\n<p><img style=\"float: right;\" src=\"{CCM:FID_7}\" alt=\"Screenshot.png\" width=\"199\" height=\"100\" />You can also use the bitcoin software to generate <a title=\"Generate new bitcoins\" href=\"http://www.bitcoinminer.com/\">new bitcoins</a>. Wait! You can just print off new money in this currency? Well, yes, but it becomes harder to generate new bitcoins as more and more are made. This is on purpose, to ensure a limited supply of bitcoins. In fact, there is a limit on the total number of bitcoins that can be generated. I recommend against trying to generate new bitcoins, unless you have a high-end model computer. Otherwise, you may be waiting around for a long time.</p>')
 ,(15,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vel tellus lectus, scelerisque faucibus nunc. Curabitur lacus nibh, eleifend vel porttitor in, bibendum quis tortor. Curabitur eros ligula, scelerisque ac ultricies a, dictum ac tellus. Mauris id tellus tortor. Proin a sollicitudin libero. Nam pellentesque commodo magna, nec mattis elit pulvinar id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris orci dui, adipiscing sit amet bibendum vel, sodales sed purus. Donec fringilla odio vel enim cursus luctus quis semper leo. Donec rhoncus odio ac elit dignissim lobortis.</p>\r\n<p>&nbsp;</p>')
 ,(16,'<p>Duis dapibus nibh eu arcu viverra tempor. Fusce auctor sapien eu mauris malesuada vel euismod orci vulputate. Curabitur at orci id quam mollis rhoncus vitae volutpat urna. Nam eget sapien at neque mollis varius sed vitae ipsum. Vestibulum commodo, eros sit amet sagittis cursus, massa mi lacinia lorem, vel pellentesque sapien purus eu lacus. Pellentesque mollis gravida enim. Fusce mi odio, elementum ut fermentum a, pharetra in quam. Mauris sed vestibulum sapien. In sit amet faucibus diam. Proin lectus quam, sodales ut posuere non, viverra a nibh. Aenean sollicitudin, diam eu elementum rutrum, nisi ante pretium mi, ut tristique ante tellus non ligula. Nam diam turpis, viverra non volutpat vel, scelerisque vel neque. In pretium, libero et vulputate varius, libero nulla blandit ligula, tincidunt egestas leo mi eu nisi. Mauris nunc augue, cursus vel viverra non, feugiat in enim. In eget dignissim est. Donec dictum leo in libero tincidunt sollicitudin hendrerit elit placerat. Aliquam vitae nunc diam, non vulputate nibh. Quisque tincidunt, dui ut rutrum feugiat, libero lorem interdum sapien, eget pharetra mi ligula ut lectus. Pellentesque consequat mollis est viverra malesuada.</p>\r\n<p>Curabitur eget quam vitae tellus blandit congue a sed lectus. Nunc ultrices lacus dignissim felis venenatis varius placerat eros dapibus. Nulla facilisi. Vivamus sodales accumsan convallis. Mauris congue tempus feugiat. Proin elementum fringilla leo, sit amet pretium nisl imperdiet interdum. Suspendisse volutpat cursus eros, nec porta est laoreet at. Sed porttitor suscipit augue, eu molestie justo faucibus et. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus faucibus mi vel tortor consequat eget rutrum nisl ultrices. Praesent et lacinia augue. Phasellus id est id enim ultricies placerat. Etiam porta enim eu enim convallis sed eleifend metus faucibus. In ac lobortis eros. Pellentesque felis turpis, cursus sed imperdiet non, viverra vel diam. Donec vel orci mi, placerat egestas purus. Vestibulum vel diam id magna suscipit accumsan. Quisque risus felis, sagittis non iaculis id, tempus in arcu. Donec tempus metus neque. Proin malesuada dui a tortor pretium tincidunt quis at ligula.</p>\r\n<p>Nam laoreet faucibus purus ac pretium. Aenean euismod diam adipiscing erat semper quis sodales elit tristique. Vestibulum vel tellus eu lorem porttitor aliquet. Vestibulum bibendum viverra cursus. Aenean sit amet magna odio, convallis imperdiet metus. Duis condimentum posuere vulputate. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed vitae elit ut sapien vestibulum tempor sit amet ac tortor. Donec ligula nulla, varius id ornare id, vestibulum non felis. Nullam neque erat, tristique a eleifend pellentesque, eleifend sit amet ipsum. In eget urna nibh. Phasellus scelerisque, magna ac feugiat ultricies, risus dolor volutpat quam, in rutrum nunc ante id sem. Fusce interdum scelerisque fermentum.</p>\r\n<p>&nbsp;</p>')
 ,(47,'')
 ,(50,'<h5>There are many great websites for finding other bitcoin businesses and merchandise. Here are just a few.</h5>')
 ,(99,'<p>First of all, let us welcome you to search bitcoin. We at search bitcoin are working hard to index all the bitcoin websites on the web. It is aggregate all the bitcoin products and services offered by the bitcoin community to give you a bird\'s eye view of the state of the economy, and to help you find the stuff you are looking for. This is a tremendously difficult project, but we are making headway. Already we\'ve added just over 100 businesses to our directory, and indexed several thousand items of merchandise offered through these stores. Stay tuned for exciting things to come!</p>')
 ,(98,'<p>First of all, let me welcome you to search bitcoin. We at search bitcoin are working hard to index all the bitcoin websites on the web. It is aggregate all the bitcoin products and services offered by the bitcoin community to give you a bird\'s eye view of the state of the economy, and to help you find the stuff you are looking for. This is a tremendously difficult project, but we are making headway. Already we\'ve added just over 100 businesses to our directory, and indexed several thousand items of merchandise offered through these stores. Stay tuned for exciting things to come!</p>')
 ,(102,'<h5>There are many great websites where you can find other bitcoins businesses. Here are a few of them.</h5>')
 ,(103,'<h5>We are committed to the development of a <em><span style=\"text-decoration: underline;\">Bitcoin Chamber of Commerce</span></em>. To that end we are offering our entire database of all the businesses we have found that accept bitcoins.</h5>')
 ,(104,'<p>Stay tuned. This page is under construction.</p>')
 ,(105,'<h5>Are you new to bitcoins? If so, then you\'ve found a great place to start.</h5>')
 ,(41,'<p>Search Bitcoin</p>')
 ,(59,'<p><a title=\"Bitcoin classifieds\" href=\"http://www.bitcoinclassifieds.net/\">Bitcoin Classifieds</a>: A leader in online ads where you can find merchandise for sale for bitcoins.</p>')
 ,(64,'<h5>Welcome to search bitcoin, the website dedicated to helping you find merchandise and services available in the bitcoin community.</h5>')
 ,(66,'<p>This plugin is part of our mission to help make the bitcoin community more accessible to the general public. Numerous sites currently use it to help support the bitcoin economy, and so can you. The plugin can easily be added to almost any website using the&nbsp;<em>embed button</em>&nbsp;in the plugin.</p>')
 ,(70,'<p><a title=\"Download bitcoin software\" href=\"http://www.bitcoin.org/\">Bitcoin.org</a>: Use this website to download the latest version of the bitcoin software, and to get your first bitcoin address. The software is free to use and open source.</p>')
 ,(69,'<h5>There are many other great websites that can help you get started. Here are a few.</h5>')
 ,(71,'<p><a title=\"Online bitcoin bank\" href=\"http://www.mybitcoin.com/\">My Bitcoin</a>: The quickest way to get a bitcoin address is to use a bitcoin bank, which will run the bitcoin software for you on their servers. My bitcoin was the first online bitcoin bank.</p>')
 ,(73,'<p><a title=\"Online bitcoin exchange\" href=\"http://www.tradehill.com/\">Trade Hill</a>: Trade hill is another commonly used exchange where people buy and sell bitcoins online.</p>')
 ,(74,'<p>We are building a search engine that focuses on bitcoin merchandise and services. Check out the items we have found in our live feed.</p>')
 ,(75,'<h5>We love hearing from our users. We welcome your suggestions, criticisms, and questions.</h5>')
 ,(77,'<p>You can also email us directory at <a title=\"Email address\" href=\"mailto:jared@bitcoinbulletin.com\">jared@bitcoinbulletin.com</a>.</p>')
 ,(78,'<p>Use the online form to send us a message. We will get back to you as quickly as possible.</p>')
 ,(79,'<h5>Here are the names of some of the biggest players in the bitcoin community.</h5>')
 ,(80,'<p><a title=\"Neo\" href=\"http://en.bitcoin.it/wiki/Satoshi_Nakamoto\">Satoshi Nakamoto</a>: Satoshi is the founder of bitcoin and the author of the initial bitcoin software. No one really knows who he or she is because Satoshi has preferred to remain anonymous.</p>')
 ,(81,'<p><a title=\"Morpheus\" href=\"http://gavinthink.blogspot.com/\">Gavin Andresen</a>: Gavin is the current lead developer for the bitcoin software.</p>')
 ,(82,'<p><a title=\"The oracle\" href=\"http://onlyonetv.com/\">Bruce Wagner</a>: Bruce is the bitcoin media guru. He loves to talk about bitcoins, and if he is not already on the phone he will answer your call.</p>')
 ,(83,'<h5>There are lots of great places to hosting discussions about bitcoins. Here are some of the popular ones.</h5>')
 ,(84,'<p><a title=\"Bitcoin blog\" href=\"http://www.bitcoinblogger.com/\">Bitcoin Blogger</a>: One of the first blogs about bitcoins.</p>')
 ,(85,'<p><a title=\"The bitcoin forums\" href=\"http://forum.bitcoin.org/\">The Bitcoin Forums</a>: The best place to talk with other people in the bitcoin community.</p>')
 ,(86,'<p><a title=\"Social media website for bitcoins\" href=\"http://witcoin.com/\">Witcoin</a>: A social media website deditcated to bitcoins.</p>')
 ,(88,'<h5>Visit this page to stay tuned to what is happening to search bitcoin.</h5>')
 ,(91,'<h5>Stay tuned to new posts in our blog to learn what is happening on this website.</h5>')
 ,(93,'<p><a title=\"Bidding site for bitcoins\" href=\"http://biddingpond.com/\">Bidding Pond</a>: This was the first website where people could place bids in bitcoins on used merchandise. It is essentially eBay for bitcoins.</p>')
 ,(94,'<p><a title=\"Wiki trade page\" href=\"http://en.bitcoin.it/wiki/Trade\">The Trade Page</a>: The trade page is a community driven wikipedia style page where people list their bitcoin website. It is arguably the most comprehensive directory listing of bitcoins products and services.</p>')
 ,(96,'<p><a title=\"Online bitcoin exchange\" href=\"http://mtgox.com\">Mt Gox</a>: Mt Gox was the first online bitcoin exchange where people could go to buy and sell bitcoins.&nbsp;</p>')
 ,(97,'<p><a title=\"Social media website for bitcoins\" href=\"http://witcoin.com/\">Witcoin</a>: A social media website dedicated to bitcoins.</p>')
 ,(107,'<p><img style=\"float: right;\" src=\"{CCM:FID_6}\" alt=\"bitcoin.png\" width=\"225\" height=\"225\" />Bitcoins are one of the few true digital currencies in existence, and although the technology behind bitcoins is complex, the currency is simple to use. Bitcoins are unique in that they have been designed with security in mind, can be traded online as easily as emails are sent, and are decentralized so that no authority can undermine the transactions.</p>\r\n<p>So what do people use bitcoins for? Well, you can see from our <a title=\"Bitcoin Merchandise\" href=\"{CCM:CID_1}\">search page</a> that you can use bitcoins to buy essentially any commidity or service that you can buy with traditional money. In fact, there are hundreds of businesses that collectively offer tens of thousands of products, and these numbers grow each day at an exponential rate.</p>\r\n<p>So how do you get bitcoins? The first step is to download the bitcoin software. The program is easy to install. Once you install it, you will be given a bitcoin address. This is kind of like an email address that is for receiving money online. A typical bitcoin address looks something like ours (<em>17gcmYY8Q7nPagk4zKRwjtgxrUvvBcFhDr)</em>. The bitcoin software may take awhile to sync with the rest of the bitcoin network. If you don\'t want to wait this long, you can use any of the online bitcoin banks, which will operate the bitcoin software for you, to quickly get your first bitcoin address.</p>\r\n<p>Once you have setup a bitcoin account, you can use the <a title=\"Get some free bitcoins\" href=\"http://freebitcoins.appspot.com/\">bitcoin faucet</a> to get your first&nbsp;<em>bit-change</em> for free. The bit-change will be sent to your account and saved in your computer (all coins are saved into a special file called the wallet file). If you want more bitcoins you will probably have to purchase them from an <a title=\"Directory of bitcoin exhanges.\" href=\"http://en.bitcoin.it/wiki/Buying_bitcoins\">exchange</a>. The exchanges are websites where people can buy and sell bitcoins. I suggest that you sign-up at an exchange now, because it typically can take up to a week to verify your account.</p>\r\n<p><img style=\"float: right;\" src=\"{CCM:FID_7}\" alt=\"Screenshot.png\" width=\"199\" height=\"100\" />You can also use the bitcoin software to generate <a title=\"Generate new bitcoins\" href=\"http://www.bitcoinminer.com/\">new bitcoins</a>. Wait! You can just print off new money in this currency? Well, yes, but it becomes harder to generate new bitcoins as more and more are made. This is on purpose, to ensure a limited supply of bitcoins. In fact, there is a limit on the total number of bitcoins that can be generated. I recommend against trying to generate new bitcoins, unless you have a high-end model computer. Otherwise, you may be waiting around for a long time.</p>')
 ,(109,'<p><a title=\"Bit sites\" href=\"http://bitsites.net/\">Bitsites</a>: Bitsites is the equivalent of Yelp for bitcoin businesses. We are currently in the process of sharing our database of bitcoin businesses with them.</p>')
 ,(110,'<p><a title=\"Meet the trader\" href=\"http://www.bitcoinbulletin.com\">Bitcoin Bulletin</a>: The bitcoin bulletin, among other things, helps to promote the bitcoin economy with their <em>Meet the Trader</em> interviews.</p>')
 ,(112,'<h5>Stay tuned to learn about the exciting things that are just around the corner.</h5>');

DROP TABLE IF EXISTS btDateNav;

CREATE TABLE IF NOT EXISTS `btDateNav` (
  `bID` int(10) unsigned NOT NULL,
  `num` smallint(5) unsigned NOT NULL,
  `cParentID` int(10) unsigned NOT NULL DEFAULT '1',
  `cThis` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ctID` smallint(5) unsigned DEFAULT NULL,
  `flatDisplay` int(11) DEFAULT '0',
  `defaultNode` varchar(64) DEFAULT 'current_page',
  `truncateTitles` int(11) DEFAULT '0',
  `truncateSummaries` int(11) DEFAULT '0',
  `displayFeaturedOnly` int(11) DEFAULT '0',
  `truncateChars` int(11) DEFAULT '128',
  `truncateTitleChars` int(11) DEFAULT '128',
  `showDescriptions` int(11) DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO btDateNav VALUES(18,0,0,0,4,0,'current_page',0,0,0,0,0,0)
 ,(28,0,71,1,0,0,'current_month',0,0,0,0,0,0);

DROP TABLE IF EXISTS btExternalForm;

CREATE TABLE IF NOT EXISTS `btExternalForm` (
  `bID` int(10) unsigned NOT NULL,
  `filename` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btFile;

CREATE TABLE IF NOT EXISTS `btFile` (
  `bID` int(10) unsigned NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `origfilename` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `generictype` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btFlashContent;

CREATE TABLE IF NOT EXISTS `btFlashContent` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `minVersion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btForm;

CREATE TABLE IF NOT EXISTS `btForm` (
  `bID` int(10) unsigned NOT NULL,
  `questionSetId` int(10) unsigned DEFAULT '0',
  `surveyName` varchar(255) DEFAULT NULL,
  `thankyouMsg` text,
  `notifyMeOnSubmission` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `recipientEmail` varchar(255) DEFAULT NULL,
  `displayCaptcha` int(11) DEFAULT '1',
  `redirectCID` int(11) DEFAULT '0',
  PRIMARY KEY (`bID`),
  KEY `questionSetIdForeign` (`questionSetId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO btForm VALUES(76,1309044364,'Contact Us','You message has been dispatched.',1,'jostmey@gmail.com',0,0);

DROP TABLE IF EXISTS btFormAnswerSet;

CREATE TABLE IF NOT EXISTS `btFormAnswerSet` (
  `asID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionSetId` int(10) unsigned DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`asID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btFormAnswers;

CREATE TABLE IF NOT EXISTS `btFormAnswers` (
  `aID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asID` int(10) unsigned DEFAULT '0',
  `msqID` int(10) unsigned DEFAULT '0',
  `answer` varchar(255) DEFAULT NULL,
  `answerLong` text,
  PRIMARY KEY (`aID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btFormQuestions;

CREATE TABLE IF NOT EXISTS `btFormQuestions` (
  `qID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msqID` int(10) unsigned DEFAULT '0',
  `bID` int(10) unsigned DEFAULT '0',
  `questionSetId` int(10) unsigned DEFAULT '0',
  `question` varchar(255) DEFAULT NULL,
  `inputType` varchar(255) DEFAULT NULL,
  `options` text,
  `position` int(10) unsigned DEFAULT '1000',
  `width` int(10) unsigned DEFAULT '50',
  `height` int(10) unsigned DEFAULT '3',
  `required` int(11) DEFAULT '0',
  PRIMARY KEY (`qID`),
  KEY `questionSetId` (`questionSetId`),
  KEY `msqID` (`msqID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO btFormQuestions VALUES(1,1,76,1309044364,'Name','field','',1000,50,3,0)
 ,(2,2,76,1309044364,'Email Address','field','',1000,50,3,1)
 ,(3,3,76,1309044364,'Comments','text','',1000,50,5,1);

DROP TABLE IF EXISTS btGoogleMap;

CREATE TABLE IF NOT EXISTS `btGoogleMap` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `zoom` int(8) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btGuestBook;

CREATE TABLE IF NOT EXISTS `btGuestBook` (
  `bID` int(10) unsigned NOT NULL,
  `requireApproval` int(11) DEFAULT '0',
  `title` varchar(100) DEFAULT 'Comments',
  `dateFormat` varchar(100) DEFAULT NULL,
  `displayGuestBookForm` int(11) DEFAULT '1',
  `displayCaptcha` int(11) DEFAULT '1',
  `authenticationRequired` int(11) DEFAULT '0',
  `notifyEmail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO btGuestBook VALUES(17,0,'Comments:','M jS, Y',1,1,0,'');

DROP TABLE IF EXISTS btGuestBookEntries;

CREATE TABLE IF NOT EXISTS `btGuestBookEntries` (
  `bID` int(11) DEFAULT NULL,
  `cID` int(11) DEFAULT '1',
  `entryID` int(11) NOT NULL AUTO_INCREMENT,
  `uID` int(11) DEFAULT '0',
  `commentText` longtext,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `entryDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approved` int(11) DEFAULT '1',
  PRIMARY KEY (`entryID`),
  KEY `cID` (`cID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btNavigation;

CREATE TABLE IF NOT EXISTS `btNavigation` (
  `bID` int(10) unsigned NOT NULL,
  `orderBy` varchar(255) DEFAULT 'alpha_asc',
  `displayPages` varchar(255) DEFAULT 'top',
  `displayPagesCID` int(10) unsigned NOT NULL DEFAULT '1',
  `displayPagesIncludeSelf` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displaySubPages` varchar(255) DEFAULT 'none',
  `displaySubPageLevels` varchar(255) DEFAULT 'none',
  `displaySubPageLevelsNum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `displayUnavailablePages` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO btNavigation VALUES(1,'display_asc','top',0,0,'none','enough',0,0)
 ,(3,'display_asc','second_level',0,0,'relevant','enough',0,0)
 ,(7,'display_asc','top',0,0,'none','enough',0,0)
 ,(9,'display_asc','second_level',0,0,'relevant','enough',0,0)
 ,(10,'display_asc','top',0,0,'none','enough',0,0)
 ,(12,'display_asc','top',0,0,'none','enough',0,0)
 ,(14,'display_asc','top',0,0,'relevant_breadcrumb','enough',0,0);

DROP TABLE IF EXISTS btNextPrevious;

CREATE TABLE IF NOT EXISTS `btNextPrevious` (
  `bID` int(10) unsigned NOT NULL,
  `linkStyle` varchar(32) DEFAULT NULL,
  `nextLabel` varchar(128) DEFAULT NULL,
  `previousLabel` varchar(128) DEFAULT NULL,
  `showArrows` int(11) DEFAULT '1',
  `loopSequence` int(11) DEFAULT '1',
  `excludeSystemPages` int(11) DEFAULT '1',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO btNextPrevious VALUES(40,'next_previous','Next','Previous',1,1,1);

DROP TABLE IF EXISTS btPageList;

CREATE TABLE IF NOT EXISTS `btPageList` (
  `bID` int(10) unsigned NOT NULL,
  `num` smallint(5) unsigned NOT NULL,
  `orderBy` varchar(32) DEFAULT NULL,
  `cParentID` int(10) unsigned NOT NULL DEFAULT '1',
  `cThis` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `paginate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displayAliases` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ctID` smallint(5) unsigned DEFAULT NULL,
  `rss` int(11) DEFAULT '0',
  `rssTitle` varchar(255) DEFAULT NULL,
  `rssDescription` longtext,
  `truncateSummaries` int(11) DEFAULT '0',
  `displayFeaturedOnly` int(11) DEFAULT '0',
  `truncateChars` int(11) DEFAULT '128',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO btPageList VALUES(30,10,'chrono_desc',0,0,1,1,4,1,'Blog','',0,0,0)
 ,(90,5,'chrono_desc',0,0,0,1,4,1,'test','test',0,0,0)
 ,(100,10,'chrono_desc',0,0,1,1,4,1,'blog','Search Bitcoin Blog Feed',1,0,128)
 ,(115,4,'chrono_desc',0,0,1,1,4,1,'blog','Search Bitcoin Blog Feed',1,0,128);

DROP TABLE IF EXISTS btRssDisplay;

CREATE TABLE IF NOT EXISTS `btRssDisplay` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `dateFormat` varchar(100) DEFAULT NULL,
  `itemsToDisplay` int(10) unsigned DEFAULT '5',
  `showSummary` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `launchInNewWindow` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btSearch;

CREATE TABLE IF NOT EXISTS `btSearch` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `buttonText` varchar(128) DEFAULT NULL,
  `baseSearchPath` varchar(255) DEFAULT NULL,
  `resultsURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO btSearch VALUES(29,'Tags','','','/search/search-results');

DROP TABLE IF EXISTS btSlideshow;

CREATE TABLE IF NOT EXISTS `btSlideshow` (
  `bID` int(10) unsigned NOT NULL,
  `fsID` int(10) unsigned DEFAULT NULL,
  `playback` varchar(50) DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `fadeDuration` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO btSlideshow VALUES(2,0,'ORDER',NULL,NULL);

DROP TABLE IF EXISTS btSlideshowImg;

CREATE TABLE IF NOT EXISTS `btSlideshowImg` (
  `slideshowImgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(10) unsigned DEFAULT NULL,
  `fID` int(10) unsigned DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `fadeDuration` int(10) unsigned DEFAULT NULL,
  `groupSet` int(10) unsigned DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `imgHeight` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`slideshowImgId`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO btSlideshowImg VALUES(1,2,5,'',5,2,0,0,192)
 ,(2,2,4,'',5,2,0,1,215)
 ,(3,2,2,'',5,2,0,2,192)
 ,(4,2,3,'',5,2,0,3,192);

DROP TABLE IF EXISTS btSurvey;

CREATE TABLE IF NOT EXISTS `btSurvey` (
  `bID` int(10) unsigned NOT NULL,
  `question` varchar(255) DEFAULT '',
  `requiresRegistration` int(11) DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btSurveyOptions;

CREATE TABLE IF NOT EXISTS `btSurveyOptions` (
  `optionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(11) DEFAULT NULL,
  `optionName` varchar(255) DEFAULT NULL,
  `displayOrder` int(11) DEFAULT '0',
  PRIMARY KEY (`optionID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btSurveyResults;

CREATE TABLE IF NOT EXISTS `btSurveyResults` (
  `resultID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `optionID` int(10) unsigned DEFAULT '0',
  `uID` int(10) unsigned DEFAULT '0',
  `bID` int(11) DEFAULT NULL,
  `cID` int(11) DEFAULT NULL,
  `ipAddress` varchar(128) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`resultID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btTags;

CREATE TABLE IF NOT EXISTS `btTags` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `targetCID` int(11) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO btTags VALUES(23,'Tags',68);

DROP TABLE IF EXISTS btVideo;

CREATE TABLE IF NOT EXISTS `btVideo` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btYouTube;

CREATE TABLE IF NOT EXISTS `btYouTube` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `videoURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



