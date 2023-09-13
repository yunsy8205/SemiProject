<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="../temp/bootstrap.jsp"></c:import>
				
				<c:forEach items="${list}" var="d" varStatus="i" >
			            <div class="col-md-3" style="padding-right: 27px;">
			                <div class="product">
					<c:set var="flag" value="true"/>
					<c:choose>
						<c:when test="${i.first}">
			                 <div class="product-img" id="totalpage" data-totalPage="${pager.totalPage}">
						</c:when>
						<c:otherwise>
							<div class="product-img">
						</c:otherwise>
					</c:choose>
						<c:forEach items="${d.fileDTOs}" var="f">
							<c:if test="${flag?true:false}">		
			                        <a href="../product/detail?proNo=${d.proNo}"><img src="../resources/upload/product/${f.originalName}" alt="" width="200px" height="200px"></a>
			                    <c:set var="flag" value="false"/>
							</c:if>
						</c:forEach>
			                    </div>
			                    <div class="product-body">
			                        <p class="product-name"><a href="./detail?proNo=${d.proNo}">${d.proName}</a></p>
			                        <h4 class="product-price">${d.proPrice} </h4>
			                        <p class="product-createDate">작성일: ${d.createDate}</p>
			                        <p class="product-hit">조회수: ${d.hit}</p>
			                    </div>
			                </div>
			            </div>
			        </c:forEach><br>