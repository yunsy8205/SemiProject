<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>상품 Detail Page</title>
</head>
<body>
<h1>상품 Detail Page</h1>
	<table>
		<tr>
			<th>상품사진</th>
			<td>
				<c:forEach items="${dto.fileDTOs}" var="f">
					${f.fileName}
				</c:forEach>
			</td>

		</tr>
		<tr>
			<th>상품이름</th>
			<td>${dto.proName}</td>

		</tr>
		<tr>
			<th>상품가격</th>
			<td>${dto.proPrice}</td>

		</tr>
		<tr>
			<th>상품상태</th>
			<td>${dto.proStatus}</td>

		</tr>
		<tr>
			<th>교환여부</th>
			<td>${dto.exchange}</td>

		</tr>
		<tr>
			<th>배송비</th>
			<td></td>

		</tr>
		<tr>
			<th>내용</th>
			<td>${dto.proContents}</td>

		</tr>
		<tr>
			<th>카테고리</th>
			<td>${dto.catName}</td>

		</tr>
	 </table>
	
	<table>
		<tr>
			<th>판매자 아이디</th>
			<td>${dto.userId}</td>
		</tr>
		<tr>
			<th>판매상품수</th>
			<td>${countp}</td>

		</tr>
		<tr>
			<th>최근 판매상품목록</th>
			<td>
				<c:forEach items="${list}" var="d">
					${d.proNo} ${d.proName}
				</c:forEach>
			</td>

		</tr>
		<tr>
			<th>판매자 후기수</th>
			<td>${countr}</td>

		</tr>
		<tr>
			<th>최근 후기목록</th>
			<td>
				<c:forEach items="${review}" var="r">
					${r.reviewNo} ${r.contents}
				</c:forEach>
			</td>

		</tr>
	 </table>


</body>
</html>