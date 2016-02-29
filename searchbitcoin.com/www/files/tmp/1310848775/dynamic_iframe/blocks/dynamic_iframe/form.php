<style type="text/css">
#ccm-dynamiciframe-block-table acronym { border-bottom-width:1px; border-bottom-style:dashed; border-bottom-color:#00A000; cursor: help; }
</style>
<table id="ccm-dynamiciframe-block-table">
	<tr>
		<th><acronym title="<?php  echo t('The website the dynamic iframe should display')?>"><?php  echo t('URL')?>:</acronym></th>
		<td>
			<input id="ccm-dynamiciframe-url" type="text" name="url" value="<?php  echo $formController->url; ?>">
		</td>
	</tr>
	<tr>
		<td colspan="2"><div class="ccm-note">iFrame URL should be sharing the same domain as the parent like www.xyz.com/123.htm and iFrame URL /blog/.</div></td>
	</tr>
	<tr>
		<th><?php  echo t('Id')?>:</th>
		<td><input  id="ccm-dynamiciframe-id" type="text" name="id" value="<?php  echo $formController->id; ?>"></td>
	</tr>
	<tr>
		<th><?php  echo t('Width')?>:</th>
		<td><input id="ccm-dynamiciframe-width" type="text" name="width" value="<?php  echo $width; ?>"></td>
	</tr>
	<tr>
		<th><acronym title="<?php  echo t('If true the height of the iFrame is adapted to content')?>"><?php  echo t('Dynamic Height')?>:</acronym></th>
		<td>
			<select id="ccm-dynamiciframe-dynamicheight" name="dynamicheight">
				<option value="1"<?php  echo $formController->dynamicheight=='1'?' selected="selected"':''; ?>><?php  echo t('Yes')?></option>
				<option value="0"<?php  echo $formController->dynamicheight=='0'?' selected="selected"':''; ?>><?php  echo t('No')?></option>
			</select>
		</td>
	</tr>
	<tr>
		<th><acronym title="<?php  echo t('Use this height instead of show an error')?>"><?php  echo t('Error Height')?>:</acronym> <div class="ccm-note">(<?php  echo t('Optional')?>)</div></th>
		<td><input id="ccm-dynamiciframe-errorheight" type="text" <?php  echo ($formController->dynamicheight!='0'?"":"disabled=\"disabled\"")?>  name="errorheight" value="<?php  echo $formController->errorheight; ?>"></td>
	</tr>		
	<tr>
	<th><acronym title="<?php  echo t('Adjust the heigth of iFrame on dynamic mode, \"-\" is accepted.')?>"><?php  echo t('Adjust Height')?>: <div class="ccm-note">(<?php  echo t('Optional')?>)</div></acronym></th>
		<td><input id="ccm-dynamiciframe-adjustheight" type="text" <?php  echo ($formController->dynamicheight!='0'?"":"disabled=\"disabled\"")?>  name="adjustheight" value="<?php  echo $formController->adjustheight; ?>"></td>
	</tr>
	<tr>
		<th><?php  echo t('Height')?>: <div class="ccm-note">(<?php  echo t('Optional')?>)</div></th>
		<td><input id="ccm-dynamiciframe-height" type="text" <?php  echo ($formController->dynamicheight=='0'?"":"disabled=\"disabled\"")?>  name="height" value="<?php  echo $formController->height; ?>"></td>
	</tr>
	<tr>
		<th><?php  echo t('Use GET query string from parent')?>:</th>
		<td>
			<select name="getqs">
				<option value="1"<?php  echo $formController->getqs=='1'?' selected="selected"':''; ?>><?php  echo t('Yes')?></option>
				<option value="0"<?php  echo $formController->getqs=='0'?' selected="selected"':''; ?>><?php  echo t('No')?></option>
			</select>
		</td>
	</tr>	
	<tr>
		<th><?php  echo t('Frame Border')?>:</th>
		<td>
			<select name="frameborder">
				<option value="1"<?php  echo $formController->frameborder=='1'?' selected="selected"':''; ?>><?php  echo t('Yes')?></option>
				<option value="0"<?php  echo $formController->frameborder=='0'?' selected="selected"':''; ?>><?php  echo t('No')?></option>
			</select>
		</td>
	</tr>
	<tr>
		<th><?php  echo t('Align')?>:</th>
		<td>
			<select name="align">
				<option value="left"<?php  echo $formController->align=='left'?' selected="selected"':''; ?>><?php  echo t('Left')?></option>
				<option value="center"<?php  echo $formController->align=='center'?' selected="selected"':''; ?>><?php  echo t('Center')?></option>
				<option value="right"<?php  echo $formController->align=='right'?' selected="selected"':''; ?>><?php  echo t('Right')?></option>
			</select>
		</td>
	</tr>
	<tr>
		<th><acronym title="Set to auto to let the browser automacially show a scrollbar if nessecary, or to no to never show a scrollbar."><?php  echo t('Scrolling')?>:</acronym></th>
		<td>
			<select name="scrolling">
				<option value="auto"<?php  echo $formController->scrolling=='auto'?' selected="selected"':''; ?>><?php  echo t('Auto')?></option>
				<option value="yes"<?php  echo $formController->scrolling=='yes'?' selected="selected"':''; ?>><?php  echo t('Yes')?></option>
				<option value="no"<?php  echo $formController->scrolling=='no'?' selected="selected"':''; ?>><?php  echo t('No')?></option>
			</select>
		</td>
	</tr>
	<tr>
		<th><?php  echo t('Margin Width')?>: <div class="ccm-note">(<?php  echo t('Optional')?>)</div></th>
		<td><input type="text" name="marginwidth" value="<?php  echo $formController->marginwidth; ?>"></td>
	</tr>
	<tr>
		<th><?php  echo t('Margin Height')?>: <div class="ccm-note">(<?php  echo t('Optional')?>)</div></th>
		<td><input type="text" name="marginheight" value="<?php  echo $formController->marginheight; ?>"></td>
	</tr>
</table>
