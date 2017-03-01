
<!DOCTYPE html>
<html lang="cn">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<meta name="theme-color" content="#3f51b5">
	<title>{$config["appName"]}</title>

	<!-- css -->
	<link href="/theme/material/css/base.min.css" rel="stylesheet">
	<link href="/theme/material/css/project.min.css" rel="stylesheet">
	<link href="//fonts.lug.ustc.edu.cn/icon?family=Material+Icons" rel="stylesheet">
	
	<!-- favicon -->
	<!-- ... -->
</head>

	<main class="content" >
	
								<div class="card-table">
									<div class="table-responsive">
										<table class="table" >
												<th style="text-align:center;">点击下面邀请码即可进入注册页面并使用</th>
											<tbody style="text-align:center;">
											{foreach $codes as $code}
											<tr>
												<td><a style="color:#58BBEE" href="/auth/register?code={$code->code}">{$code->code}</a></td>
											</tr>
											{/foreach}
											</tbody>
										</table>
									</div>
								</div>
						

					
					
							
			
			
	
	</main>

