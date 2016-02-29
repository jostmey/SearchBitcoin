var dynamicIframe ={
	init:function(){

		this.dynamicheightSwitch=$('#ccm-dynamiciframe-dynamicheight');
		this.dynamicheightSwitch.click(function(){ dynamicIframe.dynamicheightShown(this); });
		this.dynamicheightSwitch.change(function(){ dynamicIframe.dynamicheightShown(this); });

	},	

	dynamicheightShown:function(sel){ 
		var f1=$('#ccm-dynamiciframe-height');
		var f2=$('#ccm-dynamiciframe-adjustheight');
		var f3=$('#ccm-dynamiciframe-errorheight');
		
		if(sel.value==0){
			f1.attr('disabled',false);
			f2.attr('disabled',true);
			f3.attr('disabled',true);
		}else{
			f1.attr('disabled',true);
			f2.attr('disabled',false);
			f3.attr('disabled',false);
		}
	},
	
	validate:function(){
		var failed=0; 
		
		var vUrlF=$('#ccm-dynamiciframe-url');
		var vIdF=$('#ccm-dynamiciframe-id');
		var vWidthF=$('#ccm-dynamiciframe-width');

		var vUrlV=vUrlF.val();
		var vIdV=vIdF.val();
		var vWidthV=vWidthF.val();
		
		
 		if(!vUrlV || vUrlV.length==0 ){
			alert(ccm_t('dynamiciframe-url'));
			vUrlF.focus();
			failed=1;
		}
		else if(!vIdV || vIdV.length==0){
			alert(ccm_t('dynamiciframe-id'));
			vIdF.focus();
			failed=1;
		}
		else if(!vWidthV || vWidthV.length==0){
			alert(ccm_t('dynamiciframe-width'));
			vWidthF.focus();
			failed=1;
		}	

		if(failed){
			ccm_isBlockError=1;
			return false;
		}
		else {
			return true;
		}
	}
}

$(function(){ dynamicIframe.init(); });

ccmValidateBlockForm = function() { return dynamicIframe.validate(); }