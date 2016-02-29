<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>

<body>
<div id="page">

<div id="container">
	<div id="banner">
		<div id='bannertitle'>
		
		<a href="<?php  echo DIR_REL?>/"><?php  echo SITE?></a>
		
		</div>
	</div>

	<div id="outer">
 		<div id="inner">
 			
			
 			<div id="left">
 	  				<div class="verticalmenu">
  					<?php  
						$b = new Area('Header Nav');
						$b->display($c);
					?>
					</div>
 			 </div>  			
			
			<div id="content"> 
				
				<?php  
				$a = new Area('main');
				$a->display($c);
				?>
	
			</div>
			
			<!-- end content -->			
 			
		</div><!-- end inner -->
		
	</div><!-- end outer -->
 	<?php   $this->inc('elements/footer.php'); ?>