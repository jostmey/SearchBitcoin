<?php   defined('C5_EXECUTE') or die(_("Access Denied.")); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" type="text/css" href="<?php  echo $this->getThemePath()?>/css/styles.css" />
    <link rel="stylesheet" media="screen" type="text/css" href="<?php  echo $this->getStyleSheet('typography.css')?>" />
    <script type="text/javascript" src="<?php  echo $this->getThemePath()?>/js/cycle.js"></script>
	<script type="text/javascript" src="<?php  echo $this->getThemePath()?>/js/droppy.js"></script>   
    <?php   Loader::element('header_required'); ?>
</head>
<body style="background: url(<?php  echo $this->getThemePath()?>/images/left-bg.gif) #fff repeat-y 50% top;">
	<!-- begin wrapper -->
	<div id="wrapper">
    	<!-- begin header -->
        <div id="header-wrapper">
           <?php   if ($c->isEditMode()) { ?>
            <div id="header" style="height: 125px;">
            <?php  } else { ?>
            <div id="header">
            <?php  } ?>
                <div class="topbar">
				<?php  
					$a = new Area('Topper');
					$a->display($c);
				?>
                </div>
                <h1><!-- --><a href="<?php  echo DIR_REL?>/"><em><?php  $block = Block::getByName('My_Site_Name'); if( $block && $block->bID ) $block->display(); else echo SITE; ?></em></a><!-- --></h1>
                <h2>Contact us on<br /> <?php  $a = new Area('Header Msg'); $a->display($c); ?></h2>
                <?php   if ($c->isEditMode()) { ?>
                <br class="clear" />
                <?php  } ?>
                <?php  
					$a = new Area('Header Nav');
					$a->display($c);
				?>
            </div>
        </div>
        <!-- end header -->