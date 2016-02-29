<?php   
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>
<!--SubPage BottomRow Begin-->
<div id="bottomrow">
  <div id="box2holder">
      <div class="box2"> 
<?php  
    $a = new Area('Main');
    $a->display($c);
?>
    </div>
    </div>
    <div class="box2"> 
<?php  
    $a = new Area('Sidebar');
    $a->display($c);
?>
    </div>
    </div>
  </div>
</div>
<!--BottomRow END-->
    <?php       $this->inc('elements/footer.php'); ?>