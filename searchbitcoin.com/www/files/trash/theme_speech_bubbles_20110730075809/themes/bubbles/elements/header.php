 <!DOCTYPE html>
<html>
<head>
<?php        
    Loader::element('header_required'); 
 ?>


 
<link href="<?php        echo $this->getStyleSheet('style.css')?>" rel="stylesheet" type="text/css" media="screen" />
<link href="<?php        echo $this->getStyleSheet('typography.css')?>" rel="stylesheet" type="text/css" media="screen" />


	<!--[if IE]>

	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
		
  <script src="<?php   echo $this->getThemePath()?>/js/modernizr-1.6.min.js"></script>
  
</head>
<body>
<div id="container">
	<header>
		<hgroup id="logo">
			<h1><a href="<?php         echo DIR_REL?>/"><?php        
				$block = Block::getByName('My_Site_Name');
				if($block && $block->bID) $block->display();
				else echo SITE;?></a>
			</h1>
			<h2>
				<?php   
    				$a = new Area('Slogan');
    				$a->display($c);
				?>
			</h2>
		</hgroup>
	      <nav>  
	      		<ul>
<?php   
    $a = new Area('Header Nav');
    $a->display($c);
?>
		  		</ul>
          </nav>

    </header>

