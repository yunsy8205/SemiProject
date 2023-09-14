<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <c:import url="../temp/bootstrap.jsp"></c:import>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <title>상품 수정</title>
</head>
<body>
   <div class="container-fluid">
        <div class="row justify-content-center my-4">
            <h1 class="col-md-7 text-center">상품 수정</h1>
        </div>
        
        <div class="row justify-content-center my-4">
            <form class="col-md-7" action="./update" method="post" id="frm" enctype="multipart/form-data">
                <!-- 생략... -->
                <input type="hidden" name="proNo" value="${product.proNo}">

                

               <div class="mb-3">
					<button type="button" class="btn btn-primary" id="add">File추가</button>
				</div>
				
				<div id="fileList" class="my-5">
						
	
				

				<div>
					<c:forEach items="${product.fileDTOs}" var="f">
						<div class="alert alert-danger" role="alert" >
							${f.fileName}
						</div>
						<span class="delets" data-delete-num="${f.fileNo}" data-file-name="${f.fileName}">X</span>
					</c:forEach>	

				</div>

				</div>
                <div>
                    <label for="catNo">카테고리 선택:</label>
                      <select id="catNo" name="catNo">
                          <option value="1001">핸드폰</option>
                          <option value="1002">전자기기</option>
                          <option value="1003">미용가전</option>
                          <option value="1004">주방가전</option>
                          <option value="1005">생활가전</option>
                          <option value="1006">사무기기</option>
                          <option value="1007">기타</option>
                      </select>
                      </div>

                <div class="mb-3">
                    <label for="proStatus" class="form-label">상태</label>
                    <input name="proStatus" id="proStatus0" type="radio" value="0" <c:if test="${product.proStatus == 0}">checked</c:if>>
                    <label for="proStatus0">중고상품</label>
                    <input name="proStatus" id="proStatus1" type="radio" value="1" <c:if test="${product.proStatus == 1}">checked</c:if>>
                    <label for="proStatus1">새상품</label>
                </div>

                <div class="mb-3">
                    <label for="exchange" class="form-label">교환</label>
                    <input name="exchange" id="exchange0" type="radio" value="0" <c:if test="${product.exchange == 0}">checked</c:if>>
                    <label for="exchange0">교환불가</label>
                    <input name="exchange" id="exchange1" type="radio" value="1" <c:if test="${product.exchange == 1}">checked</c:if>>
                    <label for="exchange1">교환가능</label>
                </div>

                <!-- userId는 변경하지 못하도록 readonly로 설정 -->
                <div class="mb-3">
                    <label for="writer" class="form-label">작성자</label>
                    <input type="text" name="userId" readonly value="${product.userId}" class="form-control" id="userId">
                </div>

                <div class="mb-3">
                    <label for="proName" class="form-label">제목 (필수)</label>
                    <input type="text" name="proName" class="form-control" id="proName" placeholder="제목 입력" value="${product.proName}">
                </div>

                <!-- 기존 내용 표시 (수정 필요) -->
                <div class="mb-3">
                    <label for="proContents" class="form-label">내용 (필수)</label>
                    <textarea name="proContents" class="form-control" id="proContents" placeholder="내용 입력" rows="7">${product.proContents}</textarea>
                </div>

                <div class="mb-3">
                    <label for="proPrice" class="form-label">가격 (필수)</label>
                    <input type="text" name="proPrice" class="form-control" id="proPrice" placeholder="가격 입력" value="${product.proPrice}">
                    원
                </div>

                <div class="mb-3">
                    <label for="proAmount" class="form-label">수량 (필수)</label>
                    <input type="text" name="proAmount" class="form-control" id="proAmount" placeholder="수량 입력" value="${product.proAmount}">
                    개
                </div>

                <div class="mb-3">
                    <button class="my btn btn-danger" type="submit" id="btn">수정하기</button>
                </div>
            </form>
        </div>
        </div>
    </div>
    
    <script src="/resources/js/file.js"></script>
    <!-- 필수 조건 스크립트 -->
    <script>
  
    // 폼 제출 전 필수 조건 확인
    document.getElementById('frm').addEventListener('submit', function (event) {
        const proName = document.querySelector('input[name="proName"]');
        const proPrice = document.querySelector('input[name="proPrice"]');
        const proContents = document.querySelector('textarea[name="proContents"]');
        const proAmount = document.querySelector('input[name="proAmount"]');

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
