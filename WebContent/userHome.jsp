
<%
	if (request.getSession().getAttribute("login") == null) {
		response.sendRedirect("index.jsp?msg=Please Login");
	}
%>
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
<title>DoubleGuard Detecting Intrusions in Multitier Web
	Applications</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default1.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="css/reveal.css" rel="stylesheet" type="text/css"
	media="screen" />
<script type="text/javascript" src="js/jquery.reveal.js"></script>
<script type="text/javascript" src="js/jquery-1.6.min.js"></script>
<%
	System.out.println("Session ID=" + session.getId());
%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#flip").click(function() {
			$("#panel").slideToggle("slow");
		});
	});
</script>
<style type="text/css">
#panel, #flip {
	padding: 5px;
	text-align: center;
	background: #000000 url(images/img12.jpg) repeat top left;
	color: #ffffff;
}

#panel {
	padding: 10px;
	display: none;
}
</style>
</head>
<body>
	<!-- start header -->
	<div id="wrapper">
		<div id="header">
			<div id="logo">
				<h1>
					<a href="#">DoubleGuard Detecting Intrusions in Multitier Web
						Applications</a>
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
		<!-- end header -->
		<!-- star menu -->
		<div id="menu">
			<ul id="menuList">
				<li><a href="Logout">Log Out</a></li>
				<li class="current_page_item"><a href="userHome.jsp">Home</a></li>
				<li><a href="upgradePre.jsp">Trigger</a></li>
				<%
					if (request.getSession().getAttribute("role") == "admin") {
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
					<div class="title"></div>
					<div class="entry">
						<%
							if (request.getParameter("msg") != null) {
								out.println(request.getParameter("msg"));
							}
						%>
						<form name="" action="NewUser" method="post">
							<table>

								<%
									Connection con = DbConnector.getConnection();
									PreparedStatement pstm = null;
									String sql = "select * from profile where userid='"
											+ session.getAttribute("userid") + "'";
									pstm = con.prepareStatement(sql);
									ResultSet rs = pstm.executeQuery();
									int returnValue = 0;
									InputStream in = null;
									OutputStream os = null;
									Blob blob = null;
									String text;
									String logo = "";
									//text = request.getParameter("text");
									int i = 1;
									if (rs.next()) {
										String len1 = rs.getString("photo");
										int len = len1.length();
										byte[] b = new byte[len];
										in = rs.getBinaryStream("photo");
										int index = in.read(b, 0, len);
										String putFile = request.getRealPath(request.getContextPath())
												.substring(
														0,
														request.getRealPath(request.getContextPath())
																.lastIndexOf(File.separator) + 1)
												+ "images" + File.separator;
										File file = new File(putFile + rs.getString("filename"));
										logo = rs.getString("filename");
										System.out.println("Logo: " + logo);
										if (file.exists()) {
											file.delete();
										} else {
											OutputStream outImej = new FileOutputStream(file);
											while (index != -1) {
												outImej.write(b, 0, index);
												index = in.read(b, 0, len);
												System.out.println("In else..");
												System.out.println(index);
												System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>"
														+ outImej);
											}
											outImej.close();
											i++;
										}
									} else {

										logo = "images/default.jpg";
									}
								%>
								<tr>
									<td><h3>Blog</h3></td>
								</tr>
								<tr>
									<td><b>Welcome &nbsp;&nbsp;<%=request.getSession().getAttribute("userid")%>,
									</b></td>
								</tr>

								<tr>
									<td><img src="images/<%=logo%>" alt="" width="112"
										height="112" /></td>
								</tr>
							</table>
						</form>
						<h2>Search Image Here</h2>
						<form action="searchImage.jsp" method="post">
							Search:&nbsp;&nbsp
							<input type="text" id="tag" name="tag" />
							<br />
							<br />
							<br />
							<input type="submit" value="Search"
								style="background-color: #F78117; height: 35px; width: 90px;">
						</form>
					</div>

				</div>
			</div>
			<!-- end content -->
			<!-- start sidebar -->
			<div id="sidebar">
				<%
					sql = "select * from user where user='"
							+ session.getAttribute("userid") + "'";
					pstm = con.prepareStatement(sql);
					rs = pstm.executeQuery();
					if (rs.next()) {
				%>
				<ul>
					<li id="categories">
						<h2>My Profile</h2>
						<ul>
							<li>Email: <%=rs.getString("email")%>
							</li>
							<li>Gender: <%=rs.getString("gender")%>
							</li>
						</ul> <%
 	}
 %>
					</li>
					<li>
						<h2>Site Navigation</h2>
						<ul>
							<li><a href="profileImage.jsp">Change Profile Image</a></li>
							<li><a href="gallery.jsp">My Gallery</a></li>
							<li><a href="uploadImage.jsp">Upload</a></li>
							<li><a href="#">Contact Us</a></li>
						</ul>
					</li>
				</ul>
				<a name="contact">
					<div id="flip">
						<a href="#contact">Click Here to Contact Us:</a>
					</div>
					<div id="panel">
						JPInfotech Research and Development,<br />
					</div>
				</a>
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
