<?php
$this->pageTitle=Yii::app()->name; 
$this->menu=array(
	array('label'=>'Parse Store Rules', 'url'=>array('parseStoreRules/index')),
	array('label'=>'Items', 'url'=>array('items/index')),
	array('label'=>'Vendors', 'url'=>array('vendors/index')),
	array('label'=>'Vendor Submissions', 'url'=>array('vendorSubmissions/index')),
	array('label'=>'Vendor Review App', 'url'=>array('vendorReview/index')),
	array('label'=>'Feedback Referrals', 'url'=>array('feedbackReferrals/index')),
	array('label'=>'Feedback Votes', 'url'=>array('feedbackVotes/index')),
	array('label'=>'Feedback Queries', 'url'=>array('feedbackQueries/index')),
);
?>

<h1>Search Bitcoin Database</h1>

<p>Use the items listed in the right column to access various parts of the database.</p>

<br />
<br />

<p>Below is a demo of the plugin.</p>

<script type="text/javascript" src="http://api.searchbitcoin.com/btceconomy"></script>

