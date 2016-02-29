<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php');
?>	
	<div id="content">
		<!-- Primary content: Stuff that goes in the primary content column (by default, the left column) -->
		<div id="primarycontainer">
			<div id="primarycontent">
				<div class="post">
							<?php  
	print $innerContent;
	?>

				</div>
				<!-- Primary content area end -->
			</div>
		</div>
		<!-- Secondary content: Stuff that goes in the secondary content column (by default, the narrower right column) -->
		<div id="secondarycontent">
			<!-- HINT: Set any div's class to "box" to encapsulate it in (you guessed it) a box -->
			<div class="box">
            	<?php  
	$as = new Area('Sidebar');
	$as->display($c);
	?>		
			<div>
				<div class="contentarea">
					<div class="linklist">
						<?php  
	$as = new Area('Sidebar Nav');
	$as->display($c);
	?>		
                    </div>
				</div>
			</div>
		</div>
			<!-- Secondary content area end -->
		</div>
	</div>
    
<?php 
$this->inc('elements/footer.php');
?>