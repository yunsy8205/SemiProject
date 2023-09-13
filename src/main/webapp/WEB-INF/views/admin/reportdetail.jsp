<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootstrap.jsp"></c:import>
<c:import url="../temp/adminHeader.jsp"></c:import>
<style type="text/css">
	#image{
		width: 590px;
		height: 380px;

	}
</style>
</head>
<body>
	<section class="container mt-5">
		<div class="text-center mb-5">
			<h1>신고관리</h1>
		</div>
				<table class="table table-bordered">
					<tr>
						<th style="text-align: center;">번호</th><td>${dto.reportNo}</td><th style="text-align: center;">신고자</th><td>${dto.userId}</td>
					</tr>
					<tr>
						<th style="text-align: center;">신고유형</th><td>${dto.catName}</td><th style="text-align: center;">신고된 ID</th><td><a href="./memberdetail?userNo=${id.userNo}">${id.userId}</a></td>
					</tr>
					<tr>
						<th style="text-align: center;">제목</th><td colspan="3">${dto.title}</td>
					</tr>
					<tr>
						<td style="text-align: center; padding-top: 20px; padding-bottom: 20px;" colspan="4">${dto.rContents}</td>
					</tr>
					<tr>
						<th style="text-align: center; " colspan="4">신고 이미지</th>
					</tr>
					<tr>
						<td style="text-align: center; padding-top: 20px; padding-bottom: 15px;" colspan="4">
									<c:forEach items="${dto.fileDTOs}" var="f">
							<c:choose>
								<c:when test="${not empty f.fileName}">
										<div >
											<img id="image" src="../resources/upload/report/${f.fileName}">
										</div>
								</c:when>
								<c:otherwise>
									<p>없음</p>
								</c:otherwise>
							</c:choose>
									</c:forEach>
						</td>
					</tr>
				</table>
	</section>
</body>
</html>