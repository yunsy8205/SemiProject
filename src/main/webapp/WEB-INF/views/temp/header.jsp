<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
       <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

      <title>Electro - HTML Ecommerce Template</title>

      <!-- Google font -->
      <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

      <!-- Bootstrap -->
      <link type="text/css" rel="stylesheet" href="/resources/css/bootstrap.min.css"/>

      <!-- Slick -->
      <link type="text/css" rel="stylesheet" href="/resources/css/slick.css"/>
      <link type="text/css" rel="stylesheet" href="/resources/css/slick-theme.css"/>

      <!-- nouislider -->
      <link type="text/css" rel="stylesheet" href="/resources/css/nouislider.min.css"/>

      <!-- Font Awesome Icon -->
      <link rel="stylesheet" href="/resources/css/font-awesome.min.css">

      <!-- Custom stlylesheet -->
      <link type="text/css" rel="stylesheet" href="/resources/css/style.css"/>


	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
      
      <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
      <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
      
      
         
         <style>
      .product-image {
            width: 100%;
            height: auto;
            max-height: 200px; /* Set the maximum height of the image */
            object-fit: cover; /* Maintain aspect ratio and cover area */
      }
      .dropdown-item:hover {
         background-color: #007bff; 
         color: #ffffff; 
      }

      .header-search .search-btn {
        background-color: #D10024;
        color: white;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        height: 40px;
        border-radius: 0px;
        width: 40%;
    }
    .input-select {
    padding: 0px 15px;
    background: #FFF;
    border: 1px solid #E4E7ED;
    height: 40px;
}
.header-search .form-control {
    width: 100%;
    height: 40px;
    border-radius: 0px; 
}
.header-search .search-btn {
    background-color: #D10024;
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    height: 40px;
    border-radius: 0px;
    width: 40%;
}
#search-header{
    display: flex;
    align-items: center;
    height: 10rem;
}
.input-select {
    padding: 0px 15px;
    background: #FFF;
    border: 1px solid #E4E7ED;
    height: 40px;
}
.header-search form {
    display: flex;
    align-items: center;
    width: 100%;
}
.header-ctn {
    float: right;
    width: 100%;
    text-align: center;
    padding: 15px 0px;
}

.input-select {margin: 0 !important;}
.form-control {margin: 0 !important;}
   </style>
   
      

         
    </head>
   <body>

<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            
         
         <ul class="header-links pull-right">
            <c:choose>
               <c:when test="${not empty member}">
                  <li class="nav-item text-white me-3"><a href="../member/logout">로그아웃</a></li>
                  <li class="nav-item text-white me-3"><a href="../my/mypage">mypage</a></li>
               </c:when>
               <c:otherwise>
                  <li class="nav-item text-white me-3"><a href="../member/login">로그인</a></li>
                  <li class="nav-item text-white me-3"><a href="../member/signUp">회원가입</a></li>

               </c:otherwise>
            </c:choose>
         </ul>
         
         
         
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row" id="search-header">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="../" class="logo">
                            <img src="/resources/img/logoMain.jpg" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form action="/product/list" method="GET">
                            <select name="kind" id="k" class="input-select" aria-label="Default select example">
                                <option class="kind" value="proName">상품명</option>
                                <option class="kind" value="proContents">상품설명</option>
                                <option class="kind" value="userId">이름</option>
                            </select>
                            <input type="text" name="search" value="${pager.search}" class="form-control" placeholder="Search here">
                            <button type="submit" class="search-btn">검색</button>
                        </form>
                    </div>
                </div>
               

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->
                        <div>
                            <a href="../product/add">
                            <i class="bi bi-pencil-square"></i>
                                <span>상품등록</span>
                            </a>
                        </div>
                        <!-- /Wishlist -->

                      
                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->

      