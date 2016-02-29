<?php   

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeMintChocolateChipPackage extends Package {

	protected $pkgHandle = 'theme_mint_chocolate_chip';
	protected $appVersionRequired = '5.2.2';
	protected $pkgVersion = '1.0';
	
	public function getPackageDescription() {
		return t("Installs the Mint Chocolate Chip theme.");
	}
	
	public function getPackageName() {
		return t("Mint Chocolate Chip");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('mint_chocolate_chip', $pkg);		
	}

}