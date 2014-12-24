<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbConnector"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Double Guard</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default1.css" rel="stylesheet" type="text/css"
	media="screen" />
</head>
<%
	if (request.getSession().getAttribute("login") == null) {
		response.sendRedirect("index.jsp?msg=Please Login");
	}
	if (request.getSession().getAttribute("role") != "admin") {
		response.sendRedirect("index.jsp?msg=Invalid Request");
	}
%>
<body>
	<!-- start header -->
	<div id="wrapper">
		<div id="header">
			<div id="logo">
				<h1>
					<a href="#">IDS Using DOUBLEGUARD in Multitier Web Application</a>
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
				<li class="current_page_item"><a href="userHome.jsp">Home</a></li>

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
							<a href="#">User Login <img src="icons/user_go.png"
								height="20" width="20"></img></a>
						</h2>
					</div>
					<div class="entry">
						<table width="100%">
							<tr>
								<td>Name</td>
								<td>Gender</td>
								<td>E-Mail</td>
							</tr>
							<%
								try {

									Connection con = DbConnector.getConnection();
									PreparedStatement pstm = null;

									String sql = "select * from user";

									pstm = con.prepareStatement(sql);
									ResultSet rs = pstm.executeQuery();
									while (rs.next()) {
							%>
							<tr>
								<td><%=rs.getString("user")%></td>
								<td><%=rs.getString("gender")%></td>
								<td><%=rs.getString("email")%></td>
							</tr>
							<%
								}
								} catch (Exception e) {
									e.printStackTrace();

								}
							%>
						</table>
					</div>

				</div>
			</div>
			<!-- end content -->
			<!-- start sidebar -->
			<div id="sidebar">
				<img src="images/padlock.jpg" alt="" width="112" height="112"
					class="left" />
			</div>
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
