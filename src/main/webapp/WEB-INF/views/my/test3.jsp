<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="root" value="/"></c:url>
<!DOCTYPE html>

<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<title>Electro - HTML Ecommerce Template</title>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
	
	<script type="text/javascript">
	var sock=new SockJS("${root}my/test3");
	sock.onmessage=function(msg){
		console.log(msg.data);
		
		$('#target').append(msg.data+"<br/>");
	};
	
	
	$(function(){
		$('button').click(function(){

			sock.send($('input').val());
		});
	});
	</script>
    </head>
	<body>
<!-- HEADER -->

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
<!-- ------------------------------------------------------------------------------------------- -->

	${member.userId}님
		      
	<br><br><br><br>
	
	<input/><button>전송</button>
	<div id="target"></div>

	<br><br><br><br>

                    
<!-- ------------------------------------------------------------------------------------------- -->

	</body>
</html>

