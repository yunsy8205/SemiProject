const loginfrm = document.getElementById("loginfrm");
const loginbtn = document.getElementById("loginbtn");
const userId = document.getElementById("userId");
const pw = document.getElementById("pw");


loginbtn.addEventListener("click", function(){
    if(userId.value.length>0 && pw.value.length>0){

        console.log(userId.value);
        console.log(pw.value);

        // 로그인 성공 시 submit 
        loginfrm.submit();
    }
    else if(userId.value.length<1){
        alert("아이디를 입력하세요");
    }
    else if(pw.value.length<1){
        alert("비밀번호를 입력하세요")
    }
    else{
        alert("로그인을 할 수 없습니다");
    }
})