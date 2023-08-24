let idx=0;

$("#fileAdd").click(function(){

    let r = '<div class="mb-3" id="file"'+idx+'>';

    r = r.concat('<label for="pic" class="form-label">파일첨부</label>');

    r = r.concat('<input type="file" class="form-control" id="pic" name="files"');
   
    r = r.concat('</div>');

    r= r.concat('<span class="df" data-id="file" '+ idx +'>x</span>')

    $("#fileList").append(r);
    idx++;
})

$("#fileList").on("click",".df", function(){

    $(this).parent().remove();
    
})