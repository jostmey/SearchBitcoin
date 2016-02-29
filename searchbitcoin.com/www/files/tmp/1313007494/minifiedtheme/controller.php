<?php        

defined('C5_EXECUTE') or die(_("Access Denied."));

class MinifiedthemePackage extends Package {

	protected $pkgHandle = 'minifiedtheme';
	protected $appVersionRequired = '5.3.0';
	protected $pkgVersion = '1.0';
	
	public function getPackageDescription() {
		return t("Installs Minified C5 theme.");
	}
	
	public function getPackageName() {
		return t("Minified Theme");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('minifiedtheme', $pkg);		
	}

}