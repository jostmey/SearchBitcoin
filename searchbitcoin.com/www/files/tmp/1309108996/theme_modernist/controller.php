<?php     

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeModernistPackage extends Package {

	protected $pkgHandle = 'theme_modernist';
	protected $appVersionRequired = '5.3.3';
	protected $pkgVersion = '1.0';
	
	public function getPackageDescription() {
		return t("Installs the Modernist theme.");
	}
	
	public function getPackageName() {
		return t("Modernist");
	}
	
	public function install() {
		$pkg = parent::install();
		
		PageTheme::add('modernist', $pkg);
		
				
	}
	
}