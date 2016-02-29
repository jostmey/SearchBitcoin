<?php       
defined('C5_EXECUTE') or die("Access Denied.");
$survey=$controller;  
//echo $survey->surveyName.'<br>';
$miniSurvey=new MiniSurvey($b);
$miniSurvey->frontEndMode=true;
?>
<style>

.miniSurveyView{ margin-bottom:16px}
.miniSurveyView #msg{ background:#1c3dcc; color: #f1f1f1; padding:2px; border:1px solid #fff; margin:8px 0px 8px 0px}
.miniSurveyView table.formBlockSurveyTable td{ color: #005ab2; padding-bottom:4px }
.miniSurveyView td.question { padding-right: 12px}
.miniSurveyView #msg .error{padding-left:16px; color: white}
.miniSurveyView table.formBlockSurveyTable td img.ccm-captcha-image{color: #6c3459; float:none}
.miniSurveyView .required{ color: #1c3dcc }
</style>
<a name="<?php     echo $survey->questionSetId ?>"></a><br/>
<?php     if ($invalidIP) { ?>
<div class="ccm-error"><p><?php    echo $invalidIP?></p></div>
<?php     } ?>
<form enctype="multipart/form-data" id="miniSurveyView<?php    echo intval($bID)?>" class="miniSurveyView" method="post" action="<?php     echo $this->action('submit_form').'#'.$survey->questionSetId?>">
	<?php      if( $_GET['surveySuccess'] && $_GET['qsid']==intval($survey->questionSetId) ){ ?>
		<div id="msg"><?php     echo $survey->thankyouMsg ?></div> 
	<?php      }elseif(strlen($formResponse)){ ?>
		<div id="msg">
			<?php     echo $formResponse ?>
			<?php     
			if(is_array($errors) && count($errors)) foreach($errors as $error){
				echo '<div class="error">'.$error.'</div>';
			} ?>
		</div>
	<?php     } ?>
	<input name="qsID" type="hidden" value="<?php    echo  intval($survey->questionSetId)?>" />
	<input name="pURI" type="hidden" value="<?php    echo  $pURI ?>" />
	<?php      $miniSurvey->loadSurvey( $survey->questionSetId, 0, intval($bID) );  ?> 
</form>