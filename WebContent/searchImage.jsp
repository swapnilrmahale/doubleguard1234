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
<!--

Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Title      : Night Vision
Version    : 1.0
Released   : 20080119
Description: Three-column blog design with the third column allocated for ads. Features Web 2.0 design ideal for 1024x768 resolutions.

-->
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Double Guard</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="default1.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <body>
        <!-- start header -->
        <div id="wrapper">
            <div id="header">
                <div id="logo">
                    <h1><a href="#">IDS Using DOUBLEGUARD in Multitier Web Application</a></h1>		
                    <!--<p><span>DoubleGuard Detecting Intrusions in Multitier Web Applications</span></p> -->                
                </div>	
                <div id="search">
                    <form id="searchform" method="get" action="">
                        <fieldset>
                            <input type="text" name="s" id="s" size="15" value="" />
                            <input type="submit" id="x" value="Search" />
                        </fieldset>
                    </form>
                </div>
            </div>
            <!-- end header -->
            <!-- star menu -->
            <div id="menu">
                <ul>
                    <li class="current_page_item"><a href="userHome.jsp">Home</a></li>

                    <li><a href="Logout">Log Out</a></li>						
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
                            <h2><a href="#">Search Image</a></h2>				
                        </div>
                        <div class="entry">
                            <%if (request.getParameter("msg") != null) {
                                    out.println(request.getParameter("msg"));
                                }%>
                            <form name="" action="NewUser" method="post">
                                <table>

                                    <%
                                        Connection con = DbConnector.getConnection();
                                        PreparedStatement pstm = null;
                                        String sql = "select * from share where visible='yes' and tag='" + request.getParameter("tag") + "'";
                                        System.out.println(">>>>>>>>>" + sql);
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
                                        while (rs.next()) {
                                            System.out.println(">In while..");
                                            String len1 = rs.getString("image");
                                            int len = len1.length();
                                            byte[] b = new byte[len];
                                            in = rs.getBinaryStream("image");
                                            int index = in.read(b, 0, len);
                                            String putFile = request.getRealPath(request.getContextPath()).substring(0, request.getRealPath(request.getContextPath()).lastIndexOf(File.separator) + 1) + "images" + File.separator;
                                            File file = new File(putFile + rs.getString("filename"));
                                            logo = rs.getString("filename");
                                            if (file.exists()) {
                                                file.delete();
                                            }
                                            OutputStream outImej = new FileOutputStream(file);
                                            while (index != -1) {
                                                outImej.write(b, 0, index);
                                                index = in.read(b, 0, len);
                                                System.out.println(index);
                                                System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>" + outImej);
                                            }
                                            outImej.close();
                                            i++;
                                    %>
                                    <tr><td><a href="viewImage.jsp?id=<%=rs.getString("userid")%>"><img src="images/<%=logo%>" style="width: 100px;height: 100px;"></td><td>&nbsp;&nbsp;&nbsp;&nbsp;Posted by :&nbsp;&nbsp;<%=rs.getString("userid")%></td><td>&nbsp;&nbsp;Posted Date<%=rs.getString("date")%></td></tr>
                                                    <%
                                                        }%>
                                                    </table>
                                                    </form>
                                                    </div>

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
