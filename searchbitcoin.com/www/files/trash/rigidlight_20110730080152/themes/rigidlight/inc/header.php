<header class="container">
    
    	<div id="logo">
        
        	<a href="<?php  echo DIR_REL?>/" class="simple-logo-block">
            
            	<?php  
					$block = Block::getByName('My_Site_Name');  
					if( $block && $block->bID ) $block->display();   
					else echo SITE;
				?>
            
            </a><!-- .simple-logo-block -->
        
        </div><!-- #logo -->
        
        <nav id="mainNav">
        
        	<?php  
				$bt_main = BlockType::getByHandle('autonav');
				$bt_main->controller->displayPages = 'top';
				$bt_main->controller->orderBy = 'display_asc';                    
				$bt_main->controller->displaySubPages = 'all';
				$bt_main->controller->displaySubPageLevels = 'custom';      
				$bt_main->controller->displaySubPageLevelsNum = '1'; 
				$bt_main->render('templates/dropdown');
			?>
        
        </nav>
        
        <div id="vignetteShell">
        
        	<?php  $a = new Area('Header'); $a->display($c); ?>
        
        </div><!-- #vignetteShell -->
    
    </header>
    