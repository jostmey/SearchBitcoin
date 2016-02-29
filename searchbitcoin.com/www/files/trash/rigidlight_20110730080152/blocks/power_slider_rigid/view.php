<?php   defined('C5_EXECUTE') or die("Access Denied."); ?>

<?php 
global $c;
?>
<?php  if ($c->isEditMode()) { }
else { ?>
<script type="text/javascript">
$(function(){
	$("#powerSliderContainer").cycle({ 
		fx: '<?php  echo $transitionType ?>',
		next: '#powerSliderNext',
		prev: '#powerSliderPrev',
		pager: '#powerSliderPagination',
		cleartypeNoBg: true,
		timeout: <?php  echo $slideDelay ?>000
	});
});
</script>
<?php  } ?> 
<style>
#powerSliderShell { position: relative; width: <?php  echo $powerSlideWidth ?>px; height: <?php  echo $powerSlideHeight ?>px; }
#powerSliderContainer { position: relative; overflow: hidden; width: <?php  echo $powerSlideWidth ?>px; height: <?php  echo $powerSlideHeight ?>px; }
.powerSlide { height: <?php  echo $powerSlideHeight ?>px; }
</style>

<div id="powerSliderShell">
	
    <div id="powerSliderContainer">
    
            <?php  foreach($images as $imgInfo) { 
            $f = File::getByID($imgInfo['fID']);
			$fp = new Permissions($f);
			$theLink = Page::getCollectionPathFromID($imgInfo['pageID']);
			$theLink = DIR_REL . $theLink;
			?>
            <a class="powerSlide" href="<?php  echo $theLink ?>">
              
                <img src="<?php  echo $f->getRelativePath()?>">
                <span class="largeText"><?php  echo $imgInfo['powerSlidePhraseTitle']?></span>
                <span class="smallText"><?php  echo $imgInfo['powerSlidePhraseDesc']?></span>
              
            </a>
            <?php   } ?>

	</div><!-- #powerSliderContainer -->
    
    <?php  if ( $paginationToggle == "paginationOn" ) { ?>
    <div id="powerSliderPagination" style="position: absolute; width: <?php  echo $powerSlideWidth ?>px; z-index: 99; bottom: <?php  echo $paginationOffsetY ?>px; text-align: <?php  echo $paginationAlignment ?>; ">
    	
    </div>
	<?php  } ?>
    
    <?php  if ( $prevNextArrows == "prevNextOn" ) { ?>
    <div id="powerSliderNext" style="position: absolute; z-index: 99; bottom: <?php  echo $nextBtnOffsetY ?>px; right: <?php  echo $nextBtnOffsetX ?>px;"></div>
    <div id="powerSliderPrev" style="position: absolute; z-index: 99; bottom: <?php  echo $prevBtnOffsetY ?>px; left: <?php  echo $prevBtnOffsetX ?>px;"></div>
    <?php  } ?>

</div><!-- #powerSliderShell  -->