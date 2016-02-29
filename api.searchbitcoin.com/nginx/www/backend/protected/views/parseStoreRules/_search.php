<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id'); ?>
		<?php echo $form->textField($model,'id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'id_vendor'); ?>
		<?php echo $form->textField($model,'id_vendor'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'crawl_seed'); ?>
		<?php echo $form->textField($model,'crawl_seed',array('size'=>60,'maxlength'=>256)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'crawl_pattern'); ?>
		<?php echo $form->textField($model,'crawl_pattern',array('size'=>60,'maxlength'=>256)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'crawl_frequency'); ?>
		<?php echo $form->textField($model,'crawl_frequency'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'crawl_page_limit'); ?>
		<?php echo $form->textField($model,'crawl_page_limit'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'index_pattern'); ?>
		<?php echo $form->textField($model,'index_pattern',array('size'=>60,'maxlength'=>256)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'title_selector'); ?>
		<?php echo $form->textField($model,'title_selector',array('size'=>60,'maxlength'=>256)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'title_offset'); ?>
		<?php echo $form->textField($model,'title_offset'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'description_selector'); ?>
		<?php echo $form->textField($model,'description_selector',array('size'=>60,'maxlength'=>256)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'description_offset'); ?>
		<?php echo $form->textField($model,'description_offset'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'image_selector'); ?>
		<?php echo $form->textField($model,'image_selector',array('size'=>60,'maxlength'=>256)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'image_offset'); ?>
		<?php echo $form->textField($model,'image_offset'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'price_selector'); ?>
		<?php echo $form->textField($model,'price_selector',array('size'=>60,'maxlength'=>256)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'price_offset'); ?>
		<?php echo $form->textField($model,'price_offset'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'category_selector'); ?>
		<?php echo $form->textField($model,'category_selector',array('size'=>60,'maxlength'=>256)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'category_offset'); ?>
		<?php echo $form->textField($model,'category_offset'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'expiration_selector'); ?>
		<?php echo $form->textField($model,'expiration_selector',array('size'=>60,'maxlength'=>256)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'expiration_offset'); ?>
		<?php echo $form->textField($model,'expiration_offset'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'expiration_pattern'); ?>
		<?php echo $form->textField($model,'expiration_pattern',array('size'=>60,'maxlength'=>256)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'status'); ?>
		<?php echo $form->textField($model,'status',array('size'=>60,'maxlength'=>64)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'created'); ?>
		<?php echo $form->textField($model,'created'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->