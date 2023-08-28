<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 세션을 flase 값으로 주면 세션을 사용하지 않겠다고 선언하는 의미라 주석처리함. -->
<%-- <%@ page session="false" %> --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	 <style>
        .product-card {
            border: 20px solid;
            padding: 10px;
            margin: 20px;
            display: inline-block;
            width: 200px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        }
        .product-image {
            max-width: 100%;
            height: auto;
        }
    </style>
	
</head>

<body>
<ul class="nav justify-content-center">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">Active</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="../product/add">상품등록</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="../product/list">상품목록</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" aria-disabled="true">Disabled</a>
  </li>
   <li class="nav-item">
    <a class="nav-link" href="../member/login">로그인</a>
  </li>
</ul>
<h1 class="text-center">
	 INDEX PAGE
</h1>

<div id="carouselExampleIndicators" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/resources/images/광고글1.jpg" class="d-block w-100" alt="a">
    </div>
    <div class="carousel-item">
      <img src="/resources/images/광고글2.jpg" class="d-block w-100" alt="b">
    </div>
    <div class="carousel-item">
      <img src="/resources/images/광고글3.jpg" class="d-block w-100" alt="c">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>




		<section class="container mt-5">
        <h1 class="mb-3 text-center">Product List</h1>
        <div class="row">
            <c:forEach items="${list}" var="product">
                <div class="col-md-3">
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/resources/upload/product/${product.fileDTOs[0].originalName}" alt="" class="product-image">
                        <h4>${product.proName}</h4>
                        <p>작성자: ${product.userId}</p>
                        <p>${product.proContents}</p>
                        <p>작성일: ${product.createDate}</p>
                        <p>조회수: ${product.hit}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
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
</section>
    </section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="/resources/js/list.js"></script>
</body>
</html>
