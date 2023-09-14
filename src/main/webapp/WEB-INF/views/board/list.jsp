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
<c:import url="../temp/BoardHeader.jsp"></c:import>
	<section class="container mt-5">
	
		<h1 align="center">NOTICE</h1>
		
		<table class="table mt-5">
		
		<thead class="table-dark">
			 <th>ID</th><th>TITLE</th><th>DATE</th><th>HIT</th>
		</thead>
		
		<tbody class="table-light">
			<c:forEach items="${list}" var="d">
				<tr>
					<td>${d.userId}</td>
					<td><a class="text-decoration-none" href="./detail?boardNo=${d.boardNo}">${d.title}</a></td>
					<td>${d.createDate}</td>
					<td>${d.hit}</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		
		
		<nav class="nav justify-content-center" aria-label="Page navigation example">
			  <ul class="pagination">
			  	
				    <li class="page-item ${pager.pre?'':'disabled'}">
				      <a class="page-link move" href="#" data-num="${pager.startNum-1}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
			    
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    	<li class="page-item"><a class="page-link move" href="#" data-num="${i}">${i}</a></li>
			    </c:forEach>
			    <c:if test="${pager.next}">
				    <li class="page-item ${pager.next?'':'disabled' }">
				      <a class="page-link move" href="#" data-num="${pager.lastNum+1}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
		
		<div class="input-group mb-3">
		 <form action="./list" method="get" id="frm">
		 	  <input type="hidden" value="${pager.page}" id="page" name="page">
		
		<table> 
		<tr>
		 	 <td> 	
			  <select name="kind" id="k" class="form-select" data-kind="${pager.kind}" aria-label="Default select example">
				  <option class="kind" value="title">title</option>
				  <option class="kind" value="contents">Contents</option>
				  
			  </select></td>
			  
			  <td>
			  <input type="text" name="search" value="${pager.search}" class="form-control" aria-label="Amount (to the nearest dollar)">
			  <td>
			   <div class="col-auto">
			    <button type="submit" class="btn btn-dark">검색</button>
			  </div>
			  </td>
		</table> 	
		  </form>
		</div>
		
		<c:forEach items="${member.roles}" var="r"> 
		<c:if test="${r.grantNo eq '2'}">
			<a class="btn btn-dark me-2" style="float:right" href="./add">글등록</a>
		
		</c:if>
		</c:forEach>
	
	</section>
	
	
	
	

<script src="/resources/js/list.js"></script>
</body>
</html>