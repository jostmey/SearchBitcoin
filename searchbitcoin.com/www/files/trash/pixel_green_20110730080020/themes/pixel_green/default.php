<?php   
defined('C5_EXECUTE') or die("Access Denied.");
$this->inc('elements/header.php'); ?>

	<div id="topImage"> 
	
	</div>
		
	<div id="central">
		
		<div id="sidebar">
			<?php   $a = new Area('Sidebar');
			$a->setBlockWrapperStart('<div class="sidebarWrapper">');
			$a->setBlockWrapperEnd('</div>');
			$a->display($c); 
			?>				
		</div>
		
		<div id="body">	
			<?php   
			$a = new Area('Main');
			$a->display($c);
			
			?>
		</div>
		
		<div class="spacer">&nbsp;</div>		
	</div>

<?php    $this->inc('elements/footer.php'); ?>