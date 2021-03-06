<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>{$system_config.site_name}</title>
<link type="text/css" href="{$system_config.img_url}/client_images/jquery-ui-1.8.1.custom.css" rel="stylesheet" />
<script type="text/javascript" src="{$system_config.img_url}/client_script/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="{$system_config.img_url}/client_script/jquery-ui-1.8.1.custom.min.js"></script>

<!-- css -->
<link type="text/css" href="{$system_config.img_url}/client_images/admin.css" rel="stylesheet" />

<!-- easyui -->
<link rel="stylesheet" type="text/css" href="{$system_config.img_url}/client_images/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="{$system_config.img_url}/client_images/themes/icon.css">
<script type="text/javascript" src="{$system_config.img_url}/client_script/jquery.easyui.min.js"></script>
<script type="text/javascript" src="{$system_config.img_url}/client_script/easyloader.js"></script>

<!-- centextmenu -->
<link rel="stylesheet" type="text/css" href="{$system_config.img_url}/client_images/contextmenu/contextmenu.css">
<script type="text/javascript" src="{$system_config.img_url}/client_script/jquery.contextmenu.js"></script>

<link type="text/css" href="{$system_config.img_url}/{$factoryInfo.factory_enterprisecode}/client_images/appsuite.css" rel="stylesheet"/>
<script type="text/javascript" src="{$system_config.img_url}/appsuite/getclient/id/{$user.factory_id}"></script>
<script type="text/javascript" src="{$system_config.img_url}/{$factoryInfo.factory_enterprisecode}/client_script/appsuiteDB.js"></script>
<script type="text/javascript" src="{$system_config.img_url}/{$factoryInfo.factory_enterprisecode}/client_script/appsuite.js"></script>


{literal} 
<script language="javascript"> 
<!-- 
try
{ 
    document.write("<object id=maximizer type=\"application/x-oleobject\" classid=\"clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11\">"); 
    document.write("<param name=\"Command\" value=\"maximize\">"); 
    document.write("</object>"); 

    if(document.all&&screen.width>document.body.offsetWidth+5) 
    { 
        maximizer.Click(); 
    } 
} 
catch(e)
{ 
    try
    { 
        if ( top.location.href == window.location.href && window.location.href.indexOf("no_full_screen") == -1 ) 
        { 
           self.moveTo(-4,-4); 
           self.resizeTo((screen.availWidth+8),(screen.availHeight+8)); 
        } 
    } 
    catch(e){ 
    } 
    finally{ 
    } 
} 
finally{ 
} 
//--> 
$(function(){
    $('#leftmenu').tree({
	    checkbox: false,
	    url: '{/literal}{$system_config.site_url}/qnmenurenter/jsonlist/factoryid/{$user.factory_id}{literal}',
	    onClick:function(node){
		    AppSuiteObject('request', node.id);
	    }
	    
    });

    /********************************************************************************************/
    $("#cti_set_agent").click(function(){ //跳转座席配制
	    openNowWindows('座席配制', '{/literal}{$system_config.site_url}{literal}/appsuite/setclient', true);
    });
    $("#cti_other_instal").click(function(){ //跳转安装
	    openNowWindows('重新安装', '{/literal}{$system_config.site_url}{literal}/instal/index', true);
    });
    /********************************************************************************************/
    
    $("#AgentAutoEnterIdle").click(function(){
        strValue = "no";
        if($(this).attr("checked")==true)
        {
            strValue = "yes";
        }

        $.get("{/literal}{$system_config.site_url}/appsuite/setclient/id/{$user.uid}{literal}/op/agentautoenteridle/value/" + strValue); 
        AppSuiteObject("command", "agentautoenteridle", strValue);
    });
    $("#AutoAnswer").click(function(){
        strValue = "no";
        if($(this).attr("checked")==true)
        {
            strValue = "yes";
        }

        $.get("{/literal}{$system_config.site_url}/appsuite/setclient/id/{$user.uid}{literal}/op/autoanswer/value/" + strValue); 
        AppSuiteObject("command", "autoanswer", strValue);
    });
});

