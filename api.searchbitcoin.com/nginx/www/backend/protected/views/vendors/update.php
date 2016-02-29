<?php
$this->breadcrumbs=array(
	'Vendors'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Vendors', 'url'=>array('index')),
	array('label'=>'Create Vendors', 'url'=>array('create')),
	array('label'=>'View Vendors', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Vendors', 'url'=>array('admin')),
);
?>

<h1>Update Vendors <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>