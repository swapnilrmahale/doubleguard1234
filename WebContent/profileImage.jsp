<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("index.jsp?msg=Please Login");
    }

%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Double Guard</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="default.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <body>
        <!-- start header -->
        <div id="wrapper">
            <div id="header">
                <div id="logo">
                    <h1><a href="#"> DoubleGuard Detecting Intrusions in Multitier Web Applications</a></h1>		
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
                    <li><a href="userHome.jsp">Home</a></li>
                    <li class="current_page_item"><a href="#">Update Profile</a></li>
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
                            <h2><a href="#">User Login</a></h2>				
                        </div>
                        <div class="entry">
                            <%if (request.getParameter("msg") != null) {
                                    out.println(request.getParameter("msg"));
                                }%>
                            <h2>Update Profile</h2>
                            <form name="" action="ProfileImage" method="post" enctype="multipart/form-data">
                                <table>
                                    <tr><td>Choose File</td><td><input type="file" size="30"  id="file" name="file"/></td></tr>
                                    <tr>
                                        <td></td><td><input type="submit" value="Update" style="background-color: #F78117;height: 25px;width: 90px;"/></td></tr>

                                </table>
                            </form>                        </div>
                        <p class="links"> </p>
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
