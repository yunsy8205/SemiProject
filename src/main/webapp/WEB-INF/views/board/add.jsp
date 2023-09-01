<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:import url="../temp/bootstrap.jsp"></c:import>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<c:import url="../temp/BoardHeader.jsp"></c:import>

<section class="container mt-5">
	
		<form action="./add" method="post" id="frm" enctype="multipart/form-data">
		
				
			<div class="mb-3">
			<label for="userId" class="form-label">작성자</label>
			<input type="text" class="form-control" id="userId" name="userId" value="${member.userId}">
			</div>
			
			<div class="mb-3">
			<label for="title" class="form-label">제목</label>
			<input type="text" class="form-control" id="title" name="title" >
			</div>
			
			<div class="mb-3">
			<label for="contents" class="form-label">본문</label>
			<textarea rows="" cols="" class="form-control" id="contents" name="contents"></textarea>
			</div>
			
			
			
							<!-- file -->
			<div id="fileList" class="my-5"></div>
			
			<div class="mb-3">
				<button type="button" class="btn btn-outline-primary" id="fileAdd">File추가</button>
			</div>
			
			<button class="btn btn-danger" type="submit" id="btn" >등록</button>
			
			
		</form>
</section>			


	

</script>

<script src="../resources/js/file.js"></script>


</body>
</html>