let uid='';
    	$(".open").click(function () {
    		uid='';
			
			 uid=$(this).attr("data-uid");
			 $("#reason").val("");
			$("#c").click();
		});
    
    	 $(".cancel").click(function(){
    		
    		cancelPay();
    	 });
    	 
    	 function cancelPay(){
    		
    		let reason = $("#reason").val();
     	

    		console.log("cancel : ", uid);
    		console.log(reason);
    		 $.ajax({
				url:"../payment/cancel",
				method:"POST",
				data:{
					uidNo:uid,
					reason:reason
					
				},
				success:function(result){
					console.log(result);
		      		
		      		alert("결제 취소완료");
		      		window.location.href = "./management";
					
				},
				error:function(error){
					alert("관리자에게 문의하세요.");
				}
			});
    		
      		
	    	} 
	 