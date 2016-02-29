<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>

<div id="content">

	<div id="contentleft" class="full">
	
			<?php 
            $a = new Area('Main');
            $a->display($c);
            ?>
	
	</div>

	
</div>

<!-- The main column ends  -->

<?php  $this->inc('elements/footer.php'); ?>