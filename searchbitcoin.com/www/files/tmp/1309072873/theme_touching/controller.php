<?php   

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeTouchingPackage extends Package {

	protected $pkgHandle = 'theme_touching';
	protected $appVersionRequired = '5.2.2';
	protected $pkgVersion = '1.0';
	
	public function getPackageDescription() {
		return t("Installs the Touching theme.");
	}
	
	public function getPackageName() {
		return t("Touching");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('touching', $pkg);		
	}




}