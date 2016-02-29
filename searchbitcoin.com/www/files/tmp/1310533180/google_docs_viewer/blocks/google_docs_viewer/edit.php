<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
$GoogleDocsViewerController = $controller;
$includeAssetLibrary = true;
$al = Loader::helper('concrete/asset_library');
$bf = null;
if (File::getByID($fID) > 0) { 
	$bf = File::getByID($fID);
}
include($this->getBlockPath() .'/form.php');