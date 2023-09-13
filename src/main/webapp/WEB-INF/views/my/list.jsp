<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	 /* 테이블 스타일 */
    table {
        text-align: center;
        width: 100%;
        border-collapse: collapse;
    }

    /* 테이블 헤더 셀 스타일 */
    
    th {
        text-align: center;
    }

    /* 상품명 폰트 크기 */
    td:nth-child(2) {
        font-size: 16px; /* 원하는 폰트 크기로 조정하세요 */
        padding-top: 10px; /* 위에 공간을 줄 크기로 조정하세요 */
    }

    /* 가격 폰트 크기 */
    td:nth-child(3) {
        font-size: 16px; /* 원하는 폰트 크기로 조정하세요 */
        padding-top: 10px; /* 위에 공간을 줄 크기로 조정하세요 */
    }

    /* 수정 버튼 스타일 */
    .btn-primary {
        font-size: 16px; /* 원하는 폰트 크기로 조정하세요 */
        padding: 10px 20px; /* 원하는 버튼 크기로 조정하세요 */
    }

    /* 삭제 버튼 스타일 */
    .btn-danger {
        font-size: 16px; /* 원하는 폰트 크기로 조정하세요 */
        padding: 10px 20px; /* 원하는 버튼 크기로 조정하세요 */
    }
</style>
    </head>
	<body>
<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            
			
			<ul class="header-links pull-right">
				<c:choose>
					<c:when test="${not empty member}">
						<li class="nav-item text-white me-3"><a href="../member/logout">로그아웃</a></li>
						<li class="nav-item text-white me-3"><a href="../my/mypage">mypage</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item text-white me-3"><a href="../member/login">로그인</a></li>
						<li class="nav-item text-white me-3"><a href="../member/signUp">회원가입</a></li>

					</c:otherwise>
				</c:choose>
			</ul>
			
			
			
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="../" class="logo">
                            <img src="/resources/img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form>
                            <select name="kind" id="k" class="input-select" data-kind="${pager.kind}" aria-label="Default select example">
                                <option class="kind" value="proName">상품명</option>
                                <option class="kind" value="proContents">상품설명</option>
                                <option class="kind" value="userId">이름</option>
                            </select>
                            <input class="input" placeholder="Search here">
                            <button class="search-btn">Search</button>
                        </form>
                    </div>
                </div>
                <!-- <div class="col-md-6">
                    <div class="header-search">
                        <form action="./list" method="get" id="frm">
                            <input type="hidden" value="${pager.page}" id="page" name="page">		
                            <select name="kind" id="k" class="input-select" data-kind="${pager.kind}" aria-label="Default select example">
                                <option class="kind" value="proName">상품명</option>
                                <option class="kind" value="proContents">상품설명</option>
                                <option class="kind" value="userId">이름</option>
                            </select>
                               <input type="text" name="search" value="${pager.search}" class="form-control" aria-label="Amount (to the nearest dollar)">
                                <button type="submit" class="search-btn">검색</button>
                               
                           </form>
                            
                    </div>
                </div> -->
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->
                        <div>
                            <a href="../product/add">
                                <span>상품등록</span>
                            </a>
                        </div>
                        <!-- /Wishlist -->

                        <!-- Cart -->
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Your Cart</span>
                                <div class="qty">3</div>
                            </a>
                            <div class="cart-dropdown">
                                <div class="cart-list">
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="./img/product01.png" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                            <h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
                                        </div>
                                        <button class="delete"><i class="fa fa-close"></i></button>
                                    </div>

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="/resources/img/product02.png" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                            <h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
                                        </div>
                                        <button class="delete"><i class="fa fa-close"></i></button>
                                    </div>
                                </div>
                                <div class="cart-summary">
                                    <small>3 Item(s) selected</small>
                                    <h5>SUBTOTAL: $2940.00</h5>
                                </div>
                                <div class="cart-btns">
                                    <a href="#">View Cart</a>
                                    <a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- /Cart -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
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

						<li><a href="./management">구매내역/후기</a></li>
						<li><a href="./dibs">내 찜 목록</a></li>

						<li class="active"><a href="./list">상품관리</a></li>
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
                <h3 class="breadcrumb-header">상품관리</h3>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- Product List Table -->
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped">
                <thead>
                    <tr>
                    <th>사진</th>
                        <th>상품명</th>
                        <th>가격</th>
                        <!-- <th>상태</th> -->
                        <th>수정</th>
                        <th>삭제</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <!-- JSTL을 사용하여 상품 목록을 반복해서 출력 -->
                    <c:forEach var="product" items="${list}">
                        <tr> 
                        <td>
                                <!-- 상품 사진을 표시 -->
                                <img src="${pageContext.request.contextPath}/resources/upload/product/${product.fileDTOs[0].originalName}" alt="" width="200" height="200">
                            </td>
                            <td><a href="/product/detail?proNo=${product.proNo}">${product.proName}</a></td>
                            <td>${product.proPrice}</td>
                            <%--  <!-- 상태에 따라 텍스트 출력 (예: "판매 중", "판매 완료") -->
                                <c:choose>
                                    <c:when test="${product.proStatus eq '판매 중'}">판매 중</c:when>
                                    <c:when test="${product.proStatus eq '판매 완료'}">판매 완료</c:when>
                                    <!-- 필요한 상태에 따라 추가로 설정 -->
                                </c:choose> --%>
                            </td>
                            <td>
                                <!-- 수정 버튼 -->
                                <a href="/product/update?proNo=${product.proNo}" class="btn btn-primary">수정</a>
                            </td>
                            <td>
                                <!-- 삭제 버튼 -->
                                <a href="/product/delete?proNo=${product.proNo}" class="btn btn-danger">삭제</a>
                            </td>
                           
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
</div>
  <!-- ... (페이징 및 검색 부분) ... -->
						  
				 <nav aria-label="Page navigation example">
			  		 <ul class="pagination">
					    <c:if test="${pager.pre}">
					        <li class="page-item">
					            <a class="page-link" href="/my/list?page=${pager.startNum - 1}" aria-label="Previous">
					                <span aria-hidden="true">&laquo;</span>
					            </a>
					        </li>
					    </c:if>
					    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					        <li class="page-item"><a class="page-link" href="/my/list?page=${i}">${i}</a></li>
					    </c:forEach>
					    <c:if test="${pager.next}">
					        <li class="page-item">
					            <a class="page-link" href="/my/list?page=${pager.lastNum + 1}" aria-label="Next">
					                <span aria-hidden="true">&raquo;</span>
					            </a>
					        </li>
					    </c:if>
					</ul>

				</nav>
 
	
<!-- ------------------------------------------------------------------------------------------- -->

		

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

	</body>
</html>

