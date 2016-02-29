<?php  defined('C5_EXECUTE') or die(_("Access Denied.")); $this->inc('elements/header.php'); ?>

<body id="altbody">

<div id="wrapper-header">
	<div id="header">
		<h1 ><a href="<?php  echo DIR_REL?>/"><?php  echo SITE?></a></h1>
	</div>
</div>

<div id="wrapper-menu">
	<div id="menu">
		<?php  
			$b = new Area('Header Nav');
			$b->display($c);
		?>
	</div>
</div>


<div id="content">

	<?php  
	$a = new Area('main'); 
	$a->display($c); 
	?>
	
</div>



<?php   $this->inc('elements/footer.php'); ?>