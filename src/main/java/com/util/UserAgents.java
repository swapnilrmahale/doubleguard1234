/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author swapper
 * @
 */
public class UserAgents {

    public static boolean getBrowserInfo(String Information) {
    	System.out.println(Information);
        Map<String, String> KeyPair = new HashMap<String, String>();
        KeyPair.put("HTTP_USER_AGENT", Information);
        String browsername = "";
        String browserversion = "";
        String browser = Information;
        if (browser.contains("MSIE")) {
            String subsString = browser.substring(browser.indexOf("MSIE"));
            String Info[] = (subsString.split(";")[0]).split(" ");
            browsername = Info[0];
            browserversion = Info[1];
            //System.out.println("Request is coming from browser : " + browsername + " Version : " + browserversion);
            return true;
        } else if (browser.contains("Firefox")) {

            String subsString = browser.substring(browser.indexOf("Firefox"));
            String Info[] = (subsString.split(" ")[0]).split("/");
            browsername = Info[0];
            browserversion = Info[1];
            //System.out.println("Request is coming from browser : " + browsername + " Version : " + browserversion);
            return true;

        } else if (browser.contains("Chrome")) {

            String subsString = browser.substring(browser.indexOf("Chrome"));
            String Info[] = (subsString.split(" ")[0]).split("/");
            browsername = Info[0];
            browserversion = Info[1];
            //System.out.println("Request is coming from browser : " + browsername + " Version : " + browserversion);
            return true;

        } else if (browser.contains("Opera")) {

            String subsString = browser.substring(browser.indexOf("Opera"));
            String Info[] = (subsString.split(" ")[0]).split("/");
            browsername = Info[0];
            browserversion = Info[1];
            //System.out.println("Request is coming from browser : " + browsername + " Version : " + browserversion);
            return true;

        } else if (browser.contains("Safari")) {

            String subsString = browser.substring(browser.indexOf("Safari"));
            String Info[] = (subsString.split(" ")[0]).split("/");
            browsername = Info[0];
            browserversion = Info[1];
            //System.out.println("Request is coming from browser : " + browsername + " Version : " + browserversion);
            return true;

        } else {
        	//System.out.println("Request is coming from Unknown Client Application");
            return false;
        }

    }
}
