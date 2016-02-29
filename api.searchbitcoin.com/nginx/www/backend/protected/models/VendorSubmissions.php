<?php

/**
 * This is the model class for table "VendorSubmissions".
 *
 * The followings are the available columns in table 'VendorSubmissions':
 * @property integer $id
 * @property string $url
 * @property string $title
 * @property string $description
 * @property string $image
 * @property string $email_address
 * @property string $bitcoin_address
 * @property string $payment_instructions
 * @property string $country
 * @property string $province
 * @property string $city
 * @property string $tags
 * @property string $status
 * @property string $created
 */
class VendorSubmissions extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return VendorSubmissions the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'VendorSubmissions';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('url, title, description, image, email_address', 'required'),
			array('url, title, image, email_address, bitcoin_address, country, province, city, status', 'length', 'max'=>256),
			array('description, payment_instructions', 'length', 'max'=>1024),
			array('tags', 'length', 'max'=>512),
			array('url', 'url'),
			array('image', 'url'),
			array('url, image', 'UrlExistValidator'),
			array('email_address', 'email', 'checkMX'=>true),
			array('email_address', 'email', 'fullPattern'=>true),
			array('created', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, url, title, description, image, email_address, bitcoin_address, payment_instructions, country, province, city, tags, status, created', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'url' => 'Website',
			'title' => 'Title',
			'description' => 'Description',
			'image' => 'Image',
			'email_address' => 'Email Address',
			'bitcoin_address' => 'Bitcoin Address',
			'payment_instructions' => 'Payment Instructions',
			'country' => 'Country',
			'province' => 'Province',
			'city' => 'City',
			'tags' => 'Tags',
			'status' => 'Status',
			'created' => 'Created',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('url',$this->url,true);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('image',$this->image,true);
		$criteria->compare('email_address',$this->email_address,true);
		$criteria->compare('bitcoin_address',$this->bitcoin_address,true);
		$criteria->compare('payment_instructions',$this->payment_instructions,true);
		$criteria->compare('country',$this->country,true);
		$criteria->compare('province',$this->province,true);
		$criteria->compare('city',$this->city,true);
		$criteria->compare('tags',$this->tags,true);
		$criteria->compare('status',$this->status,true);
		$criteria->compare('created',$this->created,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Initializes this model. This method is invoked when an AR instance is newly created and has its scenario set.
	 */
	public function init()
	{
		$this->url='http://';
		$this->image='http://';
		return parent::init();
	}

	/**
	 * This method is invoked before saving a record (after validation, if any).
	 */
	public function beforeSave()
	{
		// Clean up the tags.
		if(!empty($this->tags))
		{
			$tags=explode(',', $this->tags);
			foreach($tags as &$tag)
			{
				$tag=ucwords(trim($tag));
			}
			$this->tags=implode(', ', $tags);
		}
		// Clean up the description.
		$this->description=trim(
			filter_var(
				preg_replace(
					'/\[\ \t\r]\[\ \t\r]+/',
					' ',
					$this->description
				),
				FILTER_SANITIZE_STRING,
				FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH
			)
		);
		if(!$this)
			return false;
		// Clean up the payment instructions.
		$this->payment_instructions=trim(
			filter_var(
				preg_replace(
					'/\s\s+/',
					' ',
					$this->payment_instructions
				),
				FILTER_SANITIZE_STRING,
				FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH
			)
		);
		if(!$this)
			return false;
		return parent::beforeSave();
	}

	/**
	 * Custom validation rule.
	 * @param string the name of the attribute to be validated.
	 * @param array options specified in the validation rule.
	 */
	public function UrlExistValidator($attribute, $params)
	{
		if(!@file_get_contents($this->{$attribute}))
			$this->addError($attribute, 'The '.$attribute.' does not exist.');
	}

	/**
	 * Custom validation rule.
	 * @param string the name of the attribute to be validated.
	 * @param array options specified in the validation rule.
	 */
	public function EmailMatchUrlValidator($attribute, $params)
	{
		if(!empty($this->{$attribute}))
		{
			$domain=$params['domain'];
			if(empty($this->{$domain}))
				$this->addError($attribute, 'Before the email address can be verified, the "'.$domain.'" must be set first.');
			$url=parse_url($this->{$domain});
			$host=(substr($url['host'], 0, 4) === 'www.') ? substr($url['host'], 4) : $url['host'];
			$email=explode('@', $this->{$attribute});
			if($host !== $email[1])
				$this->addError($attribute, 'The email address must share the same domain as '.$this->{$domain}.'.');
		}
	}

	/**
	 * @return array containing the behaviors to attach.
	 */
	public function behaviors()
	{
		return array(
			'AutoTimestampBehavior'=>array(
				'class'=>'application.components.AutoTimestampBehavior',
			),
		);
	}

	/**
	 * Disable the ability to delete an entry from the database.
	 */
	public function delete()
	{}

	/**
	 * Disable the ability to delete an entry from the database.
	 */
	public function deleteAll()
	{}

	/**
	 * Disable the ability to delete an entry from the database.
	 */
	public function deleteAllByAttributes()
	{}

	/**
	 * Disable the ability to delete an entry from the database.
	 */
	public function deleteByPk()
	{}
}
