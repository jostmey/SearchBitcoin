<?php
$this->breadcrumbs=array(
	'Vendors',
);

$this->menu=array(
	array('label'=>'Create Vendor', 'url'=>array('create')),
	array('label'=>'Manage Vendor', 'url'=>array('admin')),
);
?>

<h1>Vendor Approval Page</h1>

<div class="view">

	<?php echo $this->renderPartial('_form', array('item'=>$item, 'vendorSubmission'=>$vendorSubmission, 'vendorReviewForm'=>$vendorReviewForm)); ?>

</div>

<br/>

<div style="border: 3px solid black;">

	<iframe src="<?php echo $vendorSubmission->url; ?>" border="0" width="100%" height="500px">Your browser does not support iframes, so the content here is missing</iframe>

</div>
