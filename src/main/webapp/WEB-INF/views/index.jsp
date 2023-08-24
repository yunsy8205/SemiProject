<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 세션을 flase 값으로 주면 세션을 사용하지 않겠다고 선언하는 의미라 주석처리함. -->
<%-- <%@ page session="false" %> --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
</head>

<body>
<h1>
	 INDEX PAGE
</h1>
<a href="../product/list">리스트</a>

<table class="table table-dark table-hover">
	<c:if test="${not empty sessionScope.member}">
			<h1>로그인 상태</h1>	
	</c:if>
	
	<c:if test="${empty member}">
			<h1>비로그인 상태</h1>
	</c:if>
	
	<c:if test="${not empty sessionScope.member}">
		<p>
			${member.userId}<%--  : ${sessionScope.member.name} --%>        님 환영합니다.
		</p>
	</c:if>
	
	
	<c:if test="${empty sessionScope.member}">
		<a class="btn btn-primary" href="/member/login">로그인</a><br>
		<a class="btn btn-primary" href="/member/signUp">회원가입</a><br>
	</c:if>
	
	
	<c:if test="${not empty sessionScope.member}">
			<a class="btn btn-primary" href="/member/logout">로그아웃</a><br>
			<a class="btn btn-primary" href="/member/mypage">마이페이지</a><br>
	</c:if>
		
<%-- 		
	<tbody>
			 <c:forEach items="${list}" var="d">
				<tr>
				<td>${d.userNo}</td>
				<td>${d.userId}</td>
				<td>${d.userPw}</td>
				</tr>
			</c:forEach> 	
	</tbody>	
	 --%>
	
</table>

</body>
</html>
