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
        <title>Double Guard</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="default.css" rel="stylesheet" type="text/css" media="screen" />
        <script type="text/javascript">
            function update(){
                window.location.href="PostComment";
            }
            
        </script>
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
                            <h2><a href="#">Gallery</a></h2>				
                        </div>
                        <div class="entry">
                            <%if (request.getParameter("msg") != null) {
                                    out.println(request.getParameter("msg"));
                                }%>
                            <form name="" action="PostComment" method="post">
                                <h3>Search Result</h3>
                                <table border="0">

                                    <%
                                        Connection con = DbConnector.getConnection();
                                        PreparedStatement pstm = null;
                                        String sql = "select * from share where userid='" + request.getParameter("id") + "'";
                                        System.out.println("sql: "+sql);
                                        pstm = con.prepareStatement(sql);
                                        ResultSet rs = pstm.executeQuery();
                                        int returnValue = 0;
                                        InputStream in = null;
                                        OutputStream os = null;
                                        Blob blob = null;
                                        String text;
                                        String logo = "";
                                        String id = "";
                                        //text = request.getParameter("text");
                                        int i = 1;
                                        if (rs.next()) {
                                            id = rs.getString("userid");
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

                                        }%>
                                    <tr><td colspan="6"><img src="images/<%=logo%>" style="width: 200px;height: 200px;"></td></tr>
                                    <tr>
                                        <td>Comment<br/><input type="text" id="comment" name="comment"></td>
                                        <td><input type="radio" id="like" name="like" value="like"></td><td>Like</td>
                                        <td><input type="radio" id="like" name="like" value="unlike"></td><td>UnLike</td>
                                        <td><button onclick="update()"> Post</button></td>
                                    </tr>

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
