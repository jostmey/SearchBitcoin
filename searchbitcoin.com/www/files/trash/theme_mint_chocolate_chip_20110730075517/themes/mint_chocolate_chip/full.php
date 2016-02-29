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
		
				<img src="<?php echo View::getThemePath()?>/images/board.jpg" width="370" height="300" alt="Green Jaws - Stock Xchnge"/>

				<?php  $a = new Area('Main'); $a->display($c); ?>
	
			</div>

	</div> 

<?php  $this->inc('elements/footer.php'); ?>
