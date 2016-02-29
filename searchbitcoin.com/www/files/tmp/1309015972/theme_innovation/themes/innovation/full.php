<?php
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>

<div id="header">
	<div id="logo">
		<h1><a href="#"><?php  echo SITE?></a></h1>
	</div>
	<div id="menu">
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
<div id="headerbg">&nbsp;</div>
<div id="page">
	<!-- start content -->
	<div id="content">
		<!-- start latest-post -->
		<div id="latest-post-full" class="post">
			<?php $a = new Area('Main'); $a->display($c); ?>
		</div>
	</div>
<?php  $this->inc('elements/footer.php'); ?>