<?php      

defined('C5_EXECUTE') or die(_("Access Denied."));

class AerosPackage extends Package {

	protected $pkgHandle = 'aeros';
	protected $appVersionRequired = '5.2.2';
	protected $pkgVersion = '1.0';
	
	public function getPackageDescription() {
		return t("Installs Aeros theme");
	}
	
	public function getPackageName() {
		return t("Aeros");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('aeros', $pkg);		
	}




}