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
		<h1 class="text-center mb-5">신고관리</h1>
		<table class="table">
			<thead>
				<th>번호</th><th>신고유형</th><th>신고자</th><th>제목</th><th>등록일</th><th>확인여부</th>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="m">
					<tr>
						<td>${m.reportNo}</td><td>${m.catName}</td><td>${m.userId}</td>
						<td><a class="detail" data-report="${m.reportNo}" href="./reportdetail?reportNo=${m.reportNo}">${m.title}</a></td>
						<td>${m.reportDate}</td>
						<td><c:if test="${m.statusNo eq '0'}">미확인</c:if><c:if test="${m.statusNo eq '1'}">확인</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	    <li class="page-item ${pager.pre?'':'disabled'}">
	      <a class="page-link" href="./report?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		    <li class="page-item"><a class="page-link" href="./report?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
	    </c:forEach>
	    <li class="page-item ${pager.next?'':'disabled'}">
	      <a class="page-link" href="./report?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
		<div class="search">
			<form method="get" name="search" action="./report">
				<table class="pull-right">
					<tr>
						<td><select class="form-select" name="kind">
								<option value="userId">신고자</option>
								<option value="catName">신고유형</option>
								<option value="title">제목</option>
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
	$('.detail').click(function(){
		let reportNo=$(this).attr("data-report");
		console.log("시작");
		$.ajax({
			type:"post",
			url:"./reportstatus",
			data:{
				reportNo:reportNo
			},
			success:function(response){
				r=response.trim();
				console.log(r);
			}
		})
	})
</script>
</body>
</html>