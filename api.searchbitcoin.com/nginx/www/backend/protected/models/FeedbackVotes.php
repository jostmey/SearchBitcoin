<?php

/**
 * This is the model class for table "FeedbackVotes".
 *
 * The followings are the available columns in table 'FeedbackVotes':
 * @property integer $id
 * @property integer $id_item
 * @property double $vote
 * @property string $referrer
 * @property string $ip_client
 * @property string $created
 */
class FeedbackVotes extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return FeedbackVotes the static model class
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
		return 'FeedbackVotes';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_item, vote', 'required'),
			array('id_item', 'numerical', 'integerOnly'=>true),
			array('vote', 'numerical'),
			array('referrer', 'length', 'max'=>512),
			array('ip_client', 'length', 'max'=>32),
			array('created', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, id_item, vote, referrer, ip_client, created', 'safe', 'on'=>'search'),
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
			'vote' => 'Vote',
			'referrer' => 'Referrer',
			'ip_client' => 'Ip Client',
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
		$criteria->compare('vote',$this->vote);
		$criteria->compare('referrer',$this->referrer,true);
		$criteria->compare('ip_client',$this->ip_client,true);
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
