document.addEventListener('DOMContentLoaded', function() {
        //js
    //팝업 열리기
        let contentdetail = document.getElementById("hj-content-detail");
        let pluscontainer = document.getElementById("hj-content-plus-container");
        let popupoverlay = document.getElementById("hj-overlay-popup");
                function popup(){
                    // alert(11);
                    pluscontainer.classList.add('show');
                    popupoverlay.classList.add('active');
                }
    contentdetail.addEventListener('click', popup);
                //닫는 js
                function closepopup(){
                    pluscontainer.classList.remove('show');
                    popupoverlay.classList.remove('active');
                }
                pluscontainer.addEventListener('click',closepopup);
                //제이쿼리
        // $("#hj-content-detail").on("click", function () {
        //     // alert(11);
        //
        //     $("#hj-content-plus-container").addClass("show");
        //     $("#hj-overlay-popup").addClass("active");
        //
        // });
//제이쿼리
    //     $("#hj-content-plus-container").on("click", function () {
    //         // alert(22);
    //         $("#hj-content-plus-container").removeClass("show");
    //         $("#hj-overlay-popup").removeClass("active");
    //     });
    // });
//jquery
//     $("#hj-edit-box").click(function () {
//         // 현재 .hj-edit-drop의 display 상태를 가져옵니다.
//         let currentDisplay = $("#hj-edit-drop").css("display");
//
//         // 현재 display 상태가 "none"이면 "block"으로, "block"이면 "none"으로 토글합니다.
//         $("#hj-edit-drop").css("display", currentDisplay === "none" ? "block" : "none");
//
//
//     })
    //js
    let editbox = document.getElementById('hj-edit-box');
    let editdrop = document.getElementById('hj-edit-drop');
    let editDisplay = editdrop.style.display;
    let currentDisplay = window.getComputedStyle(editdrop).getPropertyValue('display');
    function dropeditbox(){
        if (currentDisplay=='none'){
            // alert(11);
            editDisplay="block";
        }else {
            // alert(22);
            editDisplay="none"

        }
        // editdrop.style.display = (currentDisplay === 'none') ? 'block' : 'none';
    }
    editbox.addEventListener("click", dropeditbox);


});