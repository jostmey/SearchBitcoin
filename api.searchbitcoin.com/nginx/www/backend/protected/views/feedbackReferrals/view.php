<?php
$this->breadcrumbs=array(
	'Feedback Referrals'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List FeedbackReferrals', 'url'=>array('index')),
	array('label'=>'Create FeedbackReferrals', 'url'=>array('create')),
	array('label'=>'Update FeedbackReferrals', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete FeedbackReferrals', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage FeedbackReferrals', 'url'=>array('admin')),
);
?>

<h1>View FeedbackReferrals #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'id_item',
		'referrer',
		'ip_client',
		'created',
	),
)); ?>
