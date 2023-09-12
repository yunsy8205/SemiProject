`<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 profile</title>
<style>
	.userImage{
				
				width: 100%;
	            height: 90%;
	            box-sizing: border-box;
			}
	.wrap{
	            width: 1000px;
	            height: 300px;
	        }
	#test1, #test2{ 
	           
	            height: 100%;
	            box-sizing: border-box;
	            float: left;
	        }
			
	#test1{width: 30%;}
	#test2{width: 70%;}
	
	#div1{
		padding: 20px;
	}
	.bi{
		color: rgb(252, 219, 3);
	}
	
</style>
<c:import url="../temp/bootstrap.jsp"></c:import>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
<h1 class="mt-5 ms-5">회원 profile</h1>
<div class="mt-3 mb-3 ms-5 wrap border">
	<div id="test1">
		회원사진<img class="userImage" src="../resources/upload/member/${f.originalName}" class="d-block w-100" alt="...">
	</div>
	<div id="test2">
		<h3>${dto.userId}</h3>
		<div>
		<c:forEach var="i" begin="1" end="${score}" step="1"><i class="bi bi-star-fill"></i></c:forEach><c:if test="${score%1>=0.5}"><i class="bi bi-star-half"></i></c:if><c:if test="${r.score%1<0.5}"><i class="bi bi-star"></i></c:if><c:forEach var="i" begin="1" end="${5-score}" step="1"><i class="bi bi-star"></i></c:forEach>
		</div>
		<span>상품판매횟수 : </span><span id="div1">택배발송횟수 : </span>
			<h5>소개글</h5>
			<p>${dto.intro}</p>
	</div>
</div>
<div class="ms-5">
	<c:if test="${flag eq 'products'}">
   		 <a class="btn btn-primary" href="./reviews?userNo=${dto.userNo}">후기목록</a>
	</c:if>
	<c:if test="${flag eq 'reviews'}">
		<a class="btn btn-primary" href="./products?userNo=${dto.userNo}">상품목록</a>	
	</c:if>

	
	<div id="add" class="mt-3 ms-5" data-add-num="${dto.userNo}" >
	</div>
	<div id="more">
	</div>
</div>
	<c:if test="${flag eq 'products'}">
		<script src="../resources/js/profilepro.js"></script>
	</c:if>
	<c:if test="${flag eq 'reviews'}">
		<script src="../resources/js/profilerev.js"></script>	
	</c:if>
</body>
</html>