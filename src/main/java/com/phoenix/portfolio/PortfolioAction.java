package com.phoenix.portfolio;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.phoenix.action.Action;
import com.phoenix.action.ActionForward;
import com.phoenix.user.dao.UserDTO;

public class PortfolioAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse resp) {
		HttpSession session = request.getSession();
	    UserDTO member = (UserDTO) session.getAttribute("session_member");
	    
	    String userid = member.getUserid();
	    PortfolioDTO portfolio = new PortfolioDTO(
	    		request.getParameter("ptitle"),
	    		request.getParameter("pcontents"), 
	    		request.getParameter("purl"), 
	    		request.getParameter("ppath"), 
	    		member.getUserid());
	    
	    ActionForward forward = new ActionForward();
	    
	    PortfolioDAO pdao = new PortfolioDAO();
	    
	    if(pdao.saveDB(portfolio)) {
			forward.setPath("/portfolio/finished.jsp");
			forward.setRedirect(true);
		} else {
			forward.setPath("/index.jsp");
			forward.setRedirect(true);
		}
	    
		return null;
	}

}
