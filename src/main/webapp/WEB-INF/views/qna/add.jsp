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
			<input type="text" class="form-control  w-25" id="userId" name="userId" readonly="readonly" value="${member.userId}">
			</div>
			
			<div class="mb-3">
			 <label for="Default select example" class="form-label">유형</label>
			  <select id="kind" name="kindNo" class="form-select form-control w-25" aria-label="Default select example">
				  <option class="kind" value="1">회원/계정</option>
				  <option class="kind" value="2">오류/신고/제안</option>
				  <option class="kind" value="3">거래문의</option>
				  <option class="kind" value="4">기타</option>
			  </select>
			  </div>
			
			<div class="mb-3">
			<label for="title" class="form-label">제목</label>
			<input type="text" class="form-control w-50" id="title" name="title" >
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
			
			<button class="btn btn-dark" style="float:right" type="submit" id="btn" >등록</button>
			
			
		</form>
</section>			


	

</script>

<script src="../resources/js/file.js"></script>


</body>
</html>