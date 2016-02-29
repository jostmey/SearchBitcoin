<?php   defined('C5_EXECUTE') or die("Access Denied."); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">

<head profile="http://gmpg.org/xfn/11">
<?php   Loader::element('header_required'); ?>

	<link rel="stylesheet" href="<?php  echo $this->getThemePath()?>/style.css" type="text/css" media="screen" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" href="<?php  echo $this->getThemePath()?>/ie-fixes.css" type="text/css" media="screen" />
	<![endif]-->
	<link rel="stylesheet" media="screen" type="text/css" href="<?php  echo $this->getStyleSheet('typography.css')?>" />
	<script type="text/javascript" charset="utf-8">
	//<![CDATA[
		sfHover = function() {
			var sfEls = document.getElementById("nav").getElementsByTagName("LI");
			for (var i=0; i<sfEls.length; i++) {
				sfEls[i].onmouseover=function() {
					this.className+=" sfhover";
				}
				sfEls[i].onmouseout=function() {
					this.className=this.className.replace(new RegExp(" sfhover\\b"), "");
				}
			}
		}
		if (window.attachEvent) window.attachEvent("onload", sfHover);		
	//]]>
	</script>

</head>

<body class="home blog">
	<div id="wrapper">	
		<div id="header-wrapper">
			<div id="nav">
				<?php  
    			$as = new Area('Header Nav');
			    $as->display($c);
			    ?>
			</div>
			<div id="header">
				<h1><a href="<?php  echo DIR_REL?>/"><?php  
				$block = Block::getByName('My_Site_Name');  
				if( $block && $block->bID ) $block->display();   
				else echo SITE;
			?></a></h1>
			</div>
		</div>
		<hr />