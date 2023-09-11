const id = document.getElementById("id");  // 아이디
const sameId = document.getElementById("sameId");  // 아이디 중복버튼
const pw = document.getElementById("pw");  // 비밀번호1
const pw2 = document.getElementById("pw2"); // 비밀번호2
const pwResult = document.getElementById("pwResult"); // 비밀번호확인1
const pw2Result = document.getElementById("pw2Result"); // 비밀번호확인2
const name1 = document.getElementById("name"); // 이름
const email = document.getElementById("email");  // 이메일
const phone = document.getElementById("phone");  // 전화번호
const postcodebtn = document.getElementById("postcodebtn"); // 우편번호 전송버튼
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
let phoneCheckResult=false;
let postcodeCheckResult=false;
let birthCheckResult=false;

let checkResults=[false,false,false,false,false,false,false,false,false];


id.addEventListener("keyup", function(e){

    if (e.key === "Enter"){
        document.getElementById("sameId").click();
    }
})

pw.addEventListener("keyup", function(e){

    if (e.key === "Enter"){
        document.getElementById("pw2").focus();
    }
})

pw2.addEventListener("keyup", function(e){

    if (e.key === "Enter"){
        document.getElementById("name").focus();
    }
})

name1.addEventListener("keyup", function(e){
    let check = emptyCheck(name1);
    if (e.key === "Enter"){
        if(!check){
            document.getElementById("email").focus();
        }
        else{
            name1.focus();
        }
    }
})

email.addEventListener("keyup", function(e){
    let check = emptyCheck(email);
    if (e.key === "Enter"){
        if(!check){
            document.getElementById("phone").focus();
        }
        else{
            email.focus();
        }
    }
})

phone.addEventListener("keyup", function(e){
    let check = emptyCheck(phone);
    if (e.key === "Enter"){
        if(!check){
        document.getElementById("postcodebtn").focus();
        }
        else{
            phone.focus();
        }
    }
})

