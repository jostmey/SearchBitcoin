<?php   

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeNeuphoricPackage extends Package {

	protected $pkgHandle = 'theme_neuphoric';
	protected $appVersionRequired = '5.2.2';
	protected $pkgVersion = '1.0';
	
	public function getPackageDescription() {
		return t("Installs the Neuphoric theme.");
	}
	
	public function getPackageName() {
		return t("Neuphoric");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('neuphoric', $pkg);		
	}




}