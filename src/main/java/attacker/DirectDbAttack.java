/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package attacker;

import java.net.*;
import java.io.*;
import java.util.Date;

class DirectDbAttack {

    public static String GetInfo() {
        String res="";
        try{
        int c;
        URL hp = new URL("http://localhost:8080/doubleGaurd/index.jsp");
        URLConnection hpCon = hp.openConnection();
        System.out.println("Date: " + new Date(hpCon.getDate()));
        System.out.println("Content-Type: "
                + hpCon.getContentType());
        System.out.println("Expires: " + hpCon.getExpiration());
        System.out.println("Last-Modified: "
                + new Date(hpCon.getLastModified()));
        int len = hpCon.getContentLength();
        System.out.println("Content-Length: " + len);
        if (len > 0) {
            System.out.println("=== Content ===");
            InputStream input = hpCon.getInputStream();
            int i = len;

            while (((c = input.read()) != -1) && (i > 0)) {
                res=res + ((char) c);
            }
            input.close();
        } else {
            res="No Response Available";
            //System.out.println("No Content Available");
        }
        }catch(Exception e){
            res="Your Request Is Invalidated";
        }
        return res;
    }
}