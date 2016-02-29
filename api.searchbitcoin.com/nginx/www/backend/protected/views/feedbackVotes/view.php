<?php
$this->breadcrumbs=array(
	'Feedback Votes'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List FeedbackVotes', 'url'=>array('index')),
	array('label'=>'Create FeedbackVotes', 'url'=>array('create')),
	array('label'=>'Update FeedbackVotes', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete FeedbackVotes', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage FeedbackVotes', 'url'=>array('admin')),
);
?>

<h1>View FeedbackVotes #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'id_item',
		'vote',
		'referrer',
		'ip_client',
		'created',
	),
)); ?>
