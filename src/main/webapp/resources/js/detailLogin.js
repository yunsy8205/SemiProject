	let d=true;
	let proNo=$('#add').attr("data-add-pnum");
	let n=$('#dibsNum').text();
	dibsConfirm(proNo);
	
	$('#dibs').click(function(){
		
		if(d){
			$('#heart').attr("class", "bi bi-heart-fill");
			dibsAdd(proNo);
			n++;
			console.log(n);
			$('#dibsNum').text(n);
			console.log(n);
			d=false;
		}else{
			$('#heart').attr("class", "bi bi-heart");
			dibsDelete(proNo);
			n--;
			console.log(n);
			$('#dibsNum').text(n);
			d=true;
		}
	})

	function dibsAdd(proNo){
		$.ajax({
			type:"post",
			url:"./dibsAdd",
			data:{
				proNo:proNo
			},
			success:function(response){
				if(response.trim()>0){
					alert("찜성공");
				}else{
					alert("찜실패");
				}
			}
		})
	}
	
	function dibsDelete(proNo){
		$.ajax({
			type:"get",
			url:"./dibsDelete",
			data:{
				proNo:proNo
			},
			success:function(response){
				if(response.trim()>0){
					alert("찜삭제");
				}else{
					alert("삭제실패");
				}
			}
		})
	}
	
	function dibsConfirm(proNo){
		$.ajax({
			type:"get",
			url:"./dibsConfirm",
			data:{
				proNo:proNo
			},
			success:function(response){
				if(response.trim()>0){
					console.log("찜상태");
					$('#heart').attr("class", "bi bi-heart-fill");
					d=false;
				}else{
					console.log("찜안함");
					$('#heart').attr("class", "bi bi-heart");
					d=true;
				}
			}
		})
	}