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
		}
		
		.memberImage{
			width: 100%;
            height: 100%;
            box-sizing: border-box;
            
		}
</style>
</head>
<body>
	<section class="container mt-5">
		<h1 class="text-center mb-5">회원정보관리</h1>
			<div id="image">
				${dto.originalName}
				<img class="memberImage" src="../resources/upload/member/${dto.originalName}" class="d-block w-100" alt="...">
			</div>
			<table class="table table-bordered border-secondary">
				<tr>
					<th>회원번호</th><td>${dto.userNo}</td><th>회원상태</th><td>
					<c:if test="${dto.statusNo eq '0'}"><span id="status">정지</span></c:if>
					<c:if test="${dto.statusNo eq '1'}"><span id="status">활동중</span></c:if>
					</td>
				</tr>
				<tr>
					<th>권한</th><td><c:forEach items="${dto.roles}" var="r">${r.grantName}/</c:forEach>
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
			
			<c:if test="${dto.statusNo eq '0'}"><button data-num="${dto.userNo}" type="button" class="ms-2 btn btn-secondary b" data-status="${dto.statusNo}">정지해제</button></c:if>
			<c:if test="${dto.statusNo eq '1'}"><button data-num="${dto.userNo}" type="button" class="ms-2 btn btn-danger b" data-status="${dto.statusNo}">회원정지</button></c:if>
			<a href="./memberupdate?userNo=${dto.userNo}" class="ms-2 btn btn-danger">수정</a>
			<a href="./checkAccount" class="ms-2 btn btn-danger">계좌추가</a>
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
	
$('#pw').click(function(){
		let userNo=$('.b').attr("data-num");
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
</script>
</body>
</html>