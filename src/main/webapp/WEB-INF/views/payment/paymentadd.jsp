
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
								<h3 class="title">결제하기</h3>
							</div>
							<div class="form-group" id="member" data-email="${member.email}" data-name="${member.name}"
							data-phone="${member.phone}" data-address="${member.address}" data-code="${member.zipCode}">
								배송지
								<input class="input" type="text" name="first-name" placeholder="First Name">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="last-name" placeholder="배송시 요청사항">
							</div>
						</div>
						<!-- /Billing Details -->

						<!-- Shiping Details -->
						<div class="shiping-details">
							<div class="section-title">
								<h3 class="title">결제수단</h3>
							</div>
							
						</div>
						<!-- /Shiping Details -->

						<!-- Order notes -->
						<div class="order-notes">
							<textarea class="input" placeholder="Order Notes"></textarea>
						</div>
						<!-- /Order notes -->
					</div>

					<!-- Order Details -->
					<div class="col-md-5 order-details">
						<div class="section-title text-center">
							<h3 class="title" id="order" data-name="${dto.proName}" data-price="100"
							>Your Order</h3>
						</div>
						<div class="order-summary">
							<div class="order-col">
								<div><strong>PRODUCT</strong></div>
								<div><strong>TOTAL</strong></div>
							</div>
							<div class="order-products">
								<div class="order-col">
									<div>1x Product Name Goes Here</div>
									<div>$980.00</div>
								</div>
							</div>
							<div class="order-col">
								<div>Shiping</div>
								<div><strong>FREE</strong></div>
							</div>
							<div class="order-col">
								<div><strong>TOTAL</strong></div>
								<div><strong class="order-total">$2940.00</strong></div>
							</div>
						</div>
						
						<button type="button" id="btn" class="primary-btn order-submit">Place order</button>
						
						<form action="./delete" method="post">
						<button type="submit" id="del" class="primary-btn order-submit">결제 취소</button>
						</form>
						
					</div>
					<!-- /Order Details -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
<c:import url="../temp/footer1.jsp"></c:import>
    <script>

      let proName=$('#order').attr("data-name");
      
   	  let proPrice=$('#order').attr('data-price');
   	  console.log(proPrice);
   	  let name=$('#member').attr('data-name');
   	  let phone=$('#member').attr('data-phone');
   	  let uid= 3456+new Date().getTime();
   	  
   	  $('#btn').click(function(){
		requestPay();
   	  });
   	  
   	function requestPay() {
   		var uid = '';
   	    IMP.init('imp50730076');
   	    IMP.request_pay({
   	        pg: "nice.iamport00m",
   	        pay_method: "card",
   	        merchant_uid: uid,//가맹점 주문번호
   	        name: proName,//상품명
   	        amount: proPrice,//가격

   	        buyer_name: name,//구매자
   	        buyer_tel: phone//구매자 번호
   	    }, function(rsp){
   	    	if(rsp.success){
	   	    	let payData = new Object();
	      		payData.uid = rsp.imp_uid;
	      		payData.proPrice = proPrice;
	      		payData.proName = proName;
	      		payData.name = name;
	      		payData.phone = phone;
	      		
	      		$.ajax({
					url:"/payment/success",
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
   	    	}else{
   	    		alert("결제 실패");
   	    	}
   	    });
   	}

    </script>
</body>
</html>
