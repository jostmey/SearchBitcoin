<?php
$this->breadcrumbs=array(
	'Parse Store Rules',
);

$this->menu=array(
	array('label'=>'Create ParseStoreRules', 'url'=>array('create')),
	array('label'=>'Manage ParseStoreRules', 'url'=>array('admin')),
);
?>

<h1>Parse Store Rules</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
