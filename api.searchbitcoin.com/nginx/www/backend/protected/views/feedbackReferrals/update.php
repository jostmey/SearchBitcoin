<?php
$this->breadcrumbs=array(
	'Feedback Referrals'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List FeedbackReferrals', 'url'=>array('index')),
	array('label'=>'Create FeedbackReferrals', 'url'=>array('create')),
	array('label'=>'View FeedbackReferrals', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage FeedbackReferrals', 'url'=>array('admin')),
);
?>

<h1>Update FeedbackReferrals <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>