<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Double Guard</title>
<meta name="keywords" content="" />
<meta name="description" content="" />


<!-- stylesheet -->
<link rel="stylesheet" href="css/reset.css" type="text/css"
	media="screen" charset="utf-8" />
<link rel="stylesheet" href="css/main.css" type="text/css"
	media="screen" charset="utf-8" />
<link rel="stylesheet" href="css/checkbox.css" type="text/css"
	media="screen" charset="utf-8" />

<style>
#ads-okilla {
	text-align: center;
	min-width: 180px;
	height: auto;
	right: 15px;
	top: 32px;
	position: fixed;
	background: rgba(255, 255, 255, 0.7);
	box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.1);
	z-index: 1000000;
	font-family: Arial;
	/*min-width: 250px;*/
}

.influads_block {
	padding: 20px 0;
}

.errorMsg {
	color: red;
}
</style>

<!-- javascript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var d = "placeholder" in document.createElement("input");
		if (!d) {
			$("input[placeholder]").each(
					function() {
						$(this).val(element.attr("placeholder")).addClass(
								'placeholder');
					}).bind('focus', function() {
				if ($(this).val() == element.attr('placeholder')) {
					$(this).val('').removeClass('placeholder');
				}
			}).bind(
					'blur',
					function() {
						if ($(this).val() == '') {
							$(this).val(element.attr("placeholder")).addClass(
									'placeholder');
						}
					});
		}
	});
</script>
<script type="text/javascript" src="http://www.okilla.com/js/ga.js"></script>
</head>
<body>
	<div id="ads-okilla">
		<script async
			src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		<!-- ok-samples-250x250 -->
		<ins class="adsbygoogle"
			style="display: inline-block; width: 250px; height: 250px"
			data-ad-client="ca-pub-8391134889529034" data-ad-slot="5715414909"></ins>
		<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
		</script>
	</div>
	<div id="wrap-middle">
		<div id="wrap-title">
			<h1>Double Guard</h1>
		</div>

		<div id="wrap-login">
			<div id="box-login">
				<div id="box-login-top">
					<form action="UserLogin" method="post">
						<fieldset>
							<span class="errorMsg"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
								 	if (request.getParameter("msg") != null) {
								 		out.println(request.getParameter("msg"));
								 	}else {
								 		out.println("Please Enter Your Login Details");
								 	}
								 %>
							</span>
						</fieldset>

						<fieldset>
							<input type="text" id="name_" name="name_" placeholder="username"
								class="form-text" />
						</fieldset>
						<fieldset>
							<input type="password" id="password" name="password"
								placeholder="password" class="form-text" />
						</fieldset>

						<!-- <div id="box-login-bottom">-->
							<div id="footer-login">
								<span>Enable Double Guard : </span> <input type="checkbox"
									name="enableGuard" value="true" checked="checked" /> <label
									for="remember"></label>
							</div>
						<!-- </div> -->
						
						<br />
						<fieldset class="form-actions">
							<input type="submit" name="Log In" /> <a href="newProfile.jsp" alt="#">Register</a>
						</fieldset>
					</form>
				</div>
			</div>
		</div>

	</div>

</body>
</html>
