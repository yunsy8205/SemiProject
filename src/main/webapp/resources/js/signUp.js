const id = document.getElementById("id");  // 아이디
const sameId = document.getElementById("sameId");  // 아이디 중복버튼
const pw = document.getElementById("pw");  // 비밀번호1
const pw2 = document.getElementById("pw2"); // 비밀번호2
const pwCheck = document.getElementById("pwResult"); // 비밀번호확인1
const pwCheck2 = document.getElementById("pw2Result"); // 비밀번호확인2
const name1 = document.getElementById("name"); // 이름
const phone = document.getElementById("phone");  // 전화번호
const email = document.getElementById("email");  // 이메일
const address = document.getElementById("address");  //주소
const postcode = document.getElementById("postcode");  //우편번호
const extraAddress = document.getElementById("extraAddress");  //참조주소
const detailAddress = document.getElementById("detailAddress");  //상세주소
const birth = document.getElementById("birth");  //생년월일
const frm = document.getElementById("frm");  // 폼
const signUp = document.getElementById("signUp");    // 회원가입전송버튼


//회원check결과 
let idCheckResult=false;
let pwCheckResult=false;
let pw2CheckResult=false;
let nameCheckResult=false;
let emailCheckResult=false;
let phoneCheckRewult=false;

let checkResults=[false,false,false,false,false,false,false];


id.addEventListener("keyup", function(e){

    if (e.key === "Enter"){
        document.getElementById("sameId").click();
    }

})

// id 중복체크 및 유효성검사
sameId.addEventListener("click", function(){

    console.log("id속성: "+ id.id);  // id
    
    const idResult = document.getElementById(id.id+"Result");
    //(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])
    const idRegExp = /^[a-zA-Z0-9]{4,9}$/;

    console.log("idResult: "+ idResult);  
    console.log("id.value: "+ id.value);  // 아이디 입력값

    // getIdCheck 메서드 실행
    // url?파라미터(key=value)
    // 파라미터로 보내면 컨트롤러 메서드에서 매개변수로 받아 매개변수의 setter명과 동일한 애를 찾음.
   fetch("idCheck?userId="+id.value, {method:"get"})
    .then((res)=>{
        console.log(res); // 1 or 0 
        return res.text();
    })
    .then((res)=>{
        res=res.trim();
        if(res=='1'){
            if(id.value == "" || id.value.length>10 || !idRegExp.test(id.value)){
                console.log("입력불가");
                idResult.innerHTML="ID가 비어있거나 글자 수 초과하였습니다. 영문 대소문자와 숫자 4~9자리로 다시 입력해주세요"
                alert("ID가 비어있거나 글자 수 초과하였습니다. 영문 대소문자와 숫자 4~9자리로 다시 입력해주세요")
                idResult.className="f";
                checkResults[0]=false;
                checkResults[7]=false;
            }
            else{
                console.log("입력가능");
                idResult.innerHTML="사용가능한 ID입니다."
                alert("사용가능한 ID입니다.");
                document.getElementById("pw").focus();
                idResult.className="s";
                checkResults[0]=true;
                checkResults[7]=true;
            }
        }
        else{
            idResult.innerHTML="이미 사용중인 ID 입니다";
            alert("이미 사용중인 ID 입니다");
            idResult.className="f";
            checkResults[0]=false;
            checkResults[7]=false;
        }
    })
    .catch(()=>{
        console.log('에러발생1');
        console.log('에러발생 왜??');
    })

});

// ================== 체크 ========================== //

// PW 유효성검사
pw.addEventListener("blur", function(){
    
    console.log("pw속성: "+ pw.id);
    console.log("pw속성: "+ pw.value);

    const pwResult = document.getElementById(pw.id+"Result");

    const pwRegExp = /^[a-zA-Z0-9]{4,9}$/;

    if(pw.value.length > 4 && pw.value.length <12){

        pwResult.innerHTML="올바른 패스워드입니다."
        console.log("올바른 패스워드");
        //document.getElementById("pwCheck").innerHTML = "4글자 이상";
        document.getElementById("pw2").focus();
        pwResult.className="s";
        checkResults[1]=true;
    } 
    else if(!pwRegExp.test(pw.value)){
        pwResult.innerHTML="패스워드는 4글자 이상 12글자 미만이어야 합니다.";
        console.log("패스워드 다시 입력");
        //document.getElementById("pwCheck").innerHTML = "";
        pwResult.className="f";
        checkResults[1]=false;
    }
    else{
        pwResult.innerHTML="패스워드는 4글자 이상 12글자 미만이어야 합니다.";
        console.log("패스워드 다시 입력");
        //document.getElementById("pwCheck").innerHTML = "";
        pwResult.className="f";
        checkResults[1]=false;
    }
})

pw.addEventListener("change", function(){
    pw2.value="";
    checkResults[2]=false;
    pwCheck2.innerHTML="";
})

pw2.addEventListener("keyup", function(){
    if(pw.value!=pw2.value){
        // innerHTML : div (열고 닫아주는 태그이다)
        document.getElementById("pw2").innerHTML = "비밀번호가 동일해야 합니다";
        checkResults[2]=false;
    } else{
        document.getElementById("pw2").innerHTML = "비밀번호는 일치합니다";
        checkResults[2]=true;
    }
})


// 비어있는 지 여부를 체크하는 함수 생성
function emptyCheck(element){

    if(element.value==null || element.value.length==""){
       
        return true;   // true이면 비어있다는 의미이다.
    }
    else{
        return false;
    }
}


// name 검사
name1.addEventListener("focusout", function(){
    if(name1.value.length<1){
        document.getElementById("namex").innerHTML = "이름을 입력해주세요";
        checkResults[0]=false;    
    } else{
        document.getElementById("namex").innerHTML = "";
        checkResults[0]=true;
    }
})






signUp.addEventListener('click', function(){

    console.log({userId: id.value});  // ID 입력값이 들어왔는데 왜 컨트롤러에서는 null이지?
    const obj = {userId: id.value, 
                 userPw : pw.value,
                 name : name1.value,
                 email : email.value,
                 birth : birth.value,
                 address : address.value,
                 phone : phone.value,
                 intro : '',
                 zipCode : postcode.value,
                 refAddress : extraAddress.value,
                 detailAddress : detailAddress.value
    };
    fetch("signUp", {
        method:"POST",
        headers: {
            "Content-Type": "application/json",
        },
        async:false,
        body: JSON.stringify(obj)
    })
    .then((res)=>{
        console.log(res);
        window.location.href="/";
        console.log(res.body);
        return res.json();
    })
    .then((data)=>{
        console.log(data);
        // window.location.href="/";
    })
    .catch(()=>{
        console.log('에러발생2');
    })

})