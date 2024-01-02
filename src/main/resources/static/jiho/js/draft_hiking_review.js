/**
 * 현재 별점
 * */
let clickedValue = null
/**
 * 리뷰 란의 현재 페이지 번호
 * */
let pageNum = 1

/**
 * 페이지 로딩시 각종 이벤트 리스너들이 등록되도록 해놨음
 * */
document.addEventListener('DOMContentLoaded', async function () {
    /**
     * 간략한 정보창 클릭시 상세한 정보창 열리도록 하는 이벤트 리스너 등록
     * */
    document.querySelector("#hj-content-detail").addEventListener("click", (e) => {
        document.getElementById("hj-content-plus-container").classList.add("show")
        document.getElementById("hj-overlay-popup").classList.add("active")
    })

    /**
     * 상세한 정보창 클릭시 닫히도록 하는 이벤트 리스너 등록
     * */
    // document.querySelector("#hj-content-plus-container").addEventListener("click", (e) => {
    //     document.getElementById("hj-content-plus-container").classList.remove("show")
    //     document.getElementById("hj-overlay-popup").classList.remove("active")
    // })

    /**
     * 작성된 리뷰 목로글 불러와서 화면에 렌더링하도록 하는 메서드
     * JSP 코드 상으로 리뷰 데이터가 하나도 없을 경우 reviewListContainer를 불러올 수 없기 때문에
     * 리뷰가 있을 때만 실행되도록 하는 구조임
     * */
    const reviewListContainer = document.getElementById("hj-review-list-container")
    if(reviewListContainer){
        const trailAreaId = document.getElementById("trail-area-id").value
        try {
            const resData = await getReviewList(trailAreaId, 1)

            if(resData === null)
                throw new Error("서버와의 통신 중 알 수 없는 오류가 발생")

            for(const review of resData){

                const madeReviewBox = makeReviewBox(review)
                reviewListContainer.appendChild(madeReviewBox)
            }
        } catch (e) {
            console.log(e)
            alert("원인을 알 수 없는 오류가 발생했습니다")
        }
    }

    let stars = document.querySelectorAll('.hj-star');

    // 각 별에 이벤트 리스너를 등록합니다.
    stars.forEach(function (star) {
        star.addEventListener('click', function () {
            handleStarClick(star);
        });
    });

    function handleStarClick(clickedStar) {
        // 클릭된 별의 data-value 속성 값을 가져옵니다.
        clickedValue = clickedStar.getAttribute('data-value');
        // 클릭된 별까지 노란색으로 채우기
        stars.forEach(function (star) {
            const starValue = star.getAttribute('data-value');

            if (starValue <= clickedValue) {
                star.classList.add('checked');
            } else {
                star.classList.remove('checked');
            }
        });
    }
});

/**
 * 한페이지 이전의 리뷰 목록을 불러오도록 하는 함수
 * */
async function getPrevCommentPage() {
    const trailAreaId = document.getElementById("trail-area-id").value
    try {
        const resData = await getReviewList(trailAreaId, pageNum - 1)


        if (resData === null)
            throw new Error("서버와 통신 중 원인을 알 수 없는 오류 발생")

        if (resData.length === 0) {
            alert("첫번째 페이지 입니다!")
            return
        }

        const reviewListContainer = document.getElementById("hj-review-list-container")
        reviewListContainer.innerHTML = ""
        for(const review of resData){
            const madeReviewBox = makeReviewBox(review)
            reviewListContainer.appendChild(madeReviewBox)
        }

        pageNum -= 1

        document.getElementById("hj-pages").innerHTML = `<span>${pageNum}</span>`
    } catch (e) {
        console.log(e)
        alert("원인을 알 수 없는 오류가 발생했습니다")
    }
}

/**
 * 다음페이지의 리뷰 목록을 불러오도록 하는 함수
 * */
async function getNextCommentPage() {
    const trailAreaId = document.getElementById("trail-area-id").value
    try {
        const resData = await getReviewList(trailAreaId, pageNum + 1)

        if (resData === null)
            throw new Error("서버와 통신 중 원인을 알 수 없는 오류 발생")

        if (resData.length === 0) {
            alert("마지막 페이지 입니다!")
            return
        }

        const reviewListContainer = document.getElementById("hj-review-list-container")
        reviewListContainer.innerHTML = ""
        for(const review of resData){
            const madeReviewBox = makeReviewBox(review)
            reviewListContainer.appendChild(madeReviewBox)
        }

        pageNum += 1

        document.getElementById("hj-pages").innerHTML = `<span>${pageNum}</span>`
    } catch (e) {
        console.log(e)
        alert("원인을 알 수 없는 오류가 발생했습니다")
    }
}

/**
 * 리뷰를 삭제하는 함수
 * 추후 리뷰가 하나도 없을 경우 작성된 리뷰가 없다는 메시지가 리뷰란에 출력되도록 수정해야함
 * */
