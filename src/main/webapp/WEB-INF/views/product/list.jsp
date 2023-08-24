<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>

<section class="container mt-5">
    <h1 class="mb-3 text-center">Product List</h1>
    <table class="table table-dark table-hover">
        <thead>
            <th>번호</th><th>이미지</th><th>제목</th><th>작성자</th><th>상품설명</th><th>작성일자</th><th>조회수</th>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="d">
                <tr>
                    <td>${d.proNo}</td>                  
                    <td>
					    <img src="${pageContext.request.contextPath}/resources/upload/product/${d.fileDTOs[0].originalName}" alt="" width="100" height="100">
					</td>
                    <td>${d.proName} </td>
                    <td>${d.userId} </td>
                    <td>${d.proContents}</td>
                    <td>${d.createDate}</td>
                    <td>${d.hit} </td>
                </tr>
            </c:forEach>          
        </tbody>
    </table>
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
    
<div>
    <button type="button" class="btn btn-danger"><a href="../product/add">상품등록</a></button>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="/resources/js/list.js"></script>

</body>
</html>