<?php   $this->inc('inc/top.php'); ?>

<body class="subpage rightColumn" id="pageid<?php  print $c->getCollectionID(); ?>">

	<?php   $this->inc('inc/header.php'); ?>
           
    <section id="mainShell">
    
    	<div id="headerShadow"></div>
        
        <div class="container">
                            
            <article id="main">
            
                <?php  print $innerContent; ?>
                        
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