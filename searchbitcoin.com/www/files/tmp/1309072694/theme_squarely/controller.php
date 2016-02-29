<?php  

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeSquarelyPackage extends Package {

	protected $pkgHandle = 'theme_squarely';
	protected $appVersionRequired = '5.3.0';
	protected $pkgVersion = '1.0';
	
	public function getPackageDescription() {
		return t("Installs Squarely theme.");
	}
	
	public function getPackageName() {
		return t("Squarely Theme");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('squarely', $pkg);		
	}

}