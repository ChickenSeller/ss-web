








{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">SSvip.ml</h1>
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
											<h2 style="margin:0 auto;text-align:center">使用教程</h2>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
			
		<div id="portfolio" name="portfolio">
				
			<div class="col-lg-3 text-center">

				<img src="../help/images/windows-icon.png" align="center"> <h3>Windows</h3><br>

				<h3><a href="../help/windows/index.html" target="_blank">PC电脑版教程</a></h3>

			</div>

					<div class="col-lg-3 text-center">
					
						<img src="../help/images/android-icon.png" align="center"> <h3>Android</h3><br>
						
						<h3><a href="../help/Android/index.html" target="_blank">Android安卓版教程</a></h3>
					</div>
					
					
					<div class="col-lg-3 text-center">

						<img src="../help/images/33.png" align="center"> <h3>SOCKSCAP64</h3><br>

						<h3><a href="../help/64/index.html" target="_blank" class="STYLE1">PC外服游戏代理教程</a></h3>

					</div>
					
					
					<div class="col-lg-3 text-center">

						<img src="../help/images/more.png"  style="width: 128px;  height: auto;" align="center"> <h3>More</h3><br>

						<h3><a href="../help" target="_blank"  class="STYLE1">更多教程</a></h3>

					</div>
			
			
		</div>
		<div style="height:50px;width:auto;background-color : #fff;"></div>

		
	</main>







{include file='user/footer.tpl'}

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
