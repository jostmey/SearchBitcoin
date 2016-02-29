<?php   
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>

	<div id="page">
		<div id="sidebar">
			<?php   
			$as = new Area('Sidebar');
			$as->display($c);
			?>		
		</div>
		
		<div id="content">	
			<?php   
			$a = new Area('Main');
			$a->display($c);
			
			?>
		</div>
		
	
	</div>
	
	<div style="clear: both;">&nbsp;</div>

<?php    $this->inc('elements/footer.php'); ?>