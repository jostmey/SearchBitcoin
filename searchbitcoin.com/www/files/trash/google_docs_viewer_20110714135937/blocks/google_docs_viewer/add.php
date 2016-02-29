<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
$GoogleDocsViewerController = $controller;
$includeAssetLibrary = true;
$al = Loader::helper('concrete/asset_library');
include($this->getBlockPath() .'/form.php');