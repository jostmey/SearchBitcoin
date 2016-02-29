<?php   $this->inc('inc/top.php'); ?>

<body class="subpage full" id="pageid<?php  print $c->getCollectionID(); ?>">

	<?php   $this->inc('inc/header.php'); ?>
           
    <section id="mainShell">
    
    	<div id="headerShadow"></div>
        
        <div class="container">
                            
            <article id="main">
            
                <?php  $a = new Area('Main'); $a->display($c); ?>
                        
            </article><!-- #main -->
            
            <div class="clear"></div>
            
            <section id="ctaShell">
            
                <?php  $a = new Area('CTA Area'); $a->display($c); ?>
            
            </section><!-- #ctaShell -->
        
        </div><!-- .container -->
    
    </section><!-- #mainShell -->
    
    <?php   $this->inc('inc/footer.php'); ?>