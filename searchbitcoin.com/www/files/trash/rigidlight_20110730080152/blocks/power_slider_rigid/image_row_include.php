<?php   defined('C5_EXECUTE') or die("Access Denied."); ?> 
<?php  $formPageSelector = Loader::helper('form/page_selector'); ?>

<div id="ccm-slideshowBlock-imgRow<?php  echo $imgInfo['slideshowImgId']?>" class="ccm-slideshowBlock-imgRow" >
	<div class="backgroundRow" style="background: url(<?php  echo $imgInfo['thumbPath']?>) no-repeat left top; padding-left: 100px">
		<div class="cm-slideshowBlock-imgRowIcons" >
			<div style="float:right">
				<a onclick="SlideshowBlock.moveUp('<?php  echo $imgInfo['slideshowImgId']?>')" class="moveUpLink"></a>
				<a onclick="SlideshowBlock.moveDown('<?php  echo $imgInfo['slideshowImgId']?>')" class="moveDownLink"></a>									  
			</div>
			<div style="margin-top:4px"><a onclick="SlideshowBlock.removeImage('<?php  echo $imgInfo['slideshowImgId']?>')"><img src="<?php  echo ASSETS_URL_IMAGES?>/icons/delete_small.png" /></a></div>
		</div>
        
		<strong><?php  echo $imgInfo['fileName']?></strong>
		
		<div style="margin: 10px 0;">
                <?php  echo("<label>Select which page to link to:</label>");
                echo $formPageSelector->selectPage('pageID[]',intval($imgInfo['pageID']));	?>
         </div>
         <div style="margin: 10px 0;">
         	<?php  echo $form->label('powerSlidePhraseTitle[]', 'Power Phrase Title');?>
        	<?php  echo $form->text('powerSlidePhraseTitle[]', $imgInfo['powerSlidePhraseTitle'], array('style' => 'width: 300px'));?>
         </div>
         <div style="margin: 10px 0;">
         	<?php  echo $form->label('powerSlidePhraseDesc[]', 'Power Phrase Subtitle');?>
        	<?php  echo $form->text('powerSlidePhraseDesc[]', $imgInfo['powerSlidePhraseDesc'], array('style' => 'width: 300px'));?>
         </div>
	                       
		<input type="hidden" name="imgFIDs[]" value="<?php  echo $imgInfo['fID']?>">
		<input type="hidden" name="imgHeight[]" value="<?php  echo $imgInfo['imgHeight']?>">
		
	</div>
</div>