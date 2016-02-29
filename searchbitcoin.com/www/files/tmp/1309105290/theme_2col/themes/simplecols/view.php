<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>
 		<div id="content">
            <!-- begin page left -->
            <div id="page-left">
            	<?php  
					print $innerContent;
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