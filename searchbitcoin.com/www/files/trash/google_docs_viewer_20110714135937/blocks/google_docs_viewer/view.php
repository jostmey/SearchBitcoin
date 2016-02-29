<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));

$file = File::getByID($fID); 
$path = $file->getDownloadUrl();

global $c;

if ($c->isEditMode()) { ?>

		<div class="ccm-edit-mode-disabled-item" style="width:100%; height:<?php    echo $height?>px;">
			<div style="padding:8px 0px;"><?php    echo t('Google Docs Viewer - disabled in edit mode.')?></div>
		</div>
		
<?php    } else { ?>
	<iframe src="http://docs.google.com/viewer?url=<?php  echo $path?>&embedded=true" width="100%" height="<?php  echo $height?>" style="border: none;">
		<p>Click <a href="<?php  echo $path?>">here</a> to download the document.</p>
	</iframe>
	
<?php    } ?>