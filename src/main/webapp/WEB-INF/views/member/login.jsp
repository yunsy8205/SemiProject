<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	// 로그인 되어 있으면 메인페이지로 강제 이동
	if (session.getAttribute("member") != null && session.getAttribute("member") != "") {
		response.sendRedirect("/");
	}
	// 이전 페이지 기록
    String referer = request.getHeader("member");
    if(referer==null)referer = "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootstrap.jsp"></c:import>
 <!-- Bootstrap core CSS -->
<!-- <link href="/static/bootstrap.min.css" rel="stylesheet"> -->
 <style>
    /* 부모 요소 스타일 */
   .center-fieldset {
       display: flex;
       justify-content: center;
       align-items: center;
   }
    
   /* fieldset 스타일 */
   .fieldset-container {
       padding: 60px;
       border: 1px solid #ccc;
       background-color: #f0f0f0;
   }
   
   #sform {
          display: inline-block;
          text-align: center;
        }
   
 </style>

</head>
<body class="text-center">
	<c:import url="../temp/header.jsp"></c:import>
	
<!-- ======= Join Section ======= -->
	<section class="container mt-2">
		<h1 class="text-center" id="login">로그인</h1>
	<br><br>
	<div class="loginFormGrp form-signin center-fieldset" id="sform" style="width:500px;" >
	<!-- login form -->
	<!--  action="${pageContext.request.contextPath}/login.com -->
	<form role="form" class="center" method="post" id="loginfrm" action="./login.com" enctype="multipart/form-data" autocomplete="off">
	<fieldset  class="fieldset-container">
		<div class="form-group">
    <label for="userId" class="col-sm-2" style="font-size:20px;">ID</label>
    <input type="text" class="form-control" name="userId" value="${cookie.id.value}" id="userId" style="font-size:14px;" form="loginfrm" placeholder="ID를 입력하세요">
	</div>

	<div class="form-group">
	    <label for="pw" class="col-sm-2" style="font-size:20px;">PASSWORD</label>
	    <input type="password" class="form-control" name="userPw" id="pw" value="" style="font-size:14px;" form="loginfrm" placeholder="비밀번호를 입력하세요">
	</div>

	  <div class="mb-3 form-check">
	              <input type="checkbox" class="form-check-input" id="rememberUsername">
	              <label class="form-check-label" for="rememberUsername">아이디 저장</label>
	  </div>
	  <div class="mb-3 form-check">
	              <input type="checkbox" class="form-check-input" id="rememberLogin">
	              <label class="form-check-label" for="rememberLogin">로그인 상태 유지</label>
	  </div>
		
	<div class="mb-3">
		<button type="button" id="loginbtn" class="btn btn-primary">로그인</button>
	</div>
    
	</fieldset>
   </form>
   </div>
   <br><br>
   <div>
	   <p>- 소셜 계정으로 로그인 -</p>
	   <!-- 카카오 로그인 -->
   </div>
   
   <br><br>
   <!-- 아이디 비번 찾기 및 회원가입 영역 -->
   <div class="loginEtc">
   		<a href="./findId" class="lnk_etc"><button type="button" class="btn btn-primary">아이디 찾기</button></a>
   		<em class="divi"></em>
   		<a href="./findPw" class="lnk_etc"><button type="button" class="btn btn-primary">비밀번호 찾기</button></a>
   		<em class="divi"></em>
   		<a href="./signUp" class="lnk_etc"><button type="button" class="btn btn-primary">회원가입</button></a>
   </div>
   
	</section>	
<br><br><br><br><br><br>
<!-- ----------------------------------footer--------------------------------------------------- -->
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
		
	 <!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="/resources/js/login.js"></script>

</body>
</html>