<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'feedback-queries-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'query'); ?>
		<?php echo $form->textField($model,'query',array('size'=>60,'maxlength'=>256)); ?>
		<?php echo $form->error($model,'query'); ?>
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
