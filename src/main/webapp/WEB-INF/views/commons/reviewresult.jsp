<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="../temp/bootstrap.jsp"></c:import>

	
	<c:forEach items="${list}" var="d" varStatus="i">
		<img style="width: 300px; height: 300px;" class="image" src="../resources/upload/member/${d.originalName}" class="d-block w-100" alt="...">
		<h6><a href="./reviews?userNo=${d.userNo}">${d.userId}</a></h6>
					<c:choose>
						<c:when test="${i.first}">
							<div id="totalpage" data-totalPage="${pager.totalPage}">
						</c:when>
						<c:otherwise>
							<div>
						</c:otherwise>
					</c:choose>
			<c:forEach var="i" begin="1" end="${d.score}" step="1"><i class="bi bi-star-fill"></i></c:forEach><c:if test="${d.score%1>=0.5}"><i class="bi bi-star-half"></i></c:if><c:forEach var="i" begin="1" end="${5-d.score}" step="1"><i class="bi bi-star"></i></c:forEach>
		</div> 
		<div><a href="../product/detail?proNo=${d.proNo}">${d.proName}</a></div>
		<div>${d.contents}</div><br>
	</c:forEach>
