<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<!-- header  -->
<header>

	<nav
		class="navbar navbar-expand-lg bg-dark border-bottom border-bottom-dark"
		data-bs-theme="dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">고객센터</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/">Home</a></li>
						
					<li class="nav-item"><a class="nav-link active"
						href="/notice/list">NOTICE</a></li>

					<li class="nav-item"><a class="nav-link active" data-id="${member}" id="qna"
						href="#">QNA</a></li>


				</ul>

			</div>
		</div>
	</nav>
</header>

<script>
	const qna = document.getElementById("qna");

	qna.addEventListener("click", function(){

		let num = this.getAttribute("data-id");
		console.log(num);
		if(!num){

		alert("로그인하세요");
		location.href="../member/login";
		}else{

			location.href="/qna/list";
		}
		
	})

</script>


