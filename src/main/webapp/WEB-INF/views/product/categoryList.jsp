<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>

<section class="container mt-5">
    <h1 class="mb-3 text-center">Category Product List</h1>
    <table class="table table-dark table-hover">
        <!-- ... existing table header ... -->
        <tbody>
            <c:forEach items="${productList}" var="product">
                <tr>
                    <td>${product.proNo}</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/resources/upload/product/${product.fileDTOs[0].originalName}" alt="" width="100" height="100">
                    </td>
                    <td>${product.proName} </td>
                    <td>${product.userId} </td>
                    <td>${product.proContents}</td>
                    <td>${product.createDate}</td>
                    <td>${product.hit} </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
        <!-- ... existing pagination code ... -->
    </nav>
</section>

<div>
    <button type="button" class="btn btn-danger"><a href="../product/add">상품등록</a></button>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="/resources/js/list.js"></script>

</body>
</html>
