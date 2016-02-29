<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'vendorReview-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary(array($item, $vendorSubmission, $vendorReviewForm)); ?>

	<div class="row">
		<?php echo $form->labelEx($vendorSubmission,'url'); ?>
		<?php echo $form->textField($vendorSubmission,'url',array('size'=>60,'maxlength'=>256)); ?>
		<?php echo $form->error($vendorSubmission,'url'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($vendorSubmission,'title'); ?>
		<?php echo $form->textField($vendorSubmission,'title',array('size'=>60,'maxlength'=>256)); ?>
		<?php echo $form->error($vendorSubmission,'title'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($vendorSubmission,'description'); ?>
		<?php echo $form->textArea($vendorSubmission,'description',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($vendorSubmission,'description'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($vendorSubmission,'image'); ?>
		<?php echo $form->textField($vendorSubmission,'image',array('size'=>60,'maxlength'=>256)); ?>
		<?php echo $form->error($vendorSubmission,'image'); ?>
		<br/>
		<img src="<?php echo $vendorSubmission->image ?>" style="border: 1px solid black; max-width: 100px; max-height: 100px" />
	</div>

	<div class="row">
		<?php echo $form->labelEx($vendorSubmission,'email_address'); ?>
		<?php echo $form->textField($vendorSubmission,'email_address',array('size'=>60,'maxlength'=>256)); ?>
		<?php echo $form->error($vendorSubmission,'email_address'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($vendorSubmission,'bitcoin_address'); ?>
		<?php echo $form->textField($vendorSubmission,'bitcoin_address',array('size'=>60,'maxlength'=>256)); ?>
		<?php echo $form->error($vendorSubmission,'bitcoin_address'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($vendorSubmission,'payment_instructions'); ?>
		<?php echo $form->textField($vendorSubmission,'payment_instructions',array('size'=>60,'maxlength'=>1024)); ?>
		<?php echo $form->error($vendorSubmission,'payment_instructions'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($vendorSubmission,'country'); ?>
		<?php echo $form->textField($vendorSubmission,'country',array('size'=>60,'maxlength'=>256)); ?>
		<?php echo $form->error($vendorSubmission,'country'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($vendorSubmission,'province'); ?>
		<?php echo $form->textField($vendorSubmission,'province',array('size'=>60,'maxlength'=>256)); ?>
		<?php echo $form->error($vendorSubmission,'province'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($vendorSubmission,'city'); ?>
		<?php echo $form->textField($vendorSubmission,'city',array('size'=>60,'maxlength'=>256)); ?>
		<?php echo $form->error($vendorSubmission,'city'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($vendorSubmission,'tags'); ?>
		<?php echo $form->textField($vendorSubmission,'tags',array('size'=>60,'maxlength'=>512)); ?>
		<?php echo $form->error($vendorSubmission,'tags'); ?>
	</div>

	<hr/>

	<div class="row">
		<?php echo $form->labelEx($item,'priority'); ?>
		<?php echo $form->textField($item,'priority'); ?>
		<?php echo $form->error($item,'priority'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($vendorReviewForm,'comments'); ?>
		<?php echo $form->textArea($vendorReviewForm,'comments',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($vendorReviewForm,'comments'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($vendorReviewForm,'send_message'); ?>
		<?php echo $form->checkBox($vendorReviewForm,'send_message'); ?>
		<?php echo $form->error($vendorReviewForm,'send_message'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($vendorSubmission,'status'); ?>
		<?php echo $form->radioButtonList($vendorSubmission,'status',array('active'=>'<small><i>Approve</i></small>', 'pending'=>'<small><i>Pending</i></small>', 'rejected'=>'<small><i>Reject</i></small>')); ?>
		<?php echo $form->error($vendorSubmission,'status'); ?>
	</div>

	<hr/>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Submit'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->
