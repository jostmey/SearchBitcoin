<?php   defined('C5_EXECUTE') or die(_("Access Denied.")); ?>

	<div id="footer" class="full">
		<div class="footer-area left">
		<?php  
			$as = new Area('Footer 1');
			$as->display($c);
		?>		
		</div>
		<div class="footer-area right">
		<?php  
			$as = new Area('Footer 2');
			$as->display($c);
		?>		
		</div>
		<div id="copyright">
			<span class="left">&copy; <?php  echo date('Y')?> <a href="<?php  echo DIR_REL?>/"><?php  echo SITE?></a>.
			<!-- Please contact us on our website at concrete5studio.com if you want to remove the "Design by concrete5studio.com"
			It can be removed at a cost of $15.-->
			<?php  echo t('Design by ')?> <a title="Concrete5 Themes" href="http://concrete5studio.com"><?php  echo t('concrete5studio.com') ?></a>.
			</span>
			<span class="right">
				<?php  echo t('Built with ')?> <a href="http://www.concrete5.org"><?php  echo t('concrete5 CMS') ?></a>.
				<?php  
				$u = new User();
				if ($u->isRegistered()) { ?>
					 <a href="<?php  echo $this->url('/login', 'logout')?>"><?php  echo t('Sign Out')?></a>
				<?php   } else { ?>
					<a href="<?php  echo $this->url('/login')?>"><?php  echo t('Sign In')?></a>
				<?php   } ?>
		    </span>
        </div>
	</div>

</div>

<?php   Loader::element('footer_required'); ?>

</body>
</html>