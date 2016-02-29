<?php  defined('C5_EXECUTE') or die(_("Access Denied.")); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="Shortcut Icon" href="<?php echo $this->getThemePath()?>/images/favicon.ico" type="image/x-icon" />
<style type="text/css">@import "<?php echo $this->getThemePath()?>/style.css";</style>
<style type="text/css">@import "<?php echo $this->getThemePath()?>/typography.css";</style>
<?php  Loader::element('header_required'); ?>
</head>

<body>

<div id="wrap">

	<div id="header">
	
		<div id="headerleft">
			<a href="<?php echo DIR_REL?>/"><?php echo SITE?></a><br />
		</div>
		
		<div id="headerright">
			<?php 
            $a = new Area('Header Nav');
            $a->display($c);
            ?>
		</div>

	</div>
	
<div style="clear:both;"></div>

	<div id="intro">
			<?php 
            $a = new Area('Header');
            $a->display($c);
            ?>    
    </div>
	
	<div id="tagline">
		<div id="taglineleft">
			<p><?php echo $c->getCollectionName() ?></p>
		</div>
		
		<div id="taglineright">
			<p><?php echo $c->getCollectionDescription() ?></p>
		</div>
	</div>