<?php          defined('C5_EXECUTE') or die(_("Access Denied.")); ?> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php         
    Loader::element('header_required'); 
 ?>
 
<link href="<?php         echo $this->getStyleSheet('style.css')?>" rel="stylesheet" type="text/css" media="screen" />
<link href="<?php         echo $this->getStyleSheet('typography.css')?>" rel="stylesheet" type="text/css" media="screen" />
  
</head>
<body>

<!--Header Begin-->
<div id="header">
  <div class="center">
    <div id="logo">				<h1><a href="<?php        echo DIR_REL?>/"><?php       
				$block = Block::getByName('My_Site_Name');
				if($block && $block->bID) $block->display();
				else echo SITE;?></a>
			</h1>
			</div>
    <!--Menu Begin-->
    <div id="menu">
<?php  
    $a = new Area('Header Nav');
    $a->display($c);
?>
    </div>
    <!--Menu END-->
  </div>
</div>
<!--Header END-->
<!--SubPage Toprow Begin-->
<div id="toprowsub">
  <div class="center">
    <h2><?php   echo $c->getCollectionName(); ?></h2>
  </div>
</div>
<div id="featured">
<?php  
    $a = new Area('Header');
    $a->display($c);
?></div>
<!--Toprow END-->