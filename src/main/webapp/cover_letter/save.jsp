<%@page import="com.phoenix.coverletter.dao.CoverletterDAO"%>
<%@page import="com.phoenix.coverletter.dao.CoverletterDTO"%>
<%@page import="com.phoenix.user.dao.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String cnum = request.getParameter("cnum"); //항목명
String ctitle = request.getParameter("ctitle"); //항목명
String ccontents = request.getParameter("ccontents"); //자소서 내용도 똑같이 가져와야함

UserDTO userinf = (UserDTO)session.getAttribute("session_member");
String userid = userinf.getUserid();
CoverletterDAO mdao = new CoverletterDAO();
CoverletterDTO clDto = new CoverletterDTO();

clDto.setUserid(userid);
clDto.setCnum(cnum);
clDto.setCtitle(ctitle);
clDto.setCcontents(ccontents);

int result = mdao.saveCL(clDto);
if(result != -1){  //시퀀스가 100부터 시작해서 -1은 아이디로 나올수가없음 . DAO에서 실패의 의미로 -1넘겨준것임
	//저장완료
	out.print(result);
}else{
	//저장실패
	out.print(result);
}


%>