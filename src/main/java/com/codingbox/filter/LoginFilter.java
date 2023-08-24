package com.codingbox.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.phoenix.user.dao.UserDTO;


@WebFilter("/*")
public class LoginFilter implements Filter{
	
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) arg0;
	    HttpSession session = httpRequest.getSession();
	    String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
	    
	    if (path.startsWith("/login") || path.startsWith("/join") || path.equals("/") || path.startsWith("/menu") || path.endsWith("js") || path.endsWith("css")) {
	    	arg2.doFilter(arg0, arg1);		    
	    }else {
	    	if((UserDTO)session.getAttribute("session_member")==null) {
	    		System.out.println("로그아웃된 상태로 접근 : " + path);
	    		((HttpServletResponse) arg1).sendRedirect("/");
	    	}else {
	    		arg2.doFilter(arg0, arg1);	
	    	}
	    }
	}
}
