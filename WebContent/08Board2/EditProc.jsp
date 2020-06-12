<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 체크하기 -->
<%@ include file="../common/isLogin.jsp" %>

<!-- 해당 파일 내에서 bname에 대한 폼값을 받고 있음 -->
<%@ include file="../common/isFlag.jsp" %>

<%
request.setCharacterEncoding("UTF-8");

//폼값전송받기
String num = request.getParameter("num");
String title = request.getParameter("title"); //제목
String content = request.getParameter("content"); //내용

//폼값을 DTO객체에 저장
BbsDTO dto = new BbsDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);

//DAO객체 생성시 application내장객체를 인자로 전달 (DB연결)
BbsDAO dao = new BbsDAO(application);

//사용자의 입력값을 DTO객체에 저장 후 파라미터로 전달 (오라클 테이블에 insert하는 쿼리문 실행하는 함수로 전달)
int affected = dao.updateEdit(dto);
if(affected==1) {
	//수정성공 시 상세페이지로 이동
	response.sendRedirect("BoardView.jsp?bname="+ bname +"&num="+dto.getNum());
}
else {
	//글쓰기에 실패했을 때 수정하기 페이지로 돌아간다.
%>
	<script>
		alert("수정하기에 실패하였습니다.");
		history.go(-1);
	</script>
<%
}
%>
