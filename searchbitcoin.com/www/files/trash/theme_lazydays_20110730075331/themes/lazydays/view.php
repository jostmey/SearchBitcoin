<!--
 ____________________________________________________________
|                                                            |
|    DESIGN + Pat Heard { http://fullahead.org }             |
|      DATE + 2006.03.19                                     |
| COPYRIGHT + Free use if this notice is left in place       |
|____________________________________________________________|

-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en-AU">

<head>

<!-- Site Header Content //-->
<style type="text/css">@import "<?php echo $this->getStyleSheet('css/main.css')?>";</style>
<style type="text/css">@import "<?php echo $this->getStyleSheet('css/typography.css')?>";</style>

<?php  Loader::element('header_required'); ?>
<?php  
$cp = new Permissions($c);
if($cp->canWrite() && $cp->canAddSubContent()){
echo('<style type="text/css">body{background-position:0px 50px;}</style>');
}?>

</head>


<body>

<!-- CONTENT: Holds all site content except for the footer.  This is what causes the footer to stick to the bottom -->
<div id="content">


  <!-- HEADER: Holds title, subtitle and header images -->
  <div id="header">

    <div id="title">
      <h1><a href="<?php echo DIR_REL?>/"><?php echo SITE?></a></h1>
    </div>

    <img src="<?php echo $this->getThemePath()?>/images/bg/balloons.gif" alt="balloons" class="balloons" />
    <img src="<?php echo $this->getThemePath()?>/images/bg/header_left.jpg" alt="left slice" class="left" />
    <img src="<?php echo $this->getThemePath()?>/images/bg/header_right.jpg" alt="right slice" class="right" />

  </div>
<?php  if($c->isEditMode()) { ?>
	<div style="height:80px;"></div>
	<?php };?>


  <!-- MAIN MENU: Top horizontal menu of the site.  Use class="here" to turn the current page tab on -->
  <div id="mainMenu">
		<?php 
					$an = new Area('Header Nav');
								$an->display($c);
											?>
  </div>
<?php  if($c->isEditMode()) { ?>
	echo('<div style="height:80px;"></div>');
	<?php };?>



  <!-- PAGE CONTENT BEGINS: This is where you would define the columns (number, width and alignment) -->
  <div id="page">


    <!-- 25 percent width column, aligned to the left -->
    <div class="width25 floatLeft leftColumn">

<?php 
			$as = new Area('Sidebar');
						$as->display($c);
									?>	

    </div>




    <!-- 75 percent width column, aligned to the right -->
    <div class="width75 floatRight">


      <!-- Gives the gradient block -->
      <div>
	<?php 
			print $innerContent	?>

      </div>

    </div>

  </div>

</div>


<!-- FOOTER: Site footer for links, copyright, etc. -->
<div id="footer">

  <div id="width">
    <span class="floatLeft">
      design <a href="http://fullahead.org" title="Goto Fullahead">Fullahead</a> <span class="grey">|</span>
		This site is powered by <a href="http://www.concrete5.org">concrete5</a>
					<?php  
								?>
											&copy; <?php echo date('Y')?> <a href="<?php echo DIR_REL?>/"><?php echo SITE?></a>.
														&nbsp;&nbsp;
																	<?php echo t('All rights reserved.')?>	
																				<span class="sign-in"><a href="<?php echo $this->url('/login')?>"><?php echo t('Sign In to Edit this Site')?></a></span>
    </span>
  </div>

</div>

</body>

</html>