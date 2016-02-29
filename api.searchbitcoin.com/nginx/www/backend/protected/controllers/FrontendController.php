<?php

class FrontendController extends Controller
{
	/**
	 * @var string the default layout for the controller view. Defaults to 'application.views.layouts.column1',
	 * meaning using a single column layout. See 'protected/views/layouts/column1.php'.
	 */
	public $layout='webroot.themes.blank.views.layouts.main';

	public function actionJoin()
	{
		$model=new VendorSubmissions;
		// Check if this is an AJAX request, and if so then validate the data.
		if(isset($_POST['ajax']) && $_POST['ajax']==='join-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
		// Check if there is a submission, and if so validate and save the data.
		if(isset($_POST['VendorSubmissions']))
		{
			$model->attributes=$_POST['VendorSubmissions'];
			$model->status='pending';
			if($model->save())
			{
				$token=sha1(uniqid(null, true));
				Yii::app()->session['VendorSubmissions_validation']=$token;
				$this->redirect(array('addInfo','id'=>$model->id,'token'=>$token));
			}
		}
		$this->render('join', array('model'=>$model));
	}

	public function actionAddInfo($id, $token)
	{
		$model=VendorSubmissions::model()->findByPk((int)$id);
		if($token !== Yii::app()->session['VendorSubmissions_validation'] || $model === null)
			throw new CHttpException(404,'The requested page does not exist.');
		if(isset($_POST['ajax']) && $_POST['ajax']==='addInfo-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
		if(isset($_POST['VendorSubmissions']))
		{
			$model->attributes=$_POST['VendorSubmissions'];
			$model->status='pending';
			if($model->validate() && $model->update())
				$this->redirect(array('finished'));
		}
		$this->render('addInfo', array('model'=>$model));
		@mail(
			'jostmey@gmail.com',
			'Submission of New Vendor',
			'A vendor submitted their website to Search Bitcoin.'
		);
	}

	public function actionFinished()
	{
		$this->render('finished');
	}
}
