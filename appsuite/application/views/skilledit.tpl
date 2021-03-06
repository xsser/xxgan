<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Cache-Control" content="no-cache" />
<title>{$system_config.site_name}</title>
<link type="text/css" href="{$system_config.img_url}/appsuite_images/jquery-ui-1.8.1.custom.css" rel="stylesheet" />
<script type="text/javascript" src="{$system_config.img_url}/appsuite_script/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="{$system_config.img_url}/appsuite_script/jquery-ui-1.8.1.custom.min.js"></script>

<!-- css -->
<link type="text/css" href="{$system_config.img_url}/appsuite_images/admin.css" rel="stylesheet" />

<!-- easyui -->
<link rel="stylesheet" type="text/css" href="{$system_config.img_url}/appsuite_images/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="{$system_config.img_url}/appsuite_images/themes/icon.css">
<script type="text/javascript" src="{$system_config.img_url}/appsuite_script/jquery.easyui.min.js"></script>

{literal}
	<script>
$(function(){
    $("#editscript").submit( function () { 
        if ( !$("#skillcode").val())
        {
            alert("技能编号不能为空");
            return false;
        }
        if ( !$("#skillname").val())
        {
            alert("技能名不能为空");
            return false;
        }
    });
});
	</script>
{/literal}
</head>

<body style="background:#FFFFFF;">
<div style="background:#FFFFFF;padding:10px;">
    <form id="editscript" method="post" action="{$system_config.img_url}/qnskill/edit">
	<input type="hidden" name="id" value="{$skillData.skill_id}"/>
	<table cellpadding="10" cellspacing="10">
		<tr>
			<td align="right" width="100" >技能编号:</td>
			<td><input class="easyui-validatebox" type="text" name="skillcode" id="skillcode" required="true" width="200" value="{$skillData.skill_code}"></input></td>
			<td><span style="color:#FF0000;">*</span></td>
		</tr>
		<tr>
			<td align="right">技能名:</td>
			<td><input class="easyui-validatebox" type="text" name="skillname" id="skillname" value="{$skillData.skill_name}"></input></td>
			<td><span style="color:#FF0000;">*</span></td>
		
		</tr>
		<tr>
			<td align="right">所属公司:
			
			</td>
			<td>
				<select id="factoryid" name="factoryid">
					{foreach from=$list item=item name=listloop }
					<option value="{$item.factory_id}" {if $skillData.factory_id == $item.factory_id}selected{/if}>{$item.factory_name}</option>
					{/foreach}
				</select>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right"> </td>
			<td><input type="submit" name="submit" value="提交"></td>
			<td> </td>
		</tr>
	</table>
    </form>
</div>

{literal}
{/literal}

</body>

</html>

