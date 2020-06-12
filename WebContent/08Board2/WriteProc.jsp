<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글작성 완료 전 로그인 체크하기 -->
<%@ include file="../common/isLogin.jsp" %>
<!-- 해당 파일 내에서 bname에 대한 폼값을 받고 있음 -->
<%@ include file="../common/isFlag.jsp" %>

<%
//out.print("글쓰기처리:"+ request.getParameter("title")); //디버깅용
request.setCharacterEncoding("UTF-8");

//폼값전송받기
String title = request.getParameter("title"); //제목
String content = request.getParameter("content"); //내용

//폼값을 DTO객체에 저장
BbsDTO dto = new BbsDTO();
dto.setTitle(title);
dto.setContent(content);
//세션영역에 저장된 회원ID를 가져와서 저장 DTO객체에 저장 (Object형으로 저장되어 있으므로 toString으로 변환하여 가져옴)
dto.setId(session.getAttribute("USER_ID").toString());

//게시판 필수파라미터를 DTO에 추가
dto.setBname(bname);




//DAO객체 생성시 application내장객체를 인자로 전달 (DB연결)
BbsDAO dao = new BbsDAO(application);

//사용자의 입력값을 DTO객체에 저장 후 파라미터로 전달 (오라클 테이블에 insert하는 쿼리문 실행하는 함수로 전달)

int affected = dao.insertWrite(dto);

if(affected==1) {
	//글쓰기에 성공했을 때
	response.sendRedirect("BoardList.jsp?bname="+bname);
}
else {
	//글쓰기에 실패했을 때
%>
	<script>
		alert("글쓰기에 실패하였습니다.");
		history.go(-1);
	</script>
<%
}
%>
