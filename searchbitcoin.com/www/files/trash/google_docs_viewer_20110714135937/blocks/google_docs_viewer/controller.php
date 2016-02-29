<?php  
	defined('C5_EXECUTE') or die(_("Access Denied."));
	
	class GoogleDocsViewerBlockController extends BlockController {

		protected $btDescription = "Embed Google Docs Viewer for displaying PDF, PowerPoint and TIFF documents on your website";
		protected $btName = "Google Docs Viewer";
		protected $btInterfaceWidth = 300;
		protected $btInterfaceHeight = 200;
		protected $btTable = 'btGoogleDocsViewer';		
		
	}
?>
