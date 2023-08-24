package com.phoenix.portfolio;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.phoenix.action.ActionForward;
import com.phoenix.resumes.ResumesAction;

@WebServlet("*.pf")
public class FrontController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		
			String requestURI = request.getRequestURI();
			ActionForward forward = null;
					
			if( requestURI.equals("/portfolio/portfolio.pf") ) {
				forward = new PortfolioAction().execute(request, response);
			} 
			
			// 전송에 대한 일괄처리
			if( forward != null ) {
				if( forward.isRedirect() ) {	
					// true : redirect
					response.sendRedirect(forward.getPath());
				} else {
					// false : forward
					RequestDispatcher disp 
						= request.getRequestDispatcher(forward.getPath());
					disp.forward(request, response);
				}
			}
		
	}
	
}
