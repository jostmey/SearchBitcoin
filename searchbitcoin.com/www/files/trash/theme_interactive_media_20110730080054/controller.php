<?php    

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeInteractiveMediaPackage extends Package {

	protected $pkgHandle = 'theme_interactive_media';
	protected $appVersionRequired = '5.1';
	protected $pkgVersion = '1.0';
	
	public function getPackageDescription() {
		return t("Installs Interactive Media theme");
	}
	
	public function getPackageName() {
		return t("Interactive Media");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('interactive_media', $pkg);		
	}




}