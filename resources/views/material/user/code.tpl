








{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">充值</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
				
					
					
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										
										<p style="text-decoration:underline;color:red;font-size:30px;line-height:22px"><a href="http://www.kuaifaka.com/item/RBphH2.html" target="view_window">&nbsp;购买充值码&nbsp;</a>
									<!--	</p >
											<a  target="_blank" href="http://www.kuaifaka.com/item/RBphH2.html">
											<img src="/buy11.png" style="display:inline-block;margin-top:-50px width="130" height="60" alt=""/></a>										
									--!>	
										
										
										<h5 >当前余额：{$user->money} 元</h5>
										<div class="form-group form-group-label">
											<label class="floating-label" for="code">输入充值码</label>
											<input class="form-control" id="code" type="text">
										</div>
									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="code-update" ><span class="icon">check</span>&nbsp;充值</button>
												<p><span style="color:#459FFE;">温馨提醒:充值成功后请到
													<a href="/user/shop"><i class="icon icon-lg">remove_shopping_cart</i>&nbsp;购买中心</a>购买套餐！</span>
												</p>
										</div>
									</div>
									
									
									
	<!--支付宝支付。未成功								
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
				
										<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<h3><font color="red"><strong>请使用支付宝充值！</strong></font></h3>
									<h5><p>测试中！</p></h5>
									<h5><p>如有疑问，联系我</p></h5>									
									
										<div class="form-group form-group-label">
											<label class="floating-label" for="amount">充值金额</label>
											<input class="form-control" id="amount" type="text">
										</div>
									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="relay-update" ><span class="icon">check</span>&nbsp;提交</button>
										</div>
									</div>								
									
	--!>
									
									
									
								</div>
							</div>
						</div>
					</div>
					
					{if $pmw!='0'}
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner" style="height:{$pmw_height}">
										{$pmw}
									</div>
									
								</div>
							</div>
						</div>
					</div>
					{/if}
					
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<div class="card-table">
											<div class="table-responsive">
												{$codes->render()}
												<table class="table table-hover">
													<tr>
														<th>ID</th>
														<th>代码</th>
														<th>类型</th>
														<th>操作</th>
														<th>使用时间</th>
														
													</tr>
													{foreach $codes as $code}
														{if $code->type!=-2}
															<tr>
																<td>#{$code->id}</td>
																<td>{$code->code}</td>
																{if $code->type==-1}
																<td>金额充值</td>
																{/if}
																{if $code->type==10001}
																<td>流量充值</td>
																{/if}
																{if $code->type==10002}
																<td>用户续期</td>
																{/if}
																{if $code->type>=1&&$code->type<=10000}
																<td>等级续期 - 等级{$code->type}</td>
																{/if}
																{if $code->type==-1}
																<td>充值 {$code->number} 元</td>
																{/if}
																{if $code->type==10001}
																<td>充值 {$code->number} GB 流量</td>
																{/if}
																{if $code->type==10002}
																<td>延长账户有效期 {$code->number} 天</td>
																{/if}
																{if $code->type>=1&&$code->type<=10000}
																<td>延长等级有效期 {$code->number} 天</td>
																{/if}
																<td>{$code->usedatetime}</td>
															</tr>
														{/if}
													{/foreach}
												</table>
												{$codes->render()}
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
					
					{include file='dialog.tpl'}
				</div>
			</section>
		</div>

	</main>







{include file='user/footer.tpl'}


<script>
    $(document).ready(function () {
        $("#code-update").click(function () {
            $.ajax({
                type: "POST",
                url: "code",
                dataType: "json",
                data: {
                    code: $("#code").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
						window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
						window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
                    }
                },
                error: function (jqXHR) {
					$("#result").modal();
					$("#msg").html("发生错误：" + jqXHR.status);
                }
            })
        })

	
	timestamp = {time()}; 
		
		
	function f(){
		$.ajax({
			type: "GET",
			url: "code_check",
			dataType: "json",
			data: {
				time: timestamp
			},
			success: function (data) {
				if (data.ret) {
					clearTimeout(tid);
					$("#result").modal();
					$("#msg").html("充值成功！");
					window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
				}
			}
		});
		tid = setTimeout(f, 1000); //循环调用触发setTimeout
	}
	setTimeout(f, 1000);
})
</script>

