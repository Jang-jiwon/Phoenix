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

button.add , button.save{
	margin-top: 10px;
	display:inline-block;
	width: 60px;
	background-color: #434343;
	color: white;
	padding: 5px 5px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	margin-left: 10px;
	margin-right: 10px;
}

table, tr, th, td { border:1px solid #43434350; border-collapse:collapse; }
table {
	width: 80%;
	height: 300px;
	background-color: #ffffff;
	margin: auto;
	margin-top: 30px;
};

tr.row1{
	height: 10%;
}
tr.row2{
	height: 90%;
}

td.col1{
	width: 95%;
}
td.col2{
	width: 5%;
}

button.X {
	width: 100%;
	height: 100%;
	background-color:#00ff0000;
	border: none;
	font-size: 30px;
	color: #43434360;
}

input[type=text] ,textarea{
	background-color:#00ff0000;
	width: 98%;
	height: 98%;
	border: none;
	font-size: 15px;
	padding: 10px;	
	outline: none;
}
</style>

</head>
<body>
<div class = "all">
		<div class = "left">
			<header ></header>
		</div>
		<div class = "right" id="right" align="center">
			<h1>자기소개서</h1>
			<c:forEach var="data" items="${tableDB }">
				<table border="1" id="tb_${data.cnum }">
					<tr class="row1">
						<td class="col1">
							<input type="text" placeholder="항목 입력" value="${data.ctitle }">
						</td>
						<td class="col2"> <button class="X" onclick="delDB('${data.cnum }')" >×</button> </td>
					</tr>
					<tr class="row2">
						<td colspan="2">
							<textarea maxlength="500" placeholder="자기소개 입력" style="resize: none;" >${data.ccontents}</textarea>
						</td>
					</tr>
				</table>
				<button type="submit" class="save" id="save_${data.cnum }" onclick="save(${data.cnum })">저장</button>
			</c:forEach>
			<div id="newCLArea" class="newCLArea"></div>
			<button class="add" id="add" onclick="add()">추가</button>
		</div>
	</div>
</body>
<script src="/header.js"></script>

<script src="/cover_letter/cl.js"></script>

</html>