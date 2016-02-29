<?php  
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header-full.php'); ?>
<div id="content">
    <div id="full-page">
    <?php  
        $a = new Area('Main');
        $a->display($c);
    ?>
    </div>
</div>
<?php   $this->inc('elements/footer.php'); ?>