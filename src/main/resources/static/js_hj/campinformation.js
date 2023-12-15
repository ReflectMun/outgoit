document.addEventListener('DOMContentLoaded', function() {
    $(document).ready(function () {
        // $(".hj-content-plus-container").css("display", "none");
        $("#hj-content-detail").on("click", function () {
            // alert(11);

            $("#hj-content-plus-container").addClass("show");
            $("#hj-overlay-popup").addClass("active");

        });

        $("#hj-content-plus-container").on("click", function () {
            // alert(22);
            $("#hj-content-plus-container").removeClass("show");
            $("#hj-overlay-popup").removeClass("active");
        });
    });

    $("#hj-edit-box").click(function () {
        // 현재 .hj-edit-drop의 display 상태를 가져옵니다.
        let currentDisplay = $("#hj-edit-drop").css("display");
        // 현재 display 상태가 "none"이면 "block"으로, "block"이면 "none"으로 토글합니다.
        $("#hj-edit-drop").css("display", currentDisplay === "none" ? "block" : "none");
    });
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
            return
        }

        console.log(resData)
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