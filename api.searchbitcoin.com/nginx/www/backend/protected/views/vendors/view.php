<?php
$this->breadcrumbs=array(
	'Vendors'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Vendors', 'url'=>array('index')),
	array('label'=>'Create Vendors', 'url'=>array('create')),
	array('label'=>'Update Vendors', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Vendors', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Vendors', 'url'=>array('admin')),
);
?>

<h1>View Vendors #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'id_item',
		'email_address',
		'bitcoin_address',
		'payment_instructions',
		'country',
		'province',
		'city',
		'source',
		'created',
	),
)); ?>
