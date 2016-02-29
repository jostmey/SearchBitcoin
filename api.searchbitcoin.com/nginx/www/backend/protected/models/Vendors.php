<?php

/**
 * This is the model class for table "Vendors".
 *
 * The followings are the available columns in table 'Vendors':
 * @property integer $id
 * @property integer $id_item
 * @property string $email_address
 * @property string $bitcoin_address
 * @property string $payment_instructions
 * @property string $country
 * @property string $province
 * @property string $city
 * @property string $source
 * @property string $created
 */
class Vendors extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Vendors the static model class
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
		return 'Vendors';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_item', 'required'),
			array('id_item', 'numerical', 'integerOnly'=>true),
			array('id_item', 'unique'),
			array('email_address, bitcoin_address, country, province, city, source', 'length', 'max'=>256),
			array('payment_instructions', 'length', 'max'=>1024),
			array('created', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, id_item, email_address, bitcoin_address, payment_instructions, country, province, city, source, created', 'safe', 'on'=>'search'),
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
			'item'=>array(self::BELONGS_TO, 'Items', 'id_item'),
			'items'=>array(self::HAS_MANY, 'Vendors', 'id_vendor'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'id_item' => 'Id Item',
			'email_address' => 'Email Address',
			'bitcoin_address' => 'Bitcoin Address',
			'payment_instructions' => 'Payment Instructions',
			'country' => 'Country',
			'province' => 'Province',
			'city' => 'City',
			'source' => 'Source',
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
		$criteria->compare('id_item',$this->id_item);
		$criteria->compare('email_address',$this->email_address,true);
		$criteria->compare('bitcoin_address',$this->bitcoin_address,true);
		$criteria->compare('payment_instructions',$this->payment_instructions,true);
		$criteria->compare('country',$this->country,true);
		$criteria->compare('province',$this->province,true);
		$criteria->compare('city',$this->city,true);
		$criteria->compare('source',$this->source,true);
		$criteria->compare('created',$this->created,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
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