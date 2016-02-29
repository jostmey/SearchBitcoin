<?php
$this->breadcrumbs=array(
	'Feedback Queries'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List FeedbackQueries', 'url'=>array('index')),
	array('label'=>'Create FeedbackQueries', 'url'=>array('create')),
	array('label'=>'View FeedbackQueries', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage FeedbackQueries', 'url'=>array('admin')),
);
?>

<h1>Update FeedbackQueries <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>