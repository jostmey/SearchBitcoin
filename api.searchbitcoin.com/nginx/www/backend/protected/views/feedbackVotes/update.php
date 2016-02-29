<?php
$this->breadcrumbs=array(
	'Feedback Votes'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List FeedbackVotes', 'url'=>array('index')),
	array('label'=>'Create FeedbackVotes', 'url'=>array('create')),
	array('label'=>'View FeedbackVotes', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage FeedbackVotes', 'url'=>array('admin')),
);
?>

<h1>Update FeedbackVotes <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>