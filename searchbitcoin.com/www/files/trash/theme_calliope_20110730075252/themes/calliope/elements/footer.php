<?php          defined('C5_EXECUTE') or die(_("Access Denied.")); ?> 
<!--Footer Begin-->
<div id="footer">
  <div class="foot"> <span>Calliope</span> by <a href="http://www.towfiqi.com">Towfiq I.</a> is licensed under a <a href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0 Unported License.</a>Converted by <a href="http://www.12345j.co.cc">12345j</a> for <a href="http://www.concrete5.org/r/-/27444">Concrete5</a>. 
			&copy; <?php         echo date('Y')?> <a href="<?php         echo DIR_REL?>/"><?php         echo SITE?></a>.
			&nbsp;&nbsp;
			<?php         echo t('All rights reserved.')?>
			
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
			<?php         echo t('Currently logged in as <b>%s</b>.', $userName)?> <a href="<?php         echo $this->url('/login', 'logout')?>"><?php         echo t('Sign Out')?></a>
			<?php          } else { ?>
<a href="<?php         echo $this->url('/login')?>"><?php         echo t('Sign In to Edit this Site')?></a>
			<?php          } ?>. 
 </div>
</div>
<!--Footer END-->
 	<?php          Loader::element('footer_required'); ?>
</body>
</html>