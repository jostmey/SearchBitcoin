<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_item')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id_item), array('items/'.$data->id_item)); ?>
	<br />

	<b><?php echo CHtml::encode($data->item->getAttributeLabel('url')); ?>:</b>
	<a href="<?php echo CHtml::encode($data->item->url); ?>" target="_blank"><?php echo CHtml::encode($data->item->url); ?></a>
	<br />

	<b><?php echo CHtml::encode($data->item->getAttributeLabel('title')); ?>:</b>
	<?php echo CHtml::encode($data->item->title); ?>
	<br />

	<b><?php echo CHtml::encode($data->item->getAttributeLabel('image')); ?>:</b>
	<br />
	<img src="http://api.searchbitcoin.com/services/image/<?php echo CHtml::encode($data->item->id); ?>" />
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('vote')); ?>:</b>
	<?php echo CHtml::encode($data->vote); ?>
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
