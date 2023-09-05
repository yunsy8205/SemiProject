<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8" />
    <title>Sample Payment</title>
<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
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
							<div class="form-group">
								상품이름
								<input class="input" type="text" name="last-name" readonly="readonly" value="${dto.proName}">
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
							<h3 class="title" id="order" data-name="${dto.proName}" data-price="${dto.proPrice}"
							>Your Order</h3>
						</div>
						<div class="order-summary">
							<div class="order-col">
								<div><strong>PRODUCT</strong></div>
								<div><strong>TOTAL</strong></div>
							</div>
							<div class="order-products">
								<div class="order-col">
									<div>${dto.proName}</div>
									<div>${dto.proPrice}</div>
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
						
						<a href="#" id="btn" onclick="requestPay()" class="primary-btn order-submit">Place order</a>
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
      let IMP = window.IMP;
      IMP.init("imp48226253");
 		
      let proName=$('#order').attr("data-name");
  
   	  let proPrice=$('#order').attr('data-price');
   	 
   	  let name=$('#member').attr('data-name');
		
   	  let phone=$('#member').attr('data-phone');

	
      function requestPay() {
        IMP.request_pay(
          {
            pg: "html5_inicis.INIBillTst",
            pay_method: "card",
            merchant_uid: 3456+new Date().getTime(),//가맹점 주문번호
            name: proName,//상품명
            amount: proPrice,//가격
            buyer_name: name,//구매자
            buyer_tel: phone,//구매자 번호

          },
          function(rsp) {

			

			if(rsp.success){

			console.log(rsp);
			// 결제검증
			$.ajax({
	        	type : "POST",
	        	url : "/payment/verifyIamport/" + rsp.imp_uid 
				
			

	        }).done(function(data) {
	        	
	        	console.log(data);
	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	        	if(rsp.paid_amount == data.response.amount){
		        	alert("결제 및 결제검증완료");
	        	} else {
	        		alert("결제 실패");
					
	        	}

	        });

			
			}else{

				alert("결제실패" + rsp.error_msg);
			}





		});
	}
    
    </script>
</body>
</html>