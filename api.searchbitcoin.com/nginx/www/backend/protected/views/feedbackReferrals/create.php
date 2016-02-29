<?php
$this->breadcrumbs=array(
	'Feedback Referrals'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List FeedbackReferrals', 'url'=>array('index')),
	array('label'=>'Manage FeedbackReferrals', 'url'=>array('admin')),
);
?>

<h1>Create FeedbackReferrals</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>