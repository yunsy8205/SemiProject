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
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

		<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous"> -->

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		
			
		<style>
			.product-card {
				border: 1px solid #ddd;
				padding: 10px;
				margin: 10px;
				text-align: center;
				background-color: #fff;
				box-shadow: 0px 0px 5px 0px #ddd;
			}
		
			.product-image {
            width: 100%;
            height: auto;
            max-height: 200px; /* Set the maximum height of the image */
            object-fit: cover; /* Maintain aspect ratio and cover area */
		}
		
			.product-title {
				font-size: 16px;
				font-weight: bold;
				margin-top: 10px;
			}
		
			.product-content {
				font-size: 14px;
				margin-top: 5px;
			}
		</style>
		
			
		


    </head>
	<body>
		
	<c:import url="../temp/header.jsp"></c:import>
	
	
	
	
	
	
			<!-- NAVIGATION -->
			<nav id="navigation">
				<!-- container -->
				<div class="container">
					<!-- responsive-nav -->
					<div id="responsive-nav">
						<!-- NAV -->
						<ul class="main-nav nav navbar-nav">
							<li class="active"><a href="/">Home</a></li>
							<li><a href="./categoryList?catNo=1001">핸드폰</a></li>
							<li><a href="./categoryList?catNo=1002">전자기기</a></li>
							<li><a href="./categoryList?catNo=1003">미용가전</a></li>
							<li><a href="./categoryList?catNo=1004">주방가전</a></li>
							<li><a href="./categoryList?catNo=1005">생활가전</a></li>
							<li><a href="./categoryList?catNo=1006">사무기기</a></li>
							<li><a href="./categoryList?catNo=1007">기타</a></li>
						</ul>
						<!-- /NAV -->
					</div>
					<!-- /responsive-nav -->
				</div>
				<!-- /container -->
			</nav>
			<!-- /NAVIGATION -->
	
	
	
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
							<ul class="section-tab-nav tab-nav">
								<li><a href="#" onclick="changeCondition('최신순')">최신순</a></li>
								<li><a href="#" onclick="changeCondition('인기순')">인기순</a></li>
								<li><a href="#" onclick="changeCondition('저가순')">저가순</a></li>
								<li><a href="#" onclick="changeCondition('고가순')">고가순</a></li>
								
							</ul>
						</div>
					</div>
				</div>
				<section class="container mt-5">
					<div class="col-md-12">
				    <div class="row ">
				        <c:forEach var="product" items="${list}" >
				            <div class="col-md-3">
				                <div class="product">
				                    <div class="product-img">
				                        <img src="${pageContext.request.contextPath}/resources/upload/product/${product.fileDTOs[0].fileName}" alt="" width="200" height="200">
				                    </div>
				                    <div class="product-body">
				                        <p class="product-name"><a href="./detail?proNo=${product.proNo}">${product.proName}</a></p>
				                        <h4 class="product-price">${product.proPrice} </h4>
				                        <p class="product-createDate">작성일: ${product.createDate}</p>
				                        <p class="product-hit">조회수: ${product.hit}</p>
				                        <div class="product-btns">
				                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">찜하기</span></button>
				                        </div>
				                    </div>
				                    <div class="add-to-cart">
	
				                        <button class="add-to-cart-btn"><i class="bi bi-currency-exchange"></i><a href="../payment/paymentadd?proNo=${product.proNo}">구매하기</a></button>

			                    </div>
			                </div>
			            </div>
			        </c:forEach>
			    </div>
			</div>

					  <!-- ... (페이징 및 검색 부분) ... -->
						  
					  <nav aria-label="Page navigation example" class="text-center"> <!-- Add 'text-center' class here -->
						<ul class="pagination justify-content-center"> <!-- Add 'justify-content-center' class here -->
						 <c:if test="${pager.pre}">
							 <li class="page-item">
								 <a class="page-link" href="/product/list?page=${pager.startNum - 1}&kind=${param.kind}&search=${param.search}&condition=${param.condition}&catNo=${catNo}" aria-label="Previous">
									 <span aria-hidden="true">&laquo;</span>
								 </a>
							 </li>
						 </c:if>
						 <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							 <li class="page-item"><a class="page-link" href="/product/list?page=${i}&kind=${param.kind}&search=${param.search}&condition=${param.condition}&catNo=${catNo}">${i}</a></li>
						 </c:forEach>
						 <c:if test="${pager.next}">
							 <li class="page-item">
								 <a class="page-link" href="/product/list?page=${pager.lastNum + 1}&kind=${param.kind}&search=${param.search}&condition=${param.condition}&catNo=${catNo}" aria-label="Next">
									 <span aria-hidden="true">&raquo;</span>
								 </a>
							 </li>
						 </c:if>
					 </ul>
 
				 </nav>
				<!-- 검색 부분 -->
				<div class="search">
					<form method="get" name="search" action="/product/list">
						<table class="pull-right">
							<tr>
								<td><select name="kind" id="k" class="input-select" aria-label="Default select example">
									<option class="kind" value="proName">상품명</option>
									<option class="kind" value="proContents">상품설명</option>
									<option class="kind" value="userId">이름</option>
								</select></td>
								<td><input type="text" name="search" value="${pager.search}" class="form-control" placeholder="Search here">
								</td>
								<td><button type="submit" class="search-btn">검색</button></td>
                                 <!-- 선택된 condition을 hidden input으로 추가 -->
                             <input type="hidden" name="condition" value="${param.condition}">
                             <input type="hidden" name="catNo" value="${param.catNo}">
							</tr>
						</table>
					</form>
				</div>
			
			</section>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

  





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="/resources/js/list.js"></script>
<script type="text/javascript">
    function changeCondition(condition) {
        console.log('Condition changed to: ' + condition);

        // 현재 URL을 가져옵니다.
        const currentUrl = new URL(window.location.href);

        // URL에서 page 매개변수 값을 가져옵니다. 없을 경우 1로 설정합니다.
        const currentPage = currentUrl.searchParams.get('page') || 1;

        // 선택된 condition 값을 추가하여 URL을 생성합니다.
        currentUrl.searchParams.set('condition', condition);

        // 새 URL로 이동합니다.
        currentUrl.searchParams.set('page', currentPage); // 페이지 번호도 유지
        window.location.href = currentUrl.toString();
    }
</script>






</body>
</html>