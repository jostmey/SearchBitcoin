<?php
$this->breadcrumbs=array(
	'Vendor Submissions'=>array('index'),
	$model->title,
);

$this->menu=array(
	array('label'=>'List VendorSubmissions', 'url'=>array('index')),
	array('label'=>'Create VendorSubmissions', 'url'=>array('create')),
	array('label'=>'Update VendorSubmissions', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete VendorSubmissions', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage VendorSubmissions', 'url'=>array('admin')),
);
?>

<h1>View VendorSubmissions #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'url',
		'title',
		'description',
		'image',
		'email_address',
		'bitcoin_address',
		'payment_instructions',
		'country',
		'province',
		'city',
		'tags',
		'status',
		'created',
	),
)); ?>
