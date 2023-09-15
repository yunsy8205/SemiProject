<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<title>Document</title>
	<c:import url="../temp/bootstrap.jsp"></c:import>
	<style>
	.f{
		color: red;
	}
	.s{
		color: blue;
	}
	
    input{
        padding: 10px; /* 내부 여백 조절 */
        margin: 5px; /* 외부 여백 조절 */
    }
 
	</style>
</head>
<body class="center">
	<c:import url="../temp/header.jsp"></c:import>
	<section class="container">
		<div class="page-haeder">
			<div align="center">
				<h2>회원가입</h2>
			</div>
		</div>
		<hr>

<!-- 회원가입 폼 -->		
	<div style="width:500px">
		<form class="align-center" action="/member/signUp" method="post" enctype="multipart/form-data" id="frm">
			<div class="form-group">
				<label for="userId">아이디</label>		
				<input type="text" class="form-control" id="id" name="userId" maxlength="20" placeholder="영문 대소문자와 숫자 4~8자리으로 id를 입력하세요" required>	
				<div class="checkResult" id="idResult"  style="display:none;"></div>
				<button type="button" id="sameId" value="N">ID확인</button>
			</div>	
			<div class="form-group">
				<label for="userPw">비밀번호</label>		
				<input type="password" class="form-control" id="pw" name="userPw" maxlength="20" placeholder="패스워드를 입력하세요" required>
				<div class="checkResult" id="pwResult"></div>
			</div>	
			
			<div class="form-group">
				<label for="userPw2">비밀번호 확인</label>		
				<input type="password" class="form-control" id="pw2" maxlength="20" placeholder="패스워드를 한번 더 입력하세요" required>
				<div class="checkResult" id="pw2Result"></div>
			</div>	
			
			<div class="form-group">
				<label for="name">이름</label>		
				<input type="text" class="form-control" id="name" name="name" maxlength="20" placeholder="이름을 입력하세요" required>
				<div class="checkResult" id="nameResult"></div>
			</div>	
							
			<div class="form-group">
				<label for="email">이메일 주소</label>		
				<input type="email" class="form-control" id="email" name="email" placeholder="E-mail (Ex.GUDI@naver.com)" value="${kakaoMember.email}" required>
				<div class="checkResult" id="emailResult"></div>
			</div>
			
			<div class="form-group">
				<label for="phone">핸드폰번호</label>		
				<input type="tel" class="form-control" id="phone" name="phone" oninput="autoHyphen2(this)" maxlength="13" placeholder="번호를 입력하세요">
				<div class="checkResult" id="phoneResult"></div>
			</div>	
						
			<div class="form-group">
				<label for="zipCode">우편번호</label>		
				<input type="text" class="form-control" id="postcode" name="zipCode" placeholder="우편번호">
				<input type="button" onclick="openDaumPostcode()"id="postcodebtn"  value="우편번호 찾기"><br>
			</div>
			<div class="form-group">
				<label for="address">주소</label>		
				<input type="text" class="form-control" id="address" name="address" placeholder="주소">
				<div class="checkResult" id="addrCheck"></div>
			</div>
			<div class="form-group">
				<label for="refAddress">참고주소</label>		
				<input type="text" class="form-control" id="extraAddress" name="refAddress" placeholder="예:(금천구)">
				<div class="checkResult" id="addr2Check"></div>
			</div>
			<div class="form-group">
				<label for="detailAddress">상세주소</label>		
				<input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세주소">
				<div class="checkResult" id="addr3Check"></div>
			</div>
			<br>
			<div class="form-group">
				<label for="birth">생년월일</label>		
				<input type="date" class="form-control" id="birth" name="birth">
				<div class="birthResult" id="birthCheck"></div>
			</div>
			
			<!-- 회원 프로필사진 첨부 -->
			<div class="form-group">
		  		<label for="pic" class="form-label">프로필 사진</label>
		  		<input type="file" name="file" class="form-control" id="file">
			</div>
			
			<p>자기소개</p>
		    <textarea name="intro" id="intro" placeholder="자기소개를 입력해주세요" cols="30" rows="4"></textarea>
		    <br/>
			
			<button type="button" class="btn btn-primary" id="signUp">회원가입</button>
			<input type="reset" value="다시쓰기">
			<p>
				"이미 계정이 있나요?"
				<a href="/member/login">로그인</a>
			</p>
			
		</form>
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
		
<!-- 다음 우편주소api -->
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/adress.js"></script>
<script src="/resources/js/signUp.js"></script>
	
</body>
</html>