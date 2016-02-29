<?php

/**
 * This is the model class for table "ParseStoreRules".
 *
 * The followings are the available columns in table 'ParseStoreRules':
 * @property integer $id
 * @property integer $id_vendor
 * @property string $crawl_seed
 * @property string $crawl_pattern
 * @property integer $crawl_frequency
 * @property integer $crawl_page_limit
 * @property string $index_pattern
 * @property string $title_selector
 * @property integer $title_offset
 * @property string $description_selector
 * @property integer $description_offset
 * @property string $image_selector
 * @property integer $image_offset
 * @property string $price_selector
 * @property integer $price_offset
 * @property string $category_selector
 * @property integer $category_offset
 * @property string $expiration_selector
 * @property integer $expiration_offset
 * @property string $expiration_pattern
 * @property string $status
 * @property string $created
 */
class ParseStoreRules extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return ParseStoreRules the static model class
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
		return 'ParseStoreRules';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_vendor, crawl_seed, crawl_pattern, index_pattern, description_selector, image_selector', 'required'),
			array('id_vendor, crawl_frequency, crawl_page_limit, title_offset, description_offset, image_offset, price_offset, category_offset, expiration_offset', 'numerical', 'integerOnly'=>true),
			array('crawl_seed, crawl_pattern, index_pattern, title_selector, description_selector, image_selector, price_selector, category_selector, expiration_selector, expiration_pattern', 'length', 'max'=>256),
			array('status', 'length', 'max'=>64),
			array('created', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, id_vendor, crawl_seed, crawl_pattern, crawl_frequency, crawl_page_limit, index_pattern, title_selector, title_offset, description_selector, description_offset, image_selector, image_offset, price_selector, price_offset, category_selector, category_offset, expiration_selector, expiration_offset, expiration_pattern, status, created', 'safe', 'on'=>'search'),
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
			'id_vendor' => 'Id Vendor',
			'crawl_seed' => 'Crawl Seed',
			'crawl_pattern' => 'Crawl Pattern',
			'crawl_frequency' => 'Crawl Frequency',
			'crawl_page_limit' => 'Crawl Page Limit',
			'index_pattern' => 'Index Pattern',
			'title_selector' => 'Title Selector',
			'title_offset' => 'Title Offset',
			'description_selector' => 'Description Selector',
			'description_offset' => 'Description Offset',
			'image_selector' => 'Image Selector',
			'image_offset' => 'Image Offset',
			'price_selector' => 'Price Selector',
			'price_offset' => 'Price Offset',
			'category_selector' => 'Category Selector',
			'category_offset' => 'Category Offset',
			'expiration_selector' => 'Expiration Selector',
			'expiration_offset' => 'Expiration Offset',
			'expiration_pattern' => 'Expiration Pattern',
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
		$criteria->compare('id_vendor',$this->id_vendor);
		$criteria->compare('crawl_seed',$this->crawl_seed,true);
		$criteria->compare('crawl_pattern',$this->crawl_pattern,true);
		$criteria->compare('crawl_frequency',$this->crawl_frequency);
		$criteria->compare('crawl_page_limit',$this->crawl_page_limit);
		$criteria->compare('index_pattern',$this->index_pattern,true);
		$criteria->compare('title_selector',$this->title_selector,true);
		$criteria->compare('title_offset',$this->title_offset);
		$criteria->compare('description_selector',$this->description_selector,true);
		$criteria->compare('description_offset',$this->description_offset);
		$criteria->compare('image_selector',$this->image_selector,true);
		$criteria->compare('image_offset',$this->image_offset);
		$criteria->compare('price_selector',$this->price_selector,true);
		$criteria->compare('price_offset',$this->price_offset);
		$criteria->compare('category_selector',$this->category_selector,true);
		$criteria->compare('category_offset',$this->category_offset);
		$criteria->compare('expiration_selector',$this->expiration_selector,true);
		$criteria->compare('expiration_offset',$this->expiration_offset);
		$criteria->compare('expiration_pattern',$this->expiration_pattern,true);
		$criteria->compare('status',$this->status,true);
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
