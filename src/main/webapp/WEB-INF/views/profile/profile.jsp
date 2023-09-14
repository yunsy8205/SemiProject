<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 profile</title>
<link rel="stylesheet" href="../resources/css/profile.css">
<c:import url="../temp/bootstrap.jsp"></c:import>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<c:import url="../temp/template.jsp"></c:import>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

	<section class="contain">
<h1 class="mt-5 ms-5">회원 프로필</h1>
<div class="wrap border">

		<div id="box1">
			<div id="box2">
				<img class="userImage" src="../resources/upload/member/${dto.fileName}" alt="...">
			</div>
			<div style="text-align: center; margin-top: 15px;">
				<div style="font-size: 17px;">${dto.userId}</div>
				<div>
				<c:forEach var="i" begin="1" end="${score}" step="1"><i class="bi bi-star-fill ms-1"></i></c:forEach><c:if test="${score%1>=0.5}"><i class="bi bi-star-half ms-1"></i></c:if><c:if test="${score%1<0.5}"><c:if test="${score%1>0}"><i class="bi bi-star A ms-1"></i></c:if></c:if><c:forEach var="i" begin="1" end="${5-score}" step="1"><i class="bi bi-star B ms-1"></i></c:forEach>
				</div>
			</div>
		</div>
		<div id="test2">
			<div style="font-size: 19px; font-weight: bold;" class="mt-5">${dto.userId}</div>
			<div class="border-bottom mt-3" style="font-size: 15px; padding-bottom: 10px;"><i style="color: #5CA0DB;" class="bi bi-basket3-fill"></i> 상품판매</div>
			<div class="mt-4">${dto.intro}</div>
		</div>

</div>
<div class="wrap2">
	<c:if test="${flag eq 'products'}"></c:if>
	<c:if test="${flag eq 'reviews'}"></c:if>	
		<a class="btn1" href="./products?userNo=${dto.userNo}">상품</a>	
   		<a class="btn2" href="./reviews?userNo=${dto.userNo}">회원후기</a>
	

	
	<div id="add" class="mt-3 ms-5" data-add-num="${dto.userNo}" >
					        <c:forEach var="product" items="${list}" >
			            <div class="col-md-3">
			                <div class="product">
			                    <div class="product-img">
			                        <img src="../resources/upload/product/${dto.originalName}" alt="" width="200" height="200">
			                    </div>
			                    <div class="product-body">
			                        <p class="product-name"><a href="./detail?proNo=${dto.proNo}">${dto.proName}</a></p>
			                        <h4 class="product-price">${dto.proPrice} </h4>
			                        <p class="product-createDate">작성일: ${dto.createDate}</p>
			                        <p class="product-hit">조회수: ${dto.hit}</p>
			                        <div class="product-btns">
			                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">찜하기</span></button>
			                        </div>
			                    </div>
			                    <div class="add-to-cart">
			                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>구매하기</button>
			                    </div>
			                </div>
			            </div>
			        </c:forEach>
	</div>
	<div id="more">
	</div>
</div>
	</section>
	<c:if test="${flag eq 'products'}">
		<script src="../resources/js/profilepro.js"></script>
	</c:if>
	<c:if test="${flag eq 'reviews'}">
		<script src="../resources/js/profilerev.js"></script>	
	</c:if>
<c:import url="../temp/footer1.jsp"></c:import>
</body>
</html>