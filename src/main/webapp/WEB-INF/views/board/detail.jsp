	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootstrap.jsp"></c:import>
</head>
<body>
<c:import url="../temp/BoardHeader.jsp"></c:import>
	<section class="container mt-5">
	
		<table class="table">
		
		<thead class="table-dark">
			 <th>ID</th><th>TITLE</th><th>DATE</th><th>HIT</th>
		</thead>
		
		<tbody class="table-light">
			
				<tr>
					<td>${dto.userId}</td>
					<td>${dto.title}</td>
					<td>${dto.createDate}</td>
					<td>${dto.hit}</td>
				</tr>
			
		</tbody>
		
		<tfoot>
		
		<tr>
			<td colspan="4">${dto.contents} <br>
			
			</td>
			
		</tr>
		
		
		</tfoot>

	 
		</table>
		<c:forEach items="${dto.fileDTOs}" var="f">
			<div>첨부파일 <a href="./fileDown?fileNo=${f.fileNo}">${f.originalName}</a><div>
		</c:forEach> 
		
		<c:if test="${member.userId == 'ADMIN'}">
		<a class="btn btn-dark" href="./update?boardNo=${dto.boardNo}"> 수정 </a>
		<a class="btn btn-dark" href="./delete?boardNo=${dto.boardNo}"> 삭제</a>
		</c:if>
		
	
	<a href="./list">list</a>
	
	


</body>
</html>