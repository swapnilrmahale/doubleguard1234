<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbConnector"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Double Guard</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<%
	if (request.getSession().getAttribute("login") == null) {
		response.sendRedirect("index.jsp?msg=Please Login");
	}
%>
<body>
	<!-- start header -->
	<div id="wrapper">
		<div id="header">
			<div id="logo">
				<h1>
					<a href="#"> DoubleGuard Detecting Intrusions in Multitier Web
						Applications</a>
				</h1>
				<!--<p><span>DoubleGuard Detecting Intrusions in Multitier Web Applications</span></p> -->
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
		<!-- end header -->
		<!-- star menu -->
		<div id="menu">
			<ul>
				<li><a href="Logout">Log Out</a></li>
				<li><a href="userHome.jsp">Home</a></li>
				<li class="current_page_item"><a href="UpgradeRole">Trigger</a></li>
				<%
					if ("admin".equals(request.getSession().getAttribute("userid"))) {
				%>
				<li><a href="handleReport.jsp">Reports</a></li>
				<%
					}
				%>
			</ul>
		</div>
		<!-- end menu -->
		<!-- start page -->
		<div id="page">
			<!-- start ads -->
			<!-- end ads -->
			<!-- start content -->
			<div id="content">
				<div class="post">
					<div class="title">
						<h2>
							<a href="#">Upgrade Role</a>
						</h2>
					</div>
					<div class="entry">
						<%
							if (request.getParameter("msg") != null) {
								out.println(request.getParameter("msg"));
							}
							if (request.getParameter("search") != null) {
								try {

									Connection con = DbConnector.getConnection();
									PreparedStatement pstm = null;
									/* if (request.getParameter("search").contains("'")) {
										request.setAttribute("search",
												"Query invalidated in Maping Model");
									} else if (request.getParameter("search").contains(" sss")) {
										request.setAttribute("search",
												"Query invalidated in Maping Model");
									} else { */
									String sql = "select * from user where  user='"
											+ request.getParameter("search") + "'";
									out.println("ss : " + sql);
									pstm = con.prepareStatement(sql);
									ResultSet rs = pstm.executeQuery();
									String res = "";
									while (rs.next()) {
										res = res + "Name  :" + rs.getString("user")
												+ "----- Email Id     :"
												+ rs.getString("email") + "<br>";
									}
									request.setAttribute("search", res);
									//}
								} catch (Exception e) {
									e.printStackTrace();

								}
							}
						%>

						<br /> <br /> <br /> <br />
						<ul>
							<%
								if (request.getSession().getAttribute("role") != "admin") {
							%>
							<li><a href="UpgradeRole">Upgrade Role</a></li>
							<%
								}
							%>
							<%
								if (request.getSession().getAttribute("role") == "admin") {
							%>
							<li><a href="UserInfo" style="text-decoration: none;">Get
									All User Info</a></li>
							<%
								}
							%>
						</ul>

						<br /> Sql Injection: <br /> <br />

						<form method="post" action="upgradePre.jsp">
							Search:
							<input type="text" id="searc" name="search" />
							<input type="submit" value="Search" />
						</form>
						<br /> <br /> <br />
						<%
							if (request.getAttribute("search") != null) {
								out.println(request.getAttribute("search"));
							}
						%>
					</div>
					<p class="links"></p>
				</div>
			</div>
			<!-- end content -->
			<!-- start sidebar -->
			<!-- end sidebar -->
		</div>
		<!-- end page -->
		<!-- start footer -->
		<div id="footer">
			<p class="legal">&nbsp;</p>
		</div>
	</div>
	<!-- end footer -->
</body>
</html>
