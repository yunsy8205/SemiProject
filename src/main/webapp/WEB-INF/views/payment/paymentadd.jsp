
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
			
			width: 50px;
            height: 50px;
            box-sizing: border-box;
		}
</style>
  
  </head>
  <body>
    		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<div class="col-md-7">
						<!-- Billing Details -->
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

					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
<c:import url="../temp/footer1.jsp"></c:import>
    <script>

      let proName=$('#order').attr("data-name");
      let proNo=$('#order').attr("data-proNo");
      let totalPrice=$('#order').attr('data-price');
      let userNo=$('#member').attr('data-no');
      let name=$('#member').attr('data-name');
      let phone=$('#member').attr('data-phone');

   	  
   	  $('#btn').click(function(){
		requestPay();
   	  });
   	  
   	 function requestPay() {
         IMP.init('imp50730076');
         IMP.request_pay({
             pg: "nice.iamport00m",
             pay_method: "card",
             merchant_uid: "goodee_"+new Date().getTime(),//가맹점 주문번호
             name: proName,//상품명
             amount: totalPrice,//가격
             buyer_name: name,//구매자
             buyer_tel: phone//구매자 번호

   	    }, function(rsp){
             if(rsp.success){
          
                let payData = new Object();
               payData.uidNo = rsp.imp_uid;
               payData.totalPrice = totalPrice;
               payData.proName = proName;
               payData.name = name;
               payData.phone = phone;
               payData.proNo = proNo;
               payData.userNo = userNo;
               payData.paymentNo = rsp.merchant_uid;
	      		
	      		$.ajax({
					url:"/payment/paymentadd",
					method:"POST",
					headers:{ "Content-Type":"application/json" },
					data:JSON.stringify(payData),
					success:function(result){
						console.log(result);
					},
					error:function(error){
						alert("관리자에게 문의하세요.");
					}
				});
	      		
	      		//window.location.href = '../';
   	    	}else{
   	    		alert("결제 실패");
   	    	}
   	    });
   	}

    </script>
</body>
</html>
