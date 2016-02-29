<?php
$this->breadcrumbs=array(
	'Vendor Submissions',
);

$this->menu=array(
	array('label'=>'Create VendorSubmissions', 'url'=>array('create')),
	array('label'=>'Manage VendorSubmissions', 'url'=>array('admin')),
);
?>

<h1>Vendor Submissions</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
