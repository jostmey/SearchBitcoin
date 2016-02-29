<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?> 
		
    <div id="left">
		<?php 
		$a = new Area('Main');
		$a->display($c);			
		?>	  
    </div>
	
    <div id="right" > 
		  <div class="box">
			<div class="boxInner">
				<?php 
				$as = new Area('Sidebar');
				$as->display($c);
				?>	
			</div>
		  </div> 
		  
		  <div class="box">
			<div class="boxInner">
				<?php 
				$as = new Area('Sidebar 2');
				$as->display($c);
				?>	
			</div>
		  </div> 	  
    </div>	 

<?php  $this->inc('elements/footer.php'); ?>