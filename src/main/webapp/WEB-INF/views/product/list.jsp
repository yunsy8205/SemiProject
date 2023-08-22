<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section class="container mt-5">
	<h1 class="mb-3 text-center">Product List</h1>
	<table class="table table-dark table-hover">
		<thead>
			<th>번호</th><th>제목</th><th>작성자</th><th>작성일자</th><th>조회수</th>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="d">
			
				<tr>
					<td>${d.proNo}</td>
					<td>${d.proName} </td>
					<td>${d.userId} </td>
					<td>${d.createDate} </td>
					<td>${d.proHit} </td>
				</tr>
			</c:forEach>			
		</tbody>
	</table>
	</section>
</body>
</html>