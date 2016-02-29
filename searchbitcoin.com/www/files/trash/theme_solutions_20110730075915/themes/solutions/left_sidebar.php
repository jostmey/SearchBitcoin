<?php   
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>


	<div id="page">
		<div id="sidebar_left">
			<?php   
			$as = new Area('Sidebar');
			$as->display($c);
			?>		
		</div>
		
		<div id="content_left">	
			<?php   

			$a = new Area('Main');
			$a->display($c);			
			?>
		</div>
		
	<div style="clear: both;">&nbsp;</div>	
	
	</div>

<?php    $this->inc('elements/footer.php'); ?>