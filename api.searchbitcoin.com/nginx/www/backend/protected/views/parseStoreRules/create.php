<?php
$this->breadcrumbs=array(
	'Parse Store Rules'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List ParseStoreRules', 'url'=>array('index')),
	array('label'=>'Manage ParseStoreRules', 'url'=>array('admin')),
);
?>

<h1>Create ParseStoreRules</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>