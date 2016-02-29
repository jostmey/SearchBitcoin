<?php
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>

<div id="wrapper">
<!-- start header -->
<div id="logo">
	<h1><a href="#"><?php  echo SITE?> | <?php echo $c->getCollectionAttributeValue('meta_title')?></a></h1>
	<h2> &raquo;&nbsp;&nbsp;&nbsp;<?php echo $c->getCollectionAttributeValue('meta_description')?></h2>
</div>
<div id="header">
	<div id="menu">
		<!--ul>
			<li class="current_page_item"><a href="#">Homepage</a></li>
			<li><a href="#">Blogs</a></li>
			<li><a href="#">Photos</a></li>
			<li><a href="#">About</a></li>
			<li class="last"><a href="#">Contact</a></li>
		</ul-->
			<?php
					$ah = new Area('Header Nav');
					ob_start();
					$ah->display($c);
					$printed = ob_get_contents();
					ob_end_clean();

					$printed = str_replace('<ul class="nav-header">', '', $printed);
					$printed = str_replace('<li class=" ">', '<li class="page_item">', $printed);
					$printed = str_replace('<div class="ccm-spacer">&nbsp;</div>', '', $printed);
					$printed = str_replace('<li class="nav-selected', '<li class="current_page_item', $printed);
					$printed = str_replace('</ul>', '', $printed);
					print $printed;
			?>
	</div>
</div>
<!-- end header -->
</div>
<!-- start page -->
<div id="page">
	<!-- start content -->
	<div id="content">
		<div class="post">
			<?php $a = new Area('Main'); $a->display($c); ?>
		</div>
	</div>
	<!-- end content -->
	<!-- start sidebar -->
	<div id="sidebar">
		<ul>
			<li>
				<h2>Links</h2>
				<?php
					$as = new Area('Sidebar');
					$as->display($c);
				?>
				<ul>
					<li>&nbsp;</li>
				</ul>
			</li>
		</ul>
	</div>
	<!-- end sidebar -->
	<div style="clear: both;">&nbsp;</div>
</div>
<!-- end page -->
<!-- start footer -->
<?php  $this->inc('elements/footer.php'); ?>