<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<td>
				<c:forEach items="${dto.fileDTOs}" var="f">
					${f.fileName}
				</c:forEach>
			</td>

		</tr>
		<tr>
			<th>회원아이디</th>
			<td></td>

		</tr>
		<tr>
			<th>상품판매횟수</th>
			<td></td>

		</tr>
		<tr>
			<th>택배발송횟수</th>
			<td></td>

		</tr>
		<tr>
			<th>소개글</th>
			<td></td>

		</tr>
		<tr>
			<th>별점</th>
			<td></td>

		</tr>
	 </table>
</body>
</html>