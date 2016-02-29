<?php      

defined('C5_EXECUTE') or die(_("Access Denied."));

class ThemeSpeechBubblesPackage extends Package {

	protected $pkgHandle = 'theme_speech_bubbles';
	protected $appVersionRequired = '5.1';
	protected $pkgVersion = '1.0.4';
	
	public function getPackageDescription() {
		return t("Installs Speech Bubbles theme");
	}
	
	public function getPackageName() {
		return t("Speech Bubbles");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		PageTheme::add('bubbles', $pkg);		
	}




}