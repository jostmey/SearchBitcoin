<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>

<div class="rowcontainer">
		<div class="fullcolumn">	
			<?php 

			print $innerContent;
			
			?>
		</div>
</div>
			
<?php  $this->inc('elements/footer.php'); ?>