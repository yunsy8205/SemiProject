	let userNo=$('#add').attr("data-add-num");
	let pageNum=1;
	let tp=0;
	console.log("reviews");	
	reviewsList(userNo,pageNum);

	
	function reviewsList(userNo,page){
	$.ajax({
		type:"get",
		url:"../profile/revlist",
		data:{
			userNo:userNo,
			page:page
		},
		success:function(result){
			$('#add').append(result);
			tp = $('#totalpage').attr('data-totalPage');
			let button='<button id="moreButton" class="border">더보기('+pageNum+'/'+tp+')</button>';
			
			$('#more').html(button);
		},error:function(){
			alert('관리자에게 문의');
		}
	})
	
		$('#more').on("click", "#moreButton", function(){
		
		if(pageNum>=tp){
			alert('마지막 페이지');
			return;
		}
		
		pageNum++;
		reviewsList(userNo,pageNum);
	
	})
}