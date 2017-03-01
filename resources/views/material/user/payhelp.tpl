








{include file='user/main-a.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">SSvip赞助中心 <span style="font-size:20px;">俺想说:谢谢乃些赞助俺的人！！！</pan></h1>
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
										<div class="card-table">
							
											      <h2 style="margin:0 auto;text-align:center">谢谢您的赞助 ~Onz</h2>
												  <p>推荐使用平台购买充值码，购买方式：</p>
												  <p><a href="http://www.kuaifaka.com/item/RBphH2.html">点此购买</a>,购买后拿到30位充值码后，到<a href="code">充值中心</a>进行使用。平台购买为自动发货，无需等待！</p>
												  <p>使用微信、支付宝二维码转账，属于人工充值。转账请备注用户名或者邮箱，最好使用<a href="ticket" target="_blank"  class="STYLE1">支付工单提交</a>功能提交您的支付订单及用户名或邮箱。</p>
							
							
										</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
					
					{include file='dialog.tpl'}
				</div>
			</section>
			
			
			<!--
			<div class="card margin-bottom-no">
			
			哐哐哐
			
			</div>
		--!>


	<!--<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" src="../payhelp3" width="100%" height="360px"></iframe>--!>


	<div class="content1">
		<ul id="da-thumbs" class="da-thumbs">
			<li>
				<p style="font-size:22px;text-align:center">微信</p>
				<a href="https://ssvip.ml/help/wxpay.png" target="_blank">
					<img src="../img/wxpay-web.png" >
					<div class="hot_info">
						<h2>微信赞助</h2>
						<em></em>
						<p style="text-align:center">重要的话说4遍</p>
						<p>谢谢您的赞助!</p>
						<p>谢谢您的赞助!!!</p>
						<p>谢谢您的赞助!!!!!</p>
						<p>谢谢您的赞助!!!!!!!!</p>
						<p>赞助后获得等价的充值码</p>
						<p style="text-align:right;width:300px;position:absolute;bottom:5px;padding:5px;margin-left:-12px;font-weight :bolder;text-decoration:overline">SSvip.ML</p>
						
					</div>
				</a>
			</li>
	<!--	<li>
				<a href="https://ssvip.ml/user/payhelp" target="_blank">
					<img src="../img/mapay.png" >
					<div class="hot_info">
						<h2 style="color:#fff;font-weight :bolder;">SSvip.ML</h2>
						<em></em>
						<p style="float:left;width:250px;height:150px;font-weight :bolder;">←微信扫码</p>
						<p style="float:right;width:250px;height:50px;text-align:right;font-weight :bolder;">支付宝扫码→</p>
					</div>
				</a>
			</li>
	--!>
			<li>
			<p style="font-size:22px;text-align:center">支付宝</p>
				<a href="https://ssvip.ml/help/alipay.png" target="_blank">
					<img src="../img/alipay-web.png">
					<div class="hot_info">
						<h2>支付宝赞助</h2>
						<p style="text-align:center">重要的话说4遍</p>
						<p style="text-align:right;">谢谢您的赞助!</p>
						<p style="text-align:right;">谢谢您的赞助!!!</p>
						<p style="text-align:right;">谢谢您的赞助!!!!!</p>
						<p style="text-align:right;">谢谢您的赞助!!!!!!!!</p>
						<p style="text-align:right;">赞助后获得等价的充值码</p>
						<p style="text-align:left;width:300px;position:absolute;bottom:5px;padding:5px;margin-left:12px;font-weight :bolder;text-decoration:overline">SSvip.ML</p>
					</div>
				</a>
			</li>
		</ul>
	</div>	
		<div style="height:55px;width:auto;background-color:#fff;"></div>
</div>

</main>







{include file='user/footer-a.tpl'}

<script>
    $(document).ready(function () {
        $("#hide-update").click(function () {
            $.ajax({
                type: "POST",
                url: "hide",
                dataType: "json",
                data: {
                    hide: $("#hide").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>
