<%@page import="com.phoenix.coverletter.dao.CoverletterDAO"%>
<%@page import="com.phoenix.coverletter.dao.CoverletterDTO"%>
<%@page import="com.phoenix.user.dao.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UserDTO userinf = (UserDTO)session.getAttribute("session_member");
String userid = userinf.getUserid();


CoverletterDTO clDto = new CoverletterDTO();
clDto.setUserid(userid); 

CoverletterDAO mdao = new CoverletterDAO();

CoverletterDTO[] tableDB = mdao.loadDB(clDto);//데이터 로드

session.setAttribute("tableDB", tableDB);

%>
<script>
location.href="/cover_letter/coverLetter.jsp";
</script>