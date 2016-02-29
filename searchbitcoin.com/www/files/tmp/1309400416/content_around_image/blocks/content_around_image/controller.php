<?php  
	defined('C5_EXECUTE') or die(_("Access Denied."));
	class ContentAroundImageBlockController extends BlockController {
		
		var $pobj;
		
		protected $btTable = 'btContentAroundImage';
		protected $btInterfaceWidth = "600";
		protected $btInterfaceHeight = "465";
		
		public function getBlockTypeDescription() {
			return t("HTML/WYSIWYG Editor Content Wrapping a Captioned Image.");
		}
		
		public function getBlockTypeName() {
			return t("Content Around Image");
		}
		
		function getContent() {
			$content = $this->translateFrom($this->content);

			return $content;				
		}
		
		public function getSearchableContent(){
			return $this->content;
		}
		
		function br2nl($str) {
			$str = str_replace("\r\n", "\n", $str);
			$str = str_replace("<br />\n", "\n", $str);
			return $str;
		}
		
		function getContentEditMode() {
      /*
			$content = $this->translateFromEditMode($this->content);
			return $content;				
      */
			return $this->content;				
		}

		function translateFromEditMode($text) {
			// old stuff. Can remove in a later version.
			$text = str_replace('href="{[CCM:BASE_URL]}', 'href="' . BASE_URL . DIR_REL, $text);
			$text = str_replace('src="{[CCM:REL_DIR_FILES_UPLOADED]}', 'src="' . BASE_URL . REL_DIR_FILES_UPLOADED, $text);

			// we have the second one below with the backslash due to a screwup in the
			// 5.1 release. Can remove in a later version.

			$text = preg_replace(
				array(
					'/{\[CCM:BASE_URL\]}/i',
					'/{CCM:BASE_URL}/i'),
				array(
					BASE_URL . DIR_REL,
					BASE_URL . DIR_REL)
				, $text);
				
			// now we add in support for the links
			
			$text = preg_replace(
				'/{CCM:CID_([0-9]+)}/i',
				BASE_URL . DIR_REL . '/' . DISPATCHER_FILENAME . '?cID=\\1',
				$text);

			// now we add in support for the files
			$text = preg_replace_callback(
				'/{CCM:FID_([0-9]+)}/i',
				array('ContentAroundImageBlockController', 'replaceFileIDInEditMode'),				
				$text);

			return $text;
		}
		
		function translateFrom($text) {
			// old stuff. Can remove in a later version.
			$text = str_replace('href="{[CCM:BASE_URL]}', 'href="' . BASE_URL . DIR_REL, $text);
			$text = str_replace('src="{[CCM:REL_DIR_FILES_UPLOADED]}', 'src="' . BASE_URL . REL_DIR_FILES_UPLOADED, $text);

			// we have the second one below with the backslash due to a screwup in the
			// 5.1 release. Can remove in a later version.

			$text = preg_replace(
				array(
					'/{\[CCM:BASE_URL\]}/i',
					'/{CCM:BASE_URL}/i'),
				array(
					BASE_URL . DIR_REL,
					BASE_URL . DIR_REL)
				, $text);
				
			// now we add in support for the links
			
			$text = preg_replace_callback(
				'/{CCM:CID_([0-9]+)}/i',
				array('ContentAroundImageBlockController', 'replaceCollectionID'),				
				$text);

			// now we add in support for the files
			
			$text = preg_replace_callback(
				'/{CCM:FID_([0-9]+)}/i',
				array('ContentAroundImageBlockController', 'replaceFileID'),				
				$text);
			
			return $text;
		}
		
		private function replaceFileID($match) {
			$fileID = $match[1];
			if ($fileID > 0) {
				$path = File::getRelativePathFromID($fileID);
				return $path;
			}
		}

		private function replaceFileIDInEditMode($match) {
			$fileID = $match[1];
			return View::url('/download_file', 'view_inline', $fileID);
		}
		
		private function replaceCollectionID($match) {
			$cID = $match[1];
			if ($cID > 0) {
				$path = Page::getCollectionPathFromID($cID);
				if (URL_REWRITING == true) {
					$path = DIR_REL . $path;
				} else {
					$path = DIR_REL . '/' . DISPATCHER_FILENAME . $path;
				}
				return $path;
			}
		}
		
		function translateTo($text) {
			// keep links valid
			$url1 = str_replace('/', '\/', BASE_URL . DIR_REL . '/' . DISPATCHER_FILENAME);
			$url2 = str_replace('/', '\/', BASE_URL . DIR_REL);
			$url3 = View::url('/download_file', 'view_inline');
			$url3 = str_replace('/', '\/', $url3);
			$url3 = str_replace('-', '\-', $url3);
			$text = preg_replace(
				array(
					'/' . $url1 . '\?cID=([0-9]+)/i', 
					'/' . $url3 . '([0-9]+)\//i', 
					'/' . $url2 . '/i'),
				array(
					'{CCM:CID_\\1}',
					'{CCM:FID_\\1}',
					'{CCM:BASE_URL}')
				, $text);
			return $text;
		}
		
		function save($data) {
      $args = $data;
			//Handle checkboxes
			$args['newTab'] = isset($args['newTab']) ? 1 : 0;
      //Handle empty textboxes
      $args['maxWidth'] = empty($args['maxWidth']) ? 0 : $args['maxWidth'];
      $args['maxHeight'] = empty($args['maxHeight']) ? 0 : $args['maxHeight'];
      
			$content = $this->translateTo($data['content']);
			$args['content'] = $content;
			parent::save($args);
		}
    
    function getContentAndGenerate() {
			$db = Loader::db();
			$c = Page::getCurrentPage();
			$bID = $this->bID;
			
			$f = $this->getImageFileObject();
			$fullPath = $f->getPath();
			$relPath = $f->getRelativePath();			
			$size = @getimagesize($fullPath);
			
			if ($this->maxWidth > 0 || $this->maxHeight > 0) {
				$mw = $this->maxWidth > 0 ? $this->maxWidth : $size[0];
				$mh = $this->maxHeight > 0 ? $this->maxHeight : $size[1];
				$ih = Loader::helper('image');
				$thumb = $ih->getThumbnail($f, $mw, $mh);
				$sizeStr = " width='{$thumb->width}' height='{$thumb->height}'";
				$relPath = $thumb->src;
			} else {
				$sizeStr = $size[3];
			}
      $style = $this->alignment == 0 ? 'margin-right: 8px; float: left;' : 'margin-left: 8px; float: right;';
      $style .= " width: {$thumb->width}px;";
      
			$targetStr = $this->newTab == 1 ? " target= '_blank'" : "";
      
			$img = "<img border='0' alt='{$this->altText}' src='{$relPath}' {$sizeStr} />";

			if(!empty($this->link)) {
				$img = "<a href='{$this->link}'" . $targetStr . ">" . $img ."</a>";
			}
      $retval = "<div>\r\n";
      $retval .= '<div style="clear:both;"></div>' . "\r\n";
      $retval .= "<div class='cai-image-with-caption' id='cai-image-with-caption-{$this->bID}' style='{$style}' >\r\n" . $img . "\r\n";

      if (!empty($this->caption)) {
        $retval .= "<br />\r\n<span class='cai-caption'>{$this->caption}</span>\r\n";
      }
      $retval .= "</div>\r\n" . $this->getContent() . "\r\n";
      $retval .= '<div style="clear:both;"></div>' . "\r\n";
      $retval .= "</div>\r\n";
      
			return $retval;
		}
    
		function getImageFileID() {return $this->fID;}
    
		function getImageFileObject() {
			return File::getByID($this->fID);
		}
    
    public function getJavaScriptStrings() {
      return array(
        'image-required' => t('You must select an image.'),
      );
    }
    
	}
