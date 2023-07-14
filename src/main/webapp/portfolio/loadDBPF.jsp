<%@page import="com.phoenix.portfolio.PortfolioDTO"%>
<%@page import="com.phoenix.user.dao.UserDTO"%>
<%@page import="com.phoenix.user.dao.UserDAO"%>
<%@page import="com.phoenix.portfolio.PortfolioDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pnum = request.getParameter("pnum");
	UserDTO userinf = (UserDTO)session.getAttribute("session_member");
	PortfolioDAO pdao = new PortfolioDAO( );
	PortfolioDTO pdto = pdao.loadDB2(userinf.getUserid(),pnum);
// 	System.out.println("=====================pdto.getPtitle() :"+pdto.getPurl()+"==================");
	session.setAttribute("portfolios", pdto);
%>
<script>
location.href ="/portfolio/add.jsp?pnum=" + <%=pnum %>;
</script>