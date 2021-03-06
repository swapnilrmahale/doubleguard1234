
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
<title>DoubleGuard : Grid</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default1.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="css/reveal.css" rel="stylesheet" type="text/css"
	media="screen" />

<link rel="stylesheet" href="css/jquery-ui.css"/>
<link rel="stylesheet" href="css/ui.jqgrid.css"/>

<script src="js/jquery-1.6.min.js" type="text/javascript"></script>
<script src="js/jquery.reveal.js" type="text/javascript"></script>

<script src="js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid.src.js" type="text/javascript"></script>
<script src="js/jquery-ui.js" type="text/javascript"></script>

<script src="js/piechart.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$("#flip").click(function() {
			$("#panel").slideToggle("slow");
		});

		loadGrid();
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
		<!-- end header -->
		<!-- star menu -->
		<div id="menu">
			<ul>
				<li><a href="Logout">Log Out</a></li>
				<li class="current_page_item"><a href="userHome.jsp">Home</a></li>
				<li><a href="upgradePre.jsp">Trigger</a></li>
				<%
					if ("admin".equals(request.getSession().getAttribute("userid"))) {
				%>
				<li><a href="handleReport.jsp">Reports</a></li>
				<li><a href="handleGrid.jsp">Grid</a></li>
				<%
					}
				%>
			</ul>
		</div>
		<!-- end menu -->
		<!-- start page -->
		<div id="page">

			<table id="list">
				<tr>
					<td />
				</tr>
			</table>
			<div id="pager"></div>

			<!-- start ads -->

			<!-- end ads -->
			<!-- start content -->
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
