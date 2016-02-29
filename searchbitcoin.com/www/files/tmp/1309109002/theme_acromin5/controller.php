<?php    

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeAcromin5Package extends Package {

	protected $pkgHandle = 'theme_acromin5';
	protected $appVersionRequired = '5.3.3';
	protected $pkgVersion = '1.0';
	
	public function getPackageDescription() {
		return t("Installs the Acromin5 theme.");
	}
	
	public function getPackageName() {
		return t("Acromin5");
	}
	
	public function install() {
		$pkg = parent::install();
		
		PageTheme::add('acromin5', $pkg);
		
				
	}
	
}