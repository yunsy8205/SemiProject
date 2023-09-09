<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
	<title>상품 Detail Page</title>
<c:import url="../temp/bootstrap.jsp"></c:import>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<c:import url="../temp/header1.jsp"></c:import>
<style>
	
	.btn1{
		color: white;  
		padding-top: 15px; 
		padding-bottom: 15px; 
		padding-left: 53px; 
		padding-right: 53px;
	}
	
	.btn3{
		color: white;  
		padding-top: 15px; 
		padding-bottom: 15px; 
		padding-left: 38px; 
		padding-right: 38px;
	}
	
	.btn2{
		border:none;
	}
	
	.proImage{
		width: 100%;
		height: 100%;
		box-sizing: border-box;
		
	}
	
	#wrap1{
		width: 100%;
		height: 500px;

	}
	
	.div1{
		width: 50%;
		height: 100%;
		float: left;
		box-sizing: border-box;
	}
	.div2{
		width: 50%;
		height: 100%;
		float: left;
		
	}
	
	.imgdiv{
		width: 90%;
		height: 95%;
		
	}
	
	.t{
		font-weight : bold; 
		font-size: 20px;
	}
	
	.bi-heart-fill{
		color: red;
	}
	
	.bi{
		margin: 4px;
	}
	
	#wrap2{
		width: 100%;
		height: 1000px;

	}
		
	.div3{
		width: 65%;
		height: 100%;
		float: left;
	}
	.div4{
		width: 35%;
		height: 100%;
		float: left;
		
	}
	
	.div5{
		height:90%;
		margin-top: 30px;
		margin-right: 30px;
	}
	
	.div6{
		margin: 30px;
		height: 90%;
	}
	
	.div7{
		height: 7%;
		padding-top: 35px;
	}
	
	.div8{
		

	}
	#report{
		margin-left: 300px;
	}
	
	#rt{
		color: #B7B5B5;
		font-weight : bold;
	}
</style>
</head>
<body>

		<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<ul class="breadcrumb-tree">
							<li><a href="#">Home</a></li>
							<li><a href="#">All Categories</a></li>
							<li><a href="#">Accessories</a></li>
							<li><a href="#">Headphones</a></li>
							<li class="active">Product name goes here</li>
						</ul>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /BREADCRUMB -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<div id="wrap1">
					<!-- Product main img -->
					<div class="div1" id="add" data-add-pnum="${dto.proNo}">
					<div id="carouselExampleIndicators" class="file carousel slide imgdiv">
						<div class="carousel-inner imgdiv">
							<c:forEach items="${dto.fileDTOs}" var="f">
								<div class="carousel-item active imgdiv">
									<img class="proImage" src="../resources/upload/product/${f.originalName}" class="d-block w-100" alt="...">
								</div>
							</c:forEach>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
						</div>
					</div>
					<!-- /Product main img -->
					<div id="clear1">
					</div>
					<!-- Product details -->
					<div class="div2">
						<div class="div2-1">
							<h2 class="product-name">${dto.proName}</h2>
							<h1 class="product-price">${dto.proPrice}원</h1>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
							
							<div class="mt-2">
								<span><i class="fa fa-heart-o me-2"></i>상품상태</span>
		             			<span class="span ms-3">
			             			<c:choose>
								 	    <c:when test="${dto.proStatus eq 0}">
								 			중고상품
								 	    </c:when>
								 	    <c:otherwise>
								 			새상품
								 	    </c:otherwise>
							        </c:choose>
		             			</span>
							</div>
							<div class="mt-2">
								<span><i class="fa fa-heart-o me-2"></i>교환여부</span>
		             			<span class="span ms-3">
			             			<c:choose>
								 	    <c:when test="${dto.exchange eq 0}">
								 			교환가능
								 	    </c:when>
								 	    <c:otherwise>
								 			교환불가능
								 	    </c:otherwise>
							        </c:choose>
		             			</span>
		             			<span id="report"><a href="../member/reportadd?userNo=${dto.userNo}" id="rt">신고하기</a></span>
							</div>
							<div style="padding-top: 30px">
		                        <button style="background-color: #15161D;" class="btn2" id="dibs" type="button"><div class="t btn1"><i id="heart" class="bi bi-heart"></i>찜<span id="dibsNum" class="ms-2">${dibsNum}</span></div></button>
		                        <button style="background-color: #fcca26;" class="btn2 ms-3" type="button"><div class="t btn1">톡</div></button>
		                        <button id="buy" style="background-color: #D10024;" class="btn2 ms-3" type="button"><div class="t btn3">바로구매</div></button>
	                         
	                        </div>
						</div>
					</div>
					
				</div>
				<div id="wrap2" class="border-top border-dark">
					<div class="div3">
						<div class="div5">
							<div class="border-bottom div7"><h4 class="div8">상품정보</h4></div>
						</div>
					</div>
					<div class="div4 border-start border-end">
						<div class="div6">
							<div class="border-bottom div7"><h4>판매자정보</h4></div>
						</div>
					</div>
				</div>
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

	<c:if test="${not empty member}">
		<script src="../resources/js/detailLogin.js"></script>
	</c:if>
	<c:if test="${empty member}">
		<script src="../resources/js/detailLogout.js"></script>	
	</c:if>
<c:import url="../temp/footer1.jsp"></c:import>
</body>
</html>