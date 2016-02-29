<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_vendor')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id_vendor), array('vendors/'.$data->id_vendor)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('url')); ?>:</b>
	<a href="<?php echo CHtml::encode($data->url); ?>" target="_blank"><?php echo CHtml::encode($data->url); ?></a>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('title')); ?>:</b>
	<?php echo CHtml::encode($data->title); ?>
	<br />

	<?php /*

	<b><?php echo CHtml::encode($data->getAttributeLabel('description')); ?>:</b>
	<?php 
		$description=CHtml::encode($data->description);
		if(strlen($description) > 256)
			$description=substr($description, 0, 252).' ...';
		echo $description;
	?>
	<br />

	*/ ?>

	<b><?php echo CHtml::encode($data->getAttributeLabel('image')); ?>:</b>
	<br />
	<img src="http://api.searchbitcoin.com/services/image/<?php echo CHtml::encode($data->id); ?>" />
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tags')); ?>:</b>
	<?php echo CHtml::encode($data->tags); ?>
	<br />

	<?php /*

	<b><?php echo CHtml::encode($data->getAttributeLabel('price')); ?>:</b>
	<?php echo CHtml::encode($data->price); ?>
	<br />

	*/ ?>

	<b><?php echo CHtml::encode($data->getAttributeLabel('priority')); ?>:</b>
	<?php echo CHtml::encode($data->priority); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('status')); ?>:</b>
	<?php echo CHtml::encode($data->status); ?>
	<br />

	<?php /*

	<b><?php echo CHtml::encode($data->getAttributeLabel('created')); ?>:</b>
	<?php echo CHtml::encode($data->created); ?>
	<br />

	*/ ?>

</div>
