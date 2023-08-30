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
        console.log(e);
        console.log(num);

        $.ajax({
            type:'GET',
            url: "./fileDelete",
            data:{
                fileNo:num
            },
            success:function(result){
                if(result.trim()=='1'){

                    $("#"+num).remove();
                    $(e).remove();
                    
                }
            },
            error:function(){
                console.log("error");
            }
        })
    })
})

