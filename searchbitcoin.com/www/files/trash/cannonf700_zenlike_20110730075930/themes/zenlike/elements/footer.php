<?php   defined('C5_EXECUTE') or die(_("Access Denied.")); ?>

<div id="footer">
			<div class="left">| &nbsp; &copy; <?php  echo date('Y')?> <a href="<?php  echo DIR_REL?>/"><?php  echo SITE?></a>.
			&nbsp; | &nbsp;
			<?php  echo t('Powered by ') ?><a href="http://www.concrete5.org">concrete5</a> &nbsp; | &nbsp;
            	<?php  
			$u = new User();
			if ($u->isRegistered()) { ?>
				<?php   
				if (Config::get("ENABLE_USER_PROFILES")) {
					$userName = '<a href="' . $this->url('/profile') . '">' . $u->getUserName() . '</a>';
				} else {
					$userName = $u->getUserName();
				}
				?>
				<?php  echo t('Currently logged in as <b>%s</b>.', $userName)?> <a href="<?php  echo $this->url('/login', 'logout')?>"><?php  echo t('Sign Out')?></a>
			<?php   } else { ?>
				<a href="<?php  echo $this->url('/login')?>"><?php  echo t('Sign In to Edit this Site')?></a>
			<?php   } ?>
&nbsp;|
</div>
			<div class="right">Design by <a href="http://www.nodethirtythree.com/">NodeThirtyThree Design</a></div>
	</div>
</div>
<?php   Loader::element('footer_required'); ?>
</body>
</div>
</html>	