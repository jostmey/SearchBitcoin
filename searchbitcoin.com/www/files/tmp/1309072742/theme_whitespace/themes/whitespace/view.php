<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>

<div id="content">

	<div id="contentleft" class="full">
	
			<?php 

			print $innerContent;
			
			?>
	
	</div>

	
</div>

<!-- The main column ends  -->

<?php  $this->inc('elements/footer.php'); ?>