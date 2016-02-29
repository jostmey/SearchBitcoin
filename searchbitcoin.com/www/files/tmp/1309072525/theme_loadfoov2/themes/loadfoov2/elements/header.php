<?php  defined('C5_EXECUTE') or die(_("Access Denied.")); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/2000/REC-xhtml1-20000126/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
	
<!-- Site Header Content //-->
<style type="text/css">@import "<?php echo $this->getStyleSheet('main.css')?>";</style>
<style type="text/css">@import "<?php echo $this->getStyleSheet('typography.css')?>";</style>

<?php  Loader::element('header_required'); ?>

</head>
<body>


<div id="page"><div id="wrap">
  <div id="top">
    <h2><a href="<?php echo DIR_REL?>/" title="Back to main page"><?php echo SITE?></a></h2>
    <div id="menu">
		 <?php  /*
		  <ul>
			<li><a href="#" class="current">home</a></li>
			<li><a href="#">about</a></li>
			<li><a href="#">portofolio</a></li>
			<li><a href="#">contact</a></li>
		  </ul>
		 */ ?>
		<?php 
		$a = new Area('Header Nav');
		$a->display($c);
		?>		  
    </div>
  </div>
  <div id="content">	