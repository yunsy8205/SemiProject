<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 profile</title>
</head>
<body>
	<table>
		<tr>
			<th>회원사진</th>
			<td>${dto.originalFileName}</td>

		</tr>
		<tr>
			<th>회원아이디</th>
			<td>${dto.userId}</td>

		</tr>
		<tr>
			<th>상품판매횟수</th>
			<td>${countp}</td>

		</tr>
		<tr>
			<th>택배발송횟수</th>
			<td></td>

		</tr>
		<tr>
			<th>소개글</th>
			<td>${dto.intro}</td>

		</tr>
		<tr>
			<th>별점</th>
			<td>${score}</td>

		</tr>
		<c:choose>
			<c:when test="${flag eq 'products'}">
				<tr>
					<th>판매자상품목록</th>
					<td>
			            <c:forEach items="${list}" var="d">
							${d.proNo} ${d.proName}
						</c:forEach>
					</td>
				</tr>	
			</c:when>
			<c:otherwise>
				<tr>
					<th>판매자후기목록</th>
					<td>
			            <c:forEach items="${list}" var="d">
							${d.reviewNo} ${d.contents} ${d.score}
						</c:forEach>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
	 </table>
</body>
</html>