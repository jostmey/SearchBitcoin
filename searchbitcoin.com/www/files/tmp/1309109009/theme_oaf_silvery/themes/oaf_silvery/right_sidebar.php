<?php          
	defined('C5_EXECUTE') or die(_("Access Denied."));
	$this->inc('elements/header.php');
?>
<div id="header">

<div id="logo">

			<h1>
				<a href="<?php          echo DIR_REL?>/"><?php         
				$block = Block::getByName('My_Site_Name');
				if($block && $block->bID) $block->display();
				else echo SITE;?></a>
			</h1>
</div>

<div id="nav">
				<?php          $header_nav = new Area("Header Nav"); $header_nav->display($c); ?>
	</div>
<div id="clear"></div>
</div>

<div id="mini_head">
<?php          $mini_head = new Area("Mini Head"); $mini_head->display($c); ?>
</div>

<div id="wrap">

<did id="content_area">
<div id="right_sidebar">
<?php          $left_sidebar = new Area("Sidebar"); $left_sidebar->display($c); ?></div>
		
<div id="left_content">
	<?php          $main = new Area("Main"); $main->display($c); ?></div>

<div id="clear"></div>
</div>

<?php          $this->inc('elements/footer.php'); ?>