<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.semi.main.product.ProductFileDTO" %>
<%@ page import="com.semi.main.my.DibsDTO" %>
<!DOCTYPE html>

<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Electro - HTML Ecommerce Template</title>

		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="/resources/css/bootstrap.min.css"/>

		<!-- Slick -->
		<link type="text/css" rel="stylesheet" href="/resources/css/slick.css"/>
		<link type="text/css" rel="stylesheet" href="/resources/css/slick-theme.css"/>

		<!-- nouislider -->
		<link type="text/css" rel="stylesheet" href="/resources/css/nouislider.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="/resources/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="/resources/css/style.css"/>

		<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous"> -->

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

	<style>
		.product-image {
            width: 100%;
            height: auto;
            max-height: 200px; /* Set the maximum height of the image */
            object-fit: cover; /* Maintain aspect ratio and cover area */
		}
	</style>
    </head>
	<body>
	<!-- HEADER -->
	<c:import url="../temp/header.jsp"></c:import>
	<!-- /HEADER -->

<!-- ------------------------------------------------------------------------------------------- -->

		<!-- NAVIGATION -->
		<nav id="navigation">
			<!-- container -->
			<div class="container">
				<!-- responsive-nav -->
				<div id="responsive-nav">
					<!-- NAV -->
					<ul class="main-nav nav navbar-nav">
						<li><a href="../">Home</a></li>
						<li><a href="./mypage">MY PAGE</a></li>
						<li><a href="./check">내 정보 수정</a></li>
						<li><a href="./management">구매내역</a></li>
						<li class="active"><a href="./dibs">내 찜 목록</a></li>
						<li><a href="./review">후기</a></li>
						<li><a href="./list">상품관리</a></li>
						<li><a href="./delete">회원탈퇴</a></li>
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		<!-- /NAVIGATION -->

<!-- ------------------------------------------------------------------------------------------- -->

		
<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="breadcrumb-header">내 찜 목록</h3>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /BREADCRUMB -->
	
<!-- ------------------------------------------------------------------------------------------- -->
	
	<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row ">

				<!-- section title -->
			<div class="col-md-12">
				<div class="section-title">
					<div class="section-nav">
						
					</div>
				</div>
			</div>
			<section class="container mt-5">
				<div class="col-md-12">
			    <div class="row ">
			        <c:forEach var="product" items="${dibs}" >
			            <div class="col-md-3">
			                <div class="product">
			                    <div class="product-img">
			                  
			                        <a href="../product/detail?proNo=${product.proNo}"><img src="${pageContext.request.contextPath}/resources/upload/product/${product.fileDTOs[0].originalName}" alt="" width="255" height="200"></a>
			                   
			                    </div>
			                    <div class="product-body">
			                        <p class="product-name"><a href="../product/detail?proNo=${product.proNo}">${product.proName}</a></p>
			                        <h4 class="product-price">${product.proPrice} </h4>
			                        <p class="product-createDate">작성일: ${product.createDate}</p>
			                        <p class="product-hit">조회수: ${product.proHit}</p>
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
			</div>

						  <!-- ... (페이징 및 검색 부분) ... -->
						  
				 <nav aria-label="Page navigation example">
			  		 <ul class="pagination">
					    <c:if test="${pager.pre}">
					        <li class="page-item">
					            <a class="page-link" href="/product/list?page=${pager.startNum - 1}&kind=${param.kind}&search=${param.search}&condition=${param.condition}" aria-label="Previous">
					                <span aria-hidden="true">&laquo;</span>
					            </a>
					        </li>
					    </c:if>
					    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					        <li class="page-item"><a class="page-link" href="/product/list?page=${i}&kind=${param.kind}&search=${param.search}&condition=${param.condition}">${i}</a></li>
					    </c:forEach>
					    <c:if test="${pager.next}">
					        <li class="page-item">
					            <a class="page-link" href="/product/list?page=${pager.lastNum + 1}&kind=${param.kind}&search=${param.search}&condition=${param.condition}" aria-label="Next">
					                <span aria-hidden="true">&raquo;</span>
					            </a>
					        </li>
					    </c:if>
					</ul>

				</nav>

			
				<!-- 검색 부분 -->
				<div class="input-group mb-3 justify-content-center">
				<form action="/product/list" method="GET">
				    <!-- 기존 검색 폼 입력 내용 -->
				    <select name="kind" id="k" class="input-select" aria-label="Default select example">
				        <option class="kind" value="proName">상품명</option>
				        <option class="kind" value="proContents">상품설명</option>
				        <option class="kind" value="userId">이름</option>
				    </select>
				    <input type="text" name="search" value="${pager.search}" class="form-control" placeholder="Search here">
				    <button type="submit" class="search-btn">검색</button>
				
				    <!-- 선택된 condition을 hidden input으로 추가 -->
				    <input type="hidden" name="condition" value="${param.condition}">
				</form>


				</div>
			
			</section>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
	
	
	
	
	
	
	
	<%-- 
	<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

								<!-- section title -->
                <div class="col-md-12">
                    <div class="section-title">
                    <h3 class="title">내가 찜한 목록</h3>
                        <div class="section-nav">
                        </div>
                    </div>
                </div>
					<!-- /section title -->
        <!-- 상품리스트 부분-->
        <section class="container mt-5">
            <div class="container">
                
                <div class="row">
                <c:choose>
                <c:when test="${not empty dibs}">
                    <c:forEach items="${dibs}" var="product" varStatus="status">
                        <div class="col-md-2">
                            <div class="product-card">
                                
                               <a href="../product/detail?proNo=${product.proNo}"><img src="${pageContext.request.contextPath}/resources/upload/product/${product.fileDTOs[0].originalName}" alt="" class="product-image" width="250" height="250"></a>
                                    
                                <div class="product-body">
                                <br>
                                <h3 class="product-contents"><a href="../product/detail?proNo=${product.proNo}">${product.proName}</a></h3>
                                <h4 class="product-price" style="color:red">상품가격 : ${product.proPrice}원</h4>
                                <p class="product-content">상품내용 : ${product.proContents}</p>
                                <p>작성일 : ${product.createDate}</p>
                                <p>조회수 : ${product.proHit}</p>
                                <h3 class="product-contents"></h3>
								</div>		
                            </div>
                        </div>
                    </c:forEach>
                   </c:when>
                <c:otherwise>
                    <div class="col-md-12">
                        <h3>찜목록이 없습니다. 찜목록을 추가해주세요.</h3>
                    </div>
                </c:otherwise>
            </c:choose>
                </div>
            </div>

        </section>
    	</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
	 --%>
	
	
	
	<%-- 
	<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">내가 찜한 목록</h3>
							
						</div>
					</div>
					<!-- /section title -->


					<!-- Products tab & slick -->
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab1" class="tab-pane active">
									<div class="products-slick" data-nav="#slick-nav-1">
										<!-- product -->
										<c:forEach var="product" items="${dibs}">
											<div class="product">
												<div class="product-img">	
												<c:forEach var="file" items="${product.fileDTOs}">
											        <img src="/resources/upload/product/${file.originalName}" width="200" height="200 alt="">
											      </c:forEach>
												
													<img src="../resources/upload/product/${product.fileDTOs[0].originalName}" alt="" width="200" height="200">
													
													<div class="product-label">
														<span class="new">NEW</span>
													</div>
												</div>
												<div class="product-body">
													<p class="product-name">${product.proName}</p>
													<h3 class="product-contents"><a href="../product/detail?proNo=${product.proNo}">${product.proContents}</a></h3>
													<h4 class="product-price">${product.proPrice} </h4>
													<p class="product-createDate">작성일: ${product.createDate}</p>
													<p class="product-hit">조회수: ${product.proHit}</p>
													<div class="product-btns">
														<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">찜하기</span></button>
													</div>
												</div>
												<!-- <div class="add-to-cart">
													<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>구매하기</button>
												</div> -->
											</div>
										</c:forEach>
									</div>
									<div id="slick-nav-1" class="products-slick-nav"></div>
								</div>
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- Products tab & slick -->

				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
	 --%>
	 
