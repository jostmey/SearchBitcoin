
<?php        
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?> 
 
<div id="rap"> 
 
<div id="headmenu"> 
 
       <?php   
    $a = new Area('Header Nav');
    $a->display($c);
?> 
 
 
</div><!-- end headmenu --> 
 
<div id="header"> 
 
<div id="headerleft"> 
		<h1><a href="<?php         echo DIR_REL?>/"><?php        
				$block = Block::getByName('My_Site_Name');
				if($block && $block->bID) $block->display();
				else echo SITE;?></a>
			</h1><h2><?php   
    $a = new Area('Slogan');
    $a->display($c);
?></h2> 
</div><!-- end headerleft --> 
 
</div><!-- end header --> 
 
 
<div id="content"> 
 
 
     <div class="storywrap"> 
 
<div class="post" id="post-1"> 
         <h3 class="storytitle"><?php   
    $a = new Area('Title');
    $a->display($c);
?></h3> 
 
        <div class="storycontent"> 
                <p><?php 
print $innerContent;
?> 	</p> 
        </div><!-- end storycontent --> 
 
 
 
     </div><!-- end storywrap --> 
 
</div><!-- end post --> 
 
 
<div class="navlink"> 
</div><!-- end navlink --> 
 
 
<!-- begin footer --> 
</div><!-- end content --> 
 
 
<!-- begin sidebar --> 
 
<div id="sidebar"> 
 

<ul> 
 
 
        <li class="pagenav"><ul><?php   
    $a = new Area('Sidebar');
    $a->display($c);
?></ul></li> 
 
 
 
 
 
 
 
 
</ul> 
 
</div><!-- end sidebar --> 
<!-- leave the footprint as it is --> 
<?php            $this->inc('elements/footer.php'); ?>