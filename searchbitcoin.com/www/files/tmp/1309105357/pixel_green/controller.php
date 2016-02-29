<?php     

defined('C5_EXECUTE') or die(_("Access Denied."));

class PixelGreenPackage extends Package {

	protected $pkgHandle = 'pixel_green';
	protected $appVersionRequired = '5.3';
	protected $pkgVersion = '1.1';
	
	public function getPackageDescription() {
		return t("Installs the Pixel Green theme.");
	}
	
	public function getPackageName() {
		return t("Pixel Green");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('pixel_green', $pkg);	
	}

}