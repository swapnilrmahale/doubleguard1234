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
                    <li><a href="userHome.jsp">Home</a></li>
                    <li class="current_page_item"><a href="#">Upload Image</a></li>
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
                        </div>
                        <div class="entry">
                            <%if (request.getParameter("msg") != null) {
                                    out.println(request.getParameter("msg"));
                                }%>
                            <h2>Upload</h2>
                            <form name="" action="UploadImage" method="post" enctype="multipart/form-data">
                                <table width="70%">

                                    <tr><td>Tag</td><td> <input name="tag" type="text" id="tag"/>    </td></tr>
                                    <tr><td>Title</td><td> <input name="title" id="title" type="text" />    </td></tr>
                                    <tr><td>Visible</td><td><input type="text" id="visible" name="visible" value="yes" /></td></tr>
                                    <tr><td>Description</td><td> <input name="desc" type="text" id="desc"/>    </td></tr>
                                    <tr><td>Image</td><td> <input name="file" type="file" id="file"/>    </td></tr>
                                    <tr><td></td><td> <input type="submit" value="Upload" style="background-color: #F78117;height: 25px;width: 90px;"/>    </td></tr>
                                </table>
                            </form>	                            

                        </div>
                        <p class="links"> </p>
                    </div>
                </div>
                <!-- end content -->
                <!-- start sidebar -->
                <!-- end sidebar -->
            </div>
            <!-- end page -->
            <!-- start footer -->
            		<a href="#" class="big-link" data-reveal-id="myModal">
			Fade and Pop
		</a>	
            <div id="footer">
                <p class="legal">&nbsp;</p>
            </div>
        </div>
        <!-- end footer -->
    </body>
</html>
