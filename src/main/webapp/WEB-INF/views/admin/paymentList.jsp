<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootstrap.jsp"></c:import>
</head>
<body>
<c:import url="../temp/adminHeader.jsp"></c:import>
	<section class="container mt-5">
	
	
	<h1 class="text-center mb-5">결제 관리</h1>
		<table class="table mt-5">
		
		<thead class="table">
		<th>주문번호</th> <th>ID</th> <th>이름</th> <th>상품</th><th>가격</th> <th>날짜</th> <th>상태</th>
		</thead>
		
		<tbody >
			<c:forEach items="${list}" var="d">
				<tr>
					
					<td>${d.paymentNo}</td>
					<td>${d.userId}</td>
					<td>${d.name}</td>
					<td><a class="text-decoration-none" href="../product/detail?proNo=${d.proNo}">${d.proName}</a></td>
					<td>${d.totalPrice}</td>
					<td>${d.paymentDate}</td>
					<td>${d.statusName}</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		
		
		<nav class="nav justify-content-center" aria-label="Page navigation example">
			  <ul class="pagination">
			  	
				    <li class="page-item ${pager.pre?'':'disabled'}">
				      <a class="page-link move" href="#" data-num="${pager.startNum-1}a-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
			    
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    	<li class="page-item"><a class="page-link move" href="#" data-num="${i}">${i}</a></li>
			    </c:forEach>
			    <c:if test="${pager.next}">
				    <li class="page-item ${pager.next?'':'disabled'}">
				      <a class="page-link move" href="#" data-num="${pager.lastNum+1}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
			
			<div class="input-group mb-3">
		 <form action="../admin/payment" method="get" id="frm">
		 	  <input type="hidden" value="${pager.page}" id="page" name="page">
		 	  	
		 	  <table>
		 	  <tr>
		 	  <td>
			  <select name="kind" id="k" class="form-select" data-kind="${pager.kind}" aria-label="Default select example">
				  <option class="kind" value="userId">ID</option>
				  <option class="kind" value="paymentNo">주문번호</option>
				  <option class="kind" value="proName">상품</option>
				  <option class="kind" value="statusName">상태</option>
				  
			  </select></td>
			  <td>
			  <input type="text" name="search" value="${pager.search}" class="form-control" aria-label="Amount (to the nearest dollar)">
			   </td>
			   <td>
			    <button type="submit" class="btn btn-primary">검색</button>
			  	</td>
			  </table>	
		  </form>
		</div>
		
	

	</section>
	

<script src="/resources/js/list.js"></script>

</body>
</html>