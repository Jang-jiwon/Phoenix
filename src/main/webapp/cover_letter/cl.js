/**
 * 
 */
function save(cnum){
	cnum=String(cnum);
	if(cnum.startsWith("new_")){
		var table = document.getElementById(cnum);
	}else{
		var table = document.getElementById("tb_"+cnum);
	}
     var cont = table.querySelector('tr.row2 textarea');
     var contValue = cont.value;
     var title = table.querySelector('tr.row1 input');
     var titleValue = title.value;
     
     //ajax
     var xhr = new XMLHttpRequest();
     xhr.open("POST", "save.jsp", true);
     xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
     var formData = "cnum=" + cnum +"&ctitle=" + encodeURIComponent(titleValue)+"&ccontents=" + encodeURIComponent(contValue);
     xhr.send(formData);
     xhr.onreadystatechange = function () {
         if (xhr.readyState == 4) {
             if (xhr.responseText.trim() != "-1") {
                 alert("저장되었습니다!");
                 changeTag(xhr.responseText.trim(),cnum);
             } else {
                 alert("저장 실패");
             }
         }
     }
}

function changeTag(newCnum,cnum){
	if(!cnum.startsWith("new_")){
		return ;
	}
	var tbl = document.getElementById(cnum);
	var savebtn = document.getElementById(cnum+"_btn");
	
	tbl.id = "tb_"+newCnum;//129
	
	savebtn.onclick = function() {// save() 함수 파라미터 수정
	    save(newCnum); 
	};
	
}


function delDB(id){
	id=String(id);
	if(confirm("정말로 삭제 하시겠습니까?")){
		if(id.startsWith("new_")){
			$("#"+id+"_btn").remove();
			$("#"+id).remove();
		}else{
			//DB에서 삭제
			let xhr = new XMLHttpRequest();
			xhr.open("get","deldb.jsp?cnum="+id,true);
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4){
					if(xhr.responseText.trim() == "ok"){
						alert("삭제되었습니다.");
					}else{
						alert("삭제 실패");
						return ;
					}
				}
			}
			
			//테이블 삭제
			$("#tb_"+id).remove();
			$("#save_"+id).remove();
		}
	}
}

var newDBnum = 0;
function add(){
	newDBnum = parseInt(newDBnum)+1;

	newTable = `<table border="1" id="new_`+newDBnum+`" >
					<tr class="row1">
					<td class="col1">
						<input type="text" placeholder="소제목 입력" >
					</td>
					<td class="col2"> <button class="X" onclick="delDB('new_`+newDBnum+`')" >×</button> </td>
				</tr>
				<tr class="row2">
					<td colspan="2">
						<textarea maxlength="500" placeholder="자기소개 입력(600자 이하)" style="resize: none;" ></textarea>
					</td>
				</tr>
			</table>
			<button type="submit" class="save"  id="new_`+newDBnum+`_btn"  onclick="save('new_`+newDBnum+`')">저장</button>`;
	$("#newCLArea").append(newTable);
}