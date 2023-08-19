<%@page import="com.phoenix.coverletter.dao.CoverletterDTO"%>
<%@page import="com.phoenix.user.dao.UserDTO"%>
<%@page import="com.phoenix.coverletter.dao.CoverletterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String cnum = request.getParameter("cnum"); //항목명
UserDTO userinf = (UserDTO)session.getAttribute("session_member");
String userid = userinf.getUserid();

CoverletterDTO dto = new CoverletterDTO();
dto.setCnum(cnum);
dto.setUserid(userid);

CoverletterDAO mdao = new CoverletterDAO();

if(mdao.delCL(dto)){
	out.print("ok");
}else{
	out.print("no");
}


%>