//################################################################################################
// 显示时间
function checkTime(i)
{
    if (i<10) 
    {
        i="0" + i;
    }
    return i;//返回添加好的数值 
}
function startTime()
{
    var today=new Date();//声明对象变量
    var year = today.getYear();
    var month = today.getMonth() + 1;
    var day = today.getDate();
    var h=today.getHours();//得到当前小时数
    var m=today.getMinutes();//得到当前分钟数
    var s=today.getSeconds();//得到当前秒数
    // add a zero in front of numbers<10 //这个功能是为时间的分、秒小于10时为他们的前面添加个0 例如：15：03：04 而如果大于10了 就不用在前面再添加0了！！！！
    m=checkTime(m)//这句就是把得到的m传入到函数，然后把运行的结果返回回来再给m重新赋值（这点你要理解，程序的运行方式）。
    s=checkTime(s)//同理
    $("#localCurTime").html(year + "年" + month + "月" + day + "日" + " " + h+":"+m+":"+s);
}

//################################################################################################
</script>

{/literal}
</head>

<body class="easyui-layout">

<OBJECT height=0 width=0 ID="csAgentClient" CLASSID="CLSID:167CE366-D521-4457-9216-6AE78AB6DF1B" codebase="{$system_config.site_url}/instal/cabAppSuite.cab#version=1,0,0,4"></OBJECT>          

