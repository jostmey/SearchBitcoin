<?php
$this->breadcrumbs=array(
	'Vendors',
);

$this->menu=array(
	array('label'=>'Create Vendors', 'url'=>array('create')),
	array('label'=>'Manage Vendors', 'url'=>array('admin')),
);
?>

<h1>Vendors</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
