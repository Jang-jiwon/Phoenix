<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../division.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
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
	div.content {
		margin: 0 auto;
		text-align: center;
	}
	div.pfs{
	height: 400px;
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
			<div id="pfs" class="pfs"><button class="add" id="add" onclick="location='loadadd.jsp?pnum=empty'" style="align-content: center;" >추가</button></div>
<!-- 			<button class="add" id="add" >추가</button>  -->
			
<!-- 				<button class="add" id="add" onclick="newpf()">추가</button>  -->
		</div>
	</div>
</body>
	<script src="/header.js">
	</script>
	
	<script>
// 	location.href ="/portfolio/add.jsp";

			let xhr4 = new XMLHttpRequest();
			
			xhr4.open("POST","/portfolio/loadDB.jsp",true);//tableNum 이 cnum임
			xhr4.send();
			xhr4.onreadystatechange = function(){
				if (xhr4.readyState == 4)  {
					var DB = xhr4.responseText.trim();
				    const status = xhr4.status;
				    if(status === 0 || (status >= 200 && status < 400)) {
				      console.log('success portfolio loadDB...');
				      var DB = xhr4.responseText.trim();
				      // /기준으로 각각 다른 포트폴리오
				      // & 기준으로 포트폴리오별 요소
				      console.log("==================DB :"+DB+"============");
				      tbDB = DB.split('/--/');
				      console.log("==================tbDB :"+tbDB+"============");
// 				      sessionStorage.setItem("DBlen",DBlen);
				      
					  makeDBtable(tbDB); //테이블 코드 생성
				    } else {
				      console.log('fail portfolio loadDB...');
				    }
				  }
			}
			var DBtableCode = [];
			function makeDBtable(tbDB) {
				var n=0;
				for (var i=1 ; i<tbDB.length; i++){
					if(i%3==1){
						var div_ = `<div id="pfs`+i+`" class="pfs`+i+`" style="width:100%; height:370px;display: flex;"></div>`;
						$("#pfs").append(div_);
						n=i;
						
					}
					//tbDB[1] = tb_1&수정제목11&수정내용11
					//	 				console.log("==================tbDB :"+tbDB[i]+"============");
					var strs =tbDB[i].split('&--&');//테이블번호 , 타이틀 , 대표이미지주소 - 104,Portfolio Title,/portfolio/imgs/ex.png
					console.log("==================strs :"+strs[0]+"============");
					DBtableCode[i] =  `<div id="pnum`+strs[1]+`" class = "panel"  onclick="gopf(pnum`+strs[1]+`.id)" style="width: 300px;" align="center">
					<div style="height: 70%; width: 100%;display: flex;justify-content: center; align-items: center;" align="center">
						<img src="`+strs[3]+`" alt="My Image" style="width: 100%; height: 100%;">
					</div>	
					
						<h2 style="height: 30%;align-items: center;display: inline-flex ;">`+strs[2]+`</h2>
					</div>`;//이거 코드 수정해야함
					$("#pfs"+n).append(DBtableCode[i]);
					
				}
			}
			
	function gopf(pnums) {
// 		console.log("==================pnum :"+pnums.substr(4,pnums.length) +"============");
//		pnums.substr(4,pnums.length) - pnum
		var  pnum = pnums.substr(4,pnums.length);
		alert(pnum);
		location.href="/portfolio/loadDBPF.jsp?pnum=" + pnum;
	}
			
			
	function newpf() {
		const pfs = document.getElementById('pfs');
		
		fetch('/portfolio/objs.jsp')
		.then(res => res.text())
		.then(data => pfs.innerHTML = data);
	}

</script>
</html>