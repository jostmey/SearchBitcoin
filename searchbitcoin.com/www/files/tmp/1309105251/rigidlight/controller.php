<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));

class RigidlightPackage extends Package {

     protected $pkgHandle = 'rigidlight';
     protected $appVersionRequired = '5.3.3.1';
     protected $pkgVersion = '1.0';

     public function getPackageDescription() {
          return t("A light sweet C5 theme");
     }

     public function getPackageName() {
          return t("Rigid Light - Theme");
     }
     
     public function install() {
          $pkg = parent::install();
     
          // install block 
          BlockType::installBlockTypeFromPackage('simple_logo', $pkg); 
          BlockType::installBlockTypeFromPackage('simple_cta', $pkg); 
		  BlockType::installBlockTypeFromPackage('vcard', $pkg); 
		  BlockType::installBlockTypeFromPackage('power_slider_rigid', $pkg); 
          PageTheme::add('rigidlight', $pkg);
     }
     
}
?>