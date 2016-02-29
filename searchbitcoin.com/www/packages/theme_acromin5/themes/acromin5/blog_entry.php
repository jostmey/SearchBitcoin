<?php  defined('C5_EXECUTE') or die("Access Denied."); 
$this->inc('elements/header.php'); ?>

<div id="container">
<div id="posts">
	
	 <?php 
	 	if ($c->isEditMode()) { ?>
		<div class="post">
	 <?php  } ?>
	
	<?php 
    $am = new Area('Blog Post Header');
    $am->setBlockWrapperStart('<div class="post">');
    $am->setBlockWrapperEnd('</div>');
    $am->display($c);
	?>
	
	<?php 
	   	if ($c->isEditMode()) { ?>
		</div>
	 <?php  }
	 ?>
	
	 <div class="post">
	 <h1><?php  echo $c->getCollectionName(); ?></h1>
	 <p class="meta"><?php  echo t('Posted by')?> <?php  echo $c->getVersionObject()->getVersionAuthorUserName(); ?> on <?php  echo $c->getCollectionDatePublic('F j, Y'); ?></p>
	 </div>
	 <?php 
	 if ($c->isEditMode()) { ?>
		<div class="post">
	 <?php  } ?>
	 

	<?php 
    $am = new Area('Main');
    $am->setBlockWrapperStart('<div class="post">');
    $am->setBlockWrapperEnd('</div>');
    $am->display($c);
    
    $am1 = new Area('Blog Post More');
    $am1->setBlockWrapperStart('<div class="post">');
    $am1->setBlockWrapperEnd('</div>');
    $am1->display($c);
     
    $am2 = new Area('Blog Post Footer');
    $am2->setBlockWrapperStart('<div class="post">');
    $am2->setBlockWrapperEnd('</div>');
    $am2->display($c);
   	if ($c->isEditMode()) { ?>
		</div>
	 <?php  }
?>
</div>

<div id="sidebar">
<?php 

	if ($c->isEditMode()) { ?>
		<div class="inside">
	 <?php  }
	
    $as = new Area('Sidebar');
    $as->setBlockWrapperStart('<div class="inside">');
    $as->setBlockWrapperEnd('</div>');
    $as->display($c);
   	if ($c->isEditMode()) { ?>
		</div>
	 <?php  }
?>
</div>
</div>

<?php  $this->inc('elements/footer.php'); ?>