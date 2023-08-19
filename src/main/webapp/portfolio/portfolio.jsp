<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../division.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="pf.css">
<style type="text/css">
	div.all {
		display: flex;
	}
	div.left {	
	  	flex: 0 0 270px; 
	 	 min-width: 270px; 
	}
	div.right {
 		 flex: 1; 
	}
	div.content {
		margin: 0 auto;
		text-align: center;
	}

	.pfs{
		display: grid;
	    justify-content: center;
	    align-items: center;
	    justify-items: center;
	    grid-template-columns: repeat(auto-fill, minmax(310px, 1fr));
	     grid-gap: 0px 50px;
	}
	
	div.panel{
	margin: 30px;
	padding:20px;
	justify-content: center; 
	align-items: center;
	background-color: white;
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',endColorstr='#ffeaeef2',GradientType=0);
	-webkit-box-shadow:0px 0px 20px 1px rgba(0,0,0,0.05),inset 0px 0px 2px 1px #fff;
	box-shadow:0px 0px 20px 1px rgba(0,0,0,0.08),inset 0px 0px 2px 1px #fff;
	}
	/* 추가 버튼 */
	button.add{
		margin-top: 10px;
/* 		display:inline-block; */
		align-content :flex-end;
		width: 60px;
		background-color: #434343;
		color: white;
		padding: 5px 5px;
		border: none;
		cursor: pointer;
		margin-left: 10px;
		margin-right: 10px;
 		display: block; 
		margin: 8px auto;
	}
</style>
</head>
<body>

	<div class="all">
		<div class = "left">
			<header ></header>
		</div>
		<div class = "right" id="right" >
			<div class="content" id="content" >
				<h1 style="margin: 50px ;  ">포트폴리오</h1>
			</div>
			<button class="add" id="add" onclick="location='loadadd.jsp?pnum=empty'" style="align-content: center;" >추가</button>
			<div id="pfs" class="pfs">
				<c:forEach var="pf" items="${arrPortfol}">
					<div id="pnum${pf.pnum}" class = "panel"  onclick="gopf(pnum${pf.pnum}.id)" 
					style="width: 300px; "   align="center">
						<div style="height: 70%; width: 100%;display: flex;justify-content: center; align-items: center;" align="center">
							<c:choose> 
								<c:when test="${not empty pf.ppath }">
									<img src="${pf.ppath}" style=" max-width: 100%;">
								</c:when>
							</c:choose>
						</div>	
						<h2 style="height: 30%;align-items: center;display: inline-flex ;">${pf.ptitle}</h2>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<script src="/header.js"></script>
	
<script>
	function gopf(pnums) {
		var  pnum = pnums.substr(4,pnums.length);
		location.href="/portfolio/loadDBPF.jsp?pnum=" + pnum;
	}
</script>
</html>