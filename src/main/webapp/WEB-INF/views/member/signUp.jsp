<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>

	<section class="container">
		<div class="page-haeder">
			<div align="center">
				<h2>회원가입</h2>
			</div>
		</div>
		<hr>

<!-- 회원가입 폼 -->		
		<form action="./signUp" method="post" enctype="multipart/form-data" id="frm">
			<div class="form-group">
				<label for="userId">아이디</label>		
				<input type="text" class="form-control" id="userId" name="userId" placeholder="id를 입력하세요">
				<div class="checkResult" id="idCheck"></div>
			</div>	
			
			<div class="form-group">
				<label for="userPw">비밀번호</label>		
				<input type="password" class="form-control" id="userPw" name="userPw" placeholder="패스워드를 입력하세요">
				<div class="checkResult" id="pwCheck"></div>
			</div>	
			
			<div class="form-group">
				<label for="userPw2">비밀번호 확인</label>		
				<input type="password" class="form-control" id="userPw2" name="userPw2" placeholder="패스워드를 한번 더 입력하세요">
				<div class="checkResult" id="pwCheck2"></div>
			</div>	
			
			<div class="form-group">
				<label for="name">이름</label>		
				<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요">
				<div class="checkResult" id="nameCheck"></div>
			</div>	
			
			<div class="form-group">
				<label for="phone">핸드폰번호</label>		
				<input type="text" class="form-control" id="phone" name="phone" placeholder="번호를 입력하세요">
				<div class="checkResult" id="phoneCheck"></div>
			</div>
			
			<div class="form-group">
				<label for="phone">핸드폰번호</label>		
				<input type="text" class="form-control" id="phone" name="phone" placeholder="번호를 입력하세요">
				<div class="checkResult" id="phoneCheck"></div>
			</div>
			
			<div class="form-group">
				<label for="email">이메일 주소</label>		
				<input type="email" class="form-control" id="email" name="email" placeholder="E-mail (Ex.GUDI@naver.com)">
				<div class="checkResult" id="emailCheck"></div>
			</div>
			
			<div class="form-group">
				<label for="zipCode">우편번호</label>		
				<input type="text" class="form-control" id="postcode" name="zipCode" placeholder="우편번호">
				<input type="button" onclick="openDaumPostcode()" value="우편번호 찾기"><br>
			</div>
			<div class="form-group">
				<label for="address">주소</label>		
				<input type="text" class="form-control" id="address" name="address" placeholder="주소">
				<div class="checkResult" id="addrCheck"></div>
			</div>
			<div class="form-group">
				<label for="refAddress">참고항목</label>		
				<input type="text" class="form-control" id="extraAddress" name="refAddress" placeholder="참고항목">
				<div class="checkResult" id="addr2Check"></div>
			</div>
			<div class="form-group">
				<label for="detailAddress">상세주소</label>		
				<input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세주소">
				<div class="checkResult" id="addr3Check"></div>
			</div>
			<br>
			<div class="form-group">
				<label for="birth">생년월일</label>		
				<input type="date" class="form-control" id="birth" name="birth">
				<div class="checkResult" id="birthCheck"></div>
			</div>
			
			<!-- 회원 프로필사진 첨부 -->
			<div class="form-group">
		  		<label for="pic" class="form-label">프로필 사진</label>
		  		<input type="file" name="file" class="form-control" id="file">
			</div>
			
		</form>
	</section>
<!-- 다음 우편주소api -->
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/adress.js"></script>

<body>

	
</body>
</html>