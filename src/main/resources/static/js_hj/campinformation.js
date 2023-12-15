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

    let currentDisplay = window.getComputedStyle(editdrop).getPropertyValue('display');
    function dropeditbox(){
        if (currentDisplay=='none'){

            // alert(11);
            editdrop.style.display ='block';
            // editDisplay="block";
        }else {
            // alert(22);
            editdrop.style.display ='none'
            // editDisplay="none"

        }
        // editdrop.style.display = (currentDisplay === 'none') ? 'block' : 'none';
    }
    editbox.addEventListener("click", dropeditbox);

//     별점 채우기 값 보내기
    let stars = document.querySelectorAll('.hj-star');

    stars.forEach(function(star) {
        star.addEventListener('click', function() {
            //data-rating에 있는 값을 가져와서 rating 에 넣음
            let rating = parseInt(this.getAttribute('data-rating'));
            //함수(rating)을 넣음
            handleStarClick(rating);
        });
    });

    function handleStarClick(rating) {
        // 클릭한 별의 데이터 값을 확인
        console.log(rating);

        // 선택한 별을 강조 표시하거나 다른 동작을 수행할 수 있습니다.
        stars.forEach(function(star) {
            let starRating = parseInt(star.getAttribute('data-rating'));
            if (starRating <= rating) {
                star.classList.add('checked');
            } else {
                star.classList.remove('checked');
            }
        });
    }


});