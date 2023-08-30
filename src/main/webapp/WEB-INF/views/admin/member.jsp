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
		<h1 class="text-center mb-5">회원관리</h1>
		<table class="table">
			<thead>
				<th>회원번호</th><th>회원상태</th><th>회원ID</th><th>비밀번호</th><th>이름</th><th>이메일</th>
				<th>생년월일</th><th>주소</th><th>전화번호</th><th>가입일</th>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="m">
					<tr>
						<td>${m.userNo}</td><td>${m.statusNo}</td><td>${m.userId}</td><td>${m.userPw}</td><td>${m.name}</td><td>${m.email}</td><td>${m.birth}</td>
						<td>${m.address}</td><td>${m.phone}</td><td>${m.accountDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="search">
			<form method="get" name="search" action="./member">
				<table class="pull-right">
					<tr>
						<td><select class="form-select" name="kind">
								<option value="userId">아이디</option>
								<option value="email">이메일</option>
								<option value="phone">전화번호</option>
						</select></td>
						<td><input type="text" class="form-control"
							name="search" maxlength="100"></td>
						<td><button type="submit" class="btn btn-danger">검색</button></td>
					</tr>

				</table>
			</form>
		</div>

	</section>
</body>
</html>