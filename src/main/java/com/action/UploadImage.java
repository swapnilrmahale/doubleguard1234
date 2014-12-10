/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.util.DbConnector;

/**
 *
 * @author swapper
 */
public class UploadImage extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File tmpDir;

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
        /*
         *Set the size threshold, above which content will be stored on disk.
         */
        fileItemFactory.setSizeThreshold(1 * 1024 * 1024); //1 MB
		/*
         * Set the temporary directory to store the uploaded files of size above threshold.
         */
        fileItemFactory.setRepository(tmpDir);

        ServletFileUpload uploadHandler = new ServletFileUpload(fileItemFactory);
        Connection con = null;
        PreparedStatement pstm = null;
        try {
            /*
             * Parse the request
             */
            con = DbConnector.getConnection();
            List<FileItem> items = uploadHandler.parseRequest(request);
            Iterator<FileItem> itr = items.iterator();
            String sql = "insert into share(userid,image,title,tag,descr,visible,filename,date) values(?,?,?,?,?,?,?,now())";
            pstm = con.prepareStatement(sql);
            pstm.setString(1, request.getSession().getAttribute("userid") + "");
            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                if (item.isFormField()) {
                    System.out.println(".>>>>>>>>>>>>>>>>>>>>>>>>"+item.getFieldName());
                    if (item.getFieldName().equals("tag")) {
                        pstm.setString(4, item.getString());
                    }
                    if (item.getFieldName().equals("desc")) {
                        pstm.setString(5, item.getString());
                    }
                    if (item.getFieldName().equals("title")) {
                        pstm.setString(3, item.getString());

                    }
                    if (item.getFieldName().equals("visible")) {
                        pstm.setString(6, item.getString());
                    }
                } else {
                    System.out.println(">>>>>>>>>>>>>>>>>>>>else"+item.getFieldName());
                    pstm.setBinaryStream(2, item.getInputStream(), item.getSize());
                    pstm.setString(7, item.getName());
                    pstm.executeUpdate();
                   
                }
                System.out.println(">>>>>"+sql);
                
            }
                        response.sendRedirect("uploadImage.jsp?msg=Uploaded Successfully");

        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("uploadImage.jsp?msg=Check the field");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
