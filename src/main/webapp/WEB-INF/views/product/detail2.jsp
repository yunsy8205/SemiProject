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
		
		.bi{
			color: rgb(252, 219, 3);
		}
		@keyframes tonext {
  75% {
    left: 0;
  }
  95% {
    left: 100%;
  }
  98% {
    left: 100%;
  }
  99% {
    left: 0;
  }
}
 
@keyframes tostart {
  75% {
    left: 0;
  }
  95% {
    left: -300%;
  }
  98% {
    left: -300%;
  }
  99% {
    left: 0;
  }
}
 
@keyframes snap {
  96% {
    scroll-snap-align: center;
  }
  97% {
    scroll-snap-align: none;
  }
  99% {
    scroll-snap-align: none;
  }
  100% {
    scroll-snap-align: center;
  }
}
 
body {
  max-width: 37.5rem;
  margin: 0 auto;
  padding: 0 1.25rem;
  font-family: 'Lato', sans-serif;
}
 
* {
  box-sizing: border-box;
  scrollbar-color: transparent transparent; /* thumb and track color */
  scrollbar-width: 0px;
}
 
*::-webkit-scrollbar {
  width: 0;
}
 
*::-webkit-scrollbar-track {
  background: transparent;
}
 
*::-webkit-scrollbar-thumb {
  background: transparent;
  border: none;
}
 
* {
  -ms-overflow-style: none;
}
 
ol, li {
  list-style: none;
  margin: 0;
  padding: 0;
}
 
