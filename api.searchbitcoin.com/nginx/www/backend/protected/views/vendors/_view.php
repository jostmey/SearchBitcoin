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

	<b><?php echo CHtml::encode($data->item->getAttributeLabel('description')); ?>:</b>
	<?php 
		$description=CHtml::encode($data->item->description);
		if(strlen($description) > 256)
			$description=substr($description, 0, 252).' ...';
		echo $description;
	?>
	<br />

	<b><?php echo CHtml::encode($data->item->getAttributeLabel('image')); ?>:</b>
	<br />
	<img src="http://api.searchbitcoin.com/services/image/<?php echo CHtml::encode($data->item->id); ?>" />
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('email_address')); ?>:</b>
	<?php echo CHtml::encode($data->email_address); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('bitcoin_address')); ?>:</b>
	<?php echo CHtml::encode($data->bitcoin_address); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('payment_instructions')); ?>:</b>
	<?php echo CHtml::encode($data->payment_instructions); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('country')); ?>:</b>
	<?php echo CHtml::encode($data->country); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('province')); ?>:</b>
	<?php echo CHtml::encode($data->province); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('city')); ?>:</b>
	<?php echo CHtml::encode($data->city); ?>
	<br />


	<b><?php echo CHtml::encode($data->item->getAttributeLabel('status')); ?>:</b>
	<?php echo CHtml::encode($data->item->status); ?>
	<br />

	<?php /*

	<b><?php echo CHtml::encode($data->getAttributeLabel('source')); ?>:</b>
	<?php echo CHtml::encode($data->source); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('created')); ?>:</b>
	<?php echo CHtml::encode($data->created); ?>
	<br />

	*/ ?>

</div>
