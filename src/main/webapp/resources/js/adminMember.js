	$('.b').click(function(){
	let userNo=$(this).attr("data-num");
	let statusNo=$(this).attr("data-status");
	let btn=$(this);
	$.ajax({
		type:"post",
		url:"./statusChange",
		async:false,
		data:{
			userNo:userNo,
			statusNo:statusNo
		},
		success:function(response){
			r=response.trim();
		}
	})
	if(r>0){
		if(statusNo>0){
			$(this).text("정지해제");
			$(this).attr("data-status",0);
			$(this).prev().text("정지");
			$(this).attr("class","ms-2 btn btn-secondary b");
			
		}else{
			$(this).text("회원정지");
			$(this).attr("data-status",1);
			$(this).prev().text("활동");
			$(this).attr("class","ms-2 btn btn-danger b");
		}
	}else{
		alert("상태변경실패");
	}
	
	})