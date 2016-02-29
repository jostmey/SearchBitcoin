<?php

/**
 * Behavior automatically sets the time that the row was created.
 */
class AutoTimestampBehavior extends CActiveRecordBehavior
{
	/**
	 * Use the following variables to specify the name of timestamp field.
	 * @var string $created
	 */
	public $created='created';

	/**
	 * Method called before validating model to set the timestamp.
	 */
	public function beforeValidate($event)
	{
		if($this->owner->isNewRecord)
			$this->owner->{$this->created}=new CDbExpression('NOW()');
		return true;
	}
}

