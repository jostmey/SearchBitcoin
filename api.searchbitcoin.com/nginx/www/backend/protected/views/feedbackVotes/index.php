<?php
$this->breadcrumbs=array(
	'Feedback Votes',
);

$this->menu=array(
	array('label'=>'Create FeedbackVotes', 'url'=>array('create')),
	array('label'=>'Manage FeedbackVotes', 'url'=>array('admin')),
);
?>

<h1>Feedback Votes</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