.carousel {
  position: relative;
  padding-top: 75%;
  filter: drop-shadow(0 0 10px #0003);
  perspective: 100px;
}
 
.carousel__viewport {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  display: flex;
  overflow-x: scroll;
  counter-reset: item;
  scroll-behavior: smooth;
  scroll-snap-type: x mandatory;
}
 
.carousel__slide {
  position: relative;
  flex: 0 0 100%;
  width: 100%;
  background-color: #f99;
  counter-increment: item;
}
 
.carousel__slide:nth-child(even) {
  background-color: #99f;
}
 
.carousel__slide:before {
  content: counter(item);
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate3d(-50%,-40%,70px);
  color: #fff;
  font-size: 2em;
}
 
.carousel__snapper {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  scroll-snap-align: center;
}
 
@media (hover: hover) {
  .carousel__snapper {
    animation-name: tonext, snap;
    animation-timing-function: ease;
    animation-duration: 4s;
    animation-iteration-count: infinite;
  }
 
  .carousel__slide:last-child .carousel__snapper {
    animation-name: tostart, snap;
  }
}
 
@media (prefers-reduced-motion: reduce) {
  .carousel__snapper {
    animation-name: none;
  }
}
 
.carousel:hover .carousel__snapper,
.carousel:focus-within .carousel__snapper {
  animation-name: none;
}
 
.carousel__navigation {
  position: absolute;
  right: 0;
  bottom: 0;
  left: 0;
  text-align: center;
}
 
.carousel__navigation-list,
.carousel__navigation-item {
  display: inline-block;
}
 
.carousel__navigation-button {
  display: inline-block;
  width: 1.5rem;
  height: 1.5rem;
  background-color: #333;
  background-clip: content-box;
  border: 0.25rem solid transparent;
  border-radius: 50%;
  font-size: 0;
  transition: transform 0.1s;
}
 
.carousel::before,
.carousel::after,
.carousel__prev,
.carousel__next {
  position: absolute;
  top: 0;
  margin-top: 37.5%;
  width: 4rem;
  height: 4rem;
  transform: translateY(-50%);
  border-radius: 50%;
  font-size: 0;
  outline: 0;
}
 
.carousel::before,
.carousel__prev {
  left: -1rem;
}
 
.carousel::after,
.carousel__next {
  right: -1rem;
}
 
.carousel::before,
.carousel::after {
  content: '';
  z-index: 1;
  background-color: #333;
  background-size: 1.5rem 1.5rem;
  background-repeat: no-repeat;
  background-position: center center;
  color: #fff;
  font-size: 2.5rem;
  line-height: 4rem;
  text-align: center;
  pointer-events: none;
}
 
.carousel::before {
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpolygon points='0,50 80,100 80,0' fill='%23fff'/%3E%3C/svg%3E");
}
 
.carousel::after {
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpolygon points='100,50 20,100 20,0' fill='%23fff'/%3E%3C/svg%3E");
}
	</style>
<c:import url="../temp/bootstrap.jsp"></c:import>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<c:import url="../temp/header1.jsp"></c:import>

</head>
<body>
	<section class="carousel" aria-label="Gallery">
		<ol class="carousel__viewport">
		  <li id="carousel__slide1"
			  tabindex="0"
			  class="carousel__slide">
			<div class="carousel__snapper">
			  <a href="#carousel__slide4"
				 class="carousel__prev">Go to last slide</a>
			  <a href="#carousel__slide2"
				 class="carousel__next">Go to next slide</a>
			</div>
		  </li>
		  <li id="carousel__slide2"
			  tabindex="0"
			  class="carousel__slide">
			<div class="carousel__snapper"></div>
			<a href="#carousel__slide1"
			   class="carousel__prev">Go to previous slide</a>
			<a href="#carousel__slide3"
			   class="carousel__next">Go to next slide</a>
		  </li>
		  <li id="carousel__slide3"
			  tabindex="0"
			  class="carousel__slide">
			<div class="carousel__snapper"></div>
			<a href="#carousel__slide2"
			   class="carousel__prev">Go to previous slide</a>
			<a href="#carousel__slide4"
			   class="carousel__next">Go to next slide</a>
		  </li>
		  <li id="carousel__slide4"
			  tabindex="0"
			  class="carousel__slide">
			<div class="carousel__snapper"></div>
			<a href="#carousel__slide3"
			   class="carousel__prev">Go to previous slide</a>
			<a href="#carousel__slide1"
			   class="carousel__next">Go to first slide</a>
		  </li>
		</ol>
		<aside class="carousel__navigation">
		  <ol class="carousel__navigation-list">
			<li class="carousel__navigation-item">
			  <a href="#carousel__slide1"
				 class="carousel__navigation-button">Go to slide 1</a>
			</li>
			<li class="carousel__navigation-item">
			  <a href="#carousel__slide2"
				 class="carousel__navigation-button">Go to slide 2</a>
			</li>
			<li class="carousel__navigation-item">
			  <a href="#carousel__slide3"
				 class="carousel__navigation-button">Go to slide 3</a>
			</li>
			<li class="carousel__navigation-item">
			  <a href="#carousel__slide4"
				 class="carousel__navigation-button">Go to slide 4</a>
			</li>
		  </ol>
		</aside>
	  </section>
<h1 class="mt-5 ms-5">상품 Detail Page</h1>
	<div class="wrap mt-5 ms-5 border-bottom" id="add" data-add-pnum="${dto.proNo}">
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
				<td>
				 <c:choose>
				 	<c:when test="${dto.proStatus eq 0}">
				 		중고상품
				 	</c:when>
				 	<c:otherwise>
				 		새상품
				 	</c:otherwise>
				 </c:choose>
				</td>
	
			</tr>
			<tr>
				<th>교환여부</th>
				<td>
					<c:choose>
				 	<c:when test="${dto.exchange eq 0}">
				 		교환가능
				 	</c:when>
				 	<c:otherwise>
				 		교환불가능
				 	</c:otherwise>
					</c:choose>
				</td>
	
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
	 <c:choose>
	 	<c:when test="${member.userNo eq dto.userNo}">
	 	
	 	</c:when>
	 	<c:otherwise>
			 <button id="dibs" class="ms-3 my-3 btn btn-primary"><i id="heart" class="bi bi-heart"></i>찜<span id="dibsNum">${dibsNum}</span></button>
			 <button class="ms-3 my-3 btn btn-primary">톡</button>
			 <button class="ms-3 my-3 btn btn-primary" href="../payment/paymentadd?proNo=${dto.proNo}">바로구매</button>
	 	</c:otherwise>
	 </c:choose>
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
					</div><br>
					<a class="mb-3 btn btn-primary" href="../profile/products?userNo=${dto.userNo}">판매자상품목록</a>
			<div>판매자 후기수 : ${countr}</div><br>

			<div>최근 후기목록</div><br>
			<div>
				<c:forEach items="${review}" var="r">
					${r.userId}<br>
					<c:forEach var="i" begin="1" end="${r.score}" step="1"><i class="bi bi-star-fill"></i></c:forEach><c:if test="${r.score%1>=0.5}"><i class="bi bi-star-half"></i></c:if><c:forEach var="i" begin="1" end="${5-r.score}" step="1"><i class="bi bi-star"></i></c:forEach> 
					${r.score}<br> 
					${r.contents}<br><br>
				</c:forEach>
			</div>
			<a class="mb-3 btn btn-primary" href="../profile/reviews?userNo=${dto.userNo}">판매자후기목록</a><br>
		 
		</div>

	</div> 
	

	<c:if test="${not empty member}">
		<script src="../resources/js/detailLogin.js"></script>
	</c:if>
	<c:if test="${empty member}">
		<script src="../resources/js/detailLogout.js"></script>	
	</c:if>
<c:import url="../temp/footer1.jsp"></c:import>
</body>
</html>