<?php  

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeInnovationPackage extends Package {

	protected $pkgHandle = 'theme_innovation';
	protected $appVersionRequired = '5.3.0';
	protected $pkgVersion = '1.0';
	
	public function getPackageDescription() {
		return t("Installs Innovation theme.");
	}
	
	public function getPackageName() {
		return t("Innovation Theme");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('innovation', $pkg);		
	}

}