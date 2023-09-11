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
	.image{
		width: 100px;
		height: 100px;
	}
</style>
</head>
<body>
	<section class="container mt-5">
		<h1 class="text-center mb-5">상품목록</h1>
		<table class="table">
			<thead>
				<th>상품번호</th><th>카테고리</th><th>이미지</th><th>작성자</th><th>상품명</th><th>가격</th>
				<th>수량</th><th>작성일</th><th>수정일</th><th>교환여부</th><th>상품상태</th><th>조회수</th><th>판매상태</th>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="m">
					<tr>
						<td>${m.proNo}</td><td>${m.category.catName}</td>
						<td>이미지
						<c:set var="flag" value="true"/>
							<div>
								<figure>
									<c:forEach items="${m.fileDTOs}" var="f">
										<c:if test="${flag?true:false}">
											<img class="image" src="../resources/upload/product/${f.originalName}" class="d-block w-100" alt="...">
											<c:set var="flag" value="false"/>
										</c:if>
									</c:forEach>
									</figure>
							</div>	
						</td>
						<td>${m.member.userId}</td><td>${m.proName}</td><td>${m.proPrice}</td>
						<td>${m.proAmount}</td><td>${m.createDate}</td><td>${m.modifyDate}</td>
						<td>
							<c:if test="${m.exchange eq '0'}"><span>교환불가</span></c:if>
							<c:if test="${m.exchange eq '1'}"><span>교환가능</span></c:if>
						</td>
						<td>
							<c:if test="${m.proStatus eq '0'}"><span>중고상품</span></c:if>
							<c:if test="${m.proStatus eq '1'}"><span>새상품</span></c:if>
						</td>
						<td>${m.hit}</td>
						<td>
							<select class="form-select" data-no="${m.proNo}" name="proSale">
								<c:choose>
									<c:when test="${m.proSale eq '0'}"><option class="option" value="0" selected>판매중</option></c:when>
									<c:otherwise><option class="option" value="0">판매중</option></c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${m.proSale eq '1'}"><option class="option" value="1" selected>판매완료</option></c:when>
									<c:otherwise><option class="option" value="1">판매완료</option></c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${m.proSale eq '2'}"><option class="option" value="2" selected>예약중</option></c:when>
									<c:otherwise><option class="option" value="2">예약중</option></c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${m.proSale eq '3'}"><option class="option" value="3" selected>삭제</option></c:when>
									<c:otherwise><option class="option" value="3">삭제</option></c:otherwise>
								</c:choose>
							</select>
						</td>
					</tr>
				</c:forEach>
			</tbody> 
		</table>
	<!-- <nav aria-label="Page navigation example">
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
		</div> -->
	</section>
<script>
	$('.form-select').change(function(){
		alert("판매상태변경");
		let proSale = $(this).val();
		console.log(proSale);
		let proNo = $(this).attr("data-no");
		console.log(proNo);
		$.ajax({
			type:"post",
			url:"./productsale",
			data:{
				
				proNo:proNo,
				proSale:proSale
			},
			success:function(response){
				if(response.trim()>0){
					alert("DB변경성공");
				}else{
					alert("DB변경실패");
				}
			},error:function(){
				alert("서버연결실패")
			}
		})
		$('.form-select').val()
	})
</script>
</body>
</html>