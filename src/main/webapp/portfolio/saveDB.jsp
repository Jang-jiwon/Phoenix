<%@page import="com.phoenix.user.dao.UserDTO"%>
<%@page import="com.phoenix.portfolio.PortfolioDAO"%>
<%@page import="com.phoenix.portfolio.PortfolioAction"%>
<%@page import="com.phoenix.portfolio.PortfolioDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("===================save====");
String ptitle = request.getParameter("ptitle"); //항목명
String pcontents = request.getParameter("pcontents"); //항목명
String purl = request.getParameter("purl"); //자소서 내용도 똑같이 가져와야함
System.out.println("========="+ptitle+"========="+pcontents+"====");

PortfolioDAO pdao = new PortfolioDAO();

UserDTO userinf = (UserDTO)session.getAttribute("session_member");
String userid = userinf.getUserid();

PortfolioDTO pfDto = new PortfolioDTO();
pfDto.setPtitle(ptitle);
pfDto.setPcontents(pcontents);
pfDto.setPurl(purl);
pfDto.setPpath("testPATH");
pfDto.setUserid(userid);

if(pdao.saveDB(pfDto)){
	//저장완료
	out.print("ok");//결과값을 자신을 부른 곳으로 넘겨주는
}else{
	//저장실패
	out.print("not-ok");
}
%>