async function deleteComment(commentNumber, element) {
    // alert(commentNumber)
    const passwordInput = element.parentNode.firstElementChild.firstElementChild
    if(!passwordInput.value){
        alert("댓글을 삭제하시려면 비밀번호를 입력해주세요!")
        return
    }

    try{
        const { data: resData } = await axios.post(
            '/api/review/trail/delete',
            {
                password: passwordInput.value,
                commentNumber: commentNumber
            }
        )

        if(resData== 1)
            alert("댓글 삭제 완료!")
        else {
            alert("삭제 실패")
            return
        }

        const trailAreaId = document.getElementById("trail-area-id").value
        const reviewDataList = await getReviewList(trailAreaId, pageNum)

        if (reviewDataList.length !== 0) { // 빈 데이터가 아닐 경우
            const reviewListContainer = document.getElementById("hj-review-list-container")
            reviewListContainer.innerHTML = ""
            for (const review of reviewDataList) {
                const madeReviewBox = makeReviewBox(review)
                reviewListContainer.appendChild(madeReviewBox)
            }
        } else {
            const zentai = document.getElementById("hj-review-zentai-box")
            zentai.innerHTML = "<h2 id=\"hj-no-review\">아직 작성된 리뷰가 없습니다</h2>"
        }
    }
    catch (e){
        console.log(e)
        alert("알 수 없는 오류가 발생했습니다")
    }
}

/**
 * 말 그대로 처음 수정하기 버튼 눌렀을 때 수정될 내용을 받는 등의 준비동작을 하도록 하는 함수임
 * */
async function commentModifyingReady(commentNumber, element) {
    const commentDiv =
        element.parentNode
            .parentElement
            .parentElement
            .getElementsByClassName("hj-review-comment")[0]
            .getElementsByClassName("hj-review-comment-content")[0]

    const reviewModifyingInput = document.createElement("textarea")

    reviewModifyingInput.classList.add("hj-comment-textarea")
    // reviewModifyingInput.type = "text"
    reviewModifyingInput.value = commentDiv.innerText
    commentDiv.innerText = ""

    commentDiv.appendChild(reviewModifyingInput)

    element.onclick = function (){
        updateComment(commentNumber, reviewModifyingInput, element)
    }
}

/**
 * 실제로 리뷰의 수정을 실행하는 함수
 * */
async function updateComment(commentNumber, reviewContentInput, modifyButtonElement){
    const passwordInput = modifyButtonElement.parentNode.firstElementChild.firstElementChild

    if(!passwordInput.value){
        alert("댓글을 수정하시려면 비밀번호를 입력해주세요!")
        return
    }

    if(!reviewContentInput.value){
        alert("댓글 내용이 비어있어요!")
        return
    }

    try{
        const { data: resData } = await axios.post(
            '/api/review/trail/update',
            {
                password: passwordInput.value,
                content: reviewContentInput.value,
                commentNumber: commentNumber
            }
        )

        if(resData === 1)
            alert("댓글 수정 완료!")
        else {
            alert("댓글 수정 실패")
            return
        }

        const trailAreaId = document.getElementById("trail-area-id").value

        const reviewDataList = await getReviewList(trailAreaId, pageNum)

        const reviewListContainer = document.getElementById("hj-review-list-container")
        reviewListContainer.innerHTML = ""
        for(const review of reviewDataList){
            const madeReviewBox = makeReviewBox(review)
            reviewListContainer.appendChild(madeReviewBox)
        }
    }
    catch (e){
        console.log(e)
        alert("알 수 없는 오류가 발생했습니다")
    }
}

/**
 * 개별 리뷰를 만들어서 리턴하는 함수
 * 아래와 같은 구조의 HTML을 생성해서 리턴함
 *
 * <div class="hj-review-content-box">
 *   <div class="hj-review-stars">
 *     <div class="hj-review-star">★</div>
 *     <div class="hj-review-star">★</div>
 *     <div class="hj-review-star">★</div>
 *     <div class="hj-review-star">★</div>
 *     <div class="hj-review-star">☆</div>
 *   </div>
 *   <br>
 *   <div class="hj-review-nickname">닉네임: ${review.author}</div>
 *   <div class="hj-review-comment">한줄평: ${review.content}</div>
 *   <div class="hj-edit-box">
 *     <div class="hj-edit-icon">...</div>
 *   </div>
 *   <div class="hj-edit-drop">
 *     <div><input type="text" placeholder="비밀번호"> </div>
 *     <div class="hj-edit-part" onclick="modifyComment(${review.commentNumber})">수정</div>
 *     <div class="hj-edit-part" onclick="deleteComment(${review.commentNumber})">삭제</div>
 *   </div>
 * </div>
 * */
