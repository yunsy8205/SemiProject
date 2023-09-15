<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
	<title>상품 Detail Page</title>
<c:import url="../temp/bootstrap.jsp"></c:import>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="../resources/css/prodetail.css">
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<div class="row">
					
						<ul class="breadcrumb-tree">
							<li><a href="../">Home</a></li>
							<c:if test="${dto.catNo==1001}"><li><a>핸드폰</a></li></c:if>
                  <c:if test="${dto.catNo==1002}"><li><a>전자기기</a></li></c:if>
                  <c:if test="${dto.catNo==1003}"><li><a>미용가전</a></li></c:if>
                  <c:if test="${dto.catNo==1004}"><li><a>주방가전</a></li></c:if>
                  <c:if test="${dto.catNo==1005}"><li><a>생활가전</a></li></c:if>
                  <c:if test="${dto.catNo==1006}"><li><a>사무기기</a></li></c:if>
                  <c:if test="${dto.catNo==1007}"><li><a>기타</a></li></c:if>
						</ul>
					</div>
				</div>
		
				<!-- /row -->
			</div>
			<!-- /container -->
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
									<img class="proImage" src="../resources/upload/product/${f.fileName}" class="d-block w-100" alt="...">
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
							<div class="border-bottom">
								<h2 class="product-name">${dto.proName}</h2>
								<h1 class="product-price">${dto.proPrice}원</h1>	
							</div>
							<div class="mt">
								<span style="font-weight: bold; font-size: 17px; color: #CCCCCC;"><i class="bi bi-eye-fill"> ${dto.hit}</i></span>
								<span id="report"><a href="../product/reportadd?userNo=${dto.userNo}" id="rt">신고하기</a></span>
							</div>
							<div class="mt">
								<span style="font-weight: bold; color: #CCCCCC;"><i class="fa fa-heart-o me-2"></i>상품상태</span>
		             			<span class="span ms-3" style="font-weight: bold;">
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
							<div class="mt">
								<span style="font-weight: bold; color: #CCCCCC;"><i class="fa fa-heart-o me-2"></i>교환여부</span>
		             			<span class="span ms-3" style="font-weight: bold;">
			             			<c:choose>
								 	    <c:when test="${dto.exchange eq 0}">
								 			교환가능
								 	    </c:when>
								 	    <c:otherwise>
								 			교환불가능
								 	    </c:otherwise>
							        </c:choose>
		             			</span>
		             			
							</div>
							<c:choose>
							 	<c:when test="${member.userNo eq dto.userNo}">
							 	
							 	</c:when>
							 	<c:otherwise>
									<div id="button1">
				                        <button style="background-color: #15161D;" class="btn2" id="dibs" type="button"><div class="t btn1"><i id="heart" class="bi bi-heart"></i>찜<span id="dibsNum" class="ms-2">${dibsNum}</span></div></button>
				                        <button style="background-color: #fcca26;" class="btn2 ms-3" type="button"><div class="t btn4"><a href="../my/chat">톡</a></div></button>
				                        <button id="buy" style="background-color: #D10024;" class="btn2 ms-3" type="button"><div class="t btn3">바로구매</div></button>
			                         
			                        </div>
							 	</c:otherwise>
							 </c:choose>
						</div>
					</div>
					
				</div>
				<div id="wrap2" class="border-top border-dark">
					<div class="div3">
						<div class="div5">
							<div class="border-bottom div7 div8"><h4>상품정보</h4></div>
							<div><p id="p1">${dto.proContents}</p></div>
						</div>
					</div>
					<div class="div4 border-start border-end">
						<div class="div6">
							<div class="border-bottom div7"><h4>판매자정보</h4></div>
							<div class="div9">
								<div class="div10">
									<div class="div11">
										<img class="memberImage" src="../resources/upload/member/${member.memberFileDTO.fileName}" alt="...">
									</div>
									<div class="div12">
										<div class="t2"><a>${dto.userId}</a></div>
										<div class="t2" style="color: #CCCCCC;"><a>상품 ${countp}</a></div>
									</div>
								</div>
								<div class="div13">
									<c:forEach items="${list}" var="d">
										<c:set var="flag" value="true"/>
										<div>
											<figure>
												<c:forEach items="${d.fileDTOs}" var="f">
													<c:if test="${flag?true:false}">
														<img class="image" src="../resources/upload/product/${f.fileName}" class="d-block w-100" alt="...">
														<c:set var="flag" value="false"/>
													</c:if>
												</c:forEach>
												<p class="imtext">${d.proPrice}</p>
											</figure>
										</div>
									</c:forEach>
								</div>
								<div class="div14 border-bottom">
									<a style="font-size: 15px; font-weight: bold;" href="../profile/products?userNo=${dto.userNo}">상품 더 보기</a>
								</div>
								<div class="div15 border-bottom">
									<div id="reviewh">판매자 후기</div><span style="color:#D10024; margin-left:3px; font-weight: bold;">${countr}</span>
									<div class="div18 border border-white">
										<c:forEach items="${review}" var="r">
											<div class="div16 border border-white">
												<a style="font-size:13px; font-weight: bold; color: rgb(204, 204, 204);">${r.userId}</a>
													<div>
														<c:forEach var="i" begin="1" end="${r.score}" step="1"><i class="bi star bi-star-fill"></i></c:forEach><c:if test="${r.score%1>=0.5}"><i class="bi star bi-star-half"></i></c:if><c:forEach var="i" begin="1" end="${5-r.score}" step="1"><i class="bi bi-star"></i></c:forEach> 
													</div>
												<div>${r.contents}</div>
											</div>
										</c:forEach>
									</div>
									<div class="div17 border-bottom border-top">
									<a style="font-size: 15px; font-weight: bold;" href="../profile/reviews?userNo=${dto.userNo}">후기 더 보기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /container -->
		</div>

		<!-- /SECTION -->	
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

	<c:if test="${not empty member}">
		<script src="../resources/js/detailLogin.js"></script>
	</c:if>
	<c:if test="${empty member}">
		<script src="../resources/js/detailLogout.js"></script>	
	</c:if>

</body>
</html>