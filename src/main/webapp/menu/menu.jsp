<%@page import="com.phoenix.user.dao.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Website title -->
<title>MenuBar</title>
<!-- CSS Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/perfect-scrollbar.min.css">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&amp;subset=devanagari,latin-ext" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">

<style >
@import url('https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Arvo&display=swap');

* {
  font-family: "Gowun Batang";
}

	body {
	
	background:#f0f3f587;
	font-size:14px;
	}
	p {
		font-size:1.1em;
		font-weight:300;
		line-height:1.7em;
	}
	a {
		color:#7c6dcc;
	}
	a,a:hover,a:focus {
		text-decoration:none;
		transition:all 0.3s;
	}
	.navbar {
		padding:15px 10px;
		background:#fff;
		border:none;
		border-radius:0;
		margin-bottom:40px;
		box-shadow:1px 1px 3px rgba(0,0,0,0.1);
	}
	.navbar-btn {
		box-shadow:none;
		outline:none !important;
		border:none;
	}
	img {
		max-width:100%;
	}
	.h1,.h2,.h3,.h4,.h5,.h6,h1,h2,h3,h4,h5,h6 {
		line-height:1.3;
	}
	/* --------------------------------------------------- SIDEBAR ----------------------------------------------------- */
.wrapper {
}
#sidebar {
	min-width:250px;
	max-width:250px; 
	transition:all 0.6s cubic-bezier(0.945,0.020,0.270,0.665);
	transform-origin:bottom left;
	position:fixed;
	height:100%;
	background-color:#fff;
	background-image:none;
	background-size:auto;
	background-image:-webkit-linear-gradient(top,#fff 0%,#eaeef2 100%);
	background-image:linear-gradient(to bottom,#fff 0%,#ffffff 100%);
	background-repeat:repeat-x;
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',endColorstr='#ffeaeef2',GradientType=0);
	-webkit-box-shadow:0px 0px 20px 1px rgba(0,0,0,0.2),inset 0px 0px 2px 1px #fff;
	box-shadow:0px 0px 20px 1px rgba(0,0,0,0.2),inset 0px 0px 2px 1px #fff;
	z-index:2;
	border-top:none;
	top:0;
	bottom:0;
}
#sidebar.active {
	margin-left:-250px;
	transform:rotateY(100deg);
}
#sidebar .sidebar-header {
	padding:20px;
}
#sidebar ul.components {
	padding:0;
  margin-bottom:50px;
  text-align: center;
}
#sidebar ul p {
	padding:10px 20px;
	margin: 40px;
}
#sidebar ul h1 {
	padding:10px 20px;
	margin: 40px;
}
#sidebar ul li a {
	padding:10px 20px;
	font-size:1.1em;
	display:block;
	color:inherit;
	margin-top: 10px
}
#sidebar ul li a:hover {
	color:#7c6dcc;
	background:#f8f8f8;
}


a[data-toggle="collapse"] {
	position:relative;
}
a[aria-expanded="false"]::before,a[aria-expanded="true"]::before {
	display:block;
	position:absolute;
	right:20px;
	font-family:FontAwesome;
	font-size:0.8em;
	content:"\f0d7";
}
a[aria-expanded="true"]::before {
	content:"\f0d7";
}
ul ul a {
	font-size:0.9em !important;
	padding-left:30px !important;
}

.sidebar-footer {
  padding: 20px 20px 20px 20px;
  font-size: 12px;
  text-align:center !important;
}
.sidebar-footer p {
	font-size:12px;
	text-align: center;
}
.sidebar-footer .social-icons a {
	width:25px;
	height:25px;
	background:rgb(255, 63, 30);
	color:#fff;
	display:inline-block;
	text-align:center;
	line-height:25px;
	border-radius:50%;
	margin-right:3px;
	font-size: 15px;
}
.sidebar-footer .social-icons a:hover {
  background-color:rgb(210, 48, 20);
  color:#fff;
}
#sidebarCollapse {
	width:50px;
	height:50px;
	background:#7c6dcc;
	color:#fff;
	position:absolute;
	top:-10px;
	right:-10px;
}
#sidebarCollapse span {
	width:80%;
	height:2px;
	margin:0 auto;
	display:block;
	background:#fff;
	transition:all 0.8s cubic-bezier(0.810,-0.330,0.345,1.375);
	transition-delay:0.2s;
}
#sidebarCollapse span:first-of-type {
	transform:rotate(45deg) translate(2px,2px);
}
#sidebarCollapse span:nth-of-type(2) {
	opacity:0;
}
#sidebarCollapse span:last-of-type {
	transform:rotate(-45deg) translate(1px,-1px);
}
#sidebarCollapse.active span {
	transform:none;
	opacity:1;
	margin:5px auto;
}
#sidebar-responsive {
	display:none;
}
.imglogo {
	display: inline-block;
  margin-bottom:15px;
}
</style>

</head>

<%
	String loginhref = "/login/login.jsp";
	String portfoliohref = "/portfolio/loadDB.jsp";
	String coverletterhref = "/cover_letter/load.jsp";
	String resumeshref = "/resume/dbload.jsp";
	String mypagehref = "/my_page/MyPage.my";
	String avalue ; 
	
	//세션에서 로그인 정보 가져오기
	UserDTO member = (UserDTO)session.getAttribute("session_member");
	
	if(member!=null){
		//로그인o
		avalue = "로그아웃";
		loginhref = "/logout/logout.jsp";
	}else{
		//로그인x
		avalue = "로그인"; 
		loginhref = "/login/login.jsp";
	}
	
%>

<body>
<!-- BEGIN Wrapper -->
<div class="wrapper">

	<!-- BEGIN Sidebar -->
	<nav id="sidebar">
	<div class="sidebar-header">
		
	</div>
	<ul class="list-unstyled components">
		<h1 class="site-title" align="center" style="font-family:'Arvo' ,sans-serif !important; font-weight: 500;">
		Phoenix </h1>
		<p>
			<a href="<%=loginhref %>" id="menulogin" class = "menulogin" name="menulogin"><%=avalue %></a>
		</p>
		<li>
			<a href="<%=portfoliohref %>" id="menuportfolio" class = "menuportfolio" name="menuportfolio">포트폴리오</a>
		</li>
		<li>
			<a href="<%=coverletterhref %>" id="menucoverletter" class = "menucoverletter" name="menucoverletter">자기소개서</a>
		</li>
		<li>
			<a href="<%=resumeshref %>" id="menuresumes" class = "menuresumes" name="menuresumes">이력서</a>
		</li>
		<li>
			<a href="<%=mypagehref %>" id="menumypage" class = "menumypage" name="menumypage">내정보</a>
		</li>
	</ul>
	
	</nav>
  <!-- END Sidebar -->




</div>
<!--END Wrapper -->

<!-- BEGIN Scripts -->
<script src="js/jquery.js"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/perfect-scrollbar.min.js"></script>
<script src="js/common.js"></script>
<!-- END Scripts -->

</body>
</html>