<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="../temp/bootstrap.jsp"></c:import>

	
	<c:forEach items="${list}" var="d" varStatus="i">
					<c:choose>
						<c:when test="${i.first}">
							<div class="reviewBox  border-bottom" id="totalpage" data-totalPage="${pager.totalPage}">
						</c:when>
						<c:otherwise>
							<div class="reviewBox  border-bottom">
						</c:otherwise>
					</c:choose>
			<div class="imageBox">
				<img class="reviewImage" src="../resources/upload/member/${d.fileName}" class="d-block w-100" alt="...">
			</div>
			<div class="box3">
				<div><a href="./reviews?userNo=${d.userNo}">${d.userId}</a></div>
				<div><c:forEach var="i" begin="1" end="${d.score}" step="1"><i class="bi bi-star-fill"></i></c:forEach><c:if test="${d.score%1>=0.5}"><i class="bi bi-star-half"></i></c:if><c:if test="${d.score%1<0.5}"><c:if test="${d.score%1>0}"><i class="bi bi-star"></i></c:if></c:if><c:forEach var="i" begin="1" end="${5-d.score}" step="1"><i class="bi bi-star"></i></c:forEach></div>
				<div><a href="../product/detail?proNo=${d.proNo}">${d.proName}</a></div>
				<p>${d.contents}</p>
			</div>
		</div>
	</c:forEach>
