<?php   
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>
<!--SubPage MiddleRow Begin-->
<div id="midrow">
  <div class="center">
    <div class="textbox2">
<?php  
    $a = new Area('Main');
    $a->display($c);
?>
    </div>
  </div>
</div>
<!--MiddleRow END-->
    <?php       $this->inc('elements/footer.php'); ?>