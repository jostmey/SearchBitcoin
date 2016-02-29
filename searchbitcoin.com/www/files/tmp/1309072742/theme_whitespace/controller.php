<?php  

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeWhitespacePackage extends Package {

	protected $pkgHandle = 'theme_whitespace';
	protected $appVersionRequired = '5.3.0';
	protected $pkgVersion = '1.0';
	
	public function getPackageDescription() {
		return t("Installs Whitespace theme.");
	}
	
	public function getPackageName() {
		return t("Whitespace Theme");
	}
	
	public function install() {
		$pkg = parent::install();
		PageTheme::add('whitespace', $pkg);		
	}
	
}