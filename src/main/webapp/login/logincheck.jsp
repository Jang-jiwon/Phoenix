<%@page import="com.phoenix.user.dao.UserDTO"%>
<%@page import="com.phoenix.user.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		UserDAO mdao = new UserDAO();
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		
		UserDTO member = mdao.login(userid, userpw);
		
		if(member != null){
			// 로그인 성공 
			session.setAttribute("session_member", member);
	%>
		<script>
			alert("로그인 성공");
			location.href ="/portfolio/loadDB.jsp";
		</script>
	<%} else { // 로그인 실패 %>
		<script>
			alert("아이디 또는 패스워드를 확인해 주세요");
			location.href ="/login/login.jsp";
		</script>
	
	<%} %>
