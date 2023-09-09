	let proNo=$('#add').attr("data-add-pnum");
	
	$('.btn2').click(function(){
		alert("로그인 상태에서만 가능합니다.");
		location.href="../member/login";
	})