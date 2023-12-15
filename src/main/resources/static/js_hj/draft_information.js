// document.addEventListener('DOMContentLoaded', function() {
//     $(document).ready(function () {
//         // $(".hj-content-plus-container").css("display", "none");
//         $("#hj-content-detail").on("click", function () {
//             // alert(11);
//
//             $("#hj-content-plus-container").addClass("show");
//             $("#hj-overlay-popup").addClass("active");
//
//         });
//
//         $("#hj-content-plus-container").on("click", function () {
//             // alert(22);
//             $("#hj-content-plus-container").removeClass("show");
//             $("#hj-overlay-popup").removeClass("active");
//         });
//     });
//
//     $("#hj-edit-box").click(function () {
//         // 현재 .hj-edit-drop의 display 상태를 가져옵니다.
//         let currentDisplay = $("#hj-edit-drop").css("display");
//         // 현재 display 상태가 "none"이면 "block"으로, "block"이면 "none"으로 토글합니다.
//         $("#hj-edit-drop").css("display", currentDisplay === "none" ? "block" : "none");
//     });
// });

document.addEventListener('DOMContentLoaded', function () {
    //검색 클릭시 campinformation 뜨게
    let serch = document.getElementById('submit-search');
    let detailpopup = document.getElementById('hj-container2');
    let closedetailpopup = document.getElementById('hj-close-btn');

    function campinfoup() {
        // alert(11)
        detailpopup.style.display = 'block';
    }

    function campinfodown() {
        // alert(22)
        detailpopup.style.display = 'none';
    }

    serch.addEventListener('click', campinfoup);
    closedetailpopup.addEventListener('click', campinfodown);

    //js
    //팝업 열리기
    let contentdetail = document.getElementById("hj-content-detail");
    let pluscontainer = document.getElementById("hj-content-plus-container");
    let popupoverlay = document.getElementById("hj-overlay-popup");

    function popup() {
        // alert(11);
        pluscontainer.classList.add('show');
        popupoverlay.classList.add('active');
    }

    contentdetail.addEventListener('click', popup);

    //닫는 js
    function closepopup() {
        pluscontainer.classList.remove('show');
        popupoverlay.classList.remove('active');
    }

    pluscontainer.addEventListener('click', closepopup);

    //js
    let editbox = document.getElementById('hj-edit-box');
    let editdrop = document.getElementById('hj-edit-drop');

// 요소가 존재하는 경우에만 이벤트 리스너 등록
    if (editbox && editdrop) {
        editbox.addEventListener("click", dropeditbox);
    }
    function dropeditbox() {
        // 클릭할 때마다 현재 display 상태를 다시 가져옴
        let currentDisplay = window.getComputedStyle(editdrop).getPropertyValue('display');

        if (currentDisplay === 'none') {
            editdrop.style.display = 'block';
        } else {
            editdrop.style.display = 'none';
        }
    }
//     별점 채우기 값 보내기
    let stars = document.querySelectorAll('.hj-star');

    // 각 별에 이벤트 리스너를 등록합니다.
    stars.forEach(function (star) {
        star.addEventListener('click', function () {
            handleStarClick(this);
        });
    });

    function handleStarClick(clickedStar) {
        // 클릭된 별의 data-value 속성 값을 가져옵니다.
        let clickedValue = clickedStar.getAttribute('data-value');
        console.log(clickedValue);
        // 클릭된 별까지 노란색으로 채우기
        stars.forEach(function (star) {
            let starValue = star.getAttribute('data-value');

            if (starValue <= clickedValue) {
                star.classList.add('checked');
            } else {
                star.classList.remove('checked');
            }
        });
    }
});

let pageNum = 1

async function getPrevCommentPage(){
    const campingAreaId = document.getElementById("camping-area-id").value
    const reqUrl = "/api/review/camping/list?" + `campingAreaId=${campingAreaId}&pageNumber=${pageNum - 1}`
    try{
        const { data: resData } = await axios.get(reqUrl)

        console.log(resData)

        if(resData.length === 0){
            alert("첫번째 페이지 입니다!")
        }
    }
    catch (e){
        console.log(e)
        alert("원인을 알 수 없는 오류가 발생했습니다")
    }
}

function getNextCommentPage(){

}

function deleteComment(commentNumber){
}

function modifyComment(commentNumber){
}

/**
 * <div id="hj-review-content-box">
 *   <div id="hj-review-stars">
 *     <div class="hj-review-star">★</div>
 *     <div class="hj-review-star">★</div>
 *     <div class="hj-review-star">★</div>
 *     <div class="hj-review-star">★</div>
 *     <div class="hj-review-star">☆</div>
 *   </div>
 *   <br>
 *   <div id="hj-review-nickname">닉네임: ${review.author}</div>
 *   <div id="hj-review-comment">한줄평: ${review.content}</div>
 *   <div id="hj-edit-box">
 *     <div id="hj-edit-icon">...</div>
 *   </div>
 *   <div id="hj-edit-drop">
 *     <div><input type="text" placeholder="비밀번호"> </div>
 *     <div class="hj-edit-part" onclick="modifyComment(${review.commentNumber})">수정</div>
 *     <div class="hj-edit-part" onclick="deleteComment(${review.commentNumber})">삭제</div>
 *   </div>
 * </div>
 * */
function makeReviewBox(reviewData){
    const reviewComment = document.createElement("div")

    const reviewStars = document.createElement("div")
    for(let i = 1; i <= 5; i++){
        const ratingStar = document.createElement("div")
        ratingStar.classList.add("hj-review-star")
    }
}