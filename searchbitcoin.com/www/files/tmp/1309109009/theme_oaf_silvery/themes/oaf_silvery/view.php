<?php          
	defined('C5_EXECUTE') or die(_("Access Denied."));
	$this->inc('elements/header.php');
?>

<div id="wrap">

<did id="content_area">
			<?php  

			print $innerContent;
			
			?>
</div>

<?php          $this->inc('elements/footer.php'); ?>