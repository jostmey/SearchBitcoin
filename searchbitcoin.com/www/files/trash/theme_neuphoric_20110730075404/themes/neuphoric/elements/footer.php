<?php   defined('C5_EXECUTE') or die(_("Access Denied.")); ?>

	
<div id="footer">	
  
	<span id="powered-by">
		design by <a title="derby web design" href="http://www.tristarwebdesign.co.uk">tri-star web design</a>	
		&nbsp;|&nbsp; <?php echo t('Powered by') ?> <a href="http://www.concrete5.org">concrete5</a>
	</span>
	<?php  
	//$block = Block::getGlobalBlock('Standard Footer');
	//$block->display();
	?>
	
	<div id="footerLinks">
		&copy; <?php echo date('Y')?> <a href="<?php echo DIR_REL?>/"><?php echo SITE?></a>.
		&nbsp;&nbsp;
		<?php echo t('All rights reserved.')?>	
		<span class="sign-in"><a href="<?php echo $this->url('/login')?>"><?php echo t('Sign In to Edit this Site')?></a></span>	
	</div>		
	
	<div class="spacer"></div>
</div>

</body>

</html>