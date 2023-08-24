const kind = document.getElementsByClassName("kind");
const ki = document.getElementById("k");
const move = document.getElementsByClassName("move");
const page = document.getElementById("page");
const frm = document.getElementById("frm");

// let data='';

// //1. 함수를 사용
// function setData(d){
//     data=d;
//     for(k of kind){

//         if(k.value==data){
//             console.log(k.value);
//             k.selected=true;
//             break;
//         }
//     }
// }

//2. Element에서 속성의 값으로 가져오기
let data=ki.getAttribute("data-kind")
    for(k of kind){
        if(k.value==data){
            k.selected=true;
            break;
        }
    }

    console.log(move)
for(m of move){
    m.addEventListener("click", function(){
        console.log(this);
        page.value = this.getAttribute("data-num")
        frm.submit();
    });
}