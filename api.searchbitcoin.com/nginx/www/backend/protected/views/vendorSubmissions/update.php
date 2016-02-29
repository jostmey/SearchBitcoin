<?php
$this->breadcrumbs=array(
	'Vendor Submissions'=>array('index'),
	$model->title=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List VendorSubmissions', 'url'=>array('index')),
	array('label'=>'Create VendorSubmissions', 'url'=>array('create')),
	array('label'=>'View VendorSubmissions', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage VendorSubmissions', 'url'=>array('admin')),
);
?>

<h1>Update VendorSubmissions <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>