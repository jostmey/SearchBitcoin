<?php   
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>
<!--MiddleRow Begin-->
<div id="midrow">
  <div id="container">
    <div class="box">
<?php  
    $a = new Area('Left');
    $a->display($c);
?>
    </div>
    <div class="box">
<?php  
    $a = new Area('Main');
    $a->display($c);
?>
    </div>
    <div class="box last">
<?php  
    $a = new Area('Right');
    $a->display($c);
?>
    </div>
  </div>
</div>
<!--MiddleRow END-->
    <?php       $this->inc('elements/footer.php'); ?>
