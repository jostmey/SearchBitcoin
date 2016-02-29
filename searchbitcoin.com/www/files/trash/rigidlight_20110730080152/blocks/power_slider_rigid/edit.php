<?php  
defined('C5_EXECUTE') or die("Access Denied.");
$slideshowObj=$controller;
?>

<?php  
defined('C5_EXECUTE') or die("Access Denied.");
$al = Loader::helper('concrete/asset_library');
$ah = Loader::helper('concrete/interface');
?>
<?php  $formPageSelector = Loader::helper('form/page_selector'); ?>
<style type="text/css">
#ccm-slideshowBlock-imgRows a{cursor:pointer}
#ccm-slideshowBlock-imgRows .ccm-slideshowBlock-imgRow,
#ccm-slideshowBlock-fsRow {margin-bottom:16px;clear:both;padding:7px;background-color:#eee}
#ccm-slideshowBlock-imgRows .ccm-slideshowBlock-imgRow a.moveUpLink{ display:block; background:url(<?php  echo DIR_REL?>/concrete/images/icons/arrow_up.png) no-repeat center; height:10px; width:16px; }
#ccm-slideshowBlock-imgRows .ccm-slideshowBlock-imgRow a.moveDownLink{ display:block; background:url(<?php  echo DIR_REL?>/concrete/images/icons/arrow_down.png) no-repeat center; height:10px; width:16px; }
#ccm-slideshowBlock-imgRows .ccm-slideshowBlock-imgRow a.moveUpLink:hover{background:url(<?php  echo DIR_REL?>/concrete/images/icons/arrow_up_black.png) no-repeat center;}
#ccm-slideshowBlock-imgRows .ccm-slideshowBlock-imgRow a.moveDownLink:hover{background:url(<?php  echo DIR_REL?>/concrete/images/icons/arrow_down_black.png) no-repeat center;}
#ccm-slideshowBlock-imgRows .cm-slideshowBlock-imgRowIcons{ float:right; width:35px; text-align:left; }
</style>
<style>

	.collapseContainer {  }
	
		.collapseContainer h2 { padding: 4px 0; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; cursor: pointer; }
	
	.collapsingDiv { display: none; }
	
		ul.toggleNav { overflow: auto; }
		ul.toggleNav li { float: left; padding: 2px 5px; margin: 0 5px 0 0; border: 1px solid; border-color: #aaa #aaa #fff #aaa; cursor: pointer; }
		ul.toggleNav li#addSlide { background: #ddd; color: #003c8a; }
		
		.toggleContentContainer { }
			.toggleContentContainer>div { display: none; }
			.toggleContent.toggleOn {  }
			.toggleContent:first-child { display: block; }

</style>
<script type="text/javascript">
$(function(){
	
	$(".collapseContainer h2").click(
		function(){ $(this).parent().find(".collapsingDiv").slideToggle(); }
	);
	
	$(".toggleContainer").each(function(){
		 $(".toggleContentContainer").css({"position" : "relative"});
		 $(".toggleContentContainer>div:first-child").addClass("toggleOn");
		 //$(".toggleContentContainer div").css({"position" : "absolute", "top" : "0", "left" : "0"});
		// var tcontainerWidth = $(".toggleContentContainer div.toggleOn").width();
		// var tcontainerHeight = $(".toggleContentContainer div.toggleOn").height();
		// $(".toggleContentContainer").css({"height" : tcontainerHeight, "width" : tcontainerWidth});
		 $(".toggleNav li:first-child a, .toggleNav li:first-child").addClass("active");
		 var giveOrder = 1
		 $(".toggleNav li a").each(function(){
			  $(this).attr("id", "toggleLink" + giveOrder);
			  giveOrder++
			  var toggleOrder = $(this).attr("id");
			  var toggleOrder = toggleOrder.replace("toggleLink", '');
			  $(this).click(function(){
				   $(".toggleNav li a, .toggleNav li").removeClass("active");
				   $(this).addClass("active").parent().addClass("active");
				   $(".toggleContentContainer>div").removeClass("toggleOn").hide();
				   $(".toggleContentContainer>div:nth-child(" + toggleOrder + ")").addClass("toggleOn").show();
				   //var tcontainerWidth = $(".toggleContentContainer div.toggleOn").width();
				  // var tcontainerHeight = $(".toggleContentContainer div.toggleOn").height();
				  // $(".toggleContentContainer").animate({height : tcontainerHeight, width : tcontainerWidth});
			  });
		 });
	});
	
	if ( $("#prevNextArrows").val() == "prevNextOn" ) {
		$("#prevNextHiddenFields").show();	
	}
	else { $("#prevNextHiddenFields").hide(); }
	
	if ( $("#paginationToggle").val() == "paginationOn" ) {
		$("#paginationOptionsHidden").show();	
	}
	else { $("#paginationOptionsHidden").hide(); }
	
});
</script>

<!-- Global Settings -->
<div class="collapseContainer">

	<h2><?php  echo t("Global Settings"); ?></h2>
    <div class="collapsingDiv" style="display: block;">
           
        <div style="margin: 20px 0;">
        <label for="powerSlideWidth"><?php  echo t("How wide do you want this thing?"); ?></label>
        <?php  echo $form->text('powerSlideWidth', $powerSlideWidth, array('style' => 'width: 90px')). " px";?>
        </div>
        
        <div style="margin: 20px 0;">
        <label for="powerSlideHeight"><?php  echo t("Yeah, and what kinda height we talkin?"); ?></label>
        <?php  echo $form->text('powerSlideHeight', $powerSlideHeight, array('style' => 'width: 90px')). " px";?>
        </div>
        
        <div style="margin: 20px 0;">
        <label for="transitionType"><?php  echo t("Select a transition: <a href='http://jquery.malsup.com/cycle/browser.html' target='_blank'>view examples</a>"); ?></label>
        <?php  echo $form->select('transitionType', array('blindX' => 'blindX', 'blindY' => 'blindY', 'blindZ' => 'blindZ', 'cover' => 'cover', 'curtainX' => 'curtainX', 
        'curtainY' => 'curtainY', 'fade' => 'fade', 'fadeZoom' => 'fadeZoom', 'growX' => 'growX', 'growY' => 'growY', 'none' => 'none', 'scrollUp' => 'scrollUp', 'scrollLeft' => 'scrollLeft', 
        'scrollRight' => 'scrollRight', 'scrollDown' => 'scrollDown', 'scrollHorz' => 'scrollHorz', 'scrollVert' => 'scrollVert', 'shuffle' => 'shuffle', 'slideX' => 'slideX', 'toss' => 'toss', 
        'turnUp' => 'turnUp', 'turnDown' => 'turnDown', 'turnLeft' => 'turnLeft', 'turnRight' => 'turnRight', 'uncover' => 'uncover', 'wipe' => 'wipe', 'zoom' => 'zoom'
        ), $transitionType);?>      
        </div>
        
        <div style="margin: 20px 0;">
        <label for="slideDelay"><?php  echo t("How many seconds would you like the slides to last?'"); ?></label>
        <?php  echo $form->text('slideDelay', $slideDelay, array('style' => 'width: 90px')); ?>
        </div>
        
        <input type="hidden" name="type" value="CUSTOM">
          
    </div>
    
</div><!-- .collapseContainer -->
<!-- End Global Settings -->

<!-- Begin Prev/Next Button Options -->
<div class="collapseContainer">

	<h2><?php  echo t("Prev/Next Buttons"); ?></h2>
    <div class="collapsingDiv">
        <div style="margin: 20px 0;">
            <label for="prevNextArrows"><?php  echo t("How do you feel about Prev/Next Arrows"); ?></label>
            <?php  echo $form->select('prevNextArrows', array('prevNextOff' => 'Hate Em', 'prevNextOn' => 'Love em'), $prevNextArrows, array('onChange' => 'updatePrevNextOptions();'));?>
            <script type="text/javascript">
				function updatePrevNextOptions() {
					if ( $("#prevNextArrows").val() == "prevNextOn" ) {
						$("#prevNextHiddenFields").show();	
					}
					else { $("#prevNextHiddenFields").hide(); }
				}
			</script>
        </div>
        
        <div id="prevNextHiddenFields">
            <div style="margin: 20px 0;">
                <label for="prevBtnOffsetY"><?php  echo t("Distance from bottom you'd like the Previous Arrow"); ?></label>
                <?php  echo $form->text('prevBtnOffsetY', $prevBtnOffsetY, array('style' => 'width: 90px')). " px";?>
            </div>
            
            <div style="margin: 20px 0;">
                <label for="prevBtnOffsetX"><?php  echo t("Distance from left you'd like the Previous Arrow"); ?></label>
                <?php  echo $form->text('prevBtnOffsetX', $prevBtnOffsetX, array('style' => 'width: 90px')). " px";?>
            </div>
            
            <div style="margin: 20px 0;">
                <label for="nextBtnOffsetY"><?php  echo t("Distance from bottom you'd like the Next Arrow"); ?></label
                <?php  echo $form->text('nextBtnOffsetY', $nextBtnOffsetY, array('style' => 'width: 90px')). " px";?>
            </div>
            
            <div style="margin: 20px 0;">
                <label for="nextBtnOffsetX"><?php  echo t("Distance from right you'd like the Next Arrow"); ?></label>
                <?php  echo $form->text('nextBtnOffsetX', $nextBtnOffsetX, array('style' => 'width: 90px')). " px";?>
            </div>
         </div>
    </div><!-- .collapsingDiv -->

</div><!-- .collapseContainer -->
<!-- End Prev/Next Button Options -->

<!-- Begin Pagination Button Options -->
<div class="collapseContainer">

	<h2><?php  echo t("Pagination Buttons"); ?></h2>
    <div class="collapsingDiv">
        
        <div style="margin: 20px 0;">
			<label for="paginationToggle"><?php  echo t("How do you feel pagination (clicking on 1, 2, 3 for each slide)"); ?></label>
            <?php  echo $form->select('paginationToggle', array('paginationOn' => 'Love em', 'paginationOff' => 'Hate Em'), $paginationToggle, array('onChange' => 'updatePaginationOptions();'));?>
            <script type="text/javascript">
				function updatePaginationOptions() {
					if ( $("#paginationToggle").val() == "paginationOn" ) {
						$("#paginationOptionsHidden").show();	
					}
					else { $("#paginationOptionsHidden").hide(); }
				}
			</script>
        </div>
        
        <div id="paginationOptionsHidden">
            <div style="margin: 20px 0;">
                <label for="paginationOffsetY"><?php  echo t("Distance from bottom you'd like the Pagination"); ?></label>
                <?php  echo $form->text('paginationOffsetY', $paginationOffsetY, array('style' => 'width: 90px')). " px";?>
            </div>
            
            <div style="margin: 20px 0;">
                <label for="paginationAlignment"><?php  echo t("Pagination Alignment"); ?></label>
                <?php  echo $form->select('paginationAlignment', array('left' => 'Left', 'right' => 'Right', 'center' => 'Center'), $paginationAlignment);?>
            </div>
        </div>
                
    </div><!-- .collapsingDiv -->

</div><!-- .collapseContainer -->
<!-- End Pagination Button Options -->

<div id="newImg" class="collapseContainer">
	
    <h2><?php  echo t("Add Images"); ?>A</h2>

    <div class="collapsingDiv">
        <div id="ccm-slideshowBlock-imgRows"> 
            <?php   if ($fsID <= 0) {
                foreach($images as $imgInfo){ 
                    $f = File::getByID($imgInfo['fID']);
                    $fp = new Permissions($f);
                    $imgInfo['thumbPath'] = $f->getThumbnailSRC(1);
                    $imgInfo['fileName'] = $f->getTitle();
                    if ($fp->canRead()) { 
                        $this->inc('image_row_include.php', array('imgInfo' => $imgInfo));
                    }
                }
            } ?>
        </div>
        
        <span id="ccm-slideshowBlock-chooseImg"><?php  echo $ah->button_js(t('Add Image'), 'SlideshowBlock.chooseImg()', 'left');?></span>
        
    </div>


	
</div>


<?php  
Loader::model('file_set');
$s1 = FileSet::getMySets();
$sets = array();
foreach ($s1 as $s){
    $sets[$s->fsID] = $s->fsName;
}
$fsInfo['fileSets'] = $sets;

if ($fsID > 0) {
	$fsInfo['fsID'] = $fsID;
	$fsInfo['duration']=$duration;
	$fsInfo['fadeDuration']=$fadeDuration;
} else {
	$fsInfo['fsID']='0';
	$fsInfo['duration']=$defaultDuration;
	$fsInfo['fadeDuration']=$defaultFadeDuration;
}
$this->inc('fileset_row_include.php', array('fsInfo' => $fsInfo)); ?> 

<div id="imgRowTemplateWrap" style="display:none">
<?php  
$imgInfo['slideshowImgId']='tempSlideshowImgId';
$imgInfo['fID']='tempFID';
$imgInfo['fileName']='tempFilename';
$imgInfo['origfileName']='tempOrigFilename';
$imgInfo['thumbPath']='tempThumbPath';
$imgInfo['duration']=$defaultDuration;
$imgInfo['fadeDuration']=$defaultFadeDuration;
$imgInfo['groupSet']=0;
$imgInfo['imgHeight']=tempHeight;
$imgInfo['url']='';
$imgInfo['class']='ccm-slideshowBlock-imgRow';
?>
<?php   $this->inc('image_row_include.php', array('imgInfo' => $imgInfo)); ?> 
</div>
