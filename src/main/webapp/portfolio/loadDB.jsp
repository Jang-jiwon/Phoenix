<%@page import="com.phoenix.portfolio.PortfolioDAO"%>
<%@page import="com.phoenix.portfolio.PortfolioDTO"%>
<%@page import="com.phoenix.user.dao.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
System.out.println("=====================들아왓다개굴이==================");
UserDTO userinf = (UserDTO)session.getAttribute("session_member");
String userid = userinf.getUserid();

PortfolioDTO pDto = new PortfolioDTO();

PortfolioDAO pDao = new PortfolioDAO();

PortfolioDTO[] portfolios = pDao.loadDB(userid);



for(int i=0;i<portfolios.length;i++){
	System.out.println("=====================나간다개굴이==================");
// 	System.out.println("바뀐내용 : "+portfolios[i].getPpath());
 	out.print("/--/");
 	out.print(portfolios[i].getUserid());
 	out.print("&--&");
 	out.print(portfolios[i].getPnum());
 	out.print("&--&");
 	out.print(portfolios[i].getPtitle());
 	out.print("&--&");
 	out.print(portfolios[i].getPpath());
 	
 	
}
%>