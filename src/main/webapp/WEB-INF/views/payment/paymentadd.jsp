
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8" />
    <title>Sample Payment</title>
<!-- jQuery -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<c:import url="../temp/bootstrap.jsp"></c:import>
<c:import url="../temp/header1.jsp"></c:import>
<c:import url="../temp/template.jsp"></c:import>
<link rel="stylesheet" href="../resources/css/paymentadd.css">
</head>
<body>
	<section class="contain border mt-5 mb-5">
		<div class="billing-details">
							<div class="section-title title2">
								<h1 class="title" id="member" data-no="${member.userNo}" data-name="${member.name}"
							data-phone="${member.phone}">결제하기</h1>
							</div>
	<!-- Order Details -->
					<div class="details border-bottom">
						<div class="order-summary">
					<c:set var="flag" value="true"/>
					<div id="box1">
						<c:forEach items="${dto.fileDTOs}" var="f">
							<c:if test="${flag?true:false}">
								<img class="image" src="../resources/upload/product/${f.originalName}" class="d-block w-100" alt="...">
										
								<c:set var="flag" value="false"/>
							</c:if>
						</c:forEach>
					</div>
							<div class="order-products">
								<div >
									<div style="font-size: 20px; font-weight: bold;">${dto.proPrice}원</div>
									<div style="font-size: 15px; font-weight: bold; color: #7F7F7F; margin-top: 10px;">${dto.proName}</div>
									<div style="font-size: 15px; font-weight: bold; color: #7F7F7F; margin-top: 10px;"><span>수량</span><span style="margin-left: 10px;">${dto.proAmount}개</span></div>
								</div>
							</div>
						</div>
						
						
					</div>

						<div class="section-title">
							<h3 class="title" id="order" data-proNo="${dto.proNo}" data-name="${dto.proName}" data-price="${dto.proPrice}"
							>결제금액</h3>
						</div>

						<div id="box2" class="border">
								<span id="span1">총 결제금액</span>
								<span id="span2">${dto.proPrice}원</span>
						</div>
					<!-- /Order Details -->
						</div>
						<button type="button" class="primary-btn order-submit" id="btn">결제하기</button>
						<a id="cancle" href="../product/detail?proNo=${dto.proNo}">취소</a>
						<!-- /Billing Details -->

	</section>

<c:import url="../temp/footer1.jsp"></c:import>
<script src="../resources/js/payment.js"></script>
</body>
</html>
