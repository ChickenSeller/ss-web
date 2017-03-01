







{include file='user/main.tpl'}


<script src="//cdn.bootcss.com/canvasjs/1.7.0/canvasjs.js"></script>
<script src="//cdn.bootcss.com/jquery/2.2.1/jquery.min.js"></script>


	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">节点列表</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<h4>注意!</h4>
									<dt>帐号等级:{$user->class}级;等级过期时间:{$user->class_expire}</dt>
									<dt>总流量{$user->enableTraffic()},已用流量{$user->usedTraffic()}，剩余流量{$user->unusedTraffic()}</dt>
										<div class="alstardiv">
											<p class="alstar-left">
												<a  href="javascript:void(0);" onClick="urlChange('guide',0,0,0)"><code>怎么用？不会用？点这里 这里 这里</code></a>
											</p>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="ui-card-wrap">
					<div class="row">
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<div class="tile-wrap">
											{$id=0}
											{foreach $node_prefix as $prefix => $nodes}
												{$id=$id+1}
												
													<div class="tile tile-collapse">
														<div data-toggle="tile" data-target="#heading{$node_order->$prefix}">
															<div class="tile-side pull-left" data-ignore="tile">
																<div class="avatar avatar-sm">
																	<span class="icon {if $node_heartbeat[$prefix]=='在线'}text-green{else}{if $node_heartbeat[$prefix]=='暂无数据'}text-orange{else}text-red{/if}{/if}">{if $node_heartbeat[$prefix]=="在线"}backup{else}{if $node_heartbeat[$prefix]=='暂无数据'}report{else}warning{/if}{/if}</span>
																</div>
															</div>
															<div class="tile-inner">
																<div class="text-overflow">{$prefix} | <i class="icon icon-lg">person</i> {$node_alive[$prefix]} | <i class="icon icon-lg">build</i> {$node_method[$prefix]} | <i class="icon icon-lg">traffic</i> {if isset($node_bandwidth[$prefix])==true}{$node_bandwidth[$prefix]}{else}N/A{/if}</div>
															</div>
														</div>
														<div class="collapsible-region collapse" id="heading{$node_order->$prefix}">
															<div class="tile-sub">
																
																<br>
																
																{foreach $nodes as $node}
																	
																	
																	{if $node->mu_only == 0}
																	
																	{$has_taken_up = false}
																	
																	{if $node->sort == 10}
																		{foreach $node_relay as $match_node_relay}
																			{if ($match_node_relay['rule']->source_node_id == $node->id || $match_node_relay['rule']->source_node_id == 0) && $user->port == $match_node_relay['rule']->port}
																				{$has_taken_up = true}
																			{/if}
																		{/foreach}
																	{/if}
																	
																	{if $has_taken_up != true}
																	
																	<div class="card">
																		<div class="card-main">
																			<div class="card-inner"> 
																			<p class="card-heading" >
																				<a href="javascript:void(0);" onClick="urlChange('{$node->id}',0,0,0)">点击此处查看二维码等信息</a> 
																				<span class="label label-green">{$node->status}</span>
																			</p>
																			
																			
																			
																			
																			{if $node->sort > 2 && $node->sort != 5}
																				<p>地址：<span class="label" > 
																				<a href="javascript:void(0);" onClick="urlChange('{$node->id}',0,0,0)">点击查看二维码等信息</a>
																			{else}
																				<p>地址：<span class="label label-brand-accent"> 
																				{$node->server}
																			{/if}
																				
																				</span></p>
																			
																			{if $node->sort == 0||$node->sort==7||$node->sort==8}
																				<p>加密方式：<span class="label label-brand"> 
																					{if $node->custom_method == 1}
																						{$user->method}
																					{else}
																						{$node->method}
																					{/if}
																				</span></p>
																				
																				{if $node->sort==0&&$node->custom_rss==1&&$config['enable_rss']=='true'}
																					<p>协议：<span class="label label-brand-accent"> 
																						{$user->protocol}
																					</span></p>
																					
																					<p>协议参数：<span class="label label-red"> 
																						{$user->protocol_param}
																					</span></p>
																					
																					<p>混淆方式：<span class="label label-brand"> 
																						{$user->obfs}
																					</span></p>
																					
																					<p>混淆参数：<span class="label label-green"> 
																						{$user->obfs_param}
																					</span></p>
																				{/if}
																				
																				
																				<p>流量比例：<span class="label label-red"> 
																					{$node->traffic_rate}
																				</span></p>
																				
																				
																				
																				{if ($node->sort==0||$node->sort==7||$node->sort==8)&&($node->node_speedlimit!=0||$user->node_speedlimit!=0)}
																					<p>节点限速：<span class="label label-green"> 
																						{if $node->node_speedlimit>$user->node_speedlimit}
																							{$node->node_speedlimit}Mbps
																						{else}
																							{$user->node_speedlimit}Mbps
																						{/if}
																					</span></p>
																				{/if}
																			{/if}
																			
																			<p>{$node->info}</p>
																			
																			
																			
																			
																			 </div>
																			
																		</div>
																	</div>
																	{/if}
																	{/if}
																	
																	{if $node->sort == 0 || $node->sort == 10}
																		{$point_node=$node}
																	{/if}
																	
																	
																	
																	{if ($node->sort == 0 || $node->sort == 10) && $node->custom_rss == 1}
																		{foreach $node_muport as $single_muport}
																			
																			{$has_taken_up = false}
																			{foreach $node_relay as $match_node_relay}
																				{if ($match_node_relay['rule']->source_node_id == $node->id || $match_node_relay['rule']->source_node_id == 0) && $single_muport['user']['port'] == $match_node_relay['rule']->port}
																					{$has_taken_up = true}
																				{/if}
																			{/foreach}
																			
																			{if $has_taken_up == true}
																			{continue}
																			{/if}
																			
																			<div class="card">
																				<div class="card-main">
																					<div class="card-inner"> 
																					<p class="card-heading" >
																						<a href="javascript:void(0);" onClick="urlChange('{$node->id}',{$single_muport['server']->server},0,0,0)">{$prefix} - 单端口多用户 Shadowsocks - {$single_muport['server']->server} 端口</a> 
																						<span class="label label-green">{$node->status}</span>
																					</p>
																					
																					
																					<p>地址：<span class="label label-brand-accent"> 
																					{$node->server}
																					
																					</span></p>
																					
																					<p>端口：<span class="label label-brand-red"> 
																						{$single_muport['user']['port']}
																					</span></p>
																					
																					<p>加密方式：<span class="label label-brand"> 
																						{$single_muport['user']['method']}
																					</span></p>
																					
																					<p>协议：<span class="label label-brand-accent"> 
																						{$single_muport['user']['protocol']}
																					</span></p>
																					
																					<p>协议参数：<span class="label label-red"> 
																						{$single_muport['user']['protocol_param']}
																					</span></p>
																					
																					<p>混淆方式：<span class="label label-brand"> 
																						{$single_muport['user']['obfs']}
																					</span></p>
																					
																					<p>混淆参数：<span class="label label-green"> 
																						{$single_muport['user']['obfs_param']}
																					</span></p>
																					
																					<p>流量比例：<span class="label label-red"> 
																						{$node->traffic_rate}
																					</span></p>
																					
																					<p>{$node->info}</p>
																					
																					
																					
																					
																					 </div>
																					
																				</div>
																			</div>
																		{/foreach}
																	{/if}
																	
																	{if $node->sort == 0 && $node->custom_rss == 1}
																		{foreach $node_relay as $single_node_relay}
																			{if $node->id == $single_node_relay['node_id']}
																				{if $user->port == $single_node_relay['rule']->port}
																					{$has_higher_priority = false}
																					{foreach $node_relay as $priority_node_relay}
																						{if $priority_node_relay['rule']->priority >= $single_node_relay['rule']->priority && ($single_node_relay['rule']->source_node_id == $priority_node_relay['rule']->source_node_id || $priority_node_relay['rule']->source_node_id == 0) && $single_node_relay['rule']->id < $priority_node_relay['rule']->id && $user->port == $priority_node_relay['rule']->port}
																							{$has_higher_priority = true}
																						{/if}
																					{/foreach}
																					
																					{if $has_higher_priority == true}
																						{continue}
																					{/if}
																					
																					
																					{if $single_node_relay['rule']->source_node_id == 0}
																						{foreach $relay_nodes as $relay_node}
																						<div class="card">
																							<div class="card-main">
																								<div class="card-inner"> 
																								<p class="card-heading" >
																									<a href="javascript:void(0);" onClick="urlChange('{$node->id}',0,{$single_node_relay['rule']->id},{$relay_node->id})">{$prefix} - {$relay_node->name}</a> 
																									<span class="label label-green">{$node->status}</span>
																								</p>
																								
																								<p>地址：<span class="label label-brand-accent"> 
																								{$relay_node->server}
																								
																								</span></p>
																								
																								<p>加密方式：<span class="label label-brand"> 
																									{if $node->custom_method == 1}
																										{$user->method}
																									{else}
																										{$node->method}
																									{/if}
																								</span></p>
																								
																								<p>协议：<span class="label label-brand-accent"> 
																									{$user->protocol}
																								</span></p>
																								
																								<p>协议参数：<span class="label label-red"> 
																									{$user->protocol_param}
																								</span></p>
																								
																								<p>混淆方式：<span class="label label-brand"> 
																									{$user->obfs}
																								</span></p>
																								
																								<p>混淆参数：<span class="label label-green"> 
																									{$user->obfs_param}
																								</span></p>
																								
																								<p>流量比例1：<span class="label label-red"> 
																									{$node->traffic_rate + $relay_node->traffic_rate}
																								</span></p>
																								
																								{if ($node->sort==0||$node->sort==7||$node->sort==8)&&($node->node_speedlimit!=0||$user->node_speedlimit!=0)}
																									<p>节点限速：<span class="label label-green"> 
																										{if $node->node_speedlimit>$user->node_speedlimit}
																											{$node->node_speedlimit}Mbps
																										{else}
																											{$user->node_speedlimit}Mbps
																										{/if}
																									</span></p>
																								{/if}
																								
																								<p>{$node->info}</p>
																								
																								
																								
																								
																								 </div>
																								
																							</div>
																						</div>
																						{/foreach}
																					{else}
																						
																						<div class="card">
																							<div class="card-main">
																								<div class="card-inner"> 
																								<p class="card-heading" >
																									<a href="javascript:void(0);" onClick="urlChange('{$node->id}',0,{$single_node_relay['rule']->id},0)">{$prefix} - {$single_node_relay['rule']->Source_Node()->name}</a> 
																									<span class="label label-green">{$node->status}</span>
																								</p>
																								
																								<p>地址：<span class="label label-brand-accent"> 
																								{$single_node_relay['rule']->Source_Node()->server}
																								
																								</span></p>
																								
																								<p>加密方式：<span class="label label-brand"> 
																									{if $node->custom_method == 1}
																										{$user->method}
																									{else}
																										{$node->method}
																									{/if}
																								</span></p>
																								
																								<p>协议：<span class="label label-brand-accent"> 
																									{$user->protocol}
																								</span></p>
																								
																								<p>协议参数：<span class="label label-red"> 
																									{$user->protocol_param}
																								</span></p>
																								
																								<p>混淆方式：<span class="label label-brand"> 
																									{$user->obfs}
																								</span></p>
																								
																								<p>混淆参数：<span class="label label-green"> 
																									{$user->obfs_param}
																								</span></p>
																								
																								<p>流量比例：<span class="label label-red"> 
																									{$node->traffic_rate + $single_node_relay['rule']->Source_Node()->traffic_rate}
																								</span></p>
																								
																								
																								{if ($node->sort==0||$node->sort==7||$node->sort==8)&&($node->node_speedlimit!=0||$user->node_speedlimit!=0)}
																									<p>节点限速：<span class="label label-green"> 
																										{if $node->node_speedlimit>$user->node_speedlimit}
																											{$node->node_speedlimit}Mbps
																										{else}
																											{$user->node_speedlimit}Mbps
																										{/if}
																									</span></p>
																								{/if}
																								
																								<p>{$node->info}</p>
																								
																								
																								
																								
																								</div>
																								
																							</div>
																						</div>
																					{/if}
																				{else}
																					{foreach $node_muport as $single_muport}
																						{if $single_muport['user']['port'] == $single_node_relay['rule']->port}
																							
																							{$has_higher_priority = false}
																							{foreach $node_relay as $priority_node_relay}
																								{if $priority_node_relay['rule']->priority >= $single_node_relay['rule']->priority && ($single_node_relay['rule']->source_node_id == $priority_node_relay['rule']->source_node_id || $priority_node_relay['rule']->source_node_id == 0) && $single_node_relay['rule']->id < $priority_node_relay['rule']->id && $single_muport['user']['port'] == $priority_node_relay['rule']->port}
																									{$has_higher_priority = true}
																								{/if}
																							{/foreach}
																							
																							{if $has_higher_priority == true}
																								{continue}
																							{/if}
																							
																							{if $single_node_relay['rule']->source_node_id == 0}
																								{foreach $relay_nodes as $relay_node}
																								
																								
																								<div class="card">
																									<div class="card-main">
																										<div class="card-inner"> 
																										<p class="card-heading" >
																											<a href="javascript:void(0);" onClick="urlChange('{$node->id}',{$single_muport['server']->server},{$single_node_relay['rule']->id},{$relay_node->id})">{$prefix} - 单端口多用户 Shadowsocks  - {$single_muport['server']->server} 端口 - {$relay_node->name}</a> 
																											<span class="label label-green">{$node->status}</span>
																										</p>
																										
																										
																										<p>地址：<span class="label label-brand-accent"> 
																										{$relay_node->server}
																										
																										</span></p>
																										
																										<p>端口：<span class="label label-brand-red"> 
																											{$single_muport['user']['port']}
																										</span></p>
																										
																										<p>加密方式：<span class="label label-brand"> 
																											{$single_muport['user']['method']}
																										</span></p>
																										
																										<p>协议：<span class="label label-brand-accent"> 
																											{$single_muport['user']['protocol']}
																										</span></p>
																										
																										<p>协议参数：<span class="label label-red"> 
																											{$single_muport['user']['protocol_param']}
																										</span></p>
																										
																										<p>混淆方式：<span class="label label-brand"> 
																											{$single_muport['user']['obfs']}
																										</span></p>
																										
																										<p>混淆参数：<span class="label label-green"> 
																											{$single_muport['user']['obfs_param']}
																										</span></p>
																										
																										<p>流量比例：<span class="label label-red"> 
																											{$single_muport['server']->traffic_rate + $relay_node->traffic_rate}
																										</span></p>
																										
																										<p>{$node->info}</p>
																										
																										
																										
																										
																										 </div>
																										
																									</div>
																								</div>
																								
																								{/foreach}
																							{else}
																								
																								<div class="card">
																									<div class="card-main">
																										<div class="card-inner"> 
																										<p class="card-heading" >
																											<a href="javascript:void(0);" onClick="urlChange('{$node->id}',{$single_muport['server']->server},{$single_node_relay['rule']->id},0)">{$prefix} - 单端口多用户 Shadowsocks - {$single_muport['server']->server} 端口 - {$single_node_relay['rule']->Source_Node()->name}</a> 
																											<span class="label label-green">{$node->status}</span>
																										</p>
																										
																										
																										<p>地址：<span class="label label-brand-accent"> 
																										{$single_node_relay['rule']->Source_Node()->server}
																										
																										</span></p>
																										
																										<p>端口：<span class="label label-brand-red"> 
																											{$single_muport['user']['port']}
																										</span></p>
																										
																										<p>加密方式：<span class="label label-brand"> 
																											{$single_muport['user']['method']}
																										</span></p>
																										
																										<p>协议：<span class="label label-brand-accent"> 
																											{$single_muport['user']['protocol']}
																										</span></p>
																										
																										<p>协议参数：<span class="label label-red"> 
																											{$single_muport['user']['protocol_param']}
																										</span></p>
																										
																										<p>混淆方式：<span class="label label-brand"> 
																											{$single_muport['user']['obfs']}
																										</span></p>
																										
																										<p>混淆参数：<span class="label label-green"> 
																											{$single_muport['user']['obfs_param']}
																										</span></p>
																										
																										<p>流量比例：<span class="label label-red"> 
																										{$single_muport['server']->traffic_rate + $single_node_relay['rule']->Source_Node()->traffic_rate}
																										</span></p>
																										
																										<p>{$node->info}</p>
																										
																										
																										
																										
																										 </div>
																										
																									</div>
																								</div>
																							{/if}
																						{/if}
																					{/foreach}
																				{/if}
																			{/if}
																		{/foreach}
																	{/if}
																
																{/foreach}
																	
																	
																	
																
																{if $point_node!=null}
																
																	<div class="card">
																		<div class="card-main">
																			<div class="card-inner" id="info{$id}"> 
																				
																			</div>
																		</div>
																	</div>
																	
																	<script>
																	$().ready(function(){
																		$('#heading{$node_order->$prefix}').on("shown.bs.tile", function() {

																			$("#info{$id}").load("/user/node/{$point_node->id}/ajax");

																		});
																	});
																	</script>
																{/if}	
																
																{$point_node=null}
																	
															</div>
														</div>
												</div>
											{/foreach}
										</div>
									</div>
								</div>
							</div>
															
<p style=" margin:0 auto; width:400px; height:100px;">
<a href="/user/trafficlog"><img src=../img/trafficlog.png></a>
</p>

																		
							
						</div>
						
						<div aria-hidden="true" class="modal modal-va-middle fade" id="nodeinfo" role="dialog" tabindex="-1">
							<div class="modal-dialog modal-full">
								<div class="modal-content">
									<iframe class="iframe-seamless" title="Modal with iFrame" id="infoifram"></iframe>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>








{include file='user/footer.tpl'}


<script>


function urlChange(id,is_mu,rule,relay_node_id) {
    var site = './node/'+id+'?ismu='+is_mu+'&relay_rule='+rule+"&relay_node_id="+relay_node_id;
	if(id == 'guide')
	{
		var doc = document.getElementById('infoifram').contentWindow.document;
		doc.open();
		doc.write('<img src="/yanshi.gif" style="width: 100%;height: 100%; border: none;"/>');
		doc.close();
	}
	else
	{
		document.getElementById('infoifram').src = site;
	}
	$("#nodeinfo").modal();
}
</script>
