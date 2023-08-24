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
	    		request.getParameter("pnum"),
	    		request.getParameter("ptitle"),
	    		request.getParameter("pcontents"), 
	    		request.getParameter("purl"), 
	    		request.getParameter("ppath"), 
	    		userid);
	    ActionForward forward = new ActionForward();
	    PortfolioDAO pdao = new PortfolioDAO();
	    boolean re = pdao.saveDB(portfolio);
	    
	    if(re) {
//	    	System.out.println("시발:"+portfolio.getPnum());
			forward.setPath("/portfolio/loadDB.jsp");
			forward.setRedirect(true);
		} else {
			forward.setPath("/main_view.jsp");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
