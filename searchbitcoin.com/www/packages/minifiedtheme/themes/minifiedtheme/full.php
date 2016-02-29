<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>
<div id="image-placeholder">
	<?php   $a = new Area('TopImage'); $a->display($c); ?>
</div>

<div id="sub-content-full">
	<?php   $a = new Area('Main'); $a->display($c); ?>
	<?php  print $innerContent; ?>
</div>


<br style="clear: both;" /><br />
<?php  $this->inc('elements/footer.php'); ?>
