<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
?>
<?php 
  $al = Loader::helper('concrete/asset_library');
  $bf = null;
  if ($controller->getImageFileID() > 0) { 
    $bf = $controller->getImageFileObject();
  }
?>
<div style="text-align: center">
  <textarea id="ccm-content-<?php  echo empty($blockID) ?  '' : $blockID . '-' ?><?php  echo $areaID?>" class="advancedEditor ccm-advanced-editor" name="content"><?php  echo $controller->getContentEditMode()?></textarea>
</div>

<div class="ccm-block-field-group">
<h2><?php  echo t('Image')?></h2>
<?php  echo $al->image('ccm-b-image', 'fID', t('Choose Image'), $bf);?>
</div>

<div class="ccm-block-field-group">
<h2><?php  echo t('Image Link URL')?></h2>
<?php  echo  $form->text('link', $link, array('style' => 'width: 250px')); ?>
</div>
<br />
<span>
<?php  echo $form->checkbox('newTab', 1, $newTab); ?>
<label for="newTab" style="display: inline;"> If the image is a link, open a new tab?</label>
</span>
<br />

<div class="ccm-block-field-group">
<h2><?php  echo t('Alt Text')?></h2>
<?php  echo  $form->text('altText', $altText, array('style' => 'width: 250px')); ?>
</div>

<div class="ccm-block-field-group">
<h2><?php  echo t('Maximum Dimensions')?></h2>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td><?php  echo t('Width')?>&nbsp;</td>
<td><?php  echo  $form->text('maxWidth', $maxWidth, array('style' => 'width: 60px')); ?></td>
<td><?php  echo t('Height')?>&nbsp;</td>
<td><?php  echo  $form->text('maxHeight', $maxHeight, array('style' => 'width: 60px')); ?></td>
</tr>
</table>
</div>

<div class="ccm-block-field-group">
  <h2><?php  echo t('Align Image')?></h2>
  <div><?php  echo $form->radio('alignment',0,$alignment) ?> <?php  echo t('Left'); ?></div><br />
  <div><?php  echo $form->radio('alignment',1,$alignment) ?> <?php  echo t('Right'); ?></div><br />
</div>

<div class="ccm-block-field-group">
<h2><?php  echo t('Caption')?></h2>
<?php  echo  $form->text('caption', $caption, array('style' => 'width: 250px')); ?>
</div>

