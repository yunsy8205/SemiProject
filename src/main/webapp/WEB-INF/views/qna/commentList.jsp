<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    


<%-- <table class="table">

<c:forEach items="${commentList}" var="com" varStatus="i">		
		<thead class="table-dark">
			 <th>ID</th><th>DATE</th>
		</thead>
		
		<tbody class="table-light">
			
				<tr>
					<td>${com.userId}</td>
					<td>${com.createDate}</td>
					
				</tr>
			
		</tbody>
		
		<tfoot>
		
		<tr>
			<td colspan="2">${com.contents} <br>
			
			</td>
			
		</tr>
		
		</tfoot>
</c:forEach>  
</table> --%>

<c:forEach items="${commentList}" var="com" varStatus="i">	
<header>
<span>${com.userId}</span> <span>${com.createDate}</span>
</header>
<hr>
<div>${com.contents}</div>
<hr>
<footer>
	<c:if test="${member.userId == 'ADMIN'}">
	<button class="btn btn-primary" id="btnUpdate">수정</button>
	<button class="btn btn-primary" id="btnDel">삭제</button>
	</c:if>
</footer>
</c:forEach>  


