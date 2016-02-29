<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php');
?>
	
<div id="content">
		<!-- Normal content: Stuff that's not going to be put in the left or right column. -->
		<div id="normalcontent">
			<div class="contentarea">
				<?php  
	$a = new Area('Main');
	$a->display($c);
	?>	

				<!-- Normal content area end -->
			</div>
		</div>
  </div>

<?php 
$this->inc('elements/footer.php');
?>