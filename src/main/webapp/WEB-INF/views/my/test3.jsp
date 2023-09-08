<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="root" value="/"></c:url>
<!DOCTYPE html>

<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
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
			
			$('#message').val('')
		});
	});
	</script>
    </head>
	<body>
<!-- ------------------------------------------------------------------------------------------- -->

	<li class="nav-item text-white me-3"><a href="../member/login">로그인</a></li>

	${member.userId}님
		      
	<br><br><br><br>
	
	<div id="target"></div>
	<input id="message"/><button>전송</button>

	<br><br><br><br>

                    
<!-- ------------------------------------------------------------------------------------------- -->

	</body>
</html>

