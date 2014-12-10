<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Double Guard</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="default1.css" rel="stylesheet" type="text/css" media="screen" />
    <style type="text/css">
<!--
body,td,th {
	font-family: Times New Roman, Times, serif;
}
h1 {
	color: #FFFFFF;
}
h2 {
	color: #FFFFFF;
}
h3 {
	color: #FFFFFF;
}
.style2 {font-size: 16pt}
-->
    </style></head>
    <body>
        <!-- start header -->
        <div id="wrapper">
            <div id="header">
                <div class="style2" id="logo">
                    <h1 align="justify"><a href="#"> Double Guard Detecting Intrusions in Multitier Web Applications</a></h1>		
                    <div align="center">
                      <!--<p><span>DoubleGuard Detecting Intrusions in Multitier Web Applications</span></p> -->                
                        </div>
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
                    <li class="current_page_item"><a href="index.jsp">Login</a></li>
                    <li><a href="newProfile.jsp">New User</a></li>						
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
                            <h2><a href="#">User Login <img src="icons/user_go.png" height="20" width="20"></img></a></h2>				
                        </div>
                        <div class="entry">
                            <%if (request.getParameter("msg") != null) {
                                    out.print("<img src='icons/exclamation.png'></img>");
                                    out.println("<span id='err'>" + request.getParameter("msg")+ "</span>"); 
									out.print("<img src='icons/exclamation.png'></img>");									
                                }%>
                                <h2>Login <img src="icons/building_key.png" height="20" width="20"></img></h2>                                
                            <form name="" action="UserLogin" method="post">
                                <table width="100%">
                                    <tr><td>User Id:</td><td><input type="text" size="30"  id="name_" name="name_"/></td></tr>
                                    <tr><td>Password:</td><td><input type="password" size="30"  id="password" name="password"/></td></tr>                                
                                    <tr><td><br/></td></tr>
                                    <tr><td></td><td><input type="submit" value="Login" style="background-color: #F78117;height: 30px;width: 90px;"/></td></tr>
									<tr><td>Enable SQL Guard</td><td><input type="checkbox" name="enableSQLGuard" value="true" checked="checked"/></td></tr>
                                </table>
                            </form>
                        </div>

                    </div>
                </div>
                <!-- end content -->
                <!-- start sidebar -->
                <div id="sidebar">
                    <img src="images/padlock.jpg" alt="" width="112" height="112" class="left" />
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
