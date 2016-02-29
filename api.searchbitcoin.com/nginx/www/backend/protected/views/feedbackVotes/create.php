<?php
$this->breadcrumbs=array(
	'Feedback Votes'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List FeedbackVotes', 'url'=>array('index')),
	array('label'=>'Manage FeedbackVotes', 'url'=>array('admin')),
);
?>

<h1>Create FeedbackVotes</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>