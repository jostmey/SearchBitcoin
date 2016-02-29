<?php
$this->breadcrumbs=array(
	'Parse Store Rules'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List ParseStoreRules', 'url'=>array('index')),
	array('label'=>'Create ParseStoreRules', 'url'=>array('create')),
	array('label'=>'Update ParseStoreRules', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete ParseStoreRules', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage ParseStoreRules', 'url'=>array('admin')),
);
?>

<h1>View ParseStoreRules #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'id_vendor',
		'crawl_seed',
		'crawl_pattern',
		'crawl_frequency',
		'crawl_page_limit',
		'index_pattern',
		'title_selector',
		'title_offset',
		'description_selector',
		'description_offset',
		'image_selector',
		'image_offset',
		'price_selector',
		'price_offset',
		'category_selector',
		'category_offset',
		'expiration_selector',
		'expiration_offset',
		'expiration_pattern',
		'status',
		'created',
	),
)); ?>
