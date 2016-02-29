<?php   
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>


	<div id="page" class="no-sidebar">
		
		<div id="content">	
			<?php   

			print $innerContent;
			
			?>
		</div>
		
	
	</div>
	
		<div style="clear: both;">&nbsp;</div>

<?php    $this->inc('elements/footer.php'); ?>