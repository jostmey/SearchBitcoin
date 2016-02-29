<?php
$this->breadcrumbs=array(
	'Feedback Referrals',
);

$this->menu=array(
	array('label'=>'Create FeedbackReferrals', 'url'=>array('create')),
	array('label'=>'Manage FeedbackReferrals', 'url'=>array('admin')),
);
?>

<h1>Feedback Referrals</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
