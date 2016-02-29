<?php    
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>
    <div id="full">
<?php   
    $a = new Area('Main');
    $a->display($c);
?>
    </div>
    <?php        $this->inc('elements/footer.php'); ?>