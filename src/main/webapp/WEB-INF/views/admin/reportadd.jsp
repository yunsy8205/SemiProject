<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Insert title here</title>
<c:import url="../temp/bootstrap.jsp"></c:import>
<c:import url="../temp/header1.jsp"></c:import>
<c:import url="../temp/template.jsp"></c:import>
</head>
<body>
      <!-- SECTION -->
      <div class="section">
         <!-- container -->
         <div class="container">
            <!-- row -->
            <div class="row" style="display:block; margin: 0px;">

               <div class="col-md-7" style="width: 70%">
                  <!-- Billing Details -->
                  <form action="../admin/reportadd" method="post" enctype="multipart/form-data">
                  <div class="billing-details">
                     <div class="section-title">
                        <h3 class="title">신고하기</h3>
                     </div>
                     <div class="form-group">
                     	<label for="catNo">신고 유형</label><br>
                        <select class="input-select" name="catNo">
								<option value="1">광고성 콘텐츠</option>
								<option value="2">부정확한 상품정보</option>
								<option value="3">거래금지품목 판매</option>
								<option value="4">사기의심</option>
								<option value="5">기타신고</option>
						</select>
                     </div>
                     <div class="form-group">
                     	<label for="userId">회원 아이디</label><br><!-- 번호가 넘어가서 아이디를 불러와야함 -->
                        <input class="input" type="text" name="userId" readonly value="${dto.userId}">
                     	<input class="input" type="hidden" name="userNo" value="${dto.userNo}">
                     </div>
                     <div class="form-group">
                     	<label for="title">제목</label>
                     	<input class="input" type="text" name="title">
                     </div>
                     <div class="form-group">
                     	<label for="rContents">신고 내용</label><br>
                        <textarea class="input" id="rContents" name="rContents" placeholder="※ 신고할 회원 아이디와 상품명을 정확하게 기재해 주세요."></textarea>
                     </div>
                     <div class="form-group">
                     	<label for="photos">사진 첨부</label>
                        <input class="input" type="file" name="photos">
                     </div>
                     <div class="form-group">
                        <input class="input" type="file" name="photos">
                     </div>
                     <div class="form-group">
                        <input class="input" type="file" name="photos">
                     </div>
                     <div class="form-group">
                        <input class="input" type="file" name="photos">
                     </div>
                     <div class="form-group">
                        <input class="input" type="file" name="photos">
                     </div>
                     
                  <button type="submit" class="primary-btn order-submit">신고하기</button><a style="float:right; text-decoration: underline;" href="../profile/products?userNo=${dto.userNo}">취소</a>
               </div>
               </form>
            </div>
            <!-- /row -->
         </div>
         <!-- /container -->
      </div>
      <!-- /SECTION -->

      <!-- NEWSLETTER -->
      <div id="newsletter" class="section">

      </div>
      <!-- /NEWSLETTER -->
<c:import url="../temp/footer1.jsp"></c:import>
</body>
</html>