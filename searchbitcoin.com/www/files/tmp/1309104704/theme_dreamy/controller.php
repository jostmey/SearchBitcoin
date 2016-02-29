<?php   

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeDreamyPackage extends Package {

	protected $pkgHandle = 'theme_dreamy';
	protected $appVersionRequired = '5.2.2';
	protected $pkgVersion = '1.0';
	
	public function getPackageDescription() {
		return t("Installs the Dreamy theme.");
	}
	
	public function getPackageName() {
		return t("Dreamy");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('dreamy', $pkg);		
	}




}