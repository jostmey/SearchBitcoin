<?php  defined('C5_EXECUTE') or die("Access Denied."); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<?php  Loader::element('header_required'); ?>

<link rel="stylesheet" type="text/css" href="<?php echo $this->getThemePath()?>/style.css" />
<link rel="stylesheet" type="text/css" href="<?php echo $this->getStyleSheet('typography.css')?>" />

</head>
<body>

<div id="header">
  
		<h1 class="txtlogo"><a href="<?php echo DIR_REL?>/"><?php 
			$block = Block::getByName('My_Site_Name');  
			if( $block && $block->bID ) $block->display();   
			else echo SITE;
		?></a></h1>
</div>
<div id="menu">
<?php 
    $a = new Area('Header Nav');
    $a->display($c);
?>

</div>