<?php    defined('C5_EXECUTE') or die("Access Denied."); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
	
<!-- Site Header Content //-->
<link rel="stylesheet" media="screen" type="text/css" href="<?php   echo $this->getStyleSheet('main.css')?>" />
<link rel="stylesheet" media="screen" type="text/css" href="<?php   echo $this->getStyleSheet('typography.css')?>" />

<?php   
  $u = new User();
 
  if ($u->isLoggedIn()) { ?>
    <style type="text/css">
    body { background-position: 0px 49px; }
    </style>
<?php   }

	Loader::element('header_required'); 
?>

</head>
<body>
<div id="page">

	<div id="header">

		<div id="headerLogo">  
		
			<?php   		
			$block = Block::getByName('logo');  	
			if($c->getAttribute(logo)) { ?> 
				<a href="<?php   echo DIR_REL?>/"><img src="<?php  echo $c->getAttribute('logo')->getVersion()->getRelativePath()?>"></a> <?php  ; 
			} elseif($block && $block->bID) {
				$block->display();		
			} elseif ( file_exists( getenv("DOCUMENT_ROOT") . $this->getThemePath() . '/images/logo.png' )) { ?>
				<a href="<?php   echo DIR_REL?>/"><img src="<?php  echo $this->getThemePath()?>/images/logo.png"></a> <?php  ;
			} else { ?>
				<a href="<?php   echo DIR_REL?>/"><?php     
				echo '<h1>'.SITE.'</h1>';
				?></a>
			<?php   }	?>			

		</div>	

				
		<div id="headerNav">
			<?php   
			$a = new Area('Header Nav');
			$a->display($c);
			?>
		</div>
		
		<div id="headerSlogan">
		<?php  
  			$block = Block::getByName('Slogan');
  			if($c->getAttribute('slogan')) { 
  				echo $c->getAttribute('slogan');
  			} elseif( $block && $block->bID) {
  				$block->display();
  			} else { 		
				$a = new Area('Header Slogan');
				$a->display($c);
			}
		?>
		</div>
		
	</div>			