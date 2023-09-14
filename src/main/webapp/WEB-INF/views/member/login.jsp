<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	// 로그인 되어 있으면 메인페이지로 강제 이동
	if (session.getAttribute("member") != null && session.getAttribute("member") != "") {
		response.sendRedirect("/");
	}
	// 이전 페이지 기록
    String referer = request.getHeader("member");
    if(referer==null)referer = "/";
%>
<!DOCTYPE html>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
	<title>Login</title>
	<c:import url="../temp/bootstrap.jsp"></c:import>
</head>

<body>
	<c:import url="../temp/header1.jsp"></c:import>
<!-- ======= Join Section ======= -->
	<section class="container">
		<h1 class="text-center">Login Page</h1>

	<!-- login form -->
	<!--  action="${pageContext.request.contextPath}/login.com -->
	<form role="form" method="post" id="loginfrm" action="./login.com" enctype="multipart/form-data" autocomplete="off">
		<fieldset>
		<div class="form-group">
			<label for="id" class="col-sm-2">ID</label>
			<%-- <input type="text" name="userId" value="${cookie.id.value}" id="userId" placeholder="ID를 입력하세요"> --%>
			<input type="text" name="userId" value="${cookie.id.value}"  id="userId"  placeholder="ID를 입력하세요"> 
		</div>
		
		<div class="form-group">
			<label for="pw" class="col-sm-2">PASSWORD</label>
			<input type="password" name="userPw"  id="pw" value="" placeholder="비밀번호를 입력하세요">
		</div>
		
		<div class="checkbox col-sm-offset-2">
			<span>
				<label for="idSave">아이디 저장</label>
				<input type="checkbox" id="idSave" name="idSave" autocapitalize="off" <c:if test="${cookie.id.value != null && cookie.id.value != ''}">checked</c:if>> 			
			</span>
			<span>
				<label for="idStateful">로그인 상태유지</label>
				<input type="checkbox" id="idStateful" autocapitalize="off" <c:if test="${cookie.idStateful.value != null && cookie.idStateful.value != ''}">checked</c:if>>
				<input type="hidden" name="idStateful" id="ids" value="" />			
			</span>
		</div> 
		
	<div class="mb-3">
		<button type="button" id="loginbtn" class="btn-book-a-table">로그인</button>
	</div>
	</fieldset>
   </form>
   
   <!-- 아이디 비번 찾기 및 회원가입 영역 -->
   <div class="loginEtc">
   		<a href="./findId" class="lnk_etc"><button type="button" class="site-btn">아이디 찾기</button></a>
   		<em class="divi"> | </em>
   		<a href="./findPw" class="lnk_etc"><button type="button" class="site-btn">비밀번호 찾기</button></a>
   		<em class="divi"> | </em>
   		<a href="./signUp" class="lnk_etc"><button type="button" class="site-btn">회원가입</button></a>
   </div>
   
   <!-- cd934c1bfa1d419ececfe6e1e1ef9624
   http://localhost:82/member/kakao/kakaoLogin -->
	<div>
	<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=d5aa1769209cd0342601e6c69c838176&redirect_uri=http://localhost:82/kakao/callback">
			 <img src="/resources/img/kakao_login_medium_wide.png">
	</a>
    </div>	  
   </section>	
   
   <c:import url="../temp/footer1.jsp"></c:import>
	
	 <!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="/resources/js/login.js"></script>
	<!-- 카카오 스크립트 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

</body>
</html>

