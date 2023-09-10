
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
<style>
	.image{
				
		width: 40%;
	    height: 300px;
		float:left;
	    box-sizing: border-box;
			}
	.contain{

		width: 1000px;
		height: 1000px;
		margin: auto;
		box-sizing: border-box;
		
	}
			
	.billing{
		width: 100%;
		height: 1000px;
		margin-left: 15%;
		margin-right: 15%;
		margin-bottom: 5%;

	}
	.od{
		width: 100%;
		height: 100%;
	}
	
	#product{
		height: 20%;
		margin-bottom: 5px;
	}
	.order-products{
		width: 50%;
		height: 10%;
		float:left;
		margin-left: 10%;
	}
</style>
  
</head>
<body>
	<section class="contain border mt-5 mb-5">
		<div class="billing-details">
							<div class="section-title">
								<h1 class="title" id="member" data-no="${member.userNo}" data-name="${member.name}"
							data-phone="${member.phone}">결제하기</h1>
							</div>
	<!-- Order Details -->
					<div class="col-md-5 order-details" style="width: 100%">
						<div class="section-title text-center">
							<h3 class="title" id="order" data-proNo="${dto.proNo}" data-name="${dto.proName}" data-price="${dto.proPrice}"
							>결제금액</h3>
						</div>
						<div class="order-summary">
					<c:set var="flag" value="true"/>
					<div>
						<c:forEach items="${dto.fileDTOs}" var="f">
							<c:if test="${flag?true:false}">
								<img class="image" src="../resources/upload/product/${f.originalName}" class="d-block w-100" alt="...">
										
								<c:set var="flag" value="false"/>
							</c:if>
						</c:forEach>
					</div>
							<div class="order-products">
								<div class="order-col">
									<div>${dto.proName}</div>
									<div>${dto.proPrice}원</div>
								</div>
							</div>
							<div class="order-col">
								<div><strong>총 결제금액</strong></div>
								<div><strong class="order-total">${dto.proPrice}원</strong></div>
							</div>
						</div>
						
						<button type="button" class="primary-btn order-submit" id="btn">결제하기</button>
						
					</div>
					<!-- /Order Details -->
						</div>
						<!-- /Billing Details -->

	</section>

<c:import url="../temp/footer1.jsp"></c:import>
<script src="../resources/js/payment.js"></script>
</body>
</html>
