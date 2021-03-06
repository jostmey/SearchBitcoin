<?php 

defined('C5_EXECUTE') or die("Access Denied.");
/**
 * A library for dealing with searchable logs.
 * @package Utilities
 * @author Andrew Embler <andrew@concrete5.org>
 * @category Concrete
 * @copyright  Copyright (c) 2003-2008 Concrete5. (http://www.concrete5.org)
 * @license    http://www.concrete5.org/license/     MIT License
 *
 */

/**
 * An object that represents a log entry.
 * @package Utilities
 * @author Andrew Embler <andrew@concrete5.org>
 * @category Concrete
 * @copyright  Copyright (c) 2003-2008 Concrete5. (http://www.concrete5.org)
 * @license    http://www.concrete5.org/license/     MIT License
 *
 */
class LogEntry extends Object {
	
	public function getType() {return $this->logType;}
	public function getText() {return $this->logText;}
	public function getID() {return $this->logID;}
	
	public function getTimestamp($type = 'system') {
		if(ENABLE_USER_TIMEZONES && $type == 'user') {
			$dh = Loader::helper('date');
			$timestamp = $dh->getLocalDateTime($this->timestamp);
		} else {
			$timestamp = $this->timestamp;
		}
		return $timestamp;
	}

	/** 
	 * Returns a log entry by ID
	 */
	public static function getByID($logID) {
		$db = Loader::db();
		$r = $db->Execute("select * from Logs where logID = ?", array($logID));
		if ($r) {
			$row = $r->FetchRow();
			$obj = new LogEntry();
			$obj->setPropertiesFromArray($row);
			return $obj;
		}
	}
	
	
}


/**
 * A library for dealing with searchable logs.
 * @package Utilities
 * @author Andrew Embler <andrew@concrete5.org>
 * @category Concrete
 * @copyright  Copyright (c) 2003-2008 Concrete5. (http://www.concrete5.org)
 * @license    http://www.concrete5.org/license/     MIT License
 *
 */
 
class Log {

	private $log;
	private $logfile;
	private $name;
	private $session = false;
	private $sessionText = null;
	private $isInternal = false;
	
	public function __construct($log = null, $session = true, $internal = false) {
		$th = Loader::helper('text');
		if ($log == null) {
			$log = '';
		}
		$this->log = $log;
		$this->name = $th->unhandle($log);
		$this->session = $session;
		$this->isInternal = $internal;
	}
	
	public function write($message) {
		$this->sessionText .= $message . "\n";
		if (!$this->session) {
			$this->close();
		}
	}

	public static function addEntry($message, $namespace = null) {
		$l = new Log($namespace, false);
		$l->write($message);
	}
	
	/** 
	 * Removes all "custom" log entries - these are entries that an app owner has written and don't have a builtin C5 type
	 */
	public function clearCustom() {
		$db = Loader::db();
		$db->Execute("delete from Logs where logIsInternal = 0");
	}
	
	public function clearInternal() {
		$db = Loader::db();
		$db->Execute("delete from Logs where logIsInternal = 1");
	}

	
	/** 
	 * Removes all log entries
	 */
	public function clearAll() {
		$db = Loader::db();
		$db->Execute("delete from Logs");
	}

	
	public function close() {
		$v = array($this->log, htmlentities($this->sessionText, ENT_COMPAT, APP_CHARSET), $this->isInternal);
		$db = Loader::db();
		$db->Execute("insert into Logs (logType, logText, logIsInternal) values (?, ?, ?)", $v);
		$this->sessionText = '';
	}
	
	/** 
	 * Renames a log file and moves it to the log archive.
	 */
	public function archive() {

	}
	
	/** 
	 * Returns the total number of entries matching this type 
	 */
	public static function getTotal($keywords, $type) {
		$db = Loader::db();
		if ($keywords != '') {
			$kw = 'and logText like ' . $db->quote('%' . $keywords . '%');
		}
		if ($type != false) {
			$v = array($type);
			$r = $db->GetOne('select count(logID)  from Logs where logType = ? ' . $kw, $v);
		} else {
			$r = $db->GetOne('select count(logID)  from Logs where 1=1 ' . $kw);
		}
		return $r;
	}
	
	/** 
	 * Returns a list of log entries
	 */
	public static function getList($keywords, $type, $limit) {
		$db = Loader::db();
		if ($keywords != '') {
			$kw = 'and logText like ' . $db->quote('%' . $keywords . '%');
		}
		if ($type != false) {
			$v = array($type);
			$r = $db->Execute('select logID from Logs where logType = ? ' . $kw . ' order by timestamp desc limit ' . $limit, $v);
		} else {
			$r = $db->Execute('select logID from Logs where 1=1 ' . $kw . ' order by timestamp desc limit ' . $limit);
		}
		
		$entries = array();
		while ($row = $r->FetchRow()) {
			$entries[] = LogEntry::getByID($row['logID']);
		}
		return $entries;
	}
	
	/** 
	 * Returns an array of distinct log types
	 */
	public static function getTypeList() {
		$db = Loader::db();
		$lt = $db->GetCol("select distinct logType from Logs");
		if (!is_array($lt)) {
			$lt = array();
		}
		return $lt;
	}
	
	public function getName() { return $this->name;}
	
	/** 
	 * Returns all the log files in the directory
	 */
	public static function getLogs() {
		$db = Loader::db();
		$r = $db->GetCol('select distinct logType from Logs order by logType asc');
		return $r;
	}

}