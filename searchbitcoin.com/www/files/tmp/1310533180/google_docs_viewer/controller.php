<?php     

defined('C5_EXECUTE') or die(_("Access Denied."));

class GoogleDocsViewerPackage extends Package {

	protected $pkgHandle = 'google_docs_viewer';
	protected $appVersionRequired = '5.3.0';
	protected $pkgVersion = '1.0';
	
	public function getPackageDescription() {
		return t("Embed Google Docs Viewer for displaying PDF, PowerPoint and TIFF documents on your website");
	}
	
	public function getPackageName() {
		return t("Google Docs Viewer");
	}
	
	public function install() {
		$pkg = parent::install();
		
		// install block		
		BlockType::installBlockTypeFromPackage('google_docs_viewer', $pkg);
		
	}




}
