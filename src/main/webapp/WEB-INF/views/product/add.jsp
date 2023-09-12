<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <c:import url="../temp/bootstrap.jsp"></c:import>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
	
		<div class="row justify-content-center my-4">
			<h1 class="col-md-7 text-center">상품등록</h1>
		</div>
		
		<div class="row justify-content-center my-4">
			<form class="col-md-7" action="./add" method="post" id="frm" enctype="multipart/form-data">
			
				
				<div class="mb-3">
                    <label for="pic" class="form-label">사진첨부 (1장 이상 필수)</label>
                    <input type="file" name="photos" class="form-control" id="pic" placeholder="+">
                </div>
				<div class="mb-3">
                    <label for="pic" class="form-label">사진첨부 (1장 이상 필수)</label>
                    <input type="file" name="photos" class="form-control" id="pic" placeholder="+">
                </div>
				<div class="mb-3">
                    <label for="pic" class="form-label">사진첨부 (1장 이상 필수)</label>
                    <input type="file" name="photos" class="form-control" id="pic" placeholder="+">
                </div>
                <div class="mb-3">
                    <label for="pic" class="form-label">사진첨부 (1장 이상 필수)</label>
                    <input type="file" name="photos" class="form-control" id="pic" placeholder="+">
                </div>
                <div class="mb-3">
                    <label for="pic" class="form-label">사진첨부 (1장 이상 필수)</label>
                    <input type="file" name="photos" class="form-control" id="pic" placeholder="+">
                </div>
				
				<!-- <div class="mb-3">
				  <label for="pic" class="form-label">사진첨부</label>
				  <input type="file" name="photos" class="form-control" id="pic" placeholder="+">
				</div>
				<div class="mb-3">
				  <label for="pic" class="form-label">사진첨부</label>
				  <input type="file" name="photos" class="form-control" id="pic" placeholder="+">
				</div>
				<div class="mb-3">
				  <label for="pic" class="form-label">사진첨부</label>
				  <input type="file" name="photos" class="form-control" id="pic" placeholder="+">
				</div>	 -->
				
						
				
				<div id="fileList" class="my-5"></div>
				
				<!-- 로그인 상태 확인 -->
                <c:if test="${empty member}">
                    <div class="alert alert-danger">로그인 후 상품을 등록할 수 있습니다.</div>
                </c:if>
				
				<div class="mb-3">
				  <label for="writer" class="form-label">작성자</label>
				  <input type="text" name="userId" readonly value="${member.userId}"  class="form-control" id="userId">
				</div>
				
               
				 <!-- 제목 필수 조건 -->
				 <div class="mb-3">
                    <label for="proName" class="form-label">제목 (필수)</label>
                    <input type="text" name="proName" class="form-control" id="proName" placeholder="제목 입력">
                </div>

				<!-- <div class="mb-3">
                    <label for="proName" class="form-label">제목</label>
                    <input type="text" name="proName"  class="form-control" id="proName" placeholder="제목 입력">
                  </div> -->
                  
                  <label for="catNo">카테고리 선택:</label>
				    <select id="catNo" name="catNo">
				        <option value="1001">에어컨</option>
				        <option value="1002">냉장고</option>
				        <option value="1003">세탁기</option>
						<option value="1004">TV</option>
						<option value="1005">노트북</option>
				        <option value="1006">청소기</option>
				    </select>

               
                  <div class="mb-3">
                    <label for="proStatus" class="form-label">상태</label>
                    <input name="proStatus" id="proStatus0" type="radio" value="0" checked>
                    <label for="proStatus0">중고상품</label>
                    <input name="proStatus" id="proStatus1" type="radio" value="1">
                    <label for="proStatus1">새상품</label>
                </div>
                <div class="mb-3">
                    <label for="exchange" class="form-label">교환</label>
                    <input name="exchange" id="exchange0" type="radio" value="0" checked>
                    <label for="exchange0">교환불가</label>
                    <input name="exchange" id="exchange1" type="radio" value="1">
                    <label for="exchange1">교환가능</label>
                </div>


				<!-- 가격 필수 조건 -->
					<div class="mb-3">
						<label for="proPrice" class="form-label">가격 (필수)</label>
						<input type="text" name="proPrice" class="form-control" id="proPrice" placeholder="가격 입력">
						원
					</div>

					<!-- 내용 필수 조건 -->
					<div class="mb-3">
						<label for="proContents" class="form-label">내용 (필수)</label>
						<textarea name="proContents" class="form-control" id="proContents" placeholder="내용 입력" rows="7"></textarea>
					</div>

					<!-- 수량 필수 조건 -->
					<div class="mb-3">
						<label for="proAmount" class="form-label">수량 (필수)</label>
						<input type="text" name="proAmount" class="form-control" id="proAmount" placeholder="수량 입력">
						개
					</div>
                  <!-- <div class="mb-3">
                    <label for="proPrice" class="form-label">가격</label>
                    <input type="text" name="proPrice" class="form-control" id="proPrice" placeholder="가격 입력">
                    원
                  </div>
		
				<div class="mb-3">
				  <label for="proContents" class="form-label">내용</label>
				  <textarea name="proContents" class="form-control" id="proContents" placeholder="내용 입력" rows="7"></textarea>
				</div>

                <div class="mb-3">
                    <label for="proAmount" class="form-label">수량</label>
                    <input type="text" name="proAmount" class="form-control" id="proAmount" placeholder="수량 입력">
                    개
                  </div> -->
				
				
				
							
				<div class="mb-3">
					<button class="my btn btn-danger" type="submit" id="btn">글쓰기</button>
				</div>
			
			</form>
		</div>
	</div>


	<!-- 필수 조건 스크립트 -->
<script>
    // 폼 제출 전 필수 조건 확인
    document.getElementById('frm').addEventListener('submit', function (event) {
        const photos = document.querySelector('input[name="photos"]');
        const proName = document.querySelector('input[name="proName"]');
        const proPrice = document.querySelector('input[name="proPrice"]');
        const proContents = document.querySelector('textarea[name="proContents"]');
        const proAmount = document.querySelector('input[name="proAmount"]');
        
        if (photos.files.length < 1) {
            event.preventDefault();
            alert('사진을 1장 이상 첨부해야 합니다.');
        }

        if (proName.value.trim() === '') {
            event.preventDefault();
            alert('제목을 입력해야 합니다.');
        }

        if (proPrice.value.trim() === '') {
            event.preventDefault();
            alert('가격을 입력해야 합니다.');
        }

        if (proContents.value.trim() === '') {
            event.preventDefault();
            alert('내용을 입력해야 합니다.');
        }

        if (proAmount.value.trim() === '') {
            event.preventDefault();
            alert('수량을 입력해야 합니다.');
        }
    });
</script>


</body>
</html>