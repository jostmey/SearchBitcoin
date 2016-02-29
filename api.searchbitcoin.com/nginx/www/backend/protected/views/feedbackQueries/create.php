<?php
$this->breadcrumbs=array(
	'Feedback Queries'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List FeedbackQueries', 'url'=>array('index')),
	array('label'=>'Manage FeedbackQueries', 'url'=>array('admin')),
);
?>

<h1>Create FeedbackQueries</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>