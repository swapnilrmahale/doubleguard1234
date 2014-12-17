/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.ids.IntrusionDetector;
import com.action.reporting.Reporter;
import com.util.DbConnector;

/**
 *
 * @author swapper
 */
public class NewProfile extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 * 
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Connection conn = null;
		PreparedStatement pst = null;
		try {
			conn = (Connection) DbConnector.getConnection();
			String name = request.getParameter("name_").trim();
			String password = request.getParameter("password").trim();
			String emailid = request.getParameter("emailid").trim();
			String sex = request.getParameter("sex");

			// Input for enabling Intrusion detector for XSS Attack
			Boolean isEnableXSS = new Boolean(
					request.getParameter("enableXSSGuard"));
			System.out.println(isEnableXSS);

			// Check If there any Attempt of XSS Attack
			if (isEnableXSS
					&& IntrusionDetector.isXSSAttack(name, password, emailid,
							sex)) {
				Reporter.logAttack(request, "XSS Attack");
				response.sendRedirect("index.jsp?msg=Attempt of XSS Attack");
				
			} else {
				if (name != null && name != "" && password != null
						&& password != "" && emailid != null && emailid != ""
						&& sex != "" && sex != null) {

					String sql = "insert into user values('" + name + "','"
							+ password + "','" + sex + "','" + emailid
							+ "',now())";
					System.out.println(sql);
					pst = (PreparedStatement) conn.prepareStatement(sql);
					int a = pst.executeUpdate();
					if (a > 0) {
						response.sendRedirect("index.jsp?msg=Registration Done");
					} else {
						response.sendRedirect("index.jsp?msg=UserId Already Exit");
					}
				} else {
					response.sendRedirect("newProfile.jsp?msg=Fill All The Fileds");
				}
			}

		} catch (Exception e) {
			response.sendRedirect("newProfile.jsp?msg=UserId Already Exit");
			e.printStackTrace();
		}
	}

	// <editor-fold defaultstate="collapsed"
	// desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 * 
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 * 
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 * 
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}
