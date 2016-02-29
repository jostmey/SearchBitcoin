<?php  
	defined('C5_EXECUTE') or die(_("Access Denied."));
	
	class DynamicIframeBlockController extends BlockController {

		protected $btDescription = "Insert an IFRAME with dynamic height";
		protected $btName = "Dynamic Iframe";
		protected $btInterfaceWidth = 350;
		protected $btInterfaceHeight = 345;
		protected $btTable = 'btDynamicIframe';	
		
		/** 
		 * Used for localization. If we want to localize the name/description we have to include this
		 */
		public function getBlockTypeDescription() {
			return t("iFrame which can adjust its height according to its content.");
		}
	
		public function getBlockTypeName() {
			return t("Dynamic Iframe");
		}		
			
		public function getJavaScriptStrings() {
			return array(
				'dynamiciframe-url' => t('Please enter an URL.'),
				'dynamiciframe-id' => t('Please enter the id.'),
				'dynamiciframe-width' => t('Please enter the width.')
			);
		}	
		
	}
?>
