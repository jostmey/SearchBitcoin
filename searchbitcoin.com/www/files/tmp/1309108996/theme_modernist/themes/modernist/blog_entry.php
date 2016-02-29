<?php   defined('C5_EXECUTE') or die("Access Denied."); 
$this->inc('elements/header.php'); ?>

		<div id="content">					
	 		<?php  
	 		if ($c->isEditMode()) { ?>
			<div class="post">
	 		<?php   } 
	 		
			$am = new Area('Blog Post Header');
			$am->setBlockWrapperStart('<div class="post">');
			$am->setBlockWrapperEnd('</div>');
			$am->display($c);
			?>
				<h1><?php   echo $c->getCollectionName(); ?></h1>
				<p class="meta"><?php   echo t('Posted by')?> <?php   echo $c->getVersionObject()->getVersionAuthorUserName(); ?> on <?php   echo $c->getCollectionDatePublic('F j, Y'); ?></p>	
			<?php  
			$am = new Area('Main');
			$am->setBlockWrapperStart('<div class="post">');
			$am->setBlockWrapperEnd('</div>');
			$am->display($c);

			$am = new Area('Blog Post More');
			$am->setBlockWrapperStart('<div class="post">');
			$am->setBlockWrapperEnd('</div>');
			$am->display($c);

			$am = new Area('Blog Post Footer');
			$am->setBlockWrapperStart('<div class="post">');
			$am->setBlockWrapperEnd('</div>');
			$am->display($c);
			
	   		if ($c->isEditMode()) { ?>
			</div>
	 		<?php   } ?>			
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