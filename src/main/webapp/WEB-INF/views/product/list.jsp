<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
		.product-card {
			border: 1px solid #ccc;
			padding: 10px;
			margin: 10px;
			width: 200px;
		}
		.product-image {
            width: 100%;
            height: auto;
            max-height: 200px; /* Set the maximum height of the image */
            object-fit: cover; /* Maintain aspect ratio and cover area */
		}
		
	</style>
</head>
<body>

<section class="container mt-5">
    <div class="container">
        <h1 class="mb-3 text-center">Product List</h1>
        <div class="row">
            <c:forEach items="${list}" var="product" varStatus="status">
                <div class="col-md-4">
                    <div class="product-card">
                        <c:choose>
                            <c:when test="${not empty product.fileDTOs}">
                                <img src="${pageContext.request.contextPath}/resources/upload/product/${product.fileDTOs[0].originalName}" alt="" class="product-image">
                            </c:when>
                            <c:otherwise>
                                <img src="/resources/images/이미지없음.jpg" alt="" class="product-image">
                            </c:otherwise>
                        </c:choose>
                        <h4>${product.proName}</h4>
                        <p class="product-content">${product.proContents}</p>
                        <p>작성자: ${product.userId}</p>
                        <p>작성일: ${product.createDate}</p>
                        <p>조회수: ${product.hit}</p>
                    </div>
                </div>
                <c:if test="${status.index % 3 == 2 || status.last}">
                    </div><div class="row"> <!-- 3개 카드마다 row 닫고 새로운 row 열기 -->
                </c:if>
                <c:if test="${(status.index + 1) % 10 == 0 || status.last}">
                    </div><div class="row"> <!-- 10개 카드마다 row 닫고 새로운 row 열기 -->
                </c:if>
            </c:forEach>
        </div>
    </div>
    <!-- ... (페이징 및 검색 부분) ... -->
    	<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  	<c:if test="${pager.pre}">
				    <li class="page-item">
				      <a class="page-link move" href="#" data-num="${pager.startNum-1}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
			    </c:if>
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    	<li class="page-item"><a class="page-link move" href="#" data-num="${i}">${i}</a></li>
			    </c:forEach>
			    <c:if test="${pager.next}">
				    <li class="page-item">
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
		 	  	
			  <select name="kind" id="k" class="form-select" data-kind="${pager.kind}" aria-label="Default select example">
				  <option class="kind" value="proName">상품명</option>
				  <option class="kind" value="proContents">상품설명</option>
				  <option class="kind" value="userId">이름</option>
			  </select>
			  <input type="text" name="search" value="${pager.search}" class="form-control" aria-label="Amount (to the nearest dollar)">
			   <div class="col-auto">
			    <button type="submit" class="btn btn-primary">검색</button>
			  </div>
		  </form>
		</div>
    
    <button type="button" class="btn btn-danger"><a href="../product/add">상품등록</a></button>
</div>
<div>
    <button type="button" class="btn btn-danger"><a href="../">홈</a></button>
</div>
</section>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="/resources/js/list.js"></script>

</body>
</html>