<h1>Submitting your website is easy. Fill out these required boxes.</h1>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'join-form',
	'enableAjaxValidation'=>true,
)); ?>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'url'); ?>
		<small><b>http://example.com &nbsp; http://store.example.com &nbsp; http://www.mall.com/my-bitcoin-store/</b></small><br/>
		<?php echo $form->textField($model,'url',array('class'=>'max-width','maxlength'=>256)); ?>
		<?php echo $form->error($model,'url'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'image'); ?>
		<small><b>Graphic or logo of website (example http://www.example.com/images/logo.jpg)</b></small><br/>
		<?php echo $form->textField($model,'image',array('class'=>'max-width','maxlength'=>256)); ?>
		<?php echo $form->error($model,'image'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'email_address'); ?>
		<small><b>Provide us an email address where we can contact you.</b></small><br/>
		<?php echo $form->textField($model,'email_address',array('class'=>'max-width','maxlength'=>256)); ?>
		<?php echo $form->error($model,'email_address'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'title'); ?>
		<small><b>The name of your business or service.</b></small><br/>
		<?php echo $form->textField($model,'title',array('class'=>'max-width','maxlength'=>256)); ?>
		<?php echo $form->error($model,'title'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'description'); ?>
		<small><b>Describe your website in one or two paragraphs</b></small><br/>
		<?php echo $form->textArea($model,'description',array('class'=>'max-width', 'rows'=>6)); ?>
		<?php echo $form->error($model,'description'); ?>
	</div>

	<br/>
	<p>Your answers will appear in all websites using our services. Make sure you are satisfied with your responses.</p>

	<div class="row buttons" id="submit_button">
		<?php echo CHtml::submitButton('Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->

