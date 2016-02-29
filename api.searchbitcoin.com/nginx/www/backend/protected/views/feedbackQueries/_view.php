<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('query')); ?>:</b>
	<?php echo CHtml::encode($data->query); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('referrer')); ?>:</b>
	<?php echo CHtml::encode($data->referrer); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ip_client')); ?>:</b>
	<?php echo CHtml::encode($data->ip_client); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('created')); ?>:</b>
	<?php echo CHtml::encode($data->created); ?>
	<br />


</div>