detailAddress.addEventListener("keyup", function(e){

    if (e.key === "Enter"){
        document.getElementById("birth").focus();
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

   fetch("idCheck?userId="+id.value, {method:"get"})
    .then((res)=>{
        // console.log("res1: "+res); // [Object response]
        // object.text() 검색
        return res.text();
    })
    .then((res)=>{
        // console.log("res2: "+res); // 1 or 0 
        res=res.trim();
        if(res=='1'){
            if(id.value == "" || id.value.length>10 || !idRegExp.test(id.value)){
                console.log("입력불가");
                idResult.innerHTML="ID가 비어있거나 글자 수 초과하였습니다. 영문 대소문자와 숫자 4~9자리로 다시 입력해주세요"
                alert("ID가 비어있거나 글자 수 초과하였습니다. 영문 대소문자와 숫자 4~9자리로 다시 입력해주세요")
                idResult.className="f";
                checkResults[0]=false;
                checkResults[8]=false;
            }
            else{
                console.log("입력가능");
                idResult.innerHTML="사용가능한 ID입니다."
                alert("사용가능한 ID입니다.");
                document.getElementById("pw").focus();
                idResult.className="s";
                checkResults[0]=true;
                checkResults[8]=true;
            }
        }
        else{
            idResult.innerHTML="이미 사용중인 ID 입니다";
            alert("이미 사용중인 ID 입니다");
            idResult.className="f";
            checkResults[0]=false;
            checkResults[8]=false;
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

    const pwRegExp = /^[a-zA-Z0-9]{4,12}$/;

    if(!pwRegExp.test(pw.value)){
        pwResult.innerHTML="영문,숫자로 4글자 이상 12글자 미만 입력해주세요";
        console.log("패스워드 다시 입력");
        //document.getElementById("pwCheck").innerHTML = "";
        pwResult.className="f";
        checkResults[1]=false;
        checkResults[8]=false;
    } 
    else if(pwRegExp.test(pw.value)){
        pwResult.innerHTML="올바른 패스워드입니다."
        console.log("올바른 패스워드");
        //document.getElementById("pwCheck").innerHTML = "4글자 이상";
        document.getElementById("pw2").focus();
        pwResult.className="s";
        checkResults[1]=true;
        checkResults[8]=true;
    }
    else{
        pwResult.innerHTML="패스워드는 4글자 이상 12글자 미만이어야 합니다.";
        console.log("패스워드 다시 입력");
        //document.getElementById("pwCheck").innerHTML = "";
        pwResult.className="f";
        checkResults[1]=false;
        checkResults[8]=false;
    }
})

pw.addEventListener("change", function(){
    pw2.value="";
    checkResults[2]=false;
    pw2Result.innerHTML="";
})

pw2.addEventListener("keyup", function(){
    const pw2Result = document.getElementById(pw2.id+"Result");
    let check = emptyCheck(pw2);
    if(pw.value!=pw2.value){
        pw2Result.innerHTML = "비밀번호가 일치하지 않습니다.";
        checkResults[2]=false;
        checkResults[8]=false;
    } 
    else if(check){
        pw2Result.innerHTML = "비밀번호를 입력해주세요";
        checkResults[2]=false;
        checkResults[8]=false;
    } 
    else{
        pw2Result.innerHTML = "비밀번호는 일치합니다";
        document.getElementById("name").focus();
        checkResults[2]=true;
        checkResults[8]=true;
    }
})


// 비어있는 지 여부를 체크하는 함수 생성
function emptyCheck(element){

    if(element.value==null || element.value.length==0){
       
        return true;   // true이면 비어있다는 의미이다.
    }
    else{
        return false;
    }
}

// name 검사
name1.addEventListener("focusout", function(){
    let check = emptyCheck(name1);
    let nameExpReg = /^[가-힣a-zA-Z]{2,8}$/;
    const nameResult = document.getElementById("nameResult");
    if(!check && nameExpReg.test(name1.value)){
        console.log(nameExpReg.test(name1.value));
        nameResult.innerHTML="";
        document.getElementById("email").focus();
        nameResult.className='s';
        checkResults[3]=true;
        checkResults[8]=true;
    }
    else if(check || !nameExpReg.test(name1.value)){
        nameResult.innerHTML="이름을 올바르게 입력하지 않았거나 비어있습니다.";
        nameResult.className='f';
        checkResults[3]=false;
        checkResults[8]=false;
    }
    else{
        nameResult.innerHTML="이름을 입력해주세요.";
        nameResult.className='f';
        checkResults[3]=false;
        checkResults[8]=false;
    }
})


// email 유효성 검사 및 API 연동 이메일 중복 체크
email.addEventListener("blur", function(){
    
    const emailResult = document.getElementById(email.id+"Result");
    const mailRegExp=  /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    // var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    const obj = {email : email.value}

    fetch("mailCheck?email="+email.value,  {
        method:"POST",
        headers: {
            "Content-Type": "application/json",
        },
        async:false,
        body: JSON.stringify(obj)
        })
        .then((res)=>{
            console.log("res: "+res);
            return res.json();
        })
        .then((res)=>{
            let check = emptyCheck(email);
            console.log("res: "+res);  // DB에서 조회한 결과값
            if(res===1){
                console.log('1입니다');
                if(check || !mailRegExp.test(email.value) ){
                    emailResult.innerHTML="이메일 형식이 올바르지 않거나 비어있습니다.";
                   // alert("이메일 형식이 올바르지 않거나 비어있습니다.")
                    emailResult.className='f';
                    checkResults[4]=false;
                    checkResults[8]=false;
                }
                else if(!check && mailRegExp.test(email.value)){
                    emailResult.innerHTML="사용가능한 이메일입니다.";
                   // alert("사용가능한 이메일입니다.")
                    //document.getElementById("phone").focus();
                    emailResult.className='s';
                    checkResults[4]=true;
                    checkResults[8]=true;
                }
                else{
                    emailResult.innerHTML="이메일 형식이 올바르지 않거나 비어있습니다.";
                   // alert("이메일 형식이 올바르지 않거나 비어있습니다.")
                    emailResult.className='f';
                    checkResults[4]=false;
                    checkResults[8]=false;
                }
            }
            else{
                console.log('0입니다');
                emailResult.innerHTML="해당 이메일이 이미 존재합니다.";
              //  alert("해당 이메일이 이미 존재합니다.")
                emailResult.className='f';
                checkResults[4]=false;
                checkResults[8]=false;
            }
        })
        .catch(()=>{
            console.log('에러발생3');
        })
})


// phone 검사
phone.addEventListener("blur", function(){
    let check = emptyCheck(phone);
    const PhoneRegExp = /^\d[0-9]{2,3}-\d[0-9]{3,4}-\d[0-9]{4}$/g;
    // var PhoneRegExp = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
    const phoneResult = document.getElementById("phoneResult");
    
    console.log(phone.value.length);  // 13 (하이폰 포함)

    if(!check && PhoneRegExp.test(phone.value)){
        phoneResult.innerHTML="";
        document.getElementById("postcodebtn").focus();
        phoneResult.className='s';
        checkResults[5]=true;
        checkResults[8]=true;
    }
    else if(phone.value.length ===13){
        phoneResult.innerHTML="";
        document.getElementById("postcodebtn").focus();
        phoneResult.className='s';
        checkResults[5]=true;
        checkResults[8]=true;
    }
    else if(phone.value.length !==13){
        phoneResult.innerHTML="핸드폰번호 형식이 올바르지 않습니다. 다시 입력해주세요.";
        phoneResult.className='f';
        checkResults[5]=false;
        checkResults[8]=false;
    }
    else{
        phoneResult.innerHTML="핸드폰번호를 입력해주세요";
        phoneResult.className='f';
        checkResults[5]=false;
        checkResults[8]=false;
    }
})

const autoHyphen2 = (target) => {
    target.value = target.value
     .replace(/[^0-9]/g, '')
     .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}


// postcode 검사
detailAddress.addEventListener("blur", function(){

    let check1 = emptyCheck(address);
    let check2 = emptyCheck(postcode);
    let check3 = emptyCheck(extraAddress);
    let check4 = emptyCheck(detailAddress);
    const addr3Check = document.getElementById("addr3Check");

    if(!check1 && !check2 && !check3 && !check4){
        console.log("check1: "+check1);
        console.log("check2: "+check2);
        console.log("check3: "+check3);
        console.log("check4: "+check4);

        console.log("ok");
        addr3Check.innerHTML="입력ok";
        document.getElementById("birth").focus();
        addr3Check.className='s';
        checkResults[6]=true;
        checkResults[8]=true;
    }
    else{
        console.log("check1: "+check1);
        console.log("check2: "+check2);
        console.log("check3: "+check3);
        console.log("check4: "+check4);
        console.log("주소입력필요");
        addr3Check.innerHTML="주소를 입력해주세요";
        addr3Check.className='f';
        checkResults[6]=false;
        checkResults[8]=false;
    }

})


// birth 검사
birth.addEventListener("change", function(){
    let check = emptyCheck(birth);
    const birthCheck = document.getElementById("birthCheck");

    birthCheck.innerHTML="생년월일을 선택하세요";
    birthCheck.className='f';
    checkResults[7]=false;
    checkResults[8]=false;

    if(!check){
        birthCheck.innerHTML="";
        document.getElementById("intro").focus();
        birthCheck.className='s';
        checkResults[7]=true;
        checkResults[8]=true;
    }   
})


signUp.addEventListener('click', function(){
    let c = checkResults.includes(false);
    console.log(checkResults);
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
    if(!c){
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
            console.log(res.body);
            return res.json();
        })
        .then((data)=>{
            console.log(data);
            if(data){
                alert("회원가입에 성공했습니다.")
                window.location.href="/";
            }
        })
        .catch(()=>{
            console.log('에러발생2');
        })
    }
    else{
        alert("필수 항목을 입력해주세요")
        
    }
})