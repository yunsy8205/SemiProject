<!-- 로그인 테스트용으로 나중에 삭제 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <c:import url="../temp/bootStrap.jsp"></c:import> --%>
</head>
<body>
<%-- <c:import url="../temp/header.jsp"></c:import> --%>

	<h1 class="mt-4 mb-4">login page</h1>
	
	
	<form action="./login" method="post">
	<div class="mb-4">
	 <label for="id" class="form-label">id</label>
 	 <input type="text" name="userId" class="form-control" value="ksh5" id="id" placeholder="id를 입력하세요">
	</div>
	
	<div class="mb-4">
	 <label for="pw" class="form-label">pw</label>
 	 <input type="password" name="userPw" class="form-control" value="1234" id="pw" placeholder="pw를 입력하세요">
	</div>
	
	
	<div class="mb-3">
		<button class="btn btn-primary">로그인</button>
	</div>
	
	</form>
		
</body>
</html>