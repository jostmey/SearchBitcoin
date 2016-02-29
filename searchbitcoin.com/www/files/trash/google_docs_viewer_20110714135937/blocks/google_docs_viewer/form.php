<?php   defined('C5_EXECUTE') or die(_("Access Denied."));?>

<h2><?php  echo t('File')?></h2>
<?php  echo $al->file('ccm-b-file', 'fID', t('Choose Document'), $bf, array('fExtension'=>'pdf'));?>

<br />

<h2><?php  echo t('Height')?></h2>
<input type="text" name="height" value="<?php  echo $GoogleDocsViewerController->height?>">