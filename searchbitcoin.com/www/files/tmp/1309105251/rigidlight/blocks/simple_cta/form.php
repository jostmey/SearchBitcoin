<?php    
defined('C5_EXECUTE') or die(_("Access Denied."));
$formPageSelector = Loader::helper('form/page_selector');
?>

<div style="margin: 20px 0;">
<?php  echo $form->label('ctaTitle', 'CTA Title:');?>
<?php  echo $form->text('ctaTitle', $ctaTitle, array('style' => 'width: 320px'));?>
</div>

<div style="margin: 20px 0;">
<?php  echo $form->label('ctaDesc', 'CTA Description:');?>
<?php  echo $form->text('ctaDesc', $ctaDesc, array('style' => 'width: 320px'));?>
</div>

<div style="margin: 20px 0;">
<?php  echo("<label>Select which page to link to:</label>");
echo $formPageSelector->selectPage('pageID',$pageID); ?>
</div>

