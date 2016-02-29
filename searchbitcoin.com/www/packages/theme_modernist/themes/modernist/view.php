<?php   defined('C5_EXECUTE') or die("Access Denied."); 
$this->inc('elements/header.php'); ?>

		<div id="content">					
			<div class="post"> 		
				<?php   print $innerContent; ?>
			</div>
		</div>
		<hr />	
		<div id="sidebar">
	 		<?php  
	 		if ($c->isEditMode()) { ?>
			<div class="section">
	 		<?php   } 
	 		
			$am = new Area('Sidebar');
			$am->setBlockWrapperStart('<div class="section">');
			$am->setBlockWrapperEnd('</div>');
			$am->display($c);
			
	   		if ($c->isEditMode()) { ?>
			</div>
	 		<?php   } ?>	
		</div>
<?php   $this->inc('elements/footer.php'); ?>