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
		  <li><a href="delete">회원탈퇴</a></li>
		</ul>
	</div>
	
	<div id="section">
	<p>회원탈퇴</p>
		
	</div>
	<form action="./delete" method="post" id="frm">
	<div id="section">
		<p>${member.userId} 님</p>
		
			
		 	<label for="userId" class="form-label">id</label>
	 	 	<input type="text" name="userId" class="form-control" id="userId" value="${member.userId}" placeholder="id를 입력하세요">
			
	
			
		 	<label for="userPw" class="form-label">pw</label>
	 	 	<input type="password" name="userPw" class="form-control" id="userPw" placeholder="pw를 입력하세요">
		 	

			<button class="btn btn-success" type="button" id="btn">회원탈퇴</button>
	</div>
	</form>
	
	
	<div id="footer">
		<h2>FOOTER</h2>
	</div>
    
    
    <script>
    	let btn = document.getElementById("btn");
 		let frm = document.getElementById("frm");
 		
    	btn.addEventListener("click", function(){
 			removeMember();   		
 
    	})
		
    	function removeMember() {
    			if(window.confirm("정말 탈퇴하시겠습니까?")){
    			location.href="./delete";
    			frm.submit();
    			}   			
    		}
	</script>


</body>
</html>