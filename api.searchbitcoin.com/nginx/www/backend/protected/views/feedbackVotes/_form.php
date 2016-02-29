<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'feedback-votes-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'id_item'); ?>
		<?php echo $form->textField($model,'id_item'); ?>
		<?php echo $form->error($model,'id_item'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'vote'); ?>
		<?php echo $form->textField($model,'vote'); ?>
		<?php echo $form->error($model,'vote'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'referrer'); ?>
		<?php echo $form->textField($model,'referrer',array('size'=>60,'maxlength'=>512)); ?>
		<?php echo $form->error($model,'referrer'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'ip_client'); ?>
		<?php echo $form->textField($model,'ip_client',array('size'=>32,'maxlength'=>32)); ?>
		<?php echo $form->error($model,'ip_client'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->
