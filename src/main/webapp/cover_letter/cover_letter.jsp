<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style >

/*선택시 박스표시 없앰*/
*:focus {
    outline: 0;
}

div {
	width: 100%;
}
div.left {	
	width: 20%;
	float: left;
}
div.right {
	width: 80%;
	float: right;
	height: 670px;
	display: block;
	justify-content: center;
	align-content: center;
	
}


/* 	display: flex; */
/* 	justify-content: center; */
/* 	align-items: center; */

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
}



</style>

</head>
<body>
	<div class = "all">
		<div class = "left">
			<header ></header>
		</div>
		
		<div class = "right" id="right" align="center">
			<div class="content" id="content">
			<h1 style="font-family: 'Gowun Batang';">자기소개서</h1>
<!--  
					<table border="1" id="" class="" >
						<tr class="row1">
							<td class="col1">
								<input type="text" class="ctitle" id="ctitle" name="ctitle" placeholder="항목 입력" >
							</td>
							<td class="col2"> <button class="X" >×</button> </td>
						</tr>
						<tr class="row2">
							<td colspan="2">
								<textarea maxlength="500" placeholder="자기소개 입력" style="resize: none;" id="ccontents" class="ccontents" name="ccontents"></textarea>
							</td>
						</tr>
					</table>
					<button type="submit" class="save" id="save" onclick="save()">저장</button>
					-->
			</div>
			
			<button class="add" id="add" >추가</button>
		</div>
	</div>
</body>

		<%
// 		int tableNum = 0;
// 		session.setAttribute("tableNum", tableNum);
// 		// 	tb_0~tb_19 총 20개의 테이블 아이디
// 		String[] tb_ids = new String[20];
// 		for(int i=0;i<tb_ids.length;i++){
// 			tb_ids[i]="tb_"+Integer.toString(i);
// 		}
		%>
		
		
	<script src="/header.js"></script>

	<script >
	/////////////////////////////////////자소서 불러오는 부분//////////////////////////
	// 데이터 불러와서 백틱배열만들어서 코드 저장하기
	// 화면 랜더링 끝나고 나서 넣어야 잘들어갈거같아서...
	
	//문제 생겻다 - 수정이나 저장시 유저 아이디마다 테이블 아이디 0부터 적용
	//일단 logout.jsp에 로그아웃시 tableNum 세션에서 삭제하는거 했음
	// db.jsp 하나더 만들어서 로그인하듯이 디비 만지고 하는게 나을듯
	
		//ajax통신
		var DBlen ;
		var DBtableCode = [];
		var tbDB = [];
		let xhr1 = new XMLHttpRequest();
		
		xhr1.open("POST","load.jsp",true);
		xhr1.send();
		xhr1.onreadystatechange = function(){
			if (xhr1.readyState == 4)  {
			    const status = xhr1.status;
			    if(status === 0 || (status >= 200 && status < 400)) {
			      console.log('success...');
			      var DB = xhr1.responseText.trim();
			      tbDB = DB.split('/');
			      DBlen = tbDB[0];
			      sessionStorage.setItem("DBlen",DBlen);
				  makeDBtable(DBlen,tbDB); //테이블 코드 생성
			    } else {
			      console.log('fail...');
			    }
			  }
		}
function makeDBtable(len,tbDB) {
var recentid=0;
for (var i=0 ; i<len ; i++){
	var strs =tbDB[i+1].split('&');
	console.log("======strsstrsstrs========"+strs+"============");
	var ids = strs[0].split('_')[1]; //테이블 번호
	recentid = (recentid>parseInt(ids))?recentid : ids;
	sessionStorage.setItem("DBlen",parseInt(recentid)+1); //마지막번호 다음번호를 넘겨주는것
	DBtableCode[i] =  `<table border="1" id="`+ strs[0]+`" class="`+ strs[0] +`" >
						<tr class="row1">
						<td class="col1">
							<input type="text" class="ctitle_`+ ids +`" id="ctitle_`+ ids +`" name="ctitle_`+ ids +`" placeholder="항목 입력" value="`+strs[1]+`">
						</td>
						<td class="col2"> <button class="X" onclick="del(`+ ids +`)">×</button> </td>
					</tr>
					<tr class="row2">
						<td colspan="2">
							<textarea maxlength="500" placeholder="자기소개 입력" style="resize: none;" id="ccontents_`+ ids +`" class="ccontents_`+ ids +`" name="ccontents_`+ ids +`">`+strs[2]+`</textarea>
						</td>
					</tr>
				</table>
				<button type="submit" class="save" id="save`+ ids +`" onclick="save(`+ ids +`)">저장</button>`;//이거 코드 수정해야함
					
	$("#content").append(DBtableCode[i]);
	//디비에서 내용 가져와서 적용하기
}
}
	/////////////////////////////////////자소서 불러오는 부분끝//////////////////////////
	
		
		function setNum(setid) {
			sessionStorage.setItem("tableNum",setid);
			alert(sessionStorage.getItem("tableNum"));
			
		}
		
		
		sessionStorage.setItem("tableNum",0);
		var tableNum = 0;
		
