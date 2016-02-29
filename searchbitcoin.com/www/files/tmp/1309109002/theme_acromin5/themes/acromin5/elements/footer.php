<?php  defined('C5_EXECUTE') or die("Access Denied."); ?>
<div id="footer">
  <div class="fmenu">
    <div class="credits"> &copy; <?php echo date('Y')?> <a href="<?php echo DIR_REL?>/"><?php echo SITE?></a>.
			&nbsp;
			<?php echo t('All rights reserved.')?> <span class="r">Valid <a href="http://validator.w3.org/check?uri=referer" rel="nofollow">XHTML</a>/CSS</span> </div>
  </div>
  <div class="dcredits">
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
				<span class="sign-in"><?php echo t('Currently logged in as <b>%s</b>.', $userName)?> <a href="<?php echo $this->url('/login', 'logout')?>"><?php echo t('Sign Out')?></a></span>
			<?php  } else { ?>
				<span class="sign-in"><a href="<?php echo $this->url('/login')?>"><?php echo t('Sign In to Edit this Site')?></a></span>
			<?php  } ?>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;acosmin5 designed by <a href="http://www.acosmin.com">alexandru cosmin</a> converted by <a href="http://www.mnkras.com">Mnkras</a>
  </div>
</div>
<?php  Loader::element('footer_required'); ?>
</body></html>
