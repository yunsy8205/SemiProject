<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
	<title>상품 Detail Page</title>
	<style>
			
		.proImage{
			
			width: 100%;
            height: 90%;
            box-sizing: border-box;
		}
		
		.wrap{
            
            width: 1000px;
            height: 300px;
        }
		
		.test1, .test2, .test3{ 
           
            height: 100%;
            box-sizing: border-box;
            float: left;/*밑으로 붙었던 width 30% 박스를 옆으로 붙여줌*/
        }
		
		.test1{width: 30%;}
		.test2{width: 10%;}
        .test3{width: 55%;}
        
        .wrap2{
            
            width: 1000px;
            height: 600px;
        }
		
		.test4, .test5{ 
           
            height: %;
            box-sizing: border-box;
            float: left;/*밑으로 붙었던 박스를 옆으로 붙여줌*/
        }
		
		.test4{width: 60%;}
		.test5{width: 30%;}
		
		.image{
			
			width: 50px;
            height: 50px;
            box-sizing: border-box;
		}
		
		.listfile{
		float: left;
		}
        
	</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h1 class="mt-5 text-center">상품 Detail Page</h1>
	<div class="wrap mt-5 ms-5 border-bottom">
		<div id="carouselExampleIndicators" class="test1 carousel slide">
		  <div class="carousel-inner test1">
			<c:forEach items="${dto.fileDTOs}" var="f">
			    <div class="carousel-item active test1">
			      <img class="proImage" src="../resources/upload/product/${f.originalName}" class="d-block w-100" alt="...">
			    </div>
			</c:forEach>
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
		<div class="test2"></div>
		<div class="test3">
		<table>
			<tr>
				<th>상품이름</th>
				<td>${dto.proName}</td>
	
			</tr>
			<tr>
				<th>상품가격</th>
				<td>${dto.proPrice}</td>
	
			</tr>
			<tr>
				<th>상품상태</th>
				<td>${dto.proStatus}</td>
	
			</tr>
			<tr>
				<th>교환여부</th>
				<td>${dto.exchange}</td>
	
			</tr>
			<tr>
				<th>배송비</th>
				<td></td>
	
			</tr>
			<tr>
				<th>카테고리</th>
				<td>${dto.catName}</td>
	
			</tr>
	 </table>
		</div>
	</div>
	<div class="wrap2">
		<div class="test4 ms-5">
				<h5>상품정보</h5>
				<p>${dto.proContents}</p>
		</div>
		<div class="test5">
		<p>판매자아이디 : ${dto.userId}</p>

		<p>판매상품수 : ${countp}</p>
				<h7>최근 판매상품목록</h7>
					<div>
					<c:forEach items="${list}" var="d">
					<c:set var="flag" value="true"/>
					<div>
						<c:forEach items="${d.fileDTOs}" var="f">
							<c:if test="${flag?true:false}">
								<img class="image" src="../resources/upload/product/${f.originalName}" class="d-block w-100" alt="...">
										
								<c:set var="flag" value="false"/>
							</c:if>
						</c:forEach>
					</div>
					<div>					
						${d.proPrice}
					</div>	
					</c:forEach>
					</div>
			<div>판매자 후기수 : ${countr}</div>

			<div>최근 후기목록</div>
			<div>
				<c:forEach items="${review}" var="r">
					${r.userId}<br> 
					${r.score}<br> 
					${r.contents}<br><br>
				</c:forEach>
			</div>
		 
		</div>

	</div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>