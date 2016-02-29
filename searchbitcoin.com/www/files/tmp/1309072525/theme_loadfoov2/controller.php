<?php   

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeLoadfoov2Package extends Package {

	protected $pkgHandle = 'theme_loadfoov2';
	protected $appVersionRequired = '5.2.2';
	protected $pkgVersion = '1.0';
	
	public function getPackageDescription() {
		return t("Installs the LoadFooV2 theme.");
	}
	
	public function getPackageName() {
		return t("LoadFooV2");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('loadfoov2', $pkg);		
	}




}