<?php  defined('C5_EXECUTE') or die(_("Access Denied.")); ?>
<!-- begin footer -->

<div style="clear:both;"></div>

<div id="footer">

	<div class="footerleft">	
			<?php 
            $a = new Area('Footer Left');
            $a->display($c);
            ?>
	</div>
	
	<div class="footermiddle">
			<?php 
            $a = new Area('Footer Middle');
            $a->display($c);
            ?>
	</div>

	<div class="footerright">
			<div>
			<?php 
            $a = new Area('Footer Right');
            $a->display($c);
            ?>
            </div>
			
		<h2>Credits</h2>
			<p>Copyright &copy; <?php echo date('Y')?> <a href="<?php echo DIR_REL?>/"><?php echo SITE?></a> &bull; Built with Concrete5 <a href="http://www.concrete5.org" title="concrete5 content management system">CMS</a> &bull; Theme by <a href="http://www.c5mix.com" title="concrete5 themes">c5mix</a> and <a href="http://www.briangardner.com/themes/whitespace-wordpress-theme.htm">Brian Gardner</a> &bull; <a href="<?php echo $this->url('/login')?>"><?php echo t('Sign In')?></a></p>

		
	</div>

</div>

</div>

<?php  require(DIR_FILES_ELEMENTS_CORE . '/footer_required.php'); ?>

</body>
</html>