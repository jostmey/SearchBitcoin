<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>
 		<div id="content">
			<!-- begin splash -->
            <div id="splash">
                <div class="slideshow">
                	<?php  
						$a = new Area('Header');
						$a->display($c);
					?>
            	</div>
                <div class="callback">
                	<?php  
						$a = new Area('Splash Right');
						$a->display($c);
					?> 
                </div>
            </div>
            <!-- end splash -->
            <!-- begin page left -->
            <div id="page-left">
            	<?php  
					$a = new Area('Main');
					$a->display($c);
				?>
            </div>
            <!-- end page left -->
            <!-- begin page right -->
            <div id="page-right">
            	<?php  
					$a = new Area('Sidebar');
					$a->display($c);
				?>
            </div>
            <!-- end page right -->
        </div>
        <!-- end content -->
<?php   $this->inc('elements/footer.php'); ?>