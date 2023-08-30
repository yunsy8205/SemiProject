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
<c:import url="../temp/header.jsp"></c:import>

<section class="container mt-5">
	
		<form action="./update" method="post" id="frm" enctype="multipart/form-data">
		
			<input type="hidden" name="boardNo" readonly="readonly"  value="${dto.boardNo}">
			
			<div class="mb-3">
			<label for="userId" class="form-label">작성자</label>
			<input type="text" class="form-control" id="userId" name="userId" value="${member.userId}">
			</div>
			
			<div class="mb-3">
			<label for="title" class="form-label">제목</label>
			<input type="text" class="form-control" id="title" name="title" value="${dto.title}">
			</div>
			
			<div class="mb-3">
			<label for="contents" class="form-label">본문</label>
			<textarea rows="" cols="" class="form-control" id="contents" name="contents" > ${dto.contents}</textarea>
			</div>
			
			
			
							<!-- file -->
			<div id="fileList" class="my-5"></div>
			
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
			
			<button class="btn btn-danger mt-4" type="submit" id="btn">수정</button>
			
		</form>
</section>			

	
	


<script src="../resources/js/file.js"></script>
<script>

$("#contents").summernote({
			height: 400,
			callbacks: {
				onImageUpload: function(files){
					alert('이미지 업로드');
					//이미지를 server로 전송하고
					//응답으로 이미지경로와 파일명을 받아서
					//img 태그를 만들어서 src속성에 이미지 경로를 넣는것
					let formData = new FormData(); // <form></form>
					formData.append("files",files[0]); // <input type="file" name="files"> 를 폼안에 추가

					$.ajax({
						type:"post",
						url:'./setContentsImg',
						data:formData,
						enctype: 'multipart/form-data',
						cache: false,
						processData: false,
		       			contentType: false,
						success:function(result){
							console.log(result)
							$("#contents").summernote('insertImage', result.trim());
						},
						error:function(){
							console.log('error');
						}	
					});

				},
				onMediaDelete:function(files){
					let path = $(files[0]).attr("src"); // /resources/upload/notice/파일명
					console.log("del");
					$.ajax({
						type:'post',
						url:'./setContentsImgDelete',
						data:{
							path:path
						},
						success:function(result){
							console.log(result);
						},
						error:function(){
							console.log('error');
						}
					})
				}

			}
		})
</script>

</body>
</html>