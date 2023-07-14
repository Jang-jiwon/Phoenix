<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EditPwFinish</title>
<style>


div {
	width: 100%;
}
div.left {	
	width: 10%;
	float: left;
}
div.right {
	width: 90%;
	float: right;
	height: 670px;
	display: flex;
	justify-content: center;
	align-items: center;
}

div.idArea{
	margin-bottom: 20px;
}
div.pwArea{
	margin-bottom: 20px;
}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #434343;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom: 30px;
}

button:hover {
  opacity: 0.8;
}

a.join:hover{
	text-decoration: underline;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
</head>
<body >
	<%
// 		session.removeAttribute("session_member");
		session.invalidate();
	%>
	<script >
	sessionStorage.clear();
	</script>
	<div class = "left">
		<header ></header>
	</div>

	<div class = "right">
		<div style="display: flex;	justify-content: center;	align-items: center;">
			<fieldset style=" padding : 100px;">
				<h1 style="font-size: 50px;">비밀번호</h1><br>
				<h1 style="font-size: 50px;">수정완료</h1>
				<a href="/login/login.jsp" style="padding-left: 45px;">로그인하러가기</a>	
			</fieldset>
		</div>
	</div>

	
</body>
<script src="/header.js"></script>

</html>