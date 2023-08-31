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

</head>
<body>
	<section class="container mt-5">
		<h1 class="text-center mb-5">회원관리</h1>
		<table class="table">
			<thead>
				<th>회원번호</th><th>회원ID</th><th>권한</th><th>이름</th><th>이메일</th>
				<th>생년월일</th><th>주소</th><th>전화번호</th><th>가입일</th><th>회원상태</th>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="m">
					<tr>
						<td>${m.userNo}</td><td>${m.userId}</td><td>
						<c:forEach items="${m.roles}" var="r">${r.grantName}</c:forEach> 
						</td><td>${m.name}</td><td>${m.email}</td><td>${m.birth}</td>
						<td>${m.address}</td><td>${m.phone}</td><td>${m.accountDate}</td><td>
						<c:if test="${m.statusNo eq '0'}"><span>정지회원</span><button data-num="${m.userNo}" type="button" class="btn btn-danger b" data-status="${m.statusNo}">활동회원 변경</button></c:if>
						<c:if test="${m.statusNo eq '1'}"><span>활동회원</span><button data-num="${m.userNo}" type="button" class="btn btn-secondary b" data-status="${m.statusNo}">중지회원 변경</button></c:if>
						</td> 
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	    <li class="page-item ${pager.pre?'':'disabled'}">
	      <a class="page-link" href="./member?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		    <li class="page-item"><a class="page-link" href="./member?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}<a></a></li>
	    </c:forEach>
	    <li class="page-item ${pager.next?'':'disabled'}">
	      <a class="page-link" href="./member?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
		<div class="search">
			<form method="get" name="search" action="./member">
				<table class="pull-right">
					<tr>
						<td><select class="form-select" name="kind">
								<option value="userId">아이디</option>
								<option value="email">이메일</option>
								<option value="phone">전화번호</option>
						</select></td>
						<td><input type="text" class="form-control"
							name="search" maxlength="100"></td>
						<td><button type="submit" class="btn btn-danger">검색</button></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
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
			$(this).text("활동회원 변경");
			$(this).attr("data-status",0);
			$(this).prev().text("정지회원");
			$(this).attr("class","b btn btn-danger");
			
		}else{
			$(this).text("중지회원 변경");
			$(this).attr("data-status",1);
			$(this).prev().text("활동회원");
			$(this).attr("class","b btn btn-secondary");
		}
	}else{
		alert("상태변경실패");
	}
	
	})
</script>
</body>
</html>