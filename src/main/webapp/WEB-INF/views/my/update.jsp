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
		<input type="text" id="sample6_postcode" name="zipCode" value="${member.zipCode}" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소" name="address" value="${member.address}"><br>
		<input type="text" id="sample6_extraAddress" name="refAddress" value="${member.refAddress}" placeholder="참고항목">
		<input type="text" id="sample6_detailAddress" name="detailAddress" value="${member.detailAddress}" placeholder="상세주소">
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
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
</script>

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