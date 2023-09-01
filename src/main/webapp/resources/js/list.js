const kind = document.getElementsByClassName("kind");
const ki = document.getElementById("k");
const move = document.getElementsByClassName("move");
const page = document.getElementById("page");
const frm = document.getElementById("frm");


let data=ki.getAttribute("data-kind")

    for(k of kind){
        if(k.value==data){
            k.selected=true;
            break;
        }
    }


for(m of move){
    m.addEventListener("click", function(){
        page.value = this.getAttribute("data-num")
        frm.submit();
    });
}

