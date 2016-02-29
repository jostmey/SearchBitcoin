<?php  defined('C5_EXECUTE') or die("Access Denied."); 
$this->inc('elements/header.php'); ?>

<div id="container">
<div id="posts">
<?php 
	
	 if ($c->isEditMode()) { ?>
		<div class="post">
	 <?php  }
	
    $am = new Area('Main');
    $am->setBlockWrapperStart('<div class="post">');
    $am->setBlockWrapperEnd('</div>');
    $am->display($c);
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