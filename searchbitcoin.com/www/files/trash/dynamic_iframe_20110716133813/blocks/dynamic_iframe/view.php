<?php  

	$finalurl = "";
	
	if ($getqs == 1) {
	  if($_SERVER["QUERY_STRING"]) {
	  	$pos = strpos($url,'?');

		if($pos === false) {
			$finalurl = $url . "?" . $_SERVER["QUERY_STRING"];  
		}
		else {
			$finalurl = $url . "&" . $_SERVER["QUERY_STRING"];  
		}

	 
	  } else {
	 
	    $finalurl = $url;  
	 
	  } 
	}
	else {
	    $finalurl = $url; 	
	}
?>

<?php   if($dynamicheight == 1) { ?>

<iframe onload="startResize()" src="<?php  echo $finalurl; ?>" marginheight="<?php  echo $marginheight; ?>" marginwidth="<?php  echo $marginwidth; ?>" align="<?php  echo $align; ?>" scrolling="<?php  echo $scrolling; ?>" frameborder="<?php  echo $frameborder; ?>" id="<?php  echo $id; ?>" width="<?php  echo $width; ?>">
  your browser does not support iframes!
</iframe>

<script type="text/javascript">

if(typeof String.prototype.trim !== 'function') {
  String.prototype.trim = function() {
    return this.replace(/^\s+|\s+$/g, ''); 
  }
}

var dynaiframe=["<?php  echo $id; ?>"];
var ffVer=navigator.userAgent.substring(navigator.userAgent.indexOf("Firefox")).split("/")[1];
var ffExtHeight=ffVer>=0.1? 32 : 16;

function startResize() {
	var dyniframe=new Array();
	var domainError=true;
	
	var strAdj = "<?php  echo $adjustheight; ?>";
	strAdj = strAdj.trim().length==0?0:strAdj.trim();
	var adjh = isNaN(strAdj)?0:parseInt(strAdj);
	
	var strErr = "<?php  echo $errorheight; ?>";
	strErr = strErr.trim().length==0?0:strErr.trim();
	var errh = isNaN(strErr)?0:parseInt(strErr);
	
	for (i=0; i<dynaiframe.length; i++){
		try{
			if (document.getElementById){
				dyniframe[dyniframe.length] = document.getElementById(dynaiframe[i]);
				if (dyniframe[i]){
					dyniframe[i].style.display="block";
					if (dyniframe[i].contentDocument && dyniframe[i].contentDocument.body.offsetHeight) {  //ns6 
						dyniframe[i].height = dyniframe[i].contentDocument.body.offsetHeight+ffExtHeight + adjh;
						domainError=false;
					}	
					else if (dyniframe[i].Document && dyniframe[i].Document.body.scrollHeight) {//ie5+ 
						dyniframe[i].height = dyniframe[i].Document.body.scrollHeight+ffExtHeight + adjh;
						domainError=false;						
					}	
				}
			}
		}
		catch(e){
			domainError=true;
		}
		
		if (domainError==true) {
			if (errh == 0) {
				alert('Error url is not on the same domain');
			}
			else {
				dyniframe[i].height = errh+ffExtHeight + adjh;	
			}
		}
	} 
}

</script>

<?php   } 
else {
?>
<iframe src="<?php  echo $finalurl; ?>" marginheight="<?php  echo $marginheight; ?>" marginwidth="<?php  echo $marginwidth; ?>" align="<?php  echo $align; ?>" scrolling="<?php  echo $scrolling; ?>" frameborder="<?php  echo $frameborder; ?>" id="<?php  echo $id; ?>" width="<?php  echo $width; ?>" height="<?php  echo $height; ?>">
  your browser does not support iframes, go to <a href="http://www.fluiid.ch/blog/">http://www.fluiid.ch/blog/</a> !
</iframe>

<?php   } ?>