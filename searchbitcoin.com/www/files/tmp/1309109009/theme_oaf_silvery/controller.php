<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeOafSilveryPackage extends Package {

  protected $pkgHandle = 'theme_oaf_silvery';
  protected $appVersionRequired = '5.2.2';  
  protected $pkgVersion = '1.1.3';

  public function getPackageDescription() { 
    return t("Installs the OAF_Silvery theme."); 
  }
  public function getPackageName() { 
    return t("OAF_Silvery"); 
  }  

  public function install() { 
    $pkg = parent::install();
    // install block  
    PageTheme::add('oaf_silvery', $pkg);
  }
}
?>
