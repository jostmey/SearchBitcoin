<?php
$this->breadcrumbs=array(
	'Vendor Submissions'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List VendorSubmissions', 'url'=>array('index')),
	array('label'=>'Manage VendorSubmissions', 'url'=>array('admin')),
);
?>

<h1>Create VendorSubmissions</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>