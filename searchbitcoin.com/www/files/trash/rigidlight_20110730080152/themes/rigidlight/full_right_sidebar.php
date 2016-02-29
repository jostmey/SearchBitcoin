<?php   $this->inc('inc/top.php'); ?>

<body class="subpage fullRightSidebar" id="pageid<?php  print $c->getCollectionID(); ?>">

	<?php   $this->inc('inc/header.php'); ?>
           
    <section id="mainShell">
    
    	<div id="headerShadow"></div>
        
        <div class="container">
                            
            <section id="intro">
            
            	<?php  $a = new Area('Intro'); $a->display($c); ?>
            
            	<div class="clear"></div>
            
            </section><!-- #intro -->
            
            <article id="main">
            
                <?php  $a = new Area('Main'); $a->display($c); ?>
                        
            </article><!-- #main -->
            
            <section id="sidebar">
            
                <?php  $a = new Area('Sidebar'); $a->display($c); ?>
            
            </section><!-- #sidebar -->
            
            <div class="clear"></div>
            
            <section id="ctaShell">
            
                <?php  $a = new Area('CTA Area'); $a->display($c); ?>
            
            </section><!-- #ctaShell -->
        
        </div><!-- .container -->
    
    </section><!-- #mainShell -->
    
    <?php   $this->inc('inc/footer.php'); ?>