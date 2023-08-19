<%@page import="com.phoenix.action.ActionForward"%>
<%@page import="com.phoenix.portfolio.PortfolioDAO"%>
<%@page import="com.phoenix.portfolio.PortfolioDTO"%>
<%@page import="com.phoenix.user.dao.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
UserDTO userinf = (UserDTO)session.getAttribute("session_member");
String userid = userinf.getUserid();

PortfolioDTO pDto = new PortfolioDTO();

PortfolioDAO pDao = new PortfolioDAO();

PortfolioDTO[] portfolios = pDao.loadDB(userid);

session.setAttribute("arrPortfol", portfolios);


%>

<script>
location.href="/portfolio/portfolio.jsp";
</script>