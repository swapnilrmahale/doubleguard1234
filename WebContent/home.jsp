<%-- 
    Document   : home
    Created on : Aug 8, 2014, 10:27:14 PM
    Author     : swapper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="employee_upload_profile_image.jsp" method="post" enctype="multipart/form-data" name="form1" id="form1">
            <table>
            <tr>
                <td align="right"><b>Employee Image</b> </td>
                <td>
                    <input name="file" type="file" id="file">
                </td>

            </tr>
            <tr>
                <td align="right"></td>
                <td>
                    <input type="submit" name="Submit" value="Submit"/>
                </td>
            </tr>            
            </table>

        </form>

    </body>
</html>
