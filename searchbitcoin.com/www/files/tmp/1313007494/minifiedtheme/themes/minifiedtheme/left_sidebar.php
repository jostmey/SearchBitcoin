<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>
<div id="image-placeholder">
	<?php   $a = new Area('TopImage'); $a->display($c); ?>
</div>
<div id="sidebar" class="sidebar-left">
	<?php   $a = new Area('Sidebar'); $a->display($c); ?>
</div>

<div id="sub-content-right" class="content-right">
	<?php  $pageTitle = $c->getCollectionName(); ?>
	<h1><?php  echo $pageTitle?></h1>
	<?php   $a = new Area('Main'); $a->display($c); ?>
</div>


<br style="clear: both;" /><br />
<?php  $this->inc('elements/footer.php'); ?>