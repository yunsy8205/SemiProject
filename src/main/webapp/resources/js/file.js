let idx=0;

$("#fileAdd").click(function(){

    let r = '<div class="mb-3" id="file"'+idx+'>';

    r = r.concat('<label for="pic" class="form-label">파일첨부</label>');

    r = r.concat('<input type="file" class="form-control" id="pic" name="files1"');
   
    r = r.concat('</div>');

    r= r.concat('<span class="df" data-id="file" '+ idx +'>x</span>')

    $("#fileList").append(r);
    idx++;
})

$("#fileList").on("click",".df", function(){

    $(this).parent().remove();
    
})



$(".delets").each(function(i,e){

    let num = this.getAttribute("data-delete-num");

    $(e).click(function(){

        $.ajax({
            type:'GET',
            url: "./fileDelete",
            data:{
                fileNo:num
            },
            success:function(result){
                if(result.trim()=='1'){

                    $(this).parent().remove();
                }
            },
            error:function(){

            }
        })
    })
})

// for(del of delets){

//     del.addEventListener("click", function(){

//         let num = this.getAttribute("data-delete-num");
//         let check =confirm("삭제시 복구 불가");

//         if(check){

//             fetch("./fileDelete?fileNum="+num, {
//                 method:"get"
//             })
//             .then((result)=>{
//                 return result.text()    
//             })
//             .then((r)=>{
//                 if(r.trim()=='1'){

//                     this.previousSibling.previousSibling.remove();
//                     this.remove();
//                     count--;
                    
//                 }
//             })

//         }
//     })
// }