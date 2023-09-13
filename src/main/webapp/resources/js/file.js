//<div class="input-group mb-3">
//<input type="file" class="form-control" id="photos" name="photos">
//</div> 

const add = document.getElementById("add");
const fileList = document.getElementById("fileList");
const delets = document.getElementsByClassName("delets");

// 이벤트 핸들러를 함수로 만들어 재사용 가능하게 만듭니다.
function addDeleteEventListener(deleteElement) {
    deleteElement.addEventListener("click", function () {
        let fileNo = this.getAttribute("data-delete-num");
        let originalName = this.getAttribute("data-original-name"); // 파일 이름 가져오기
        let check = confirm("삭제시 복구 불가");

        if (check) {
            // GET 방식으로 파일 삭제 요청을 보냄
            fetch(`./fileDelete?fileNo=${fileNo}&originalName=${originalName}`, { // 파일 번호와 파일 이름 모두 전달
                method: "GET"
            })
                .then((result) => {
                    return result.text();
                })
                .then((r) => {
                    if (r.trim() == '1') {
                        // 파일 삭제 성공 시 해당 요소를 삭제합니다.
                        this.parentElement.remove();
                        location.reload();
                    } else {
                        // 파일 삭제 실패 시 오류 처리
                        alert("파일 삭제 실패");
                    }
                })
                .catch((error) => {
                    console.error("파일 삭제 오류:", error);
                });
        }
    });
}

// 모든 'delets' 클래스를 가진 요소에 대한 이벤트 핸들러를 추가합니다.
for (let i = 0; i < delets.length; i++) {
    let deleteElement = delets[i];
    let fileNo = deleteElement.getAttribute("data-delete-num");
    let fileName = deleteElement.getAttribute("data-file-name"); // 파일 이름 가져오기
    deleteElement.setAttribute("data-file-name", fileName); // 데이터 속성으로 파일 이름 추가
    addDeleteEventListener(deleteElement);
}

// 나머지 코드는 그대로 유지됩니다.


let max = 5;
let count = 0;

if (delets != null) {
    count = delets.length;
}

let idx = 0;

$("#fileList").on("click", ".df", function () {
    $(this).parent().remove();
    count--;
});

$("#add").click(function () {
    if (count >= max) {
        alert("최대 5개만 가능");
        return;
    }
    count++;

    let r = '<div class="input-group mb-3" id="file' + idx + '">'
    r = r + '<input type="file" class="form-control" id="photos" name="photos">'
    r = r + '<span class="df" data-id="file' + idx + '">X</span>'
    r = r + "</div>";
    idx++;

    $("#fileList").append(r);
});



// let idx = 0;

//         // 버튼 클릭 시 새 파일 입력란 추가
//         $("#fileAdd").click(function () {
//             let r = '<div class="mb-3" id="file' + idx + '">';
//             r += '<label for="pic" class="form-label">파일첨부</label>';
//             r += '<input type="file" class="form-control" id="pic" name="files' + idx + '">';
//             r += '<span class="df" data-id="file' + idx + '">x</span>';
//             r += '</div>';
//             $("#fileList").append(r);
//             idx++;
//         });

//         // X를 클릭할 때 파일 입력란 삭제
//         $("#fileList").on("click", ".df", function () {
//             $(this).parent().remove();
//         });

//         // 기존 파일 삭제 처리
//         $(".delets").each(function (i, e) {
//             $(e).click(function () {
//                 let fileNo = $(e).attr("data-delete-num");
//                 let check = confirm("삭제시 복구 불가");
//                 if (check) {
//                     fetch("./fileDelete?fileNo=" + fileNo, { method: "get" })
//                         .then((result) => { return result.text() })
//                         .then((r) => {
//                             if (r.trim() == '1') {
//                                 $("#" + fileNo).remove();
//                                 $(e).remove();
//                             }
//                         })
//                 }
//             });
//         });


