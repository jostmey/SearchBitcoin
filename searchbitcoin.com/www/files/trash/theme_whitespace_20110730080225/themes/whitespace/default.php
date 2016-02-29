<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>

<div id="content">

	<div id="l_sidebar">
 			<?php 
            $a = new Area('Sidebar');
            $a->display($c);
            ?>   
    </div>

	<div id="contentleft">
	
			<?php 
            $a = new Area('Main');
            $a->display($c);
            ?>
	
	</div>
	
	<div id="r_sidebar">
			<?php 
            $a = new Area('Sidebar Right');
            $a->display($c);
            ?> 
    </div>
	
</div>

<!-- The main column ends  -->

<?php  $this->inc('elements/footer.php'); ?>