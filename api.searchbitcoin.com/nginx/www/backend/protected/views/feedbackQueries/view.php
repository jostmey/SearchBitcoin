<?php
$this->breadcrumbs=array(
	'Feedback Queries'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List FeedbackQueries', 'url'=>array('index')),
	array('label'=>'Create FeedbackQueries', 'url'=>array('create')),
	array('label'=>'Update FeedbackQueries', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete FeedbackQueries', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage FeedbackQueries', 'url'=>array('admin')),
);
?>

<h1>View FeedbackQueries #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'query',
		'referrer',
		'ip_client',
		'created',
	),
)); ?>
