<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Home</title>
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
	
	
	<form action="./check" method="post" id="frm">
	<div id="section">
		비밀번호 입력
		<input type="password" name="userPw" class="form-control" id="userPw" placeholder="pw를 입력하세요">
		<button type="button" id="btn">확인</button>
	</div>
	</form>
	
	
	
	
	<div id="footer">
		<h2>FOOTER</h2>
	</div>
    
    <script>
    let btn = document.getElementById("btn");
    let frm = document.getElementById("frm");
    let userPw = document.getElementById("userPw");
    
  	btn.addEventListener("click", function(){
  		console.log("click");
  		
  		console.log(userPw.value);
  		
  		frm.submit();
  	})
    </script>
</body>
</html>