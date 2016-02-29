<?php   

defined('C5_EXECUTE') or die(_("Access Denied."));

class DynamicIframePackage extends Package {

	protected $pkgHandle = 'dynamic_iframe';
	protected $appVersionRequired = '5.2.0';
	protected $pkgVersion = '1.5';
	
	public function getPackageDescription() {
		return t("iFrame which can adjust its height according to its content.");
	}
	
	public function getPackageName() {
		return t("Dynamic Iframe");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		BlockType::installBlockTypeFromPackage('dynamic_iframe', $pkg);
		
	}




}