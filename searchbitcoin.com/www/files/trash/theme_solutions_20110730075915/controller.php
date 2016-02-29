<?php    

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeSolutionsPackage extends Package {

	protected $pkgHandle = 'theme_solutions';
	protected $appVersionRequired = '5.3.0';
	protected $pkgVersion = '1.0';
	
	public function getPackageDescription() {
		return t("Installs Solutions theme.");
	}
	
	public function getPackageName() {
		return t("Solutions Theme");
	}
	
	public function install() {
		$pkg = parent::install();
		PageTheme::add('solutions', $pkg);		
	}
	
}