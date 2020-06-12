<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//세션영역에 저장된 use id 정보를 조회하여 null(값이 없으면) => 로그인이 안되어 있다면
if(session.getAttribute("USER_ID")==null) {
%>    
	<script>
		alert("로그인 후 이용해주십시오.");
		location.href="../06Session/Login.jsp";
	</script>
<%
	return;
}
%>	