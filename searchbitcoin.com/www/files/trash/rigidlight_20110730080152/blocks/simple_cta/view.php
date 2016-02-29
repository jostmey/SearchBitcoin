<?php 

$theLink = Page::getCollectionPathFromID($pageID);
$theLink = DIR_REL . $theLink;
 
?>  

<div class="cta">
                
                    <span class="ctaTitle"><?php  echo $ctaTitle?></span>
                    <span class="ctaDesc"><?php  echo $ctaDesc?></span>
                    <a href="<?php  echo $theLink ?>">Read More</a>
                
                </div>      