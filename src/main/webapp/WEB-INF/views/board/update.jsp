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
	
		<form action="./update" method="post" id="frm" enctype="multipart/form-data">
		
			<input type="hidden" name="boardNo" readonly="readonly"  value="${dto.boardNo}">
			
			<div class="mb-3">
			<label for="userId" class="form-label ">작성자</label>
			<input type="text" class="form-control p-2 mb-3 w-25" id="userId" name="userId" value="${member.userId}">
			</div>
			
			<div class="mb-3">
			<label for="title" class="form-label">제목</label>
			<input type="text" class="form-control p-2 mb-3 w-25" id="title" name="title" value="${dto.title}">
			</div>
			
			<div class="mb-3">
			<label for="contents" class="form-label">본문</label>
			<textarea rows="" cols="" class="form-control" id="contents" name="contents" > ${dto.contents}</textarea>
			</div>
			
			
			
							<!-- file -->
			<div id="fileList" class="my-5 col-xs-3"></div>
			
			<div class="mb-3">
				<button type="button" class="btn btn-outline-primary mb-2" id="fileAdd">File추가</button>
			</div>
			
			<div >
			<c:forEach items="${dto.fileDTOs}" var="f">
				<span class="alert alert-primary me-2" role="alert" id="${f.fileNo}" >
					첨부파일 : ${f.originalName}
				 </span>
			<span class="delets" data-delete-num="${f.fileNo}" >x</span>
			</c:forEach>
			</div>
			
			<button class="btn btn-dark mt-4" style="float:right" type="submit" id="btn">수정</button>
			
		</form>
</section>			

	
	


<script src="../resources/js/file.js"></script>

</body>
</html>