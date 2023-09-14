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
         IMP.init('imp48226253');
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
			      		window.location.href = "../";
			      		alert("결제 성공");
						
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
