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
<link rel="stylesheet" href="../resources/css/reviewadd.css">
<style type="text/css">
	.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}
</style>
</head>
<body>

	<section class="contain border mt-5 mb-5">
		<div class="billing-details">
							<div class="section-title title2">
								<h1 class="title" id="member">후기 남기기</h1>
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
									<div style="font-size: 15px; font-weight: bold; margin-top: 10px;">${dto.proName}</div>

								</div>
							</div>
						</div>
						
						
					</div>

						<div class="section-title">
							<form action="./reviewadd" method="post">
					        
					            <div class="star-rating space-x-4 mx-auto">
									<input type="radio" id="5-stars" name="score" value="5" v-model="ratings"/>
									<label for="5-stars" class="star pr-4">★</label>
									<input type="radio" id="4-stars" name="score" value="4" v-model="ratings"/>
									<label for="4-stars" class="star">★</label>
									<input type="radio" id="3-stars" name="score" value="3" v-model="ratings"/>
									<label for="3-stars" class="star">★</label>
									<input type="radio" id="2-stars" name="score" value="2" v-model="ratings"/>
									<label for="2-stars" class="star">★</label>
									<input type="radio" id="1-star" name="score" value="1" v-model="ratings" />
									<label for="1-star" class="star">★</label>
								
								</div>
								<div class="mb-3">
									<textarea name="contents" class="form-control" id="message-text" placeholder="후기를 10글자 이상 작성해주세요."></textarea>
								</div>
								<input type="hidden" value="${dto.proNo}" name="proNo">
								<input type="hidden" value="${dto.userNo}" name="userNo">
								<input type="hidden" value="${dto.proName}" name="proName">
						<button type="submit" class="primary-btn order-submit">작성완료</button>
						</form>
						<a id="cancle" href="">돌아가기</a>
						<!-- /Billing Details -->
						</div>
					<!-- /Order Details -->
						</div>


   </section>

<c:import url="../temp/footer1.jsp"></c:import>
</body>
</html>