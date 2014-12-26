package com.action.reporting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.util.DbConnector;

public class Reporter {

	public static void logAttack(HttpServletRequest request, String type) {
		// System.out.println("Start Reporting...");
		String ua = request.getHeader("User-Agent");
		String ra = request.getRemoteAddr();
		String rh = request.getRemoteHost();
		int rp = request.getRemotePort();
		String ru = request.getRemoteUser();
		// System.out.println("UA : " + ua + "\nRA : " + ra + "\nRH : " + rh + "\nRP : " + rp + "\nRU : " + ru);

		// if client behind firewall
		String ipAddress = request.getHeader("X-FORWARDED-FOR");
		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
		}
		// System.out.println("Client IP Address : " + ipAddress);
		String browserDetails = request.getHeader("User-Agent");
		String userAgent = browserDetails;
		String user = userAgent.toLowerCase();
		// System.out.println(user);
		String os = "";
		// =================OS=======================
		if (userAgent.toLowerCase().indexOf("windows") >= 0) {
			os = "Windows";
		} else if (userAgent.toLowerCase().indexOf("iphone") >= 0) {
			os = "IPhone";
		} else if (userAgent.toLowerCase().indexOf("mac") >= 0) {
			os = "Mac";
		} else if (userAgent.toLowerCase().indexOf("x11") >= 0) {
			os = "Unix";
		} else if (userAgent.toLowerCase().indexOf("android") >= 0) {
			os = "Android";
		} else {
			os = "UnKnown, More-Info: " + userAgent;
		}

		String browser = "";
		// ===============Browser===========================
		if (user.contains("msie")) {
			String substring = userAgent.substring(userAgent.indexOf("MSIE"))
					.split(";")[0];
			browser = substring.split(" ")[0].replace("MSIE", "IE") + "-"
					+ substring.split(" ")[1];
		} else if (user.contains("safari") && user.contains("version")) {
			browser = (userAgent.substring(userAgent.indexOf("Safari")).split(
					" ")[0]).split("/")[0]
					+ "-"
					+ (userAgent.substring(userAgent.indexOf("Version")).split(
							" ")[0]).split("/")[1];
		} else if (user.contains("opr") || user.contains("opera")) {
			if (user.contains("opera"))
				browser = (userAgent.substring(userAgent.indexOf("Opera"))
						.split(" ")[0]).split("/")[0]
						+ "-"
						+ (userAgent.substring(userAgent.indexOf("Version"))
								.split(" ")[0]).split("/")[1];
			else if (user.contains("opr"))
				browser = ((userAgent.substring(userAgent.indexOf("OPR"))
						.split(" ")[0]).replace("/", "-")).replace("OPR",
						"Opera");
		} else if (user.contains("chrome")) {
			browser = (userAgent.substring(userAgent.indexOf("Chrome")).split(
					" ")[0]).replace("/", "-");
		} else if ((user.indexOf("mozilla/7.0") > -1)
				|| (user.indexOf("netscape6") != -1)
				|| (user.indexOf("mozilla/4.7") != -1)
				|| (user.indexOf("mozilla/4.78") != -1)
				|| (user.indexOf("mozilla/4.08") != -1)
				|| (user.indexOf("mozilla/3") != -1)) {
			// browser=(userAgent.substring(userAgent.indexOf("MSIE")).split(" ")[0]).replace("/",
			// "-");
			browser = "Netscape-?";

		} else if (user.contains("firefox")) {
			browser = (userAgent.substring(userAgent.indexOf("Firefox")).split(
					" ")[0]).replace("/", "-");
		} else {
			browser = "UnKnown, More-Info: " + userAgent;
		}
		// System.out.println("OS : " + os);
		// System.out.println("Browser : " + browser);

		insertAttackRecord(type, ipAddress, browser, os, new Date());
	}

	private static void insertAttackRecord(String type, String ipAddress,
			String browser, String os, Date date) {
		PreparedStatement pst = null;
		Connection conn = null;
		String sql = "";
		try {
			conn = (Connection) DbConnector.getConnection();
			sql = "insert into attack_data (attack, ip, browser, os, time) values ('"
					+ type
					+ "', '"
					+ ipAddress
					+ "', '"
					+ browser
					+ "', '"
					+ os
					+ "', now() )";
			pst = (PreparedStatement) conn.prepareStatement(sql);
			pst.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
