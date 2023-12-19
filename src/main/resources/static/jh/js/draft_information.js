document.addEventListener('DOMContentLoaded', async function () {
    document.querySelector("#hj-content-detail").addEventListener("click", (e) => {
        document.getElementById("hj-content-plus-container").classList.add("show")
        document.getElementById("hj-overlay-popup").classList.add("active")
    })

    document.querySelector("#hj-content-plus-container").addEventListener("click", (e) => {
        document.getElementById("hj-content-plus-container").classList.remove("show")
        document.getElementById("hj-overlay-popup").classList.remove("active")
    })

    const reviewListContainer = document.getElementById("hj-review-list-container")
    if(reviewListContainer){
        const campingAreaId = document.getElementById("camping-area-id").value
        try {
            const resData = await getReviewList(campingAreaId, 1)

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
});

let pageNum = 1

async function getPrevCommentPage() {
    const campingAreaId = document.getElementById("camping-area-id").value
    try {
        const resData = await getReviewList(campingAreaId, pageNum - 1)

        if (resData === null)
            throw new Error("서버와 통신 중 원인을 알 수 없는 오류 발생")

        if (resData.length === 0) {
            alert("첫번째 페이지 입니다!")
            return
        }

        const reviewListConatiner = document.getElementById("hj-review-list-container")
        reviewListConatiner.innerHTML = ""
        for(const review of resData){
            const madeReviewBox = makeReviewBox(review)
            reviewListConatiner.appendChild(madeReviewBox)
        }

        pageNum -= 1

        document.getElementById("hj-pages").innerHTML = `<span>${pageNum}</span>`
    } catch (e) {
        console.log(e)
        alert("원인을 알 수 없는 오류가 발생했습니다")
    }
}

async function getNextCommentPage() {
    const campingAreaId = document.getElementById("camping-area-id").value
    try {
        const resData = await getReviewList(campingAreaId, pageNum + 1)

        if (resData === null)
            throw new Error("서버와 통신 중 원인을 알 수 없는 오류 발생")

        if (resData.length === 0) {
            alert("마지막 페이지 입니다!")
            return
        }

        const reviewListConatiner = document.getElementById("hj-review-list-container")
        reviewListConatiner.innerHTML = ""
        for(const review of resData){
            const madeReviewBox = makeReviewBox(review)
            reviewListConatiner.appendChild(madeReviewBox)
        }

        pageNum += 1

        document.getElementById("hj-pages").innerHTML = `<span>${pageNum}</span>`
    } catch (e) {
        console.log(e)
        alert("원인을 알 수 없는 오류가 발생했습니다")
    }
}

function deleteComment(commentNumber, element) {
    const passwordInput = element.parentNode.firstElementChild
    if(!passwordInput.value){
        alert("댓글을 수정하시려면 비밀번호를 입력해주세요!")
        return
    }


}

function modifyComment(commentNumber, element) {
    console.log(commentNumber)
    console.log(element.parentNode.firstElementChild.firstElementChild)
    console.log(element.parentNode.firstElementChild.firstElementChild.value)
}

/**
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

    // <br>
    reviewComment.appendChild(document.createElement("br"))

    /*
     *   <div class="hj-review-nickname">닉네임: ${review.author}</div>
     * */
    const authorDiv = document.createElement("div")
    authorDiv.innerText = `닉네임: ${reviewData['author']}`
    authorDiv.classList.add("hj-review-nickname")
    reviewComment.appendChild(authorDiv)

    /*
     *   <div class="hj-review-comment">한줄평: ${review.content}</div>
     * */
    const comment = document.createElement("div")
    comment.innerText = `한줄평: ${reviewData['content']}`
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

    const passwordInputDiv = document.createElement("div")
    const passwordInput = document.createElement("input")
    passwordInput.type = "text"
    passwordInput.placeholder = "비밀번호"
    passwordInputDiv.appendChild(passwordInput)
    editDrop.appendChild(passwordInputDiv)

    const editButtonDiv = document.createElement("div")
    editButtonDiv.innerText = "수정"
    editButtonDiv.onclick = function (){
        modifyComment(commentNum, editButtonDiv)
    }
    editButtonDiv.classList.add("hj-edit-part")
    editDrop.appendChild(editButtonDiv)

    const deleteButtonDiv = document.createElement("div")
    deleteButtonDiv.innerText = "삭제"
    deleteButtonDiv.onclick = function (){
        deleteComment(commentNum, deleteButtonDiv)
    }
    deleteButtonDiv.classList.add("hj-edit-part")
    editDrop.appendChild(deleteButtonDiv)

    editDrop.classList.add("hj-edit-drop")
    reviewComment.appendChild(editDrop)

    reviewComment.classList.add("hj-review-content-box")
    return reviewComment
}

async function getReviewList(areaId, pageNumber){
    const reqUrl = "/api/review/camping/list?" + `campingAreaId=${areaId}&pageNumber=${pageNumber}`
    try {
        const {data: resData} = await axios.get(reqUrl)
        return resData
    } catch (e) {
        return null
    }
}