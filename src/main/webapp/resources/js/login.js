const loginfrm = document.getElementById("loginfrm");
const loginbtn = document.getElementById("loginbtn");
const userId = document.getElementById("userId");
const pw = document.getElementById("pw");
const idSave = document.getElementById("idSave");
const idStateful = document.getElementById("idStateful");


userId.addEventListener("keyup", function(e){
    if (e.key === "Enter"){
        document.getElementById("pw").focus();

    }
})

pw.addEventListener("keyup", function(e){
    if(e.key === "Enter"){
        document.getElementById("loginbtn").click();
    }
})


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

// 쿠키 저장함수 | 쿠키이름=쿠키값; Domain=도메인값; Path=경로값; Expires=GMT형식의만료일시
function setCookie(name, value, expiredays){
    let todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + expiredays);
    document.cookie = name + "=" + encodeURIComponent(value) + "; path=/ ; expires=" + todayDate.toTimeString() +";"
}

// 쿠키 불러오는 함수
function getCookie(Name){
    let search = Name + "=";
    if(document.cookie.length >0){
        offset = document.cookie.indexOf(search);

        // if cookie exists
        if(offset != -1){
            offset += search.length;
            end = document.cookie.indexOf(";", offset);
            if(end == -1){
                end = document.cookie.length;
                return decodeURIComponent(document.cookie.substring(offset, end));
            }

        }
    }
}

// 로그인 폼 전송 이벤트 등록
$("#loginfrm").submit(function(e){
    e.preventDefault();
    
    // ID 저장 체크 시 쿠키에 값 저장
    if($("#idSave").is(":checked") == true){

        //쿠키이름을 id로 아이디입력필드값을 7일동안 저장
        setCookie("userId", $("#userId").val(), 7);
    }
    else{
        // 아이디 저장을 체크 하지 않았을때, 날짜를 0으로 저장하여 쿠키삭제
        setCookie("userId", $("#userId").val(), 0);
    }

    // 로그인 상태 유지
    if($("#idStateful").is(":checked") == true){
        $("#userId").val("true");
    }
    else{
        $("#userId").val("");
    } 
})