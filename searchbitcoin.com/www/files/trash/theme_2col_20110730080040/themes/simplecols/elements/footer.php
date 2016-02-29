<?php   defined('C5_EXECUTE') or die(_("Access Denied.")); ?>
<!-- begin footer -->
	<div class="push"></div>
    </div>
    <!-- end wrapper -->
	<div id="footer">
        	<div id="footer-inner">
                <div class="box">
                    <?php  
						$a = new Area('Footer Left');
						$a->display($c);
					?>
                </div>
                <div class="box">
                    <?php  
						$a = new Area('Footer Middle');
						$a->display($c);
					?>
                </div>
                <div class="box nmr">
                    <?php  
						$a = new Area('Footer Right');
						$a->display($c);
					?>
                </div>
                <div id="footer-lower">
                    <p class="copy">&copy; <?php  echo date('Y')?> <a href="<?php  echo DIR_REL?>/"><?php  echo SITE?></a> | <a href="http://www.concrete5.org" title="<?php  echo t('concrete5 - open source content management system for PHP and MySQL')?>"><?php  echo t('concrete5 - open source CMS')?></a> <br /> <?php  
					$u = new User();
					if ($u->isRegistered()) { ?>
						<?php   
						if (Config::get("ENABLE_USER_PROFILES")) {
							$userName = '<a href="' . $this->url('/profile') . '">' . $u->getUserName() . '</a>';
						} else {
							$userName = $u->getUserName();
						}
						?>
						<span class="sign-in"><?php  echo t('Currently logged in as <b>%s</b>.', $userName)?> <a href="<?php  echo $this->url('/login', 'logout')?>"><?php  echo t('Sign Out')?></a></span>
					<?php   } else { ?>
						<span class="sign-in"><a href="<?php  echo $this->url('/login')?>"><?php  echo t('Sign In to Edit this Site')?></a></span>
					<?php   } ?>
					</p>
                    <p class="built"><a href="http://www.r1creative.co.uk" title="Web design Staffordshire">Template design</a> by <a href="http://www.r1creative.co.uk" title="Web design Staffordshire">R1 Creative</a></p>
                </div>
            </div>
        </div>
<?php   Loader::element('footer_required'); ?>
</body>
</html>