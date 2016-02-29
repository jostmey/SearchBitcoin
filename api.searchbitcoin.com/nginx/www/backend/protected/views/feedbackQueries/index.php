<?php
$this->breadcrumbs=array(
	'Feedback Queries',
);

$this->menu=array(
	array('label'=>'Create FeedbackQueries', 'url'=>array('create')),
	array('label'=>'Manage FeedbackQueries', 'url'=>array('admin')),
);
?>

<h1>Feedback Queries</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
