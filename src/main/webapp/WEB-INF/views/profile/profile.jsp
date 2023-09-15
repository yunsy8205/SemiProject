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
	

	
	<div id="add" style="margin-top: 10%;" class="mt-3 ms-5" data-add-num="${dto.userNo}" >

	</div>
	<div id="more">
	</div>
</div>
	</section>
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
	<c:if test="${flag eq 'products'}">
		<script src="../resources/js/profilepro.js"></script>
	</c:if>
	<c:if test="${flag eq 'reviews'}">
		<script src="../resources/js/profilerev.js"></script>	
	</c:if>
</body>
</html>