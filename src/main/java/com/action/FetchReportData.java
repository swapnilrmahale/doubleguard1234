package com.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.util.DbConnector;

public class FetchReportData extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	 PreparedStatement pst = null;
     Connection conn = null;
     String sql = "";
     
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doDelete(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		processRequest(req, resp);
	}

	@Override
	protected void doHead(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doHead(req, resp);
	}

	@Override
	protected void doOptions(HttpServletRequest arg0, HttpServletResponse arg1)
			throws ServletException, IOException {
		super.doOptions(arg0, arg1);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doPost(req, resp);
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doPut(req, resp);
	}

	@Override
	protected void doTrace(HttpServletRequest arg0, HttpServletResponse arg1)
			throws ServletException, IOException {
		super.doTrace(arg0, arg1);
	}

	@Override
	protected long getLastModified(HttpServletRequest req) {
		return super.getLastModified(req);
	}

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
			throws ServletException, IOException {
		super.service(arg0, arg1);
	}

	@Override
	public void service(ServletRequest req, ServletResponse res)
			throws ServletException, IOException {
		super.service(req, res);
	}

	@Override
	public void destroy() {
		super.destroy();
	}

	@Override
	public String getInitParameter(String name) {
		return super.getInitParameter(name);
	}

	@Override
	public Enumeration<String> getInitParameterNames() {
		return super.getInitParameterNames();
	}

	@Override
	public ServletConfig getServletConfig() {
		return super.getServletConfig();
	}

	@Override
	public ServletContext getServletContext() {
		return super.getServletContext();
	}

	@Override
	public String getServletInfo() {
		return super.getServletInfo();
	}

	@Override
	public String getServletName() {
		return super.getServletName();
	}

	@Override
	public void init() throws ServletException {
		super.init();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	@Override
	public void log(String msg) {
		super.log(msg);
	}

	@Override
	public void log(String message, Throwable t) {
		super.log(message, t);
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}

	@Override
	public boolean equals(Object obj) {
		return super.equals(obj);
	}

	@Override
	protected void finalize() throws Throwable {
		super.finalize();
	}

	private void processRequest(HttpServletRequest _req, HttpServletResponse _res) {
		String rType = _req.getParameter("rtype");
		JSONObject reportData = null;
		switch (rType) {
		case "pieos":
			try {
				reportData = getPieOSData();
			} catch (SQLException | JSONException e) {
				System.err.println("Error while fetching data for Pie Chart of No Of Attack Vs. OS");
				e.printStackTrace();
			}
			break;
		case "pieattack":
			try {
				reportData = getPieAttackData();
			} catch (SQLException | JSONException e) {
				System.err.println("Error while fetching data for Pie Chart of No Of Attack Vs. OS");
				e.printStackTrace();
			}
			break;
		case "bar":
			reportData = getBarData();
			break;
		default:
			System.out.println(rType + " is not a valid report");
		}
		_res.setContentType("application/json");
		if (reportData != null) {
			try {
				_res.getWriter().write(reportData.toString());
			} catch (IOException exception) {
				System.err.println("Error while wrting data to response...");
			}
		} else {
			System.err.println("Error while fetching data from DB..");
		}
	}

	private JSONObject getPieOSData() throws SQLException, JSONException {
		conn = DbConnector.getConnection();
		sql = "SELECT os, COUNT(*) count FROM attack_data GROUP BY os";
        
		pst = (PreparedStatement) conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        JSONObject pieOSReportData = new JSONObject();
        JSONArray records = new JSONArray();
        
        String osName = "";
        Integer noOfAttacks = null;
        JSONObject touple = null;
        
        while (rs.next()) {
        	osName = rs.getString("os");
        	noOfAttacks = rs.getInt("count");
        	touple = new JSONObject();
        	touple.put("os", osName);
        	touple.put("attacks", noOfAttacks);
        	
        	records.put(touple);
        }
        pieOSReportData.put("data", records);
		return pieOSReportData;
	}
	
	private JSONObject getPieAttackData() throws SQLException, JSONException {
		conn = DbConnector.getConnection();
		sql = "SELECT attack, COUNT(*) count FROM attack_data GROUP BY attack";
        
		pst = (PreparedStatement) conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        JSONObject pieAttackReportData = new JSONObject();
        JSONArray records = new JSONArray();
        
        String attackName = "";
        Integer noOfAttacks = null;
        JSONObject touple = null;
        
        while (rs.next()) {
        	attackName = rs.getString("attack");
        	noOfAttacks = rs.getInt("count");
        	touple = new JSONObject();
        	touple.put("attack", attackName);
        	touple.put("number", noOfAttacks);
        	
        	records.put(touple);
        }
        pieAttackReportData.put("data", records);
		return pieAttackReportData;
	}
	
	private JSONObject getBarData() {
		return null;
	}
	
	@Override
	public int hashCode() {
		return super.hashCode();
	}

	@Override
	public String toString() {
		return super.toString();
	}

}
