<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
$includeAssetLibrary = true;
$assetLibraryPassThru = array(
	'type' => 'image'
);
$bt->inc('editor_init.php');

$areaID = $a->getAreaID();
$blockID = $b->getBlockID();
$this->inc('/form.php');
?>