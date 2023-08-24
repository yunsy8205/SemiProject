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
	<section class="container mt-5">
	
		<table class="table">
		
		<thead class="table-dark">
			 <th>ID</th><th>TITLE</th><th>DATE</th><th>HIT</th>
		</thead>
		
		<tbody class="table-light">
			<c:forEach items="${list}" var="d">
				<tr>
					<td>${d.userId}</td>
					<td>${d.title}</td>
					<td>${d.createDate}</td>
					<td>${d.hit}</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		
		    <li class="page-item ${pager.pre?'':'disabled'}">
		      <a class="page-link move" href="./list?page=${pager.lastNum-1}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		   
		    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		    <li class="page-item"><a class="page-link move"  href="./list?page=${i}">${i}</a></li>
			</c:forEach>
			

		    <li class="page-item ${pager.next?'':'disabled' }" >
		      <a class="page-link move" href="./list?page=${pager.lastNum+1}" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
  		</ul>
	</nav>
	
	
	<a class="btn btn-primary me-2" style="float:right" href="./add">글등록</a>
	</section>
	
	


</body>
</html>