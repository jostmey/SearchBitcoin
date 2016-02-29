<?php
$this->breadcrumbs=array(
	'Parse Store Rules'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List ParseStoreRules', 'url'=>array('index')),
	array('label'=>'Create ParseStoreRules', 'url'=>array('create')),
	array('label'=>'View ParseStoreRules', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage ParseStoreRules', 'url'=>array('admin')),
);
?>

<h1>Update ParseStoreRules <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>