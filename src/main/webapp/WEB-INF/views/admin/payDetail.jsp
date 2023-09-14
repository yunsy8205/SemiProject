	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootstrap.jsp"></c:import>
</head>
<body>
<c:import url="../temp/adminHeader.jsp"></c:import>
	<section class="container mt-5">
	
		<table class="table">
		
		<thead class="table-dark">
			<th>판매자</th> <th>예금주</th><th>은행명</th><th>계좌번호</th>
		</thead>
		
		<tbody class="mb-5" >
		
		<tr>
				 	<td>${dto.userId} </td>	
					<td>${dto.holder}</td>
					<td>${dto.bankName}</td>
					<td>${dto.bankNum}</td>
				</tr>
			
		</tbody >
		
    </table>
    
   
			<div class="mb-3">
			<label for="contents" class="form-label">환불사유</label>
			<textarea rows="20" cols="" class="form-control" readonly="readonly" > ${dto.reason}</textarea>
			</div>
    
   
		
		
		
		
	

	
	


</body>
</html>