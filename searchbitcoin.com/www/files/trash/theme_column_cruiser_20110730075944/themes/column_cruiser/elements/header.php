<?php  defined('C5_EXECUTE') or die(_("Access Denied.")); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<!-- add your meta tags here -->

<!-- Site Header Content //-->

<style type="text/css">@import "<?php echo $this->getStyleSheet('main.css')?>";</style>
<style type="text/css">@import "<?php echo $this->getStyleSheet('typography.css')?>";</style>

<!--[if lte IE 7]>
<link href="<?php echo $this->getThemePath()?>/css/patch_tcc.css" rel="stylesheet" type="text/css" />
<![endif]-->

<?php  Loader::element('header_required'); ?>

</head>
<body>
  <div class="page_margins">
    <div id="topnav">
      <!-- start: skip link navigation -->
      <a class="skip" title="skip link" href="#navigation">Skip to the navigation</a><span class="hideme">.</span>
      <a class="skip" title="skip link" href="#content">Skip to the content</a><span class="hideme">.</span>
      <!-- end: skip link navigation -->
	  <?php
		$uinfo = new User();
		if($uinfo->IsLoggedIn()){ ?>
		  <a href="<?php echo $this->url('/login/-/logout')?>">Logout</a> | <a href="<?php echo $this->url('/profile')?>">My Profile</a> | <a href="<?php echo $this->url('/imprint')?>">Imprint</a>
	  <?php	
		} else { ?>
		  <a href="<?php echo $this->url('/login')?>">Login</a> | <a href="<?php echo $this->url('/register')?>">Register</a> | <a href="<?php echo $this->url('/imprint')?>">Imprint</a>
	  <?php	}?>
    </div>
    <div id="border-top">
      <div id="edge-tl"></div>
      <div id="edge-tr"></div>
    </div>
    <div class="page">
      <div id="header">
	    <?php 
		  $a_header = new Area('Header');
		  $a_header->display($c);
		  if ($a_header->getTotalBlocksInArea() > 0) { ?>
		    <div class="divider"></div>
    	<?php  } 
		  if ($c->isEditMode()) { ?>
            <div style="min-height: 80px">
		<?php  } ?>
      </div>
		<?php  if ($c->isEditMode()) { ?>
		  </div><!-- end isEditMode //-->
		<?php  } ?>
      <div id="nav">
        <!-- skiplink anchor: navigation -->
        <a id="navigation" name="navigation"></a>
        <div class="hlist">
          <!-- main navigation: horizontal list -->
          <?php 
		    $a_headerNav = new Area('Header Nav');
		    $a_headerNav->display($c);
	        if ($a_headerNav->getTotalBlocksInArea() > 0) { ?>
              <div class="divider"></div>
    	  <?php  } ?>
        </div>
      </div>