<%-- 	
	<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<div class="col-md-7">
						<!-- Billing Details -->
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">내가 찜한 목록</h3>
							</div>
							<div class="form-group">
								
								<c:forEach var="dibs" items="${dibs}">
							        <c:forEach var="fileDTO" items="${dibs.fileDTOs}" begin="0" end="0" step="1">
							                <img src="../resources/upload/product/${fileDTO.originalName}">
							        </c:forEach>
							        <p>상품 제목: ${dibs.proName}</p>
								    <p>상품 내용 : ${dibs.proContents}</p>
								    <p>가격 : ${dibs.proPrice}원</p>
								    <p>작성일 : ${dibs.createDate}</p>
								    <p>조회수 : ${dibs.proHit}</p>
        
    							</c:forEach>
     
							</div>
							<div class="form-group">
					
							</div>
							
							<div class="form-group">
								
							</div>
						</div>
						<!-- /Billing Details -->

						
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		</div>
		<!-- /SECTION -->
	 --%>
	
	
	<!-- ------------------------------------------------------------------------------------------- -->
		

		<!-- FOOTER -->
		<footer id="footer">
			<!-- top footer -->
			<div class="section">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">About Us</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
								<ul class="footer-links">
									<li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
									<li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
									<li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Categories</h3>
								<ul class="footer-links">
									<li><a href="#">Hot deals</a></li>
									<li><a href="#">Laptops</a></li>
									<li><a href="#">Smartphones</a></li>
									<li><a href="#">Cameras</a></li>
									<li><a href="#">Accessories</a></li>
								</ul>
							</div>
						</div>

						<div class="clearfix visible-xs"></div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Information</h3>
								<ul class="footer-links">
									<li><a href="#">About Us</a></li>
									<li><a href="#">Contact Us</a></li>
									<li><a href="#">Privacy Policy</a></li>
									<li><a href="#">Orders and Returns</a></li>
									<li><a href="#">Terms & Conditions</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Service</h3>
								<ul class="footer-links">
									<li><a href="#">My Account</a></li>
									<li><a href="#">View Cart</a></li>
									<li><a href="#">Wishlist</a></li>
									<li><a href="#">Track My Order</a></li>
									<li><a href="#">Help</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /top footer -->

			<!-- bottom footer -->
			<div id="bottom-footer" class="section">
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-12 text-center">
							<ul class="footer-payments">
								<li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
								<li><a href="#"><i class="fa fa-credit-card"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
							</ul>
							<span class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span>
						</div>
					</div>
						<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /bottom footer -->
		</footer>
		<!-- /FOOTER -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

		<!-- jQuery Plugins -->
		<script src="/resources/js/jquery.min.js"></script>
		<script src="/resources/js/bootstrap.min.js"></script>
		<script src="/resources/js/slick.min.js"></script>
		<script src="/resources/js/nouislider.min.js"></script>
		<script src="/resources/js/jquery.zoom.min.js"></script>
		<script src="/resources/js/main.js"></script>
    
	    <script>
	    let btn = document.getElementById("btn");
	    let frm = document.getElementById("frm");
	    let userPw = document.getElementById("userPw");
	    
	  	btn.addEventListener("click", function(){
	  		console.log("click");
	  		
	  		console.log(userPw.value);
	  		
	  		frm.submit();
	  	})
	    </script>
</body>
</html>