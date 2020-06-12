<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="row">		
		<div class="col-12">			 
			<!-- 
				.bg-primary, .bg-success, .bg-info, .bg-warning, .bg-danger, .bg-secondary, 
				.bg-dark, .bg-light
			-->
			<nav class="navbar navbar-expand-sm bg-light navbar-dark">
				<!-- Brand/logo -->
				<a class="navbar-brand" href="#">
					<img src="http://www.ikosmo.co.kr/images/common/logo_center_v2.jpg" style="width:150px;">
				</a>
				
				<!-- Links -->
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link text-dark" href="../08Board2/BoardList.jsp?bname=freeboard">자유게시판</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-dark" href="../08Board2/BoardList.jsp?bname=notice">공지사항</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-dark" href="../08Board2/BoardList.jsp?bname=qna">질문과답변</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-dark" href="../08Board2/BoardList.jsp?bname=faq">자주묻는질문</a>
					</li>
					
					<% if(session.getAttribute("USER_ID")!=null) { 
						String username = session.getAttribute("USER_NAME").toString(); %>
					
					<li class="nav-item">
						<p style=" margin-top: 8px; margin-left: 5px;"><%=username %>님 로그인 중입니다.</p>
					</li>
					<% } %>
				</ul>

				<!-- <form class="form-inline mt-3 ml-3" method="get" action="">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Search">
						<div class="input-group-append">
							<button class="btn btn-warning" type="submit"><i class='fas fa-search' style='font-size:20px'></i></button>
						</div>
					</div>
				</form> -->
				<ul class="navbar-nav ml-auto" >
				<% if(session.getAttribute("USER_ID")==null) { %>
					<li class="nav-item">
						<a class="nav-link text-dark" href="#"><i class='fas fa-edit' style='font-size:20px'></i>
						회원가입</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-dark" href="../06Session/Login.jsp"><i class='fas fa-sign-in-alt' style='font-size:20px'></i>
						로그인</a>
					</li>
				<% } else { %>
					<li class="nav-item">
						<a class="nav-link text-dark" href="#"><i class='fa fa-cogs' style='font-size:20px'></i>
						회원정보수정</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-dark" href="../06Session/Logout.jsp"><i class='fas fa-sign-out-alt' style='font-size:20px'></i>
						로그아웃</a>
					</li>
				<% } %>
				</ul>
			</nav>
		</div>
	</div>