<%@page import="com.phoenix.portfolio.PortfolioDAO"%>
<%@page import="com.phoenix.user.dao.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UserDTO userinf = (UserDTO)session.getAttribute("session_member");
String userid = userinf.getUserid();

String pnum = (String)request.getParameter("pnum");
System.out.println("별pnum : "+pnum);
PortfolioDAO pdao = new PortfolioDAO();
pdao.delDB(userid, pnum);

%>

<script>
location.href="/portfolio/loadDB.jsp";
</script>