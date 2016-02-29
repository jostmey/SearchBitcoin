<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<?php   Loader::element('header_required'); ?>

<!-- CSS -->
<link rel="stylesheet" media="screen" type="text/css" href="<?php  echo $this->getStyleSheet('main.css')?>" />
<link rel="stylesheet" media="screen" type="text/css" href="<?php  echo $this->getStyleSheet('typography.css')?>" />

<link rel="stylesheet" href="<?php  echo $this->getThemePath()?>/print.css" media="print" type="text/css" />
<link rel="stylesheet" href="<?php  echo $this->getThemePath()?>/css/uniform.default.css" type="text/css" media="screen" charset="utf-8" />

<!-- JavaScripts -->
<script src="<?php  echo $this->getThemePath()?>/js/cufon-yui.js" type="text/javascript"></script>
<script src="<?php  echo $this->getThemePath()?>/js/Museo_Sans_500.font.js" type="text/javascript"></script>
<script src="<?php  echo $this->getThemePath()?>/js/jquery.uniform.min.js" type="text/javascript"></script>
<script src="<?php  echo $this->getThemePath()?>/js/viva.js" type="text/javascript"></script>

</head>

<body>
<div id="wrapper">
	<div id="content">
	
	<div id="header">
		<div class="logo">
		<!--
			--><a href="<?php  echo DIR_REL?>/" ><h1><?php  
				$block = Block::getByName('My_Site_Name');  
				if( $block && $block->bID ) $block->display();   
				else echo SITE;
			?></h1></a><!--
			-->
		</div>
		
		<div id="navigation">
			<?php  
	    			$bt_main = BlockType::getByHandle('autonav'); 
	    			$bt_main->controller->displayPages = 'top'; 
	    			$bt_main->controller->orderBy = 'display_asc'; 
	    			$bt_main->controller->displaySubPages = 'all';
	    			$bt_main->controller->displaySubPageLevels = 'all';  
	    			$bt_main->controller->displayPagesIncludeSelf = 0; 
	    			$bt_main->render('templates/minified'); 
			?>
		</div>
		
		<div id="top-text">
			<?php   $a = new Area('Header'); $a->display($c); ?>
		</div>
		
	</div>
	
