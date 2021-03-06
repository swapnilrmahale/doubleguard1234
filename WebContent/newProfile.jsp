<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Double Guard</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<div id="logo">
				<h1>
					<a href="#">IDS Using DOUBLEGUARD in Multitier Web Application</a>
				</h1>
			</div>
			<div id="search">
				<form id="searchform" method="get" action="">
					<fieldset>
						<input type="text" name="s" id="s" size="15" value="" /> <input
							type="submit" id="x" value="Search" />
					</fieldset>
				</form>
			</div>
		</div>
		<div id="menu">
			<ul>
				<li><a href="index.jsp">Login</a></li>
				<li class="current_page_item"><a href="#">New User</a></li>
			</ul>
		</div>
		<div id="page">
			<div id="content">
				<div class="post">
					<div class="title">
						<h2>
							<a href="#">Registration</a>
						</h2>
					</div>
					<div class="entry">
						<%
							if (request.getParameter("msg") != null) {
								out.println(request.getParameter("msg"));
							}
						%>
						<h2>New User</h2>
						<form action="NewProfile" method="post">
							<table>
								<tr style="height: 40px;">
									<td>User Name</td>
									<td><input type="text" size="30" id="name_" name="name_" /></td>
								</tr>
								<tr style="height: 40px;">
									<td>Password</td>
									<td><input type="password" size="30" id="password"
										name="password" /></td>
								</tr>
								<tr style="height: 40px;">
									<td>Email-Id</td>
									<td><input type="text" size="30" id="emailid"
										name="emailid" /></td>
								</tr>
								<tr style="height: 40px;">
									<td>Gender</td>
									<td><input type="radio" name="sex" id="sex" value="male" />
										Male</td>
								</tr>
								<tr>
									<td></td>
									<td><input type="radio" name="sex" id="sex" value="female" />Female
									</td>
								</tr>

								<tr style="height: 40px;">
									<td></td>
									<td><input type="submit" value="Login"
										style="background-color: #F78117; height: 25px; width: 90px;" /></td>
								</tr>

								<tr>
									<td>Enable XSS Guard</td>
									<td><input type="checkbox" name="enableXSSGuard"
										value="true" checked="checked" /></td>
								</tr>
							</table>
						</form>
					</div>
					<p class="links"></p>
				</div>
			</div>
			<div id="sidebar">
				<img src="images/padlock.jpg" alt="" width="250" height="250"
					class="left" />
			</div>
		</div>
	</div>
</body>
</html>
