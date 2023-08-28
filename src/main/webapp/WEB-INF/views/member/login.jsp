<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	// 로그인 되어 있으면 메인페이지로 강제 이동
	if (session.getAttribute("member") != null && session.getAttribute("member") != "") {
		response.sendRedirect("/");
	}
	// 이전 페이지 기록
    String referer = request.getHeader("member");
    if(referer==null)referer = "/";
%>
<!DOCTYPE html>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
	<title>Login</title>
</head>

<body>
<!-- ======= Join Section ======= -->
	<section class="container">
		<h1 class="text-center">Login Page</h1>

	
	<!-- login form -->
	<!--  action="${pageContext.request.contextPath}/login.com -->
	<form role="form" method="post" id="loginfrm" action="./login.com" enctype="multipart/form-data">
		<fieldset>
		<div class="form-group">
			<label for="id" class="col-sm-2">ID</label>
			<%-- <input type="text" name="userId" value="${cookie.id.value}" id="userId" placeholder="ID를 입력하세요"> --%>
			<input type="text" name="userId" value="${cookie.id.value}"  id="userId"  placeholder="ID를 입력하세요"> 
		</div>
		
		<div class="form-group">
			<label for="pw" class="col-sm-2">PASSWORD</label>
			<input type="password" name="userPw"  id="pw" value="" placeholder="비밀번호를 입력하세요">
		</div>
		
		<div class="checkbox col-sm-offset-2">
				<label><input type="checkbox" id="idSave" <c:if test="${cookie.id.value != null && cookie.id.value != ''}">checked</c:if>>아이디 저장</label> 
				<label><input type="checkbox" id="idStateful" <c:if test="${cookie.idStateful.value != null && cookie.idStateful.value != ''}">checked</c:if>>로그인 상태유지</label>
				<input type="hidden" name="idStateful" id="ids" value="" />
		</div> 
		
	<div class="mb-3">
		<button type="button" id="loginbtn" class="btn-book-a-table">로그인</button>
	</div>
	
		
	</fieldset>
   </form>
</section>	

	<script src="/resources/js/login.js"></script>
  
</body>
</html>