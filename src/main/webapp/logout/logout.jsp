<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<%
	session.invalidate();
// 		session.removeAttribute("session_member");
		// session.invalidate();
		response.sendRedirect("/login/login.jsp");
	%>
	<script >
// 	sessionStorage.removeItem("tableNum");
	sessionStorage.clear();
	</script>
</body>
<script src="/header.js"></script>

</html>