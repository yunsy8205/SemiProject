<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootstrap.jsp"></c:import>
<style>
  .container {
    width: 900px;
  }
</style>

<c:if test="${empty member }">
	<script type="text/javascript">
		alert("로그인하세요");
		location.href="../member/login";
	</script>
</c:if>
</head>
<body>
<c:import url="../temp/BoardHeader.jsp"></c:import>
	<section class="container mt-5">
	
	<h1 align="center">1대1 문의</h1>
		<table class="table mt-5">
		
		<thead class="table-dark">
			<th>TITLE</th><th>DATE</th><th>상태</th>
		</thead>
		
		<tbody class="table-light">
			<c:forEach items="${list}" var="d">
				<tr>
					
					<td><a class="text-decoration-none" href="./detail?boardNo=${d.boardNo}">${d.title}</a></td>
					<td>${d.createDate}</td>
					<td>${d.status}</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		
	

	<a class="btn btn-dark me-2" style="float:right" href="./add">문의하기</a>
	</section>
	


</body>
</html>