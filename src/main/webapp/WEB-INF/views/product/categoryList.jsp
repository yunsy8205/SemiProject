<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>카테고리별 상품 리스트</title>
</head>
<body>
    <div class="container">
        <h1>카테고리별 상품 리스트</h1>

        <c:forEach var="p" items="${list}">
            <div>
                <h2>${p.proName}</h2>
                <p>가격: ${p.prPrice}원</p>
                <p>작성자: ${p.userid}</p>
                <!-- 기타 상품 정보 출력 -->
            </div>
        </c:forEach>
    </div>
</body>
</html>
