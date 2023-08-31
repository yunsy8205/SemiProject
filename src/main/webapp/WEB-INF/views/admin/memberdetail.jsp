<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootstrap.jsp"></c:import>
<c:import url="../temp/adminHeader.jsp"></c:import>

</head>
<body>
	<section class="container mt-5">
		<h1 class="text-center mb-5">회원정보관리</h1>
			<table class="table table-bordered border-secondary">
				<tr>
					<th>회원번호</th><td>${dto.userNo}</td><th>회원상태</th><td>
					<c:if test="${dto.statusNo eq '0'}">정지</c:if>
					<c:if test="${dto.statusNo eq '1'}">활동중</c:if>
					</td>
				</tr>
				<tr>
					<th>권한</th><td><c:forEach items="${dto.roles}" var="r">${r.grantName}</c:forEach>
					</td><th>가입일</th><td>${dto.accountDate}</td>
				</tr>
				<tr>
					<th>ID</th><td>${dto.userId}</td><th>PW</th><td>${dto.userPw}</td>
				</tr>
				<tr>
					<th>이름</th><td>${dto.name}</td><th>생년월일</th><td>${dto.birth}</td>
				</tr>
				<tr>
					<th>이메일</th><td>${dto.email}</td><th>전화번호</th><td>${dto.phone}</td>
				</tr>
				<tr>
					<th>소개글</th><td colspan="3">${dto.intro}</td>
				</tr>
			</table>
			
			<a href="./memberdelete?userNO=${dto.userNo}" class="btn btn-danger">탈퇴</a><a href="./memberupdate?userNO=${dto.userNo}" class="ms-2 btn btn-danger">수정</a>
	</section>
</body>
</html>