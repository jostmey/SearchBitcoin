<?php    

defined('C5_EXECUTE') or die(_("Access Denied."));

class Cannonf700ZenlikePackage extends Package {

	protected $pkgHandle = 'cannonf700_zenlike';
	protected $appVersionRequired = '5.3.0';
	protected $pkgVersion = '1.02';
	
	public function getPackageDescription() {
		return t("A free, lightweight, tableless, fluid W3C-compliant website design by NodeThirtyThree Design. Converted by www.rynomediaonline.com");
	}
	
	public function getPackageName() {
		return t("ZenLike");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('zenlike', $pkg);		 
	}




}