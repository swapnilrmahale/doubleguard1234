package com.util;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 *
 * @author swapper
 */

   public class Utilities {
    public static ResultSet executeSqlQuery(Connection conn,String sql) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            System.out.println(sql);
            pst = (PreparedStatement) conn.prepareStatement(sql);
            rs = pst.executeQuery();
            //System.out.println("xxxxxxxxxxxxxxxxx"+rs.next());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    public static int updateSqlQuery(Connection conn,String sql) {
        PreparedStatement pst = null;
        int a=0;
        try {
            System.out.println(sql);
            pst = (PreparedStatement) conn.prepareStatement(sql);
            a=pst.executeUpdate();
            //System.out.println("xxxxxxxxxxxxxxxxx"+rs.next());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }
    
    public static Date parseDate(String dateStr, String format) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            // sdf.setLenient( false );
            return sdf.parse(dateStr);
        } catch (ParseException pe) {
            pe.printStackTrace();
            return null;
        }
    }

    public static String formatDate(Date date, String format) {
        if (date == null) {
            return "";
        }
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }
}
