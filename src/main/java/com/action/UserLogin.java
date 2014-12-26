/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.action.ids.IntrusionDetector;
import com.action.reporting.Reporter;
import com.util.Constants;
import com.util.LoginProcessor;

/**
 *
 * @author swapper
 */
public class UserLogin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String COOKIE_NAME = "JSESSIONID";

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
		try {
			HttpSession session = request.getSession();

			String username = request.getParameter("name_");
			String password = request.getParameter("password");
			// Input for enabling Intrusion detector for SQL Injection
			Boolean isEnableSQL = new Boolean(
					request.getParameter("enableSQLGuard"));
			System.out.println(isEnableSQL);

			// SQL Injection Layer
			if (isEnableSQL
					&& IntrusionDetector.isSqlInjection(username, password)) {
				Reporter.logAttack(request, "SQL Injection");
				response.sendRedirect("index.jsp?msg=Attempt of SQL Injection");
			}

			if ("admin".equals(username) && "admin".equals(password)) {

				String currentSessionId = request.getSession().getId()
						.toUpperCase();
				if (Constants.sesWeb.get(currentSessionId) == null) {
					Constants.sesWeb.put(currentSessionId, "admin");
					System.out.println(request.getParameterNames().toString());
					Constants.dbreq.put(currentSessionId, request
							.getParameterNames().toString());
					
					session.setAttribute("userid", username);
					session.setAttribute("login", "true");
					session.setAttribute("user", "true");
					session.setAttribute("role", "admin");

					response.sendRedirect("userHome.jsp");
				} else {
					Reporter.logAttack(request, "Session Hijack");
					response.sendRedirect("index.jsp?msg=Attempt of Session Hijacking for session id "
							+ currentSessionId);
				}

			}
			if (LoginProcessor.getUserDetails(username, password)) {
				
				session.setAttribute("userid", username);
				session.setAttribute("login", "true");
				session.setAttribute("user", "true");

				String currentSessionId = request.getSession().getId()
						.toUpperCase();
				System.out.println("Map : Before : " + Constants.sesWeb);
				System.out.println("Current Session Id : " + currentSessionId);
				if (Constants.sesWeb.get(currentSessionId) == null) {
					
					Constants.sesWeb.put(currentSessionId, "user");
					Constants.dbreq.put(currentSessionId, request
							.getParameterNames().toString());
					System.out.println("Map : First Request : " + Constants.sesWeb);
					response.sendRedirect("userHome.jsp");

				} else {
					Reporter.logAttack(request, "Session Hijack");
					response.sendRedirect("index.jsp?msg=Attempt of Session Hijacking for session id "
							+ currentSessionId);
				}
			}
			response.sendRedirect("index.jsp?msg=You are NOT Authorised User");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

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
	}
}