<!-- 
<OBJECT ID="csAgentClient" CLASSID="CLSID:167CE366-D521-4457-9216-6AE78AB6DF1B" VIEWASTEXT height=0 width=0></OBJECT>
<OBJECT ID="csAgentClient" CLASSID="" VIEWASTEXT height=0 width=0></OBJECT>
-->
	<!-- 顶部 -->
    <div region="north" class="region-north" border="false">
        <div style="height: 60px; border:#f00 0px solid;">
            <ul id="toolbar">
                <li class="toolbar_idle" id="cti_tool_setidle"/><div style="padding-top: 45px">示闲</div></li> 
                <li class="toolbar_busy" id="cti_tool_setbusy" /><div style="padding-top: 45px">示忙</div></li>  
                <li style="background:#ffffff; width: 1px; height: 58px;" disabled=true> </li>
                <li class="toolbar_hold" id="cti_tool_hold"/><div style="padding-top: 45px">保持</div></li> 
                <li class="toolbar_callback" id="cti_tool_back"/><div style="padding-top: 45px">接回</div></li>   
                <li style="background:#ffffff; width: 1px; height: 58px;" disabled=true> </li>          
                <li class="toolbar_conference" id="cti_tool_conference"/><div style="padding-top: 45px">会议</div></li>  
                <li class="toolbar_consult" id="cti_tool_consult" /><div style="padding-top: 45px">咨询</div></li>  
                <li class="toolbar_transfer" id="cti_tool_transfer" /><div style="padding-top: 45px">转移</div></li>  
                <li style="background:#ffffff; width: 1px; height: 58px;" disabled=true> </li>    
                <li class="toolbar_in" id="cti_tool_insert"/><div style="padding-top: 45px">强插</div></li> 
                <li class="toolbar_monitor" id="cti_tool_monitor" /><div style="padding-top: 45px">监听</div></li>
                <li class="toolbar_out" id="cti_tool_take_apart" /><div style="padding-top: 45px">拦截</div></li>
                <li style="background:#ffffff; width: 1px; height: 58px;" disabled=true> </li>
                <li class="toolbar_answer" id="cti_tool_answer" /><div style="padding-top: 45px">应答</div></li>      
                <li class="toolbar_over" id="cti_tool_over" /><div style="padding-top: 45px">挂断</div></li>
                <li style="background:#ffffff; width: 1px; height: 58px;" disabled=true> </li>
                <li class="toolbar_phone" id="com_tool_phone" /><div style="padding-top: 45px">呼叫</div></li>
                <li style="background:#ffffff; width: 1px; height: 58px;" disabled=true> </li>
                <li style="width: 80px;">
                    <input type="checkbox" id="AgentAutoEnterIdle" {if $user.agentautoenteridle == 1}checked="checked"{/if}>自动置闲  <p/>
                    <input type="checkbox" id="AutoAnswer"{if $user.autoanswer == 1}checked="checked"{/if}>自动应答  <p/>
                </li>
                <li style="width: 80px;"> 
                    <!-- <a stype="" href="javascript:void(0);" class="easyui-splitbutton" plain="true" menu="#otherskill">更多</a> -->
                    <a href="javascript:void(0);" id="cti_tool_pay" class="easyui-linkbutton" plain="true"  icon="icon-coins" style="margin-left:10px;">转支付</a>
                </li>
            </ul>
        </div>
        <div>
            <div style="border:#000000 0px solid; float:left;width: 200px; height: 50px;margin-top:7px;">
                <span style="color:#505050;margin-right:5px;">座席状态: </span><span id="qn_do_txt">注销</span>
            </div>
            <div style="width: 210px; float:left;margin-top:7px;"><span style="color:#505050;margin-right:5px;">通话号码: </span><span id="msg_calling"> </span> </div>
            <div style="width: 600px; float:left;margin-top:7px;">  
                <span style="color:#505050;margin-right:5px;">呼叫进入: </span><span id="call_in_time" style="color:#505050;">00:00:00</span>
                <span style="color:#505050;margin-right:5px;margin-left:7px;">应答开始: </span><span id="start_time" style="color:#505050;">00:00:00</span>
                <span style="color:#505050;margin-right:5px;margin-left:7px;">通话时长: </span><span id="msg_timelong" style="color:#505050;">0</span>
                <span style="color:#808080;margin-left:30px;">排队数: </span><span id="queue_size">0</span><a href="javascript:void(0);" id="refresh_queue_size" class="easyui-linkbutton" plain="true"  icon="icon-reload" style="margin-left:10px;"></a>
                <span >来自:<span id="msg_callid"></span></span>
            </div>
        </div>
	</div> <!-- 顶部 end -->

	<!-- 左则树 -->
	<div region="west" split="false" title="菜单" style="width:150px;padding:1px;">
	<ul id="leftmenu"></ul>
	</div>
	<!-- 左则树 end -->

	<!-- 底部 -->
	<div region="south" class="region-south" border="false">
		<div style="float:left;">
		版本:<span><a href="{$system_config.img_url}/instal/index">1.0.0.000</a></span> <span>|</span> 
		用户:<span>{$user.nickname}</span> <span>|</span> 
		工号:<span>{$user.workid}</span> <span>|</span> 
		分机号:<span>{$user.DN}</span> <span>|</span> 
		
		技能:<span>{$user.skills}</span> <span>|</span> 
        <!--
		来电:<span>(124个)</span>外呼：<span>(3个)</span>
		-->
		</div>
		<div style="float:right;width:300px;text-align:right;">
		<span id="localCurTime">2010年11月17日 16:22:34</span> 
		<a id="lockscreem_id" href="javascript:void(0)">锁屏</a>
		<span>|</span><a id="startService_id" href="javascript:void(0);">签入</a>
		<span>|</span><a id="exit_id" href="javascript:void(0)">退出</a> 
		</div>
	</div><!-- 底部 end -->


    <div region="center" title="" id="center">
        <!-- maintab -->
        <div id="maintab" class="easyui-tabs" fit="true" border="false">
            <div title="起始页" style="padding:10px;overflow:hidden;"> 
                <div class="index_info_div">
                    <ul>                                       
                    <li><span style="font-weight:bold;">座席信息</span></li>
                    <li>座席名：{$user.nickname}</li> 
					<li>座席工名： {$user.agentid}</li> 
					<li>座席分机号： {$user.DN}</li> 
                    </ul>
					<ul>
					<li><span style="font-weight:bold;">上次通话</span></li>
					<li>主叫：<span class="msg_calling"></span></li> 
					<li>被叫：<span class="msg_called"></span></li>
					<li>呼叫时间：<span class="call_in_time"></span></li> 
					<li>应答时间：<span class="start_time"></span></li> 
					<li>呼叫时长：<span class="msg_timelong"></span></li> 
					</ul>
                </div>
            </div>
        </div>
        <!-- maintab end -->
    </div><!-- center -->
    
    <!-- 软电话  -->
    <div title="软电话" class="softphone" id="softphone" stype="text-align:center;overflow:hidden;">
	{literal}
        <table>
            <tr>
            <td><input type='text' class="softphonevalue" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)"/></td>
            <td> <a href="javascript:void(0);" id="makecallbutton" class="easyui-linkbutton" plain="true" icon="icon-call-idle" title="呼叫"></a> </td>
            </tr>
        </table>
	{/literal}
        
          <div style="border:#000000 0px solid; margin: 1px; overflow: auto;display:;" id="softphonekeys" >
            <ul id="softphonekey">
                <li class="key_1" value="1"/></li>
                <li class="key_2" value="2"/></li>
                <li class="key_3" value="3"/></li>
                <li class="key_4" value="4"/></li>
                <li class="key_5" value="5"/></li>
                <li class="key_6" value="6"/></li>
                <li class="key_7" value="7"/></li>
                <li class="key_8" value="8"/></li>
                <li class="key_9" value="9"/></li>
                <li class="key_xing" value="101"/></li>
                <li class="key_0" value="0"/></li>
                <li class="key_jing" value="102"/></li>
                <!-- <li class="key_save" value="201"/></li> -->
                <li class="key_refresh" value="203"/></li> 
				<li/></li>
                <li class="key_call" value="202"/></li>
            </ul>
          </div>
		  <div style="display:none;width: auto; height:290px; text-align:left;" id="softphoneaddress">
			<table style=" height:290px;" id="softphoneaddress-tab" fit="true">
				<thead>
					<tr>
						<th field="f1" width="80">工号</th>
                        <th field="f2" width="100">用户名</th>
                        <th field="f3" width="100">角色</th>
						<th field="f4" width="150">技能组</th>
						<th field="f5" width="80">当前状态</th>
					</tr>
				</thead>
				<tbody>
                {foreach from=$agentList item=item name=listloop }
                    <tr>
                        <td>{$item.workid}</td> 
                        <td>{$item.nickname}</td>   
                        <td>{$item.rolename}</td>  
                        <td>{$item.skills}</td> 
                        <td> </td>
                    </tr>
                {/foreach}
				</tbody>
			</table>
		  </div> <!-- address -->
      </div><!-- 软电话  end -->
     
	 <!-- 目录 班长  -->
	  <div id="monitorskill" style="width:100px;"> 
      <!--
		<div id="cti_tool_monitor" icon="icon-call-listen">监听</div>
		<div id="cti_tool_insert" icon="icon-call-inset">强插</div>
		<div id="cti_tool_take_apart" icon="icon-call-take_apart">拦截</div>
        -->
		<div class="menu-sep"></div>
	  </div><!-- 目录1 end  -->

	  <!-- 目录 其它  -->
	  <div id="otherskill" style="width:150px;">
	  <!--
		<div>通话面板</div>
		<div class="menu-sep"></div>
		-->
        <!--  
		<div>单步呼转</div>
		<div>单步会议</div>
        
		<div>转回IVR</div>
		<div>挂机并转回IVR</div>
       
		<div>前置偏转</div> 
        <div id="cti_tool_pay">转IVR支付</div>  -->
		<!--
        <div class="menu-sep"></div>
		<div>
            
			<span>其它</span>
			<div style="width:100px;">
				<div id="cti_set_agent">座席设置</div>
				<div class="menu-sep"></div>
				<div id="cti_other_instal_"><a target="_blank " href="{$system_config.site_url}/instal/index">重新安装</a></div>
			</div>
		</div>
        -->
	  </div><!-- 目录2 end  -->
      
        <!-- 目录 自定义  -->
      <div id="menucustomize" class="easyui-menu" style="width:100px;">
        <div id="menu_customize_1">自定义1</div>
        <div id="menu_customize_2">自定义2</div>
        <div id="menu_customize_3">自定义3</div>
      </div><!-- 目录 自定义 end  -->
      
	
	  <div id="msgpanel"></div><!-- 消息  -->
      <div id="alertpanel"></div><!-- 对话框  -->
	  <div id="consultdialog" stype="text-align:center;overflow:hidden;" > <!-- 咨询 -->
        <div>
        {literal}
        <table>
        <tr><td>
        输入参数:<input type='text' class="consultdialogvalue" onkeyup="(this.s=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)"/>
        </td>
        <td>
        <a stype="margin:0 20px;" class="easyui-linkbutton" id="consultdialogflag_bt">咨询</a>
        </td></tr>
        </table>
        {/literal}
        </div>
		<div >
            <table><tr><td>咨询类别:</td><td>
            <select id="consultdialogflag" style="width:200px; margin:20px 10px;" class="easyui-combobox_" name="agent"  required="true">
                <option value="0">咨询座席工号</option>
                <option value="1">咨询外部号码</option>
                <option value="2">咨询技能组</option>
                <!--
                <option value="3" style="display:none;">IVR/MS</option>
                -->
            </select>
            </td></tr></table>        
		    
		    
		</div>
        <!-- 咨询座席工号 -->
        <div style="width: auto; height:250px; text-align:left;" id="consultaddress">
            <table style="height:250px;" id="consultaddress-tab" fit="true">
                <thead>
                    <tr>
                       <th field="f1" width="80">工号</th>
                        <th field="f2" width="100">用户名</th>
                        <th field="f3" width="100">角色</th>
                        <th field="f4" width="150">技能组</th>
                        <th field="f5" width="80">当前状态</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$agentList item=item name=listloop }
                    <tr>
                        <td>{$item.workid}</td> 
                        <td>{$item.nickname}</td>   
                        <td>{$item.rolename}</td>  
                        <td>{$item.skills}</td> 
                        <td> </td>
                    </tr>
                {/foreach} 
                </tbody>
            </table>
        </div> <!-- address -->
        
        <!-- 咨询外部号码 -->
        <div style="display:none; width: auto; height:250px; text-align:left;" id="consultout">
        </div>
        
        <!-- 咨询技能组 -->
        <div style="display:none; width: auto; height:250px; text-align:left;" id="consultskills">
            <table style="height:250px;" id="consultskill-tab" fit="true">
                <thead>
                    <tr>
                        <th field="f1" width="100">技能组编号</th>
                        <th field="f2" width="100">技能名</th>
                    </tr>                                         
                </thead>
                <tbody>  
                {foreach from=$skillList item=item name=listloop }
                    <tr>
                        <td>{$item.skill_code}</td>     
                        <td>{$item.skill_name}</td> 
                    </tr>
                {/foreach}

                </tbody>
            </table>
        </div>
		
	  </div> <!-- 咨询 -->
      
      <!-- 外呼还是内呼 -->
	  <input type="hidden" name="makecalltile" id="makecalltile" value="out"/>
       <input type="hidden" name="fakecalling" id="fakecalling" value="{$fakecalling}"/>
      
      <!-- 外呼还是内呼 end -->

		<!-- 锁屏 -->
		<div id="lockscreem_window" closed="false" modal="true" title="口令" style="width:300px;height:100px;">
			<div>请输入您的登陆密码:</div>
			<input type="password" id="lockscreem_pwd" name="lockscreem_pwd" />
			<input type="hidden" id="lockscreem_name" name="nsername" value="{$user.uid}"/>
			<input type="hidden" id="lockscreem_pwdplaintext" name="pwdplaintext" value="{$user.pwdplaintext}"/>
			<a id="lockscreem_submit" href="javascript:void(0);" class="easyui-linkbutton">开锁</a>
		</div>
		<!-- 锁屏 end -->

		<!-- 监听 -->
		<div id="monitor_window" closed="false" modal="true" title="监听">
			<table><tr><td>请输入被监听座席工号:
			<input type="text" id="monitored_agentid" name="monitored_agentid" /> </td>
            <td>
			<a id="monitored_submit" href="javascript:void(0);" class="easyui-linkbutton">监听</a>
            </td>
            </tr>
            </table>
            <div style="width: auto; height:330px; text-align:left;">
            <table style="height:330px;" id="monitored-tab" fit="true">
                <thead>
                    <tr>
                        <th field="f1" width="80">工号</th>
                        <th field="f2" width="100">用户名</th>
                        <th field="f3" width="100">角色</th>
                        <th field="f4" width="150">技能组</th>
                        <th field="f5" width="80">当前状态</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$agentList item=item name=listloop }
                        <tr>
                            <td>{$item.workid}</td> 
                            <td>{$item.nickname}</td>   
                            <td>{$item.rolename}</td>  
                            <td>{$item.skills}</td> 
                            <td> </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
            </div>
		</div>
		<!-- 监听  end -->

		<!-- 强插 -->
		<div id="insert_window" closed="false" modal="true" title="强插" style="width:300px;height:100px;">
			<table><tr><td>请输入被强插座席工号:
			<input type="text" id="insert_agentid" name="insert_agentid" />
            </td>
            <td>
			<a id="insert_submit" href="javascript:void(0);" class="easyui-linkbutton">强插</a>
             </td></tr></table>
            <div style="width: auto; height:330px; text-align:left;">
            <table style="height:330px;" id="insert-tab" fit="true">
                <thead>
                    <tr>
                        <th field="f1" width="80">工号</th>
                        <th field="f2" width="100">用户名</th>
                        <th field="f3" width="100">角色</th>
                        <th field="f4" width="150">技能组</th>
                        <th field="f5" width="80">当前状态</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$agentList item=item name=listloop }
                        <tr>
                            <td>{$item.workid}</td> 
                            <td>{$item.nickname}</td>   
                            <td>{$item.rolename}</td>  
                            <td>{$item.skills}</td> 
                            <td> </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
            </div>
		</div>
		<!-- 强插 end -->

		<!-- 拦截 -->
		<div id="intercept_window" closed="false" modal="true" title="拦截" style="width:300px;height:100px;">
			<table><tr><td>请输入被拦截座席工号:
			<input type="text" id="intercept_agentid" name="intercept_agentid" />
            </td><td>
			<a id="intercept_submit" href="javascript:void(0);" class="easyui-linkbutton">拦截</a>
            </td>
            </tr></table>
            <div style="width: auto; height:330px; text-align:left;">
            <table style="height:330px;" id="intercept-tab" fit="true">
                <thead>
                    <tr>
                        <th field="f1" width="80">工号</th>
                        <th field="f2" width="100">用户名</th>
                        <th field="f3" width="100">角色</th>
                        <th field="f4" width="150">技能组</th>
                        <th field="f5" width="80">当前状态</th>
                    </tr>
                </thead>
                <tbody>
                     {foreach from=$agentList item=item name=listloop }
                        <tr>
                            <td>{$item.workid}</td> 
                            <td>{$item.nickname}</td>   
                            <td>{$item.rolename}</td>  
                            <td>{$item.skills}</td> 
                            <td> </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
            </div>
		</div>
		<!-- 拦截 end -->

