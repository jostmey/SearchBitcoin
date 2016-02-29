<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>
	<div class="wrap">
		<div id="logo">
						<h1><a href="<?php       echo DIR_REL?>/"><?php      
				$block = Block::getByName('My_Site_Name');
				if($block && $block->bID) $block->display();
				else echo SITE;?></a>
			</h1>			<p><?php 
    $a = new Area('Slogan');
    $a->display($c);
?></p>
		</div>
		<ul id="nav">
<?php 
    $a = new Area('Header Nav');
    $a->display($c);
?>		</ul>
	</div>
	<div class="wrap">
		<div id="left">
						<p><?php 
print $innerContent;
?> 	</p>
		</div>	
		<div id="right">
			<ul>
<?php 
    $a = new Area('Sidebar');
    $a->display($c);
?>			</ul>
		</div>
    <?php      $this->inc('elements/footer.php'); ?>
