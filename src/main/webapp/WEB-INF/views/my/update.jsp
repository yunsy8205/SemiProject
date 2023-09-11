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
						<li class="nav-item text-white me-3"><a href="../member/join">회원가입</a></li>
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
						<li class="active"><a href="./check">내 정보 수정</a></li>
						<li><a href="./list">내 판매글/구매내역/후기</a></li>
						<li><a href="#">내 찜 목록</a></li>
						<li><a href="#">택배조회</a></li>
						<li><a href="#">상품관리</a></li>
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


		<!-- SECTION -->
		<form action="./update" method="post" enctype="multipart/form-data" id="frm">
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<div class="col-md-4">
						<!-- Billing Details -->
						<div class="billing-details">
							
							<div class="form-group">
									
									<img alt="" id="profile" src="../resources/upload/member/${member.memberFileDTO.fileName}" onerror="this.onerror-null; this.src='../resources/img/imgtest.jpeg';" width="250" height="250">
									<br><br>
									<input type="file" name="file" id="file">
							</div>
						</div>
						<!-- /Billing Details -->	
					</div>
					
					<!-- Order Details -->
					<div class="col-md-6 order-details">
						
						<div class="order-summary">
							<div class="order-col">
								<div><strong>이름</strong></div>
								<div style="color:red">*필수입력</div>
							</div>
							<div class="order-products">
								<div class="order-col-md-3">
									<div class="form-group">
										<input class="input" type="text" name="name" id="name" value="${member.name}" placeholder="이름을 입력하세요">
										<span id="namex" style="color:red"></span>
									</div>
								</div>
								
								<div class="order-col">
									<div><strong>비밀번호</strong></div>
									<div style="color:red">*필수입력</div>
								</div>
							
								<div class="order-col-md-3">
									<div class="form-group">
										<input class="input" type="password" name="userPw" id="pw" value="${member.userPw}" placeholder="비밀번호를 입력하세요">
										<span id="pwx" style="color:red"></span>
									</div>
								</div>
								
								<div class="order-col">
									<div><strong>비밀번호 확인</strong></div>
									<div style="color:red">*필수입력</div>
								</div>
							
								<div class="order-col-md-3">
									<div class="form-group">
										<input class="input" type="password" id="pw2" value="${member.userPw}" placeholder="비밀번호를 입력하세요">
										<span id="pwx2" style="color:red"></span>
									</div>
								</div>
								
								<div class="order-col">
									<div><strong>이메일</strong></div>
									<div><strong></strong></div>
								</div>
							
								<div class="order-col-md-3">
									<div class="form-group">
										<input class="input" type="email" name="email" value="${member.email}" placeholder="이메일을 입력하세요">
									</div>
								</div>
								
								<div class="order-col">
									<div><strong>생일</strong></div>
									<div style="color:red">*필수입력</div>
								</div>
							
								<div class="order-col-md-3">
									<div class="form-group">
										<input class="input" type="date" name="birth" id="birth" value="${member.birth}" placeholder="생일을 입력하세요">
										<span id="birthx" style="color:red"></span>
									</div>
								</div>
								
								<div class="order-col">
									<div><strong>주소</strong></div>
									<div style="color:red">*필수입력</div>
								</div>
							
								<div class="order-col-md-3">
									<div class="form-group" id="addressTotal">
										<input class="input" type="text" id="postcode" name="zipCode" value="${member.zipCode}" placeholder="우편번호">
										<input class="input" type="button" onclick="openDaumPostcode()" value="우편번호 찾기"><br>
										<input class="input" type="text" id="address" name="address" value="${member.address}" placeholder="주소"><br>
										<input class="input" type="text" id="extraAddress" name="refAddress" value="${member.refAddress}" placeholder="참고항목"><br>
										<input class="input" type="text" id="detailAddress" name="detailAddress" value="${member.detailAddress}" placeholder="상세주소"><br>
										<span id="postcodex" style="color:red"></span><br>
										<span id="addressx" style="color:red"></span><br>
										<span id="extraAddressx" style="color:red"></span><br>
										<span id="detailAddressx" style="color:red"></span>
									</div>
								</div>
								
								<div class="order-col">
									<div><strong>휴대폰</strong></div>
									<div style="color:red">*필수입력</div>
								</div>
							
								<div class="order-col-md-3">
									<div class="form-group">
										<input class="input" type="tel" name="phone" value="${member.phone}" id="phone" oninput="autoHyphen2(this)" maxlength="13" placeholder="번호를 입력하세요">
										<span id="phonex" style="color:red"></span>
									</div>
								</div>
								
								<div class="order-col">
									<div><strong>자기소개</strong></div>
									<div><strong></strong></div>
								</div>
							
								<div class="order-col-md-3">
									<div class="form-group">
										<input class="input" type="text" name="intro" value="${member.intro}" placeholder="자기소개를 입력하세요">
									</div>
								</div>
								
						</div>
						
						<button class="primary-btn order-submit center" type="button" id="btn">회원수정</button>
					</div>
					<!-- /Order Details -->
					
					
				</div>
				<!-- /row -->
				
			</div>
			<!-- /container -->
		
		<!-- /SECTION -->
		</div>
		</div>
		
		</form>
		
		


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



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/adress.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	$("input:file").change(function(){ // -1. 다른 파일 선택 시 이 이벤트가 호출됨-
		// -2. 선택학 파일 데이터를 가져옴-
    	let formData = new FormData(); // <form></form>
		formData.append("file", $("input:file")[0].files[0]); // <input type="file" name="file">
    	
		// -3. 가져온 파일 데이터를 컨트롤러 setContentsImg 메서드로 넘김 -
		$.ajax({
			type:"POST",
			url:"./setContentsImg",
			data:formData, // 가져온 파일 데이터 설정(파라미터로 넘어감)
			enctype:"multipart/form-data",
			cache:false,
			contentType:false,
			processData:false,
			success:function(result){
				$("#profile").attr("src", result);
			}
		});

  	});
