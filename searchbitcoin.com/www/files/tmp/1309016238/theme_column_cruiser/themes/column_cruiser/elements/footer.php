<?php  defined('C5_EXECUTE') or die(_("Access Denied.")); ?>
<!-- begin: #footer -->
      <div id="footer">
        <div class="subcolumns">
          <div class="c25l">
            <div class="subcl">
              <!-- Insert your subtemplate content here -->
			  <?php 
			    $af1 = new Area('Sidebar Footer 1');
			    $af1->display($c);
			    if ($af1->getTotalBlocksInArea() > 0) { ?>
	              <div class="divider"></div>
	          <?php  } ?>
            </div>
          </div>
          <div class="c25l">
            <div class="subcl">
              <!-- Insert your subtemplate content here -->
			  <?php 
			    $af2 = new Area('Sidebar Footer 2');
			    $af2->display($c);
			    if ($af2->getTotalBlocksInArea() > 0) { ?>
	              <div class="divider"></div>
	          <?php  } ?>
            </div>
          </div>
          <div class="c25l">
            <div class="subcl">
              <!-- Insert your subtemplate content here -->
			  <?php 
			    $af3 = new Area('Sidebar Footer 3');
			    $af3->display($c);
			    if ($af3->getTotalBlocksInArea() > 0) { ?>
	              <div class="divider"></div>
	          <?php  } ?>
            </div>
          </div>
          <div class="c25r">
            <div class="subcl">
              <!-- Insert your subtemplate content here -->
			  <?php 
			    $af4 = new Area('Sidebar Footer 4');
			    $af4->display($c);
			    if ($af4->getTotalBlocksInArea() > 0) { ?>
	              <div class="divider"></div>
	          <?php  } ?>
            </div>
          </div>
        </div>Layout based on <a href="http://www.yaml.de/">YAML</a> | powered by <a href="http://www.concrete5.org/">Concrete5</a>
      </div>
    </div>
    <div id="border-bottom">
      <div id="edge-bl"></div>
      <div id="edge-br"></div>
    </div>
  </div>
  <?php  Loader::element('footer_required'); ?>
</body>
</html>