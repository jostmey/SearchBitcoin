<?php         defined('C5_EXECUTE') or die(_("Access Denied.")); ?> 

   <footer>
		<?php   
    		$a = new Area('Footer');
   			$a->display($c);
		?>	
    </footer>
    <cite>Design by <a href="12345j.co.cc">12345j</a> for <a href="http://www.concrete5.org/r/-/27444">Concrete5.</a> Inspired by <a href="http://nicolasgallagher.com/pure-css-speech-bubbles/">Nicolas Gallagher</a>
			&copy; <?php        echo date('Y')?> <a href="<?php        echo DIR_REL?>/"><?php        echo SITE?></a>.
			&nbsp;&nbsp;
			<?php        echo t('All rights reserved.')?>
			
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
			<?php        echo t('Currently logged in as <b>%s</b>.', $userName)?> <a href="<?php        echo $this->url('/login', 'logout')?>"><?php        echo t('Sign Out')?></a>
			<?php         } else { ?>
<a href="<?php        echo $this->url('/login')?>"><?php        echo t('Sign In to Edit this Site')?></a>
			<?php         } ?>. 
    </cite>

</div>
<?php         Loader::element('footer_required'); ?>
</body>
</html>
