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
<c:import url="../temp/BoardHeader.jsp"></c:import>
	<div class="container mt-5 pt-5">

		<header>
			<h1>1대1문의</h1>
		</header>
		<hr>
		
		
		<label for="id" class="form-label">아이디</label>
		<div class="border border-dark border-opacity-50 p-2 mb-3 w-25 rounded"> ${dto.userId}</div>

		<label for="kindName" class="form-label">유형</label>
		<div class="border border-dark border-opacity-50 p-2 mb-3 w-25 rounded" >${dto.kindName}</div>

		<label for="title" class="form-label">제목</label>
		<div class="border border-dark border-opacity-50 p-2 mb-3 w-25 rounded" >${dto.title}</div>
		
		<label for="contents" class="form-label">내용</label>
		<div class="border border-dark border-opacity-50 p-2 mb-3 w-100 rounded" >${dto.contents}</div>

		<div id="no" data-num-no="${dto.boardNo}" data-member-no="${member.userNo}"></div>
		<hr>
		<footer>
			<c:forEach items="${dto.fileDTOs}" var="f">
				<div>첨부파일 <a href="./fileDown?fileNo=${f.fileNo}">${f.originalName}</a><div>
			</c:forEach> 
			<a class="btn btn-dark" href="./update?boardNo=${dto.boardNo}"> 수정 </a>
			<a class="btn btn-dark" href="./delete?boardNo=${dto.boardNo}"> 삭제</a>
		</footer>
		
		
		<label for="contents" class="form-label">답글</label>
		<div class="border border-dark border-opacity-50 p-2 mb-3 w-100 rounded" id="contents">
		
		<div id="commentList"> </div>
		
		</div>
			
		<c:if test="${member.userId == 'ADMIN' }">
		<div class="a mb-3">
			<label for="comment" class="form-label">답글달기</label>
			<textarea cols="10" rows="10" class="form-control" id="comment"></textarea>
			<button class="btn btn-primary mb-3" id="commentAdd">답글등록</button>
		</div>
		</c:if>
		
	
	</div>
	
	<script type="text/javascript">

	

		let userNo = $("#no").attr("data-member-no");
		let boardNo = $("#no").attr("data-num-no");
		

		$("#commentAdd").click(function(){
			
			let comment = $("#comment").val();
			
			
			
			$.ajax({
			type:"POST",
			url:"./commentAdd",
			data:{
				boardNo: boardNo,
				userNo : userNo,
				contents : comment

			},
			success:function(result){

				if(result.trim()>0){
					
					$("#commentList").empty();
					$("#comment").val("");
					
					console.log(boardNo)
					getCommentList(boardNo);
				}


			}
		});
		})

		getCommentList(boardNo);

		function getCommentList(boardNo){
		$.ajax({
			type:"get",
			url: "./commentList",
			data:{
				boardNo:boardNo,
				
			},
			success:function(result){
				console.log(result);
				
				$("#commentList").append(result);

				
			},
			error:function(){
				alert("관리자에게 문의")
			}
		});
	}
	
		



	
	</script>

	
	


</body>
</html>