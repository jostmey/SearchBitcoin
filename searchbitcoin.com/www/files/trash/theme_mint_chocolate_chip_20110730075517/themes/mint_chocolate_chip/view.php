<?php   defined('C5_EXECUTE') or die(_("Access Denied.")); ?>
<?php  $this->inc('elements/header.php'); ?>

	<div id="maincontainer">

		<div id="nav">
	
			<div id="navinner">
		
			<?php  $a = new Area('Header Nav'); $a->display($c); ?>
		
			</div>
		</div>
	
	<div id="padding"></div>

			<div id="content">
		
				<?php  print $innerContent; ?>
	
			</div>

	</div>

<?php  $this->inc('elements/footer.php'); ?>