<script type="text/javascript">

/** 加载脚本信息 */
{foreach from=$script item=item}
	AppSuiteObject("local", "setscript", "{$item.scriptdb_key}", "{$item.scriptdb_info}");
{/foreach}  

/** 加载工号对应信息 */
{foreach from=$agentList item=item}
 //   var str = csAgentClient.manageData("<\?xml version=\"1.0\" \?><cmdbody><cmdtype>local</cmdtype><cmdname>setparam</cmdname><parameter><element name=\"BP{$item.workid}\" type=\"\" value=\"{$item.plain}\" /><element name=\"PB{$item.plain}\" type=\"\" value=\"{$item.workid}\" /></parameter></cmdbody>");
{/foreach}

{literal} 
try
{
{/literal} 
    var str = csAgentClient.manageData("<\?xml version=\"1.0\" \?><cmdbody><cmdtype>local</cmdtype><cmdname>setparam</cmdname><parameter><element name=\"workid\" type=\"\" value=\"{$user.workid}\" /><element name=\"agentid\" type=\"\" value=\"{$user.agentid}\" /><element name=\"username\" type=\"\" value=\"{$user.nickname}\" /><element name=\"photonum\" type=\"\" value=\"{$user.DN}\" /><element name=\"pwdmd5\" type=\"\" value=\"{$user.password}\" /><element name=\"mainip\" type=\"\" value=\"{$system_config.cti_server}\" /></parameter></cmdbody>");
{literal}
}
catch(err)
{
    alert(err.description);
}
{/literal} 
</script>

{literal}
<script type="text/javascript">
try
{
    setTimeout("csAgentClient.Init()", 3000);
    setInterval("startTime()", 1000);
}
catch(err)
{
    alert(err.description);
}
</script>

<!-- 消息响应 -->
<script language="javascript" for="csAgentClient" event="OnEvent(xml)">
   manageEvent(xml);
</script>

{/literal}

<input type="hidden" name="site_url" id="site_url" value="{$system_config.site_url}"/>
</body>

</html>

