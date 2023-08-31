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
    width: 1000px;
  }
</style>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
	<div class="container mt-5 pt-5">

		<header>
			<h1>1대1문의</h1>
		</header>
		<hr>
	
		<label for="id" class="form-label">아이디</label>
		<div class="border border-dark border-opacity-50 p-2 mb-3 w-25 rounded" id="id"> ${dto.userId}</div>

		<label for="kindName" class="form-label">유형</label>
		<div class="border border-dark border-opacity-50 p-2 mb-3 w-25 rounded" id="kindName">${dto.kindName}</div>

		<label for="title" class="form-label">제목</label>
		<div class="border border-dark border-opacity-50 p-2 mb-3 w-25 rounded" id="title">${dto.title}</div>
		
		<label for="contents" class="form-label">내용</label>
		<div class="border border-dark border-opacity-50 p-2 mb-3 w-100 rounded" id="contents">${dto.contents}</div>

		
		
		
		<hr>
		<footer>
			<c:forEach items="${dto.fileDTOs}" var="f">
			<div>첨부파일 <a href="./fileDown?fileNo=${f.fileNo}">${f.originalName}</a><div>
		</c:forEach> 
			<a class="btn btn-dark" href="./update?boardNo=${dto.boardNo}"> 수정 </a>
			<a class="btn btn-dark" href="./delete?boardNo=${dto.boardNo}"> 삭제</a>
		</footer>
		
		
	
	</div>

	
	


</body>
</html>