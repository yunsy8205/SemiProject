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
            <th>번호</th><th>이미지</th><th>제목</th><th>작성자</th><th>작성일자</th><th>조회수</th>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="d">
                <tr>
                    <td>${d.proNo}</td>
                    <td>
                        <c:if test="${not empty d.dtos}">
                            <img alt="" src="${pageContext.request.contextPath}${dto.dtos[0].fileName}" />
                        </c:if>
                    </td>
                    <td>${d.proName} </td>
                    <td>${d.userId} </td>
                    <td>${d.createDate} </td>
                    <td>${d.hit} </td>
                </tr>
            </c:forEach>          
        </tbody>
    </table>
</section>
    
<div>
    <button type="button" class="btn btn-danger"><a href="../product/add">상품등록</a></button>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>