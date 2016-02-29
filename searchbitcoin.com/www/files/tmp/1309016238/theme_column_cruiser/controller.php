<?php  

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeColumnCruiserPackage extends Package {

	protected $pkgHandle = 'theme_column_cruiser';
	protected $appVersionRequired = '5.2.2';
	protected $pkgVersion = '1.1';
	
	public function getPackageDescription() {
		return t("Installs Column Cruiser theme.");
	}
	
	public function getPackageName() {
		return t("Column Cruiser");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('column_cruiser', $pkg);		
	}




}