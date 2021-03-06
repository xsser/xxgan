{literal}
<style type="text/css">

.iplist {}
.iplist tr {border-bottom: 1px solid #a6c9e2; height: 24px;}
.iplist th {border-bottom: 1px solid #a6c9e2; }
.iplist td {border-bottom: 1px solid #a6c9e2; }
.ipedit {margin: 0; height: 24px; width: 30px; float: left; background-image: url(/images/200811222014050877801.jpg); background-position: -357px -183px; cursor: hand; margin-right: 3px; }
.ipdel {margin: 0; height: 24px; width: 30px; float: left; background-image: url(/images/200811222014050877801.jpg); background-position: -200px -23px; cursor: hand; }
#chgflowcell {background-color: #ffffff;}
input, select {margin-bottom : 3px;}
</style>
<script type="text/javascript">
$(function() {
	var chgflowvalue = $("#chgflowvalue"),
		chgflowtitle = $("#chgflowtitle"),
		allFields = $([]).add(chgflowvalue).add(chgflowtitle),
		tips = $("#validateTips");

	function updateTips(t) {
		tips.text(t).effect("highlight",{},1500);
	}

	function checkLength(o,n,min,max) {

		if ( o.val().length > max || o.val().length < min ) {
			o.addClass('ui-state-error');
			//updateTips("Length of " + n + " must be between "+min+" and "+max+".");
			updateTips("不能为空值");
			return false;
		} else {
			return true;
		}

	}

	function checkRegexp(o,regexp,n) {

		if ( !( regexp.test( o.val() ) ) ) {
			o.addClass('ui-state-error');
			updateTips(n);
			return false;
		} else {
			return true;
		}

	}
	
	$("#chgflowcell").dialog({
		bgiframe: true,
		autoOpen: false,
		height: 300,
		width: 450,
		modal: true,
		buttons: {
			'取消': function() {
				$(this).dialog('close');
			},
			'提交': function() {
				var bValid = true;
				allFields.removeClass('ui-state-error');

				bValid = bValid && checkLength(chgflowvalue, "chgflowvalue", 1, 128);
				bValid = bValid && checkLength(chgflowtitle, "chgflowtitle", 1, 128);

				//bValid = bValid && checkRegexp(name,/^[a-z]([0-9a-z_])+$/i,"Username may consist of a-z, 0-9, underscores, begin with a letter.");
				// From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
				//bValid = bValid && checkRegexp(email,/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i,"eg. ui@jquery.com");
				//bValid = bValid && checkRegexp(password,/^([0-9a-zA-Z])+$/,"Password field only allow : a-z 0-9");
				
				if (bValid) {
					$.post(
						'/admin/chgflowcell',
						{chgflowvalue: $("#chgflowvalue").val(), flowgroup: $("#flowgroup").val(), chgflowtitle: $("#chgflowtitle").val()
						     , chgflowdes: $("#chgflowdes").val(), chgflowop: $("#chgflowop").val(), chgflowid: $("#chgflowid").val()
						},
						function(data) {
							$("#aboutchannelsoft_windows .qn_ui-sortable-placeholder-frame").load("/admin/chgflowlist"); 
						}
					);
					$(this).dialog('close');
				}
			}
		},
		close: function() {
			allFields.val('').removeClass('ui-state-error');
		}
	});
		
		
	/*add*/
	$('#create-chgflow').click(function() {
			$("#chgflowop").val('add');
			$("#chgflowid").val('0');
			$('#chgflowcell').dialog('open');
		})
		.hover(
			function(){ 
				$(this).addClass("ui-state-hover"); 
			},
			function(){ 
				$(this).removeClass("ui-state-hover"); 
			}
		)/*add*/
		
	/*edit*/
	$(".ipedit").click(function(){
		var ipid = $(this).parents("tr:first").attr("id"); /*id*/
		$.ajax({
			type: "GET",
			url: "/admin/chgflowcell",
			dataType: "json",
			data: {chgflowop: 'fetch', id: ipid},
			success: function(msg){
				$("#chgflowcell #chgflowvalue").val(msg.value);
				$("#chgflowcell #chgflowtitle").val(msg.title);
				$("#chgflowcell #flowgroup").val(msg.flowgroup);
				$("#chgflowcell #chgflowdes").val(msg.des);
				$("#chgflowcell #chgflowop").val('edit');
				$("#chgflowcell #chgflowid").val(msg.id);
				$('#chgflowcell').dialog('open');
			}
		}); 
	});/*edit*/
	
	/*del*/
	$(".ipdel").click(function(){
		var ipid = $(this).parents("tr:first").attr("id"); /*id*/
		$("#dialog_div").html("");
		$("#dialog_div").append("<div id=\"dialog\" title=\"\" ><p><span class=\"ui-icon ui-icon-alert\" style=\"float:left; margin:0 7px 20px 0;\"></span>您真的要删除该条记录吗？</p></div>");
		$("#dialog").dialog({
			bgiframe: true,
			resizable: false,
			height:140,
			modal: true,
			overlay: {
				backgroundColor: '#000',
				opacity: 0.5
			},
			buttons: {
				'取消': function() {
					$(this).dialog('close');
				},
				'确认': function() {
					$.post(
						'/admin/chgflowcell',
						{ chgflowop: 'del', id: ipid},
						function(data) {
							$("#" + ipid).hide('highlight');
							//$("#aboutchannelsoft_windows .qn_ui-sortable-placeholder-frame").load("/admin/iplist"); 
						}
					);
					$(this).dialog('close');
				}

			}
		});
	});/*del*/
	
	$("#selectbygroup").change(function(){
		groupid = $(this).val();
		$.post(
			'/admin/chgflowlist',
			{ groupid: groupid},
			function(data) {
				$("#aboutchannelsoft_windows .qn_ui-sortable-placeholder-frame").html(data); 
				$("#selectbygroup").val(groupid);
			}
		);
	});
});

</script>
{/literal}
<div>
<table cellpadding="0" cellspacing="0" width="98%" align="center" class="iplist">
<col width='5%'>
<col width='8%'>
<col width='35%'>
<col width='40%'>
<col width='10%'>
<tr>
	<th>&nbsp;</th>
	<th>值</th>
	<th>
		<select style="font-weight: bold; width: 100%;" id="selectbygroup">
			<option value="all">类 别</option>
			{foreach from=$qnsoftchgflow item=item key=key}
			<option value="{$key}">{$item}</option>
			{/foreach}
		</select>
	</th>
	<th>标题</th>
	<th>&nbsp;</th>
</tr>
{foreach from=$chgflowData item=item name=iplistloop }
<tr align="left" id="{$item.id}">
	<td align="left">{$smarty.foreach.iplistloop.iteration}</td>
	<td align="center">{$item.value}</td>
	<td>{if $item.flowgroup_txt}{$item.flowgroup_txt}{else}&nbsp;{/if}</td>
	<td>{if $item.title}{$item.title}{else}&nbsp;{/if}</td>
	<td>
		<div class="ipedit" title="编辑"></div>
		<div class="ipdel" title="删除"></div>
	</td>
</tr>
{/foreach}
</table>
</div>
<p/>
<div align="center">
	<button id="create-chgflow" class="ui-button ui-state-default ui-corner-all">Create new chgflow</button>
</div>

