<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

	<title>회원수정</title>
	<style>
		#header {
			background-color:gray;
			height:100px;
		}
		#nav {
			background-color:green;
			color:white;
			width:250px;
			height:700px;
			float:left;
		}
		#section {
			width:200px;
			text-align:left;
			float:left;
			padding:10px;
		}
		#footer {
			background-color:gray;
			height:100px;
			clear:both;
		}
		
		#header, #nav, #section, #footer { text-align:center; }
		#header, #footer { line-height:100px; }
		/* #nav, #section { line-height:240px; } */
	</style>
</head>
<body>    
    <div id="header">
		<a href="../">header</a><br>
		
	</div>
	
	<div id="nav">
		
		<ul>
		<li><a href="./mypage">마이페이지</a></li><br><br>
		  <li><a href="./check">정보수정</a></li><br><br>
		  <li><a href="./list">내판매글/구매내역/후기</a></li><br><br>
		  <li>내 찜 목록</li><br><br>
		  <li>택배조회</li><br><br>
		  <li><a href="./management">상품관리</a></li><br><br>
		  <li><a href="./delete">회원탈퇴</a></li>
		</ul>
	</div>
	
	<form action="./update" method="post" enctype="multipart/form-data">
	<div id="section">
	<p>정보수정페이지</p>
		<p>
			<img alt="" id="profile" src="../resources/upload/member/${member.memberFileDTO.fileName}" onerror="this.onerror-null; this.src='../resources/img/imgtest.jpeg';" width="200"; height="300">
		</p>
		<input type="file" name="file" id="file" value="../resources/upload/member/${member.memberFileDTO.fileName}">
	</div>
	
	
	<div id="section">
		<br><br>
		<p>이름</p>
		<input type="text" name="name" value="${member.name}">
		<br>
		<p>비밀번호</p>
		<input type="password" id="pw" name="userPw" value="${member.userPw}">
		<br>
		<p>비밀번호 확인</p>
		<input type="password" value="${member.userPw}">
		<br>
		<p>이메일</p>
		<input type="email" name="email" value="${member.email}">
		<br>
		<p>생일</p>
		<input type="date" name="birth" value="${member.birth}">
		<br>
		<p>주소</p>
		<input type="text" id="postcode" name="zipCode" value="${member.zipCode}" placeholder="우편번호">
		<input type="button" onclick="openDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="address" placeholder="주소" name="address" value="${member.address}"><br>
		<input type="text" id="extraAddress" name="refAddress" value="${member.refAddress}" placeholder="참고항목">
		<input type="text" id="detailAddress" name="detailAddress" value="${member.detailAddress}" placeholder="상세주소">
		<br>
		<p>휴대폰</p>
		<input type="tel" name="phone" value="${member.phone}">
		<br>
		<p>자기소개</p>
		<input type="text" name="intro" value="${member.intro}">
		<br>
		<button class="btn btn-primary">회원수정</button>
	
		</div>
		</form>
	
	
	
	<div id="footer">
		<h2>FOOTER</h2>
	</div>
    
    
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/adress.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	$("input:file").change(function(){ // -1. 다른 파일 선택 시 이 이벤트가 호출됨-
		// -2. 선택학 파일 데이터를 가져옴-
    	let formData = new FormData(); // <form></form>
		formData.append("file", $("input:file")[0].files[0]); // <input type="file" name="file">
    	
		// -3. 가져온 파일 데이터를 컨트롤러 setContentsImg 메서드로 넘김 -
		$.ajax({
			type:"POST",
			url:"./setContentsImg",
			data:formData, // 가져온 파일 데이터 설정(파라미터로 넘어감)
			enctype:"multipart/form-data",
			cache:false,
			contentType:false,
			processData:false,
			success:function(result){
				$("#profile").attr("src", result);
			}
		});
		
		/*	
			$.ajax({
				type:'post',
				url:'./setContentsImgDelete',
				data:{
					path:path
				},
				success:function(result){
					console.log(result);
				},
				error:function(){
					console.log("err");
				}
			});
		*/
  	});
</script>
</body>
</html>