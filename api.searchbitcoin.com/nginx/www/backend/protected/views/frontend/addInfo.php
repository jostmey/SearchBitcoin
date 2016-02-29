<h1>Your website has been submitted for review.</h1>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'addInfo-form',
	'enableAjaxValidation'=>true,
)); ?>

	<p>Any of the boxes below are optional. Additional information will help direct traffic to your webpage.</p>

	<div class="row">
		<?php echo $form->labelEx($model,'bitcoin_address'); ?>
		<small><b>Listing your bitcoin address will help us validate that your business accepts bitcoins.</b></small><br/>
		<?php echo $form->textField($model,'bitcoin_address',array('class'=>'max-width','maxlength'=>256)); ?>
		<?php echo $form->error($model,'bitcoin_address'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'payment_instructions'); ?>
		<small><b>How will customers pay with bitcoins? For example, do they have to email you first?</b></small><br/>
		<?php echo $form->textArea($model,'payment_instructions',array('class'=>'max-width', 'rows'=>3)); ?>
		<?php echo $form->error($model,'payment_instructions'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'country'); ?>
		<b><small>Help us geographically target customers.</b></small><br/>
		<?php echo $form->textField($model,'country',array('class'=>'max-width','maxlength'=>256)); ?>
		<?php echo $form->error($model,'country'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'province'); ?>
		<b><small>Help us geographically target customers.</small></b><br/>
		<?php echo $form->textField($model,'province',array('class'=>'max-width','maxlength'=>256)); ?>
		<?php echo $form->error($model,'province'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'city'); ?>
		<b><small>Help us geographically target customers.</small></b><br/>
		<?php echo $form->textField($model,'city',array('class'=>'max-width','maxlength'=>256)); ?>
		<?php echo $form->error($model,'city'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tags'); ?>
		<b><small>List keywords separated by commas that describe your service (e.g. electronics, mining, consulting).</small></b><br/>
		<?php echo $form->textField($model,'tags',array('class'=>'max-width','maxlength'=>512)); ?>
		<?php echo $form->error($model,'tags'); ?>
	</div>

	<br/>
	<p>Tip: If you are not happy with your answers in the previous step then just start again.</p>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->
