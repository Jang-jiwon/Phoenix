<%@page import="com.phoenix.portfolio.PortfolioDTO"%>
<%@page import="com.phoenix.portfolio.PortfolioDAO"%>
<%@page import="com.phoenix.user.dao.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UserDTO userinf = (UserDTO)session.getAttribute("session_member");
String userid = userinf.getUserid();
String pnum = request.getParameter("pnum");

PortfolioDAO pdao = new PortfolioDAO();
PortfolioDTO pdto = new PortfolioDTO(pnum,"","","","", userid);


session.setAttribute("portfolios", pdto);

%>
<script>
location.href ="/portfolio/add.jsp?pnum="+"<%=pnum%>";
</script>