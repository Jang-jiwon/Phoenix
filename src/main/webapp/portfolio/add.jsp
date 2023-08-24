<%@page import="com.phoenix.portfolio.PortfolioDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
input:focus {outline: none;} /* outline 테두리 없애기 */
	table{
		margin:0 auto;
		width: 80%;
	}
	div.all {
		width: 100%;
	}
	div.left {	
		width: 20%;
		float: left;
	}
	div.right {
		width: 80%;
		float: right;
	}
	#title{
		height: 50px;
	}
	#pcontents{
		width:	98%;
		height:	300px;
		resize: none;
	}
	#url-input{
		height: 50px;
	}
	/* 파일 */
	.filebox .upload-name {
	    display: inline-block;
	    height: 40px;
	    padding: 0 10px;
	    vertical-align: middle;
	    border: 1px solid #dddddd;
	    width: 90%;
	    color: #999999;
	}
	.filebox label {
		margin-top: 10px;
		display:inline-block;
		width: 60px;
		background-color: #434343;
		color: white;
		padding: 5px 5px;
		border: none;
		cursor: pointer;
		margin-left: 10px;
		margin-right: 10px;
		margin: 8px auto;
	}
	.filebox input[type="file"] {
	    position: absolute;
	    width: 0;
	    height: 0;
	    padding: 0;
	    overflow: hidden;
	    border: 0;
	}
	
	/* 저장 버튼 */
	button.save , button.del{
		margin-top: 10px;
		display:inline-block;
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
	
	/* 텍스트 */
	input[type=text] ,textarea{
		background-color:#00ff0000;
		width: 98%;
		border: none;
		font-size: 15px;
		outline:none;
	}

</style>
</head>
<body>
	<div class="all">
		<div class = "left">
			<header ></header>
		</div>
		
		<div class = "right" >
			<div>
				<form method="post" name="boardForm" action="${pageContext.request.contextPath}/portfolio/portfolio.pf" id="frm">
					<table style="margin: 0 auto;  width: 80%; border: 0px;">
						<tr align="center" valign="middle">
							<td><h1>포트폴리오</h1></td>
						</tr>
						<tr style="display: flex; margin: 0 auto;">
							<td>
								<input style="display:none;" name="pnum" id="pnumInput" value="${portfolios.pnum}" >
								<c:choose> 
									<c:when test="${portfolios.pnum != 'empty' }" > 
										<button class="del" id="del" type="button" onclick="delDB('${portfolios.pnum}');">삭제</button>
									</c:when>
								</c:choose>
							</td>
						</tr>
					</table>
					<table border="1" style="border-collapse:collapse;background-color:white;">
						<!-- 제목 -->
						<tr height="50px">
							<td>
								<input type="text" id="ptitle"  name="ptitle" class = "ptitle" placeholder="  제목" value="${portfolios.ptitle}">
							</td>
						</tr>
						<!-- 내용 -->
						<tr height="300px">
							<td>
								<textarea id="pcontents" placeholder="  내용"  name="pcontents" >${portfolios.pcontents}</textarea>					
							</td>
						</tr>
						<!-- 링크 -->
						<tr>
							<td class="form-group" >
								<input type="text" id="purl" name="purl" class="purl" placeholder="  URL 추가" value="${portfolios.purl}" >
							</td>
						</tr>
						<!-- 이미지 -->
						<tr>
							<td>
								<div id="image_container" >
									<c:choose> 
										<c:when test="${not empty portfolios.ppath}"> 
											<img id="yImg"  class="isimg" src="${portfolios.ppath}">
										</c:when>
										<c:otherwise> 
											<img style="display: none;" id="noImg" class="isimg" >
										</c:otherwise>
									</c:choose>
								</div>
								<div class="filebox" style="display: flex; padding-right : 5px;">
								    <input id="upload-name"  class="upload-name" placeholder="대표이미지" style="border: none;" readonly="readonly">
								    <label for="file" style="padding-left: 14px;">파일찾기</label> 
								    <input type="file" id="file" class="file" accept="image/*" onchange="changeImg(event);" > 
								    <c:choose>
								    	<c:when test="${not empty portfolios.ppath}"> 
								    		<textarea id="ppath" name="ppath"  style="display:none;" >${portfolios.ppath}</textarea>
								    	</c:when>
								    	<c:otherwise>
								    		<textarea id="ppath" name="ppath"  style="display:none;" ></textarea>
								    	</c:otherwise>
								    </c:choose>
								</div>
							</td>
						</tr>
					</table>
					<button class="save" id="save" type="submit" >저장</button> 
					<!-- 저장 -->
<!-- 					<button class="save" id="save" type="button" onclick="savedb()">저장</button> -->
				</form>
			</div>
		</div>
	</div>
</body>
<script src="../header.js"></script>
<script >
<%String path = ((PortfolioDTO)session.getAttribute("portfolios")).getPpath();%>
	var ptitle;
	var pcontents;
	var purl;
	var pnum;
	var ppath = '<%= path %>';;
	var input;
	var showImg;
	var uploadNameInput;
	
	
	function delDB(id){
		location.href="/portfolio/delDB.jsp?pnum="+id;
	}
	
	
	
	function changeImg(event) {
		uploadNameInput = document.querySelector(".upload-name");
		showImg = document.getElementsByClassName("isimg");
		input = document.getElementById('file');
		var newpath=document.getElementById('ppath');
		// 파일이 선택되었을 때만 실행
		if (event.target.files && event.target.files[0]) {
			const reader = new FileReader();
		    reader.onload = async function (event) {
		    	ppath = event.target.result;
		    	if(showImg[0].style.display=="none"){ 			//showImg 에는 하나의 값만 존재함 . 배열의 형태일뿐
		    		var img = document.getElementById("noImg");
		    		img.src = event.target.result;
		    		img.style.display="block";
		    		newpath.value = event.target.result;
		    	}else{
		    		var img = document.getElementById("yImg");
		    		img.src = event.target.result;
		    	}
	    		uploadNameInput.value = input.value.split("\\").pop();
		    };
		    reader.readAsDataURL(event.target.files[0]);
		 }
		
	}
	
	function save(){
		var xhr = new XMLHttpRequest();
        xhr.open("POST", "/portfolio/saveDB.jsp", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        var formData = "ptitle=" + encodeURIComponent(ptitle.value) +"&ptitle=" + encodeURIComponent(ptitle.value) + "&pcontents=" + encodeURIComponent(pcontents.value)
        + "&ppath=" + encodeURIComponent(ppath)+ "&purl=" + encodeURIComponent(purl.value)+ "&pnum=" + encodeURIComponent(pnum);
        xhr.send(formData);
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.responseText.trim() == "ok") {
                    alert("저장되었습니다.");
                    location.href="/portfolio/portfolio.jsp";
                } else {
                    alert("저장실패 ");
                }

            }
        }
	}

	function savedb(){	//num은 테이블 번호 즉 몇번째 테이블인지 - 0부터 시작
		var frm = document.getElementById('frm');
		ptitle = document.getElementById('ptitle');
		pcontents = document.getElementById('pcontents');
		purl = "testUrl";
		pnum = '<%=request.getParameter("pnum")%>';
		input = document.getElementById('file');
		save();
	}
	</script>
	
</html>