<?php   
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>
	
	<div id="page">
		
		<div id="content_full">	
			<?php   
			
			$a = new Area('Main');
			$a->display($c);
			
			?>
		</div>
		
	<div style="clear: both;">&nbsp;</div>
		
	</div>

<?php    $this->inc('elements/footer.php'); ?>