<?php     

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeCalliopePackage extends Package {

	protected $pkgHandle = 'theme_calliope';
	protected $appVersionRequired = '5.1';
	protected $pkgVersion = '1.0.1';
	
	public function getPackageDescription() {
		return t("Installs Calliope theme");
	}
	
	public function getPackageName() {
		return t("Calliope");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('calliope', $pkg);		
	}




}