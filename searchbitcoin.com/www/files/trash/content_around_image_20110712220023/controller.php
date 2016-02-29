<?php 

defined('C5_EXECUTE') or die(_("Access Denied."));

class ContentAroundImagePackage extends Package {

     protected $pkgHandle = 'content_around_image';
     protected $appVersionRequired = '5.3.0';
     protected $pkgVersion = '1.23';

     public function getPackageDescription() {
          return t("Wraps a captioned image in wysiwyg editable content");
     }

     public function getPackageName() {
          return t("Content Around Image");
     }
    
     public function install() {
          $pkg = parent::install();
    
          // install block
          BlockType::installBlockTypeFromPackage('content_around_image', $pkg);
     }
    
}

?>