</script>

<script>
const name1 = document.getElementById("name");
const namex = document.getElementById("namex");
const pw = document.getElementById("pw");
const pw2 = document.getElementById("pw2");
const pwx = document.getElementById("pwx");
const pwx2 = document.getElementById("pwx2");
const birth = document.getElementById("birth");
const birthx = document.getElementById("birthx");
const phone = document.getElementById("phone");
const phonex = document.getElementById("phonex");

const addressTotal = document.getElementById("addressTotal");

const postcode = document.getElementById("postcode");
const address = document.getElementById("address");
const extraAddress = document.getElementById("extraAddress");
const detailAddress = document.getElementById("detailAddress");

const postcodex = document.getElementById("postcodex");
const addressx = document.getElementById("addressx");
const extraAddressx = document.getElementById("extraAddressx");
const detailAddressx = document.getElementById("detailAddressx");

const btn = document.getElementById("btn");
const frm = document.getElementById("frm");

let checkResults=[false, false, false, false, false, false, false, false, false];

name1.addEventListener("focusout", function(){
    if(name1.value.length<1){
        document.getElementById("namex").innerHTML = "이름을 입력해주세요";
        checkResults[0]=false;    
    } else{
        document.getElementById("namex").innerHTML = "";
        checkResults[0]=true;
    }
})

pw.addEventListener("focusout", function(){
    if(pw.value.length < 4){
        document.getElementById("pwx").innerHTML = "4글자 이상";
        checkResults[1]=false;
    } else if(pw.value.length > 11){
        document.getElementById("pwx").innerHTML = "10글자 미만";
        checkResults[1]=false;
    } else{
        document.getElementById("pwx").innerHTML = "";
        checkResults[1]=true;
    }
})

pw.addEventListener("change", function(){
    pw2.value="";
    checkResults[2]=false;
    pwx2.innerHTML="";
})

pw2.addEventListener("keyup", function(){
    if(pw.value!=pw2.value){
        document.getElementById("pwx2").innerHTML = "비밀번호는 동일해야 합니다";
        checkResults[2]=false;
    } else{
        document.getElementById("pwx2").innerHTML = "";
        checkResults[2]=true;
    }
})

birth.addEventListener("focusout", function(){
    if(birth.value<1){
        document.getElementById("birthx").innerHTML = "생년월일을 입력해주세요";
        checkResults[3]=false;
    } else{
        document.getElementById("birthx").innerHTML = "";
        checkResults[3]=true;
    }
})

addressTotal.addEventListener("focusout", function(){
	if(postcode.value<1){
		document.getElementById("postcodex").innerHTML = "우편번호를 입력해주세요";
        checkResults[4]=false;
	} else{
        document.getElementById("postcodex").innerHTML = "";
        checkResults[4]=true;
    }
	
	if(address.value<1){
		document.getElementById("addressx").innerHTML = "주소를 입력해주세요";
        checkResults[5]=false;
	} else{
        document.getElementById("addressx").innerHTML = "";
        checkResults[5]=true;
    }
	
	if(extraAddress.value<1){
		document.getElementById("extraAddressx").innerHTML = "참고항목을 입력해주세요";
        checkResults[6]=false;
	} else{
        document.getElementById("extraAddressx").innerHTML = "";
        checkResults[6]=true;
    }
	
	if(detailAddress.value<1){
		document.getElementById("detailAddressx").innerHTML = "상세주소를 입력해주세요";
        checkResults[7]=false;
	} else{
        document.getElementById("detailAddressx").innerHTML = "";
        checkResults[7]=true;
    }
	
})

phone.addEventListener("focusout", function(){
    if(phone.value.length<13){
        document.getElementById("phonex").innerHTML = "휴대폰 번호를 바르게 입력해주세요";
        checkResults[8]=false;
    } else{
        document.getElementById("phonex").innerHTML = "";
        checkResults[8]=true;
    }
})

const autoHyphen2 = (target) => {
 target.value = target.value
   .replace(/[^0-9]/g, '')
  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}

btn.addEventListener("click", function(){
    
	if((name1.value == '') || (pw.value.length < 4) || (pw.value!=pw2.value) || (birth.value < 1) || (postcode.value == '') || (address.value == '') || (extraAddress.value.length < 1) || (detailAddress.value.length < 1) || phone.value.length < 13){
		alert("필수입력사항을 입력해주세요");
	} else{
		frm.submit();
		alert("회원정보 수정이 완료되었습니다.");
	}

})

</script>

	</body>
</html>

