<?php   

defined('C5_EXECUTE') or die(_("Access Denied."));

class Theme2colPackage extends Package {

	protected $pkgHandle = 'theme_2col';
	protected $appVersionRequired = '5.3.0';
	protected $pkgVersion = '1.0.1';
	
	public function getPackageDescription() {
		return t("Installs Simple 2 Column Theme.");
	}
	
	public function getPackageName() {
		return t("Simple 2 Column Theme");
	}
	
	public function install() {
		$pkg = parent::install();
		PageTheme::add('simplecols', $pkg);		
	}
	
}