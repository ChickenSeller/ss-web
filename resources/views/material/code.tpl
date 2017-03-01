



{include file='header.tpl'}






	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-lg-push-0 col-sm-12 col-sm-push-0">
						<h1 class="content-heading">　</h1>
						
					</div>
				</div>
			</div>
		</div>
		<div class="container">
				<section class="content-inner margin-top-no">
				
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<!--<p>{$config["appName"]} 的邀请码。</p>--!>
								<p style="color:red;font-size : 20px">为了节点的稳定性，2017/02/10晚12点开启使用邀请码注册！</p>
								<p style="font-size : 16px">邀请码给需要的人！请珍惜您的邀请码，如您邀请的人违反了协议，我们将您的账号一并删除。每个注册用户只能生成2个邀请码。</p>
								<p style="font-size : 14px">注:如果您邀请的人，在本站消费，您将获得他充值面额的<code>{$config["code_payback"]} %</code>的提成。如:A邀请B注册，B充值10元，A可获得2元的提成！</p>

							</div>
						</div>
					</div>
				
					
					
					
					<div class="card">
						<div class="card-main">
							<div class="card-inner margin-bottom-no">
								<p class="card-heading">如果您只是注册看看，手下留情，请勿注册。邀请码不多，留点给真正需要的人。谢谢！！！</p>
								<div class="card-table">
									<div class="table-responsive">
										<table class="table">
											<thead>
											<tr>
												<th>序号</th>
												<th>邀请码 (点击邀请码进入注册页面)</th>
												<th>状态</th>
											</tr>
											</thead>
											<tbody>
											{foreach $codes as $code}
											<tr>
												<td>{$code->id}</td>
												<td><a href="/auth/register?code={$code->code}">{$code->code}</a></td>
												<td>可用</td>
											</tr>
											{/foreach}
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				
					
					
					
							
			
			
		</div>
	</main>


{include file='footer.tpl'}