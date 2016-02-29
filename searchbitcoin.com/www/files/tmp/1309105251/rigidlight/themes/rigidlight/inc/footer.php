<footer class="container">
    
    	<nav>
        
        	<?php  
				$bt_main = BlockType::getByHandle('autonav');
				$bt_main->controller->displayPages = 'top';
				$bt_main->controller->orderBy = 'display_asc';                    
				$bt_main->controller->displaySubPages = 'none';
				$bt_main->controller->displaySubPageLevels = 'custom';      
				$bt_main->controller->displaySubPageLevelsNum = '0'; 
				$bt_main->render('view');
			?>
        
        </nav>
        
        <?php  $a = new Area('Footer'); $a->display($c); ?>
        
        <div id="vivid">
        
        	<a href="http://isitvivid.com"><strong>Website Design By Vivid</strong></a>
        
        </div>
    
    </footer>
    
<?php  Loader::element('footer_required'); ?>

</body>
</html>
