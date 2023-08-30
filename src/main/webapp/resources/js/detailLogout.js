	let proNo=$('#add').attr("data-add-pnum");
	
	$('#dibs').click(function(){
		alert("로그인 상태에서만 찜하기가 가능합니다.");
		location.href="../member/login";
	})