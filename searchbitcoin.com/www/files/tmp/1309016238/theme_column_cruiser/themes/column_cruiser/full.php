<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>

	  <div id="teaser">
	    <?php 
		  $a_teaser = new Area('Teaser');
		  $a_teaser->display($c);
		  if ($a_teaser->getTotalBlocksInArea() > 0) { ?>
			<div class="divider"></div>
	    <?php  } ?>
      </div>
      <div id="main">
        <div id="col1">
          <div id="col1_content" class="clearfix">
            <!-- add your content here -->
			<?php 
			  $a_col1_content = new Area('Sidebar');
			  $a_col1_content->display($c);
		      if ($a_col1_content->getTotalBlocksInArea() > 0) { ?>
	            <div class="divider"></div>
	        <?php  } ?>
          </div>
        </div>
        <div id="col2">
          <div id="col2_content" class="clearfix">
            <!-- add your content here -->
			<?php 
			  $a_col2_content = new Area('Sidebar 2');
			  $a_col2_content->display($c);
		      if ($a_col2_content->getTotalBlocksInArea() > 0) { ?>
	            <div class="divider"></div>
	        <?php  } ?>
          </div>
        </div>
        <div id="col3">
          <div id="col3_content" class="clearfix">
            <!-- add your content here -->
			<?php 
			  $a_col3_content = new Area('Main');
			  $a_col3_content->display($c);
		      if ($a_col3_content->getTotalBlocksInArea() > 0) { ?>
	            <div class="divider"></div>
	        <?php  } ?>
          </div>
          <!-- IE Column Clearing -->
          <div id="ie_clearing"> &#160; </div>
        </div>
      </div>
	  
<?php  $this->inc('elements/footer.php'); ?>
