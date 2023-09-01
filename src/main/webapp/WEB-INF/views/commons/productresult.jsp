<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="../temp/bootstrap.jsp"></c:import>


				<c:forEach items="${list}" var="d" varStatus="i">
				<c:set var="flag" value="true"/>
					<c:choose>
						<c:when test="${i.first}">
							<div id="totalpage" data-totalPage="${pager.totalPage}">
						</c:when>
						<c:otherwise>
							<div>
						</c:otherwise>
					</c:choose>
						<c:forEach items="${d.fileDTOs}" var="f">
							<c:if test="${flag?true:false}">
								<a href="../product/detail?proNo=${d.proNo}"><img style="width: 300px; height: 300px;" class="image" src="../resources/upload/product/${f.originalName}" class="d-block w-100" alt="..."></a>	
								<c:set var="flag" value="false"/>
							</c:if>
						</c:forEach>
					</div>
					<div><a href="../product/detail?proNo=${d.proNo}">${d.proName}</a></div>
					<div>${d.proPrice}원 ${d.createDate}</div>
				</c:forEach><br>
