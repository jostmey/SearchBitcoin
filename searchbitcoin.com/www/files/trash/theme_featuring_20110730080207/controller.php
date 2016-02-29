<?php  

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeFeaturingPackage extends Package {

	protected $pkgHandle = 'theme_featuring';
	protected $appVersionRequired = '5.3.0';
	protected $pkgVersion = '1.0';
	
	public function getPackageDescription() {
		return t("Installs Featuring theme.");
	}
	
	public function getPackageName() {
		return t("Featuring Theme");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('featuring', $pkg);		
	}

}