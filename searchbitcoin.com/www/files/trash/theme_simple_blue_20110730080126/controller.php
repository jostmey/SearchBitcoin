<?php    

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeSimpleBluePackage extends Package {

	protected $pkgHandle = 'theme_simple_blue';
	protected $appVersionRequired = '5.2.2';
	protected $pkgVersion = '1.1';
	
	public function getPackageDescription() {
		return t("Install the theme Simple Blue, a clean and simple two column theme.");
	}
	
	public function getPackageName() {
		return t("Simple Blue");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('simple_blue', $pkg);	
	}

}