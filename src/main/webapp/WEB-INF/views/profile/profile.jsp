<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 profile</title>
<style>
	.contain{
		width: 1000px;
		height: 1200px;
		margin: auto;
	}
	
	.userImage{
				
				width: 100%;
	            height: 100%;
	            object-fit: cover;
	     
			}
	.wrap{
	            width: 100%;
	            height: 25%;

	        }
	#test2{ 
	           
	            height: 100%;
	            box-sizing: border-box;
	            float: left;
	        }
			
	#box1{
		width: 30%;
	    height: 100%;
	    float: left;

	}
	
	#box2{
		width: 50%;
		height: 50%;
		border-radius: 70%;
	    overflow: hidden;
	    margin: auto;
	    margin-top: 40px;
	}
	
	#test2{ width: 67%;}
	
	#div1{
		padding: 20px;
	}
	.bi{
		color: rgb(252, 219, 3);
	}
	
	.btn1{
		    padding: 15px 100px 15px 100px;
		    background: white;
		    border: 1px solid black;
	}
	
	.btn2{
		    padding: 15px 85px 15px 85px;
		    background: white;
		    border: 1px solid black;
	}
	
	.wrap2{
		width: 100%;
	    height: 70%;
	    padding-top: 4%;
	}
	
	#more{
		margin: auto;
	}
	
</style>
<c:import url="../temp/bootstrap.jsp"></c:import>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<c:import url="../temp/header1.jsp"></c:import>
<c:import url="../temp/template.jsp"></c:import>
</head>
<body>
	<section class="contain">
<h1 class="mt-5 ms-5">회원 프로필</h1>
<div class="wrap border">

		<div id="box1">
			<div id="box2">
				<img class="userImage" src="../resources/upload/member/${member.memberFileDTO.fileName}" alt="...">
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
<div class="wrap2 border">
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