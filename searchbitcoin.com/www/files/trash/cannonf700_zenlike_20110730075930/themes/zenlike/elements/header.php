<?php   defined('C5_EXECUTE') or die(_("Access Denied.")); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/2000/REC-xhtml1-20000126/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php  echo LANGUAGE?>" lang="<?php  echo LANGUAGE?>">
<head>
<link rel="stylesheet" media="screen" type="text/css" href="<?php  echo $this->getStyleSheet('main.css')?>" />
<link rel="stylesheet" media="screen" type="text/css" href="<?php  echo $this->getStyleSheet('typography.css')?>" />

<?php   Loader::element('header_required'); ?>

<!-- Site Header Content //-->
</head>
<div id="wrapper">
<body>
<!--zenlike1.0 by nodethirtythree design http://www.nodethirtythree.com -->
<html>
<div id="upbg"></div>

<div id="outer">


	<div id="header">
		<div id="headercontent">
			<h1><a href="<?php   print DIR_REL; ?>/"><?php   print SITE; ?></a></h1>

		</div>
	</div>


	<form method="get" action="/index.php/search/">
		<div id="search">
			<input type="text" class="text" maxlength="64" name="query" />
			<input type="hidden" value="" name="search_paths[]">
			<input type="submit" class="submit" value="Search" />
		</div>
	</form>


	<div id="headerpic">
    <?php  
			$a = new Area('Header');
			if (($a->getTotalBlocksInArea($c) > 0) || ($c->isEditMode())) {
				$a->setBlockLimit(1);
				$a->display($c);
			} else { ?>
				<img src="<?php   print $this->getThemePath(); ?>/images/hdrpic.jpg" width="746" height="109" alt="" />
			<?php   } ?>
</div>

	
	<div id="menu">

				<?php  
		$bt_nav = BlockType::getByHandle('autonav');
		$bt_nav->controller->displayPages = 'top';
		$bt_nav->controller->orderBy = 'display_asc';
		$bt_nav->controller->displaySubPages = 'none';
		$bt_nav->render('templates/header_menu');
		?>
		
	</div>
	<div id="menubottom"></div>