function makeReviewBox(reviewData) {
    const reviewComment = document.createElement("div")

    /*
    * <div class="hj-review-stars">
    *   <div class="hj-review-star">★</div>
    *   <div class="hj-review-star">★</div>
    *   <div class="hj-review-star">★</div>
    *   <div class="hj-review-star">★</div>
    *   <div class="hj-review-star">☆</div>
    * </div>
    * */
    const reviewStars = document.createElement("div")
    for (let i = 1; i <= 5; i++) {
        const ratingStar = document.createElement("div")
        if (reviewData['rating'] >= i)
            ratingStar.innerText = "★"
        else
            ratingStar.innerText = "☆"
        ratingStar.classList.add("hj-review-star")
        reviewStars.appendChild(ratingStar)
    }
    reviewStars.classList.add("hj-review-stars")
    reviewComment.appendChild(reviewStars)

    const tape = document.createElement("div")
    tape.classList.add("hj-review-tape")
    reviewComment.appendChild(tape)
    // <br>
    // reviewComment.appendChild(document.createElement("br"))

    /*
     *   <div class="hj-review-nickname">닉네임: ${review.author}</div>
     * */
    const authorDiv = document.createElement("div")
    authorDiv.innerText = `${reviewData['author']}`
    authorDiv.classList.add("hj-review-nickname")
    reviewComment.appendChild(authorDiv)

    /*
     *   <div class="hj-review-comment">
     *      <div>한줄평</div>
     *      <div>${review.content}</div>
     *   </div>
     * */
    const comment = document.createElement("div")
    comment.innerHTML = `<div class="hj-review-comment-content">${reviewData['content']}</div>`
    comment.classList.add("hj-review-comment")
    reviewComment.appendChild(comment)

    /*
     *   <div class="hj-edit-box">
     *     <div class="hj-edit-icon">...</div>
     *   </div>
     * */
    const editBox = document.createElement("div")
    const editIcon = document.createElement("div")
    editIcon.innerText = "..."
    editIcon.classList.add("hj-edit-icon")
    editBox.appendChild(editIcon)
    editBox.addEventListener("click", (e) => {
        const siblingEditDropBox =  editBox.parentNode.lastElementChild
        const displayValue = siblingEditDropBox.style['display']
        siblingEditDropBox.style['display'] = displayValue === "none" ? "block" : "none"
    })
    editBox.classList.add("hj-edit-box")
    reviewComment.appendChild(editBox)

    /*
     *   <div class="hj-edit-drop">
     *     <div><input type="text" placeholder="비밀번호"> </div>
     *     <div class="hj-edit-part" onclick="modifyComment(${review.commentNumber})">수정</div>
     *     <div class="hj-edit-part" onclick="deleteComment(${review.commentNumber})">삭제</div>
     *   </div>
     * */
    const commentNum = reviewData['commentNumber']

    const editDrop = document.createElement("div")

    const editDropbox = document.createElement("div")
    editDrop.appendChild(editDropbox)

    const passwordInputDiv = document.createElement("div")
    const passwordInput = document.createElement("input")
    passwordInput.type = "text"
    passwordInput.placeholder = "비밀번호"
    passwordInput.onfocus=clearPlaceholder
    passwordInput.onblur=setPlaceholder
    function  clearPlaceholder(){
        passwordInput.placeholder='';
    }
    function setPlaceholder(){
        passwordInput.placeholder='비밀번호';
    }
    passwordInput.classList.add("hj-password-input")
    passwordInputDiv.appendChild(passwordInput)
    editDropbox.appendChild(passwordInputDiv)

    const editButtonDiv = document.createElement("div")
    editButtonDiv.innerText = "수정"
    editButtonDiv.onclick = function (){
        commentModifyingReady(commentNum, editButtonDiv)
    }
    editButtonDiv.classList.add("hj-edit-part")
    editDropbox.appendChild(editButtonDiv)

    const deleteButtonDiv = document.createElement("div")
    deleteButtonDiv.innerText = "삭제"
    deleteButtonDiv.onclick = function (){
        deleteComment(commentNum, deleteButtonDiv)
    }
    deleteButtonDiv.classList.add("hj-edit-part")
    editDropbox.appendChild(deleteButtonDiv)



    editDrop.classList.add("hj-edit-drop")
    editDropbox.classList.add("hj-edit-drop-box")
    reviewComment.appendChild(editDrop)

    reviewComment.classList.add("hj-review-content-box")
    return reviewComment
}

/**
 * 서버에서 리뷰 목록을 불러오는 함수
 * null을 리턴할 경우 서버와 통신하는 도중에 문제가 생겼다는 의미임
 * */
async function getReviewList(areaId, pageNumber){
    const reqUrl = "/api/review/trail/list?" + `trailRouteId=${areaId}&pageNumber=${pageNumber}`
    try {
        const {data: resData} = await axios.get(reqUrl)
        return resData
    } catch (e) {
        return null
    }
}