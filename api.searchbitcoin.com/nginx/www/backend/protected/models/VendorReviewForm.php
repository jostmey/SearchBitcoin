<?php

class VendorReviewForm extends CFormModel
{
	public $email_address;
	public $send_message;
	public $status;
	public $url;
	public $comments;

	/**
	 * Declares the validation rules.
	 */
	public function rules()
	{
		return array(
			array('status, email_address, url', 'required'),
			array('send_message', 'boolean'),
			array('email_address', 'email'),
			array('comments', 'safe'),
		);
	}

	/**
	 * Declares customized attribute labels.
	 * If not declared here, an attribute would have a label that is
	 * the same as its name with the first letter in upper case.
	 */
	public function attributeLabels()
	{
		return array(
			'email_address'=>'Email Address',
			'send_message'=>'Send Message',
			'status'=>'Status',
			'url'=>'Url',
			'comments'=>'Comments',
		);
	}

	/**
	 * Initializes this model. This method is invoked when an AR instance is newly created and has its scenario set.
	 */
	public function init()
	{
		$this->send_message=true;
		return parent::init();
	}

	/**
	 * Send out email review.
	 */
	public function dispatchEmailNotification()
	{
		if(!$this->send_message)
			return;
		$comments=!empty($this->comments) ? "Here is what the reviewer had to say: \"".$this->comments."\"\n\n" : '';
		switch($this->status)
		{
			case 'active':
				$subject='Search Bitcoin - Website Approved';
				$text=file_get_contents('/usr/share/nginx/www/backend/protected/models/approved.txt');
				$text=str_replace(
					array('%c', '%d'),
					array($comments, $this->url), 
					$text
				);
				break;
			case 'rejected':
				$subject='Search Bitcoin - Website Submission Request';
				$text=file_get_contents('/usr/share/nginx/www/backend/protected/models/rejected.txt');
				$text=str_replace(
					array('%c', '%d'),
					array($comments, $this->url), 
					$text
				);
				break;
			default;
				return;
		}
		spl_autoload_unregister(array('YiiBase','autoload'));
		require 'Mail.php';
		$headers=array(
			'From'=>'searchbitcoin@gmail.com',
			'To'=>$this->email_address,
			'Subject'=>$subject,
		);
		$smtp=Mail::factory(
			'smtp',
			array(
				'host'=>'ssl://smtp.gmail.com',
				'port'=>'465',
				'auth'=>true,
				'debug'=>false,
				'username'=>'searchbitcoin@gmail.com',
				'password'=>'hsDSKsD6SaFfukLa',
			)
		);
		$mail=$smtp->send($headers['To'], $headers, $text);
		if(PEAR::isError($mail))
			throw new CException("An error occurred while trying to send an email. Details: ".$mail->getMessage());
		spl_autoload_register(array('YiiBase','autoload'));
	}
}

