<?php
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>

<div id="wrapper">
	<div id="header">
		<div id="logo">
			<h1><a href="#"><?php  echo SITE?></a></h1>
			<h2><a href="#"><?php echo $c->getCollectionName()?></a></h2>
		</div>
		<!-- end div#logo -->
		<div id="menu">
			<?php
					$ah = new Area('Header Nav');
					ob_start();
					$ah->display($c);
					$printed = ob_get_contents();
					ob_end_clean();

					$printed = str_replace('<li class="nav-selected', '<li class="active', $printed);

					print $printed;
			?>
		</div>
		<!-- end div#menu -->
	</div>
	<!-- end div#header -->
	<div id="page">
		<div id="headercode">
			<?php $a = new Area('Header Code'); $a->display($c); ?>
		</div>
		<div id="page-bgtop">
			<div id="content_full">
				<div class="post">
					<?php $a = new Area('Main'); $a->display($c); ?>
				</div>
			</div>
			<!-- end div#content -->
			<div style="clear: both; height: 1px"></div>
		</div>
	</div>
	<!-- end div#page -->
</div>
<!-- end div#wrapper -->
<?php  Loader::element('footer_required'); ?>
</body>
</html>


<?php  $this->inc('elements/footer.php'); ?>