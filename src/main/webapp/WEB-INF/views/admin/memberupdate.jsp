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
		<h1 class="text-center mb-5">회원정보수정</h1>
		<form action="./memberupdate?userNO=${dto.userNo}" method="post">
			<table class="table table-bordered border-secondary">
				<tr>
					<th>회원번호</th><td><input type="text" readonly name="userNo" value="${dto.userNo}"></td><th>회원상태</th><td>
					<c:if test="${dto.statusNo eq '0'}">
						<select class="form-select" name="statusNo">
								<option value="0" selected>정지</option>
								<option value="1">활동중</option>
						</select></c:if>
					<c:if test="${dto.statusNo eq '1'}">
						<select class="form-select" name="statusNo">
							<option value="0">정지</option>
							<option value="1" selected>활동중</option>
						</select></c:if>
					
					</td>
				</tr>
				<tr>
					<th>권한</th>
					<td>
						<c:forEach items="${dto.roles}" var="r">
						<c:if test="${r.grantName eq 'MEMBER'}">
						<select class="" name="grantNo">
								<option value="1" selected>MEMBER</option>
								<option value="2">ADMIN</option>
						</select></c:if>
						<c:if test="${r.grantName eq 'ADMIN'}">
						<select class="" name="grantNo">
								<option value="1">MEMBER</option>
								<option value="2" selected>ADMIN</option>
						</select></c:if>
						</c:forEach>
						<c:if test="${empty dto.roles}">
						<select class="" name="grantNo">
								<option value="1">MEMBER</option>
								<option value="2">ADMIN</option>
						</select></c:if>
					</td>
					<th>가입일</th><td>${dto.accountDate}</td>
				</tr>
				<tr>
					<th>ID</th><td>${dto.userId}</td><th>PW</th><td><input type="password" name="userPw" readonly value="${dto.userPw}"></td>
				</tr>
				<tr>
					<th>이름</th><td><input type="text" name="name" value="${dto.name}"></td><th>생년월일</th><td><input type="date" name="birth" value="${dto.birth}"></td>
				</tr>
				<tr>
					<th>이메일</th><td><input type="email" name="email" value="${dto.email}"></td><th>전화번호</th><td><input type="tel" name="phone" value="${dto.phone}"></td>
				</tr>
				<tr>
					<th>소개글</th><td colspan="3"><input type="text" name="intro" value="${dto.intro}"></td>
				</tr>
			</table>
		
			<button type="submit" class="ms-2 btn btn-danger">저장</button>
		</form>
	</section>

</body>
</html>