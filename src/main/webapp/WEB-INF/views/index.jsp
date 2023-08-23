<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<style>
		.card-num{
			float: left;
		}
		.card{
			float: left;
		}
		.card-body{
			float: left;
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




		<table class="table table-dark table-hover">
		<thead>
			<th>번호</th><th>제목</th><th>작성자</th><th>작성일자</th><th>조회수</th>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="d">
			
				<div>
				<tr>
				<td>${d.proNo}</td>
					<td>
                        <c:if test="${not empty d.dtos}">
                            <img src="${pageContext.request.contextPath}/resources/upload/product/${d.dtos[0].fileName}" alt="">
                        </c:if>
                    </td>
					
					<td>${d.proName} </td>
					<td>${d.userId} </td>
					<td>${d.createDate} </td>
					<td>${d.hit} </td>
				</tr>
				</div>
				
					
			</c:forEach>			
		</tbody>
	</table>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
