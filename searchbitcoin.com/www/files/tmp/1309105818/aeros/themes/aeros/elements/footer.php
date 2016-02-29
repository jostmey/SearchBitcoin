
<?php        defined('C5_EXECUTE') or die(_("Access Denied.")); ?>
<p class="footprint"><cite>Theme: TheBuckmaker.com <a href="http://thebuckmaker.com/">Wordpress Themes</a>
			&copy; <?php      echo date('Y')?> <a href="<?php      echo DIR_REL?>/"><?php      echo SITE?></a>
			&nbsp;&nbsp;
			<?php      echo t('All rights reserved.')?>
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
<?php      echo t('Currently logged in as <b>%s</b>.', $userName)?> <a href="<?php      echo $this->url('/login', 'logout')?>"><?php      echo t('Sign Out')?></a>
			<?php       } else { ?>
<a href="<?php      echo $this->url('/login')?>"><?php      echo t('Sign In to Edit this Site')?></a>
			<?php       } ?>
</cite></p> 
</div><!-- end rap -->
<?php        Loader::element('footer_required'); ?>
</body>
</html>