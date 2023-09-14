<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootstrap.jsp"></c:import>
<c:import url="../temp/adminHeader.jsp"></c:import>
<style type="text/css">
		
		#image{
			width: 200px;
            height: 200px;
            margin-bottom: 15px;
            float: left;
		}
		
		.memberImage{
			width: 100%;
            height: 100%;
            object-fit: cover;
            box-sizing: border-box;
            
		}
		#fileDel{
			margin-top: 12%;
		}
</style>
</head>
<body>
	<section class="container mt-5 mb-5">
		<h1 class="text-center mb-5">회원정보관리</h1>
			<div id="image">
				<img class="memberImage" src="../resources/upload/member/${dto.memberFileDTO.fileName}"alt="...">
			</div>
			<span><button type="button" class="ms-2 btn btn-danger" id="fileDel">파일삭제</button></span>
			<table class="table table-bordered border-secondary">
				<tr>
					<th>회원번호</th><td>${dto.userNo}</td><th>회원상태</th><td>
					<c:if test="${dto.statusNo eq '0'}"><span id="status">정지</span></c:if>
					<c:if test="${dto.statusNo eq '1'}"><span id="status">활동중</span></c:if>
					</td>
				</tr>
				<tr>
					<th>권한</th><td><c:forEach items="${dto.roles}" var="r">${r.grantName}</c:forEach>
					</td><th>가입일</th><td>${dto.accountDate}</td>
				</tr>
				<tr>
					<th>ID</th><td>${dto.userId}</td><th>PW</th><td><button type="button" id="pw">비밀번호 초기화</button></td>
				</tr>
				<tr>
					<th>이름</th><td>${dto.name}</td><th>생년월일</th><td>${dto.birth}</td>
				</tr>
				<tr>
					<th id="email" data-email="${dto.email}">이메일</th><td>${dto.email}</td><th>전화번호</th><td>${dto.phone}</td>
				</tr>
				<tr>
					<th>소개글</th><td colspan="3">${dto.intro}</td>
				</tr>
			</table>
			<table  class="table table-bordered border-secondary">
				<tr>
					<th>우편번호</th><td>${dto.zipCode}</td><th>참고항목</th><td>${dto.refAddress}</td>
				</tr>
				<tr>
					<th>주소</th><td colspan="3">${dto.address}</td>
				</tr>
				<tr>
					<th>상세주소</th><td colspan="3">${dto.detailAddress}</td>
				</tr>
			</table>
			<c:choose>
				<c:when test="${not empty dto.holder}">
				
					<table  class="table table-bordered border-secondary">
						<tr>
							<th>은행명</th>
							<td>
								<c:if test="${dto.bankCode eq 004}">KB국민은행</c:if>
								<c:if test="${dto.bankCode eq 003}">기업은행</c:if>
								<c:if test="${dto.bankCode eq 011}">농협</c:if>
								<c:if test="${dto.bankCode eq 088}">신한은행</c:if>
								<c:if test="${dto.bankCode eq 020}">우리은행</c:if>
								<c:if test="${dto.bankCode eq 090}">카카오뱅크</c:if>

							</td>
							<th>예금주</th><td>${dto.holder}</td>
						</tr>
						<tr>
							<th>계좌번호</th><td colspan="3">${dto.bankNum}</td>
						</tr>
					</table>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
			
			<c:if test="${dto.statusNo eq '0'}"><button data-num="${dto.userNo}" type="button" class="ms-2 btn btn-secondary b" data-status="${dto.statusNo}">정지해제</button></c:if>
			<c:if test="${dto.statusNo eq '1'}"><button data-num="${dto.userNo}" type="button" class="ms-2 btn btn-danger b" data-status="${dto.statusNo}">회원정지</button></c:if>
			<a href="./memberupdate?userNo=${dto.userNo}" class="ms-2 btn btn-danger">수정</a>
		<c:if test="${empty dto.holder}">
			<button type="button" class="ms-2 btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">계좌추가</button>
		</c:if>
		<c:if test="${not empty dto.holder}">
			<button type="button" class="ms-2 btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">계좌변경</button>
		</c:if>
		
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">계좌변경</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form>
		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">예금주</label>
		            <input type="text" class="form-control" id="holder" name="holder">
		          </div>
		          <div class="mb-3">
		            <label for="message-text" class="col-form-label">은행 선택</label>
		            <select class="form-select" id="code" name="bankcode">
		            	<option value="004" selected>KB국민은행</option>
		            	<option value="003">기업은행</option>
		            	<option value="011">농협</option>
		            	<option value="088">신한은행</option>
		            	<option value="020">우리은행</option>
		            	<option value="090">카카오뱅크</option>
		            </select>
		          </div>
		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">계좌번호</label>
		            <input type="text" class="form-control" id="num" name="banknum">
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" id="save" class="btn btn-danger">저장</button>
		      </div>
		    </div>
		  </div>
		</div>
	</section>
	
	<!-- 주소 정보 추가 -->
<script type="text/javascript">

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
	console.log(r);
	if(r>0){
		if(statusNo>0){
			$(this).text("정지해제");
			$(this).attr("data-status",0);
			$(this).attr("class","ms-2 btn btn-secondary b");
			$('#status').text("정지");
		}else{
			$(this).text("회원정지");
			$(this).attr("data-status",1);
			$(this).attr("class","ms-2 btn btn-danger b");
			$('#status').text("활동중");
		}
	}else{
		alert("상태변경실패");
	}
	
	})
	
let userNo=$('.b').attr("data-num");
$('#pw').click(function(){
		let email=$('#email').attr("data-email")
	$.ajax({
		type:"post",
		url:"./passwordreset",
		data:{
			userNo:userNo,
			email:email
		},
		success:function(response){
			r=response.trim();
			if(r>0){
				alert("비밀번호 초기화 되었습니다.");
				
			}else{
				alert("초기화 실패");
			}
		}
	})
})

$('#fileDel').click(function(){
	$.ajax({
		type:"post",
		url:"./memberFileDel",
		data:{
			userNo:userNo
		},
		success:function(response){
			r=response.trim();
			if(r>0){
				$('.memberImage').attr("src","");
				alert("파일 삭제 완료");		
			}else{
				alert("파일 삭제 실패");
			}
		},error:function(){
			alert("서버 연결 실패");
		}
	})
})

const exampleModal = document.getElementById('exampleModal');
if (exampleModal) {
  exampleModal.addEventListener('show.bs.modal', event => {
    // Button that triggered the modal
    const button = event.relatedTarget;
    // Extract info from data-bs-* attributes
    const recipient = button.getAttribute('data-bs-whatever');
    // If necessary, you could initiate an Ajax request here
    // and then do the updating in a callback.

    // Update the modal's content.
    const modalTitle = exampleModal.querySelector('.modal-title');;
    const modalBodyInput = exampleModal.querySelector('.modal-body input')

    modalTitle.textContent = `계좌변경`;
    
  })
}

$('#save').click(function(){
let holder = $('#holder').val();
console.log(holder);
let code = $('#code').val();
console.log(code);
let num = $('#num').val();
console.log(num);
	$.ajax({
		type: "post",
		url: "../payment/checkaccount",
		data:{
			userNo:userNo,
			holder:holder,
			bankCode:code,
			bankNum:num
		}
		,success:function(res){
			if(res.trim()>0){
				alert("계좌변경 완료");
				window.location.href="./memberdetail?userNo="+userNo;
			}else{
				alert("계좌변경 실패");
			}
		}
		,error:function(){
			alert("서버 연결 실패");
		}
	})
})
</script>
</body>
</html>