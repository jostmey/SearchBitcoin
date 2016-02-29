<?php 
	class SimpleCtaBlockController extends BlockController {
		
		var $pobj;
		
		protected $btDescription = "Add a Call to Action";
		protected $btName = "Simple CTA";
		protected $btTable = 'btSimpleCta';
		protected $btInterfaceWidth = "370";
		protected $btInterfaceHeight = "350";
		
		
		public function save($args) {		
			$args['pageID'] = ($args['pageID'] != '') ? $args['pageID'] : 0;
			parent::save($args);
		}
		
	}
	
?>