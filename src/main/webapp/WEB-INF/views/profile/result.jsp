<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="../temp/bootstrap.jsp"></c:import>

	<c:choose>
		<c:when test="${flag eq 'products'}">
			<p><a class="btn btn-primary" href="./reviews?userNo=${dto.userNo}">후기목록</a></p>
				<c:forEach items="${list}" var="d">
					${d.proName} ${d.proPrice}
				<c:set var="flag" value="true"/>
					<div>
						<c:forEach items="${d.fileDTOs}" var="f">
							<c:if test="${flag?true:false}">
								<img class="image" src="../resources/upload/product/${f.originalName}" class="d-block w-100" alt="...">	
								<c:set var="flag" value="false"/>
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>
		</c:when>
		<c:otherwise>
			<p><a class="btn btn-primary" href="./products?userNo=${dto.userNo}">상품목록</a></p>
 				<h3>판매자후기목록</h3>
				<div>
		            <c:forEach items="${list}" var="d">
						${d.reviewNo} ${d.contents} ${d.score}
					</c:forEach>
				</div>
		</c:otherwise>
	</c:choose>