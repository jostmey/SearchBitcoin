<?php

class VendorReviewController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/column1';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow', // allow admin user to perform actions
				'actions'=>array('index','view'),
				'users'=>array('admin'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	/**
	 * Redirect to the next website in the queue.
	 */
	public function actionIndex()
	{
		if(
			!(
				$vendorSubmission=VendorSubmissions::model()->findByAttributes(
					array('status'=>'pending')
				)
			)
		)
			$this->render('index');
		else
			$this->redirect(array('view', 'id'=>$vendorSubmission->id));
	}

	/**
	 * Menu for approving or rejecting a vendor.
	 */
	public function actionView($id)
	{
		$item=new Items;
		$vendorSubmission=VendorSubmissions::model()->findByPk($id);
		$vendorReviewForm=new VendorReviewForm;
		if(isset($_POST['Items'], $_POST['VendorReviewForm'], $_POST['VendorSubmissions']))
		{
			$item->attributes=$_POST['Items'];
			$vendorReviewForm->attributes=$_POST['VendorReviewForm'];
			$vendorSubmission->attributes=$_POST['VendorSubmissions'];
			$vendorReviewForm->status=$vendorSubmission->status;
			$vendorReviewForm->url=$vendorSubmission->url;
			$vendorReviewForm->email_address=$vendorSubmission->email_address;
			if($item->validate(array('priority')) && $vendorReviewForm->validate() && $vendorSubmission->validate())
			{
				if($vendorSubmission->status === 'active')
				{
					// Save model of Item.
					if(
						!(
							$item_=Items::model()->findByAttributes(
								array('url'=>$vendorSubmission->url)
							)
						)
					)
					{
						$item_=new Items;
						$item_->id_vendor=-1;
					}
					$item_->attributes=array(
						'url'=>$vendorSubmission->url,
						'title'=>$vendorSubmission->title,
						'description'=>$vendorSubmission->description,
						'image'=>$vendorSubmission->image,
						'tags'=>$vendorSubmission->tags,
						'priority'=>$item->priority,
					);
					if(!$item_->save())
						throw new CException("Failed to save item.\n");
					if(!is_numeric($item_->id) || $item_->id < 0)
						throw new CException("Failed to set item id.\n");
					// Save model of Vendor.
					$vendor=($item_->id_vendor == -1) ?
						new Vendors :
						Vendors::model()->findByPk($item_->id_vendor);
					$vendor->attributes=array(
						'id_item'=>$item_->id,
						'email_address'=>$vendorSubmission->email_address,
						'bitcoin_address'=>$vendorSubmission->bitcoin_address,
						'payment_instructions'=>$vendorSubmission->payment_instructions,
						'country'=>$vendorSubmission->country,
						'province'=>$vendorSubmission->province,
						'city'=>$vendorSubmission->city,
						'source'=>'user_submitted',
					);
					if(!$vendor->save())
						throw new CException("Failed to vendor for item with id '".$item->id.".'\n");
					// Update model of Item.
					$item_->id_vendor=$vendor->id;
					if(!$item_->update())
						throw new CException("Failed to update vendor_id for item with id '".$item->id.".'\n");
				}
				$vendorSubmission->update();
				if($vendorReviewForm->validate())
					$vendorReviewForm->dispatchEmailNotification();
				$this->redirect(array('index'));
			}
		}
		$this->render('view', array('item'=>$item, 'vendorSubmission'=>$vendorSubmission, 'vendorReviewForm'=>$vendorReviewForm));
	}
}

