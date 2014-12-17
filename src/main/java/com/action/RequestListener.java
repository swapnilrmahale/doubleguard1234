/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.util.UserAgents;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author swapper
 */
public class RequestListener implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
       // throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	//ServletContext context= request.getServletContext();
    	HttpServletRequest _r = (HttpServletRequest) request;

    	String requestUrl = _r.getRequestURL().toString();
    	//System.out.println("Request URL: " + requestUrl);
    	
    	String sessionId = _r.getSession().getId();
        //System.out.println("Session Id : "+ sessionId);
        
        String userAgentInfo = _r.getHeader("User-Agent");
        Boolean isValidUserAgent = UserAgents.getBrowserInfo(userAgentInfo);
//        System.out.println("Valid User Agent : "+isValidUserAgent + "\n");
      
        if(!isValidUserAgent){
              PrintWriter out = response.getWriter();
              out.write("You Can't Bypass web request directly to database");
        }
        
        //HttpSession session = ((HttpServletRequest) request).getSession();
        //RequestDispatcher rd= context.getRequestDispatcher("/index.jsp");
        //rd.forward(request, response);

        else{
            chain.doFilter(request, response);
        }
       // throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void destroy() {
        //throw new UnsupportedOperationException("Not supported yet.");
    }

    
}