// 		자기소개서 불러올때는 아래와 다르게 클래스랑 아이디 부분에 디비에서 자겨온 고유 아이디로 넣기 - 디비고유아이디에 아래 tb_ids[String(tableNum)] 넣을예정
//	  	저장버튼도 자기소개서마다 넣는걸로 바꿀까
//		추가버튼 누를때마다 tableNum 증가되어 테이블 개수까지 알 수 있음
		
		$("#add").click(function() {
			var DBlen2 = parseInt(sessionStorage.getItem("DBlen"));
			tableNum = DBlen2;
			sessionStorage.setItem("DBlen",DBlen2+1);
			var tbl = `<table border="1" id="tb_`+ String(tableNum) +`" class="tb_`+ String(tableNum) +`" >
							<tr class="row1">
							<td class="col1">
								<input type="text" class="ctitle_`+ String(tableNum) +`" id="ctitle_`+ String(tableNum) +`" name="ctitle_`+ String(tableNum) +`" 
								placeholder="항목 입력" ">
							</td>
							<td class="col2"> <button class="X" onclick="del(`+ String(tableNum) +`)">×</button> </td>
						</tr>
						<tr class="row2">
							<td colspan="2">
								<textarea maxlength="500" placeholder="자기소개 입력" style="resize: none;" id="ccontents_`+ String(tableNum) +`" 
								class="ccontents_`+ String(tableNum) +`" name="ccontents_`+ String(tableNum) +`"></textarea>
							</td>
						</tr>
					</table>
					<button type="submit" class="save" id="save`+ String(tableNum) +`" onclick="save(`+ String(tableNum) +`)">저장</button>`;//이거 코드 수정해야함
			sessionStorage.setItem("tableNum",tableNum+1);
			
			$("#content").append(tbl);
	  	});


		//이미 있는 테이블에 저장할 경우 먼저 select로 디비에 있는 아이디 인지 확인해보고 있으면 내용 수정하는 sql쿼리 하기
		
		function save(num){	//num은 테이블 번호 즉 몇번째 테이블인지 - 0부터 시작
			var ctitlevalue = document.getElementById('ctitle_'+num).value;
			var ccontentsvalue = document.getElementById('ccontents_'+num).value;
// 			alert(ccontentsvalue);
			
			//ajax통신
			
			let xhr = new XMLHttpRequest();
			
			xhr.open("POST","savedb.jsp?ctitle="+ctitlevalue+"&ccontents="+ccontentsvalue+"&tableNum=tb_"+num,true);//tableNum 이 cnum임
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4){
					if(xhr.responseText.trim() == "ok"){
						alert("저장됨");
					}else{
						alert("저장실패");
					}
					
				}
			}
		}
		
		function del(cnum){	//num은 테이블 번호 즉 몇번째 테이블인지 - 0부터 시작
// 			alert(cnum);
// 			cnum = String(cnum);
			//ajax통신
			
			let xhr2 = new XMLHttpRequest();
			
			xhr2.open("get","deldb.jsp?cnum=tb_"+cnum,true);
			
			xhr2.send();
			
			xhr2.onreadystatechange = function(){
// 				console.log("==================POST ============");
				if(xhr2.readyState == 4){
					if(xhr2.responseText.trim() == "ok"){
						$("#tb_"+cnum).remove();
						$("#save"+cnum).remove();
						alert("삭제됨");
					}else if(xhr2.responseText.trim() == "not-ok"){
						alert("삭제실패");
					}else if(xhr2.responseText.trim() == "empty"){
						sessionStorage.setItem("DBlen",sessionStorage.getItem("DBlen")-1);
						$("#tb_"+cnum).remove();
						$("#save"+cnum).remove();
						alert("삭제됨");
					}
					
				}
			}
		}
		
		
		
// 		function del() {
// 			var element = document.getElementById(classes[0]);
// 		    element.parentNode.removeChild(element);
// // 			alert("어거지로 구현함..");
// 		}
		
	</script>


</html>