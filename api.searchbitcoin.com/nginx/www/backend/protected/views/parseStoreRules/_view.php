<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_vendor')); ?>:</b>
	<?php echo CHtml::encode($data->id_vendor); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('crawl_seed')); ?>:</b>
	<?php echo CHtml::encode($data->crawl_seed); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('crawl_pattern')); ?>:</b>
	<?php echo CHtml::encode($data->crawl_pattern); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('crawl_frequency')); ?>:</b>
	<?php echo CHtml::encode($data->crawl_frequency); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('crawl_page_limit')); ?>:</b>
	<?php echo CHtml::encode($data->crawl_page_limit); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('index_pattern')); ?>:</b>
	<?php echo CHtml::encode($data->index_pattern); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('title_selector')); ?>:</b>
	<?php echo CHtml::encode($data->title_selector); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('title_offset')); ?>:</b>
	<?php echo CHtml::encode($data->title_offset); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('description_selector')); ?>:</b>
	<?php echo CHtml::encode($data->description_selector); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('description_offset')); ?>:</b>
	<?php echo CHtml::encode($data->description_offset); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('image_selector')); ?>:</b>
	<?php echo CHtml::encode($data->image_selector); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('image_offset')); ?>:</b>
	<?php echo CHtml::encode($data->image_offset); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('price_selector')); ?>:</b>
	<?php echo CHtml::encode($data->price_selector); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('price_offset')); ?>:</b>
	<?php echo CHtml::encode($data->price_offset); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('category_selector')); ?>:</b>
	<?php echo CHtml::encode($data->category_selector); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('category_offset')); ?>:</b>
	<?php echo CHtml::encode($data->category_offset); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('expiration_selector')); ?>:</b>
	<?php echo CHtml::encode($data->expiration_selector); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('expiration_offset')); ?>:</b>
	<?php echo CHtml::encode($data->expiration_offset); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('expiration_pattern')); ?>:</b>
	<?php echo CHtml::encode($data->expiration_pattern); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('status')); ?>:</b>
	<?php echo CHtml::encode($data->status); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('created')); ?>:</b>
	<?php echo CHtml::encode($data->created); ?>
	<br />

	*/ ?>

</div>