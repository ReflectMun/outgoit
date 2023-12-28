<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${campingAreaName} 상세정보</title>
    <link rel="stylesheet" href="/resources/static/jiho/css/camp_information.css"/>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="/resources/static/jiho/js/draft_information.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</head>
<body>
<input id="camping-area-id" value="${campingAreaNumber}" style="display: none;">
<div id="hj-container2">
    <!-- 정보 div -->
    <div id="hj-info">
        <div class="hj-info-box">
            <div id="hj-info-name-img">
                <div class="hj-info-name">${campingAreaName}</div>
            </div>
        </div>
    </div>
    <!-- 판 밑에 연결하는 div -->

    <!-- 실제 정보 들어있는 div중 사진 -->
    <div class="hj-content1">
        <div class="hj-content-box">
            <!-- 칠판 효과 보더준 부분 -->
            <div id="hj-content-pic">
                <!-- 팝업 클릭했을떄 뜨는 상세내용 디브 -->
                <div id="hj-content-plus-container">
                    <div id="hj-content-plus-overray">
                    <div class="hj-content-plus-ray">
                    <div id="hj-detail-tel">번호: ${telephoneNumber}</div>
                    <div id="hj-detail-season">운영 시즌: ${periodOfOperation}</div>
                    <div id="hj-detail-addr">주소: ${address}</div>
                    <div id="hj-detail-facilities">부대시설: ${subsidiaryFacilities}</div>
                    </div>
                    <div class="hj-content-plus-ray">
                    <div id="hj-line-introduce">
<%--                        <div>한줄 소개</div>--%>
                        <div>${lineIntro}</div>
                    </div>
                    <div>일반 야영장 개수: ${generalSite}</div>
                    <div>자동차 야영장 개수: ${autoSite}</div>
                    <div>애완동물 동반 가능 여부: ${animalComingControl}</div>
                    <div>장비 대여 가능 여부: ${equipmentRental}</div>
                    <div>개인 트레일러 동반 가능 여부: ${trailerAccompanyAt}</div>
                    <div>개인 카라반 동반 가능 여부: ${caravanAccompanyAt}</div>
                    <div>화장실 개수: ${toiletCount}</div>
                    <div>이용 가능한 주면 시설: ${availableFacilities}</div>
                    <div>현재 운영 상태: ${managementStatement}</div>
                    <div>휴장 시작: ${holidaySeasonStart}</div>
                    <div>휴장 종료: ${holidaySeasonEnd}</div>
                    <div>샤워룸 개수: ${showerRoomCount}</div>
                    <div>화로대 개인 지참 여부: ${brazierControl}</div>
                    <div>잔디바닥 자리: ${siteGrass}</div>
                    <div>파쇄석 자리: ${siteCrushedStone}</div>
                    <div>테크 자리: ${siteDeck}</div>
                    <div>자갈 자리: ${siteGravel}</div>
                    <div>맨흙 자리: ${siteSoil}</div>
                    </div>
                    </div>
                </div>
                <div id="hj-overlay-popup"></div>
                <!-- 칠판에 쓰인 분필 -->
                <div id="hj-content-box-comment"><span>OUT GO IT</span></div>
                <div id="hj-post-it"></div>

                <!-- 이미지 부분 -->
                <div id="hj-content-inside-box">
                    <div id="hj-content-img" class="swiper">
                        <div id="hj-content-img-slide-wrapper" class="swiper-wrapper">
                            <c:forEach var="img" items="${images}">
                                <div class="swiper-slide"><img src="${img.imageUrl}" alt=""></div>
                            </c:forEach>
                        </div>

                        <div class="swiper-pagination"></div>

                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>
                    <!-- 정보 부분 -->
                    <div id="hj-content-detail">
                        <div id="hj-no">번호: ${telephoneNumber}</div>
                        <div id="hj-time">운영 시즌: ${periodOfOperation}</div>
                        <div id="hj-addr">주소: ${address}</div>
                        <div id="hj-ability">부대시설: ${subsidiaryFacilities}</div>
                        <div id="hj-rating-avg">캠핑장 평점: ${ratingAvg}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 코멘트 입력 부분 -->
    <div id="hj-comment">
        <div class="hj-info-box">
            <div id="hj-comment-name-img">
                <div class="hj-info-name">Comment</div>
            </div>
        </div>
        <!--  -->

        <div class="hj-content1">
            <div class="hj-content-box">
                <!-- 코멘트 칠판 효과 -->
                <div id="hj-comment-pic">
                    <div id="hj-content-inside-box2">
                        <div id="hj-content-detail2">
                            <div id="hj-content-zentai-box">
                                <!-- 별부분 -->
                                <div id="hj-review-star-box">
                                    <span class="hj-star" data-value="1">&#9733;</span>
                                    <span class="hj-star" data-value="2">&#9733;</span>
                                    <span class="hj-star" data-value="3">&#9733;</span>
                                    <span class="hj-star" data-value="4">&#9733;</span>
                                    <span class="hj-star" data-value="5">&#9733;</span>
                                </div>
                                <!-- 인풋 아이디 비번 부분 -->
                                <div id="hj-input">
                                    <div id="hj-input-content">
                                        <div id="hj-nickname">
                                            <input
                                                    type="text"
                                                    id="hj-id-input"
                                                    placeholder="닉네임"
                                                    name="author"
                                            />
                                        </div>
                                        <div id="hj-pw">
                                            <input
                                                    type="text"
                                                    id="hj-pw-input"
                                                    placeholder="비번"
                                                    name="password"
                                            />
                                        </div>
                                    </div>
                                    <!-- 리뷰부분 -->
                                    <div id="hj-review-content">
                                        <input
                                                type="text"
                                                id="hj-review-input"
                                                placeholder="비방글은 삭제 조치 됩니다."
                                        />
                                    </div>
                                    <!-- 확인버튼 -->
                                    <div id="hj-btn">
                                        <button id="hj-btn-button">확인</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 리뷰 보여주는 부분 -->
    <div id="hj-review">
        <div class="hj-content1">
            <div id="hj-review-content2-box">
                <div id="hj-review-pic">

                    <!--  칠판 코멘트 -->
                    <div id="hj-content-box-comment2"><span>Camping</span></div>
                    <div id="hj-review-inside-box2">

                        <div id="hj-review-detail2">
                            <div id="hj-review-zentai-box">

                                <!-- 작성된 리뷰들을 개별 출력하는 부분 -->
                                <c:choose>
                                    <c:when test="${existReviews}">
                                        <div id="hj-review-list-container">
                                            <!--
                                            여기에 리뷰 나타날 예정
                                            동적으로 생성됩니다
                                            -->
                                        </div>
                                        <!-- 코멘트 보여주는 위치 여기까지 -->
                                        <!-- 페이징 처리-->
                                        <div id="hj-page-box">
                                            <div id="hj-prev-button" onclick="getPrevCommentPage()"><span>[앞으로]</span>
                                            </div>
                                            <div id="hj-pages"><span>1</span></div>
                                            <div id="hj-next-button" onclick="getNextCommentPage()"><span>[다음으로]</span>
                                            </div>
                                        </div>
                                        <!--페이징 처리 div 끝 -->
                                    </c:when>
                                    <c:otherwise>
                                        <h2 id="hj-no-review">아직 작성된 리뷰가 없습니다</h2>
                                    </c:otherwise>
                                </c:choose>

                            </div>

                        </div>
                    </div>
                    <!-- 칠판모양 코멘트 영역 여기까지 -->

                </div>
            </div>
        </div>
    </div>
    <!-- 리뷰 보여주는 곳 끝 -->

</div>
<script>
    const commentSubmitButton = document.getElementById("hj-btn-button")
    commentSubmitButton.addEventListener("click", async (e) => {
        const authorInput = document.getElementById("hj-id-input")
        const passwordInput = document.getElementById("hj-pw-input")
        const contentInput = document.getElementById("hj-review-input")

        if (!authorInput.value) {
            alert("닉네임을 입력해주세요!")
            return
        }

        if (!passwordInput.value) {
            alert("비밀번호를 입력해주세요!")
            return;
        }

        if (!contentInput.value) {
            alert("댓글을 입력해주세요!")
            return;
        }

        if (!clickedValue) {
            alert("평점을 선택해주세요!")
            return
        }

        try {
            const reqUrl = "/api/review/camping/submit"

            const {data: resData} = await axios.post(
                reqUrl,
                {
                    author: authorInput.value,
                    password: passwordInput.value,
                    content: contentInput.value,
                    rating: clickedValue, // starValue 값 관련 코드는 draft_information.js에 있는 외부 값임
                    campingAreaId: ${campingAreaNumber}
                }
            )

            if (resData['statusCode'] === 200) {
                alert("리뷰 작성 성공")
            } else {
                alert(resData['errorMessage'])
                return
            }

            const campingAreaId = document.getElementById("camping-area-id").value

            // 화면상의 리뷰 목록 갱신을 위해 서버에서 리뷰 데이터를 받아옴
            const reviewDataList = await getReviewList(campingAreaId, 1)

            // 리뷰 컨테이너를 비우고 받아온 데이터 기반으로 리뷰 목록을 다시 렌더링함
            let reviewListContainer = document.getElementById("hj-review-list-container")
            // 만약 리뷰가 없어서 "아직 작성된 리뷰가 없습니다" 라는 메시지가 떠있으면 리뷰 목록 보여주게 데이터 가공
            if (!reviewListContainer) {
                const zentai = document.getElementById("hj-review-zentai-box")
                zentai.innerHTML = ""
                reviewListContainer = document.createElement("div")
                // 리뷰 리스트를 담을 컨테이너를 생성하고 zentai-box의 자식 요소로 추가
                reviewListContainer.id = "hj-review-list-container"

                const paging = document.createElement("div")

                const prevButton = document.createElement("div")
                prevButton.innerHTML = "<span>[앞으로]</span>"
                prevButton.onclick = () => {
                    getPrevCommentPage()
                }
                prevButton.id = "hj-prev-button"
                paging.appendChild(prevButton)

                const commentPageViewer = document.createElement("div")
                commentPageViewer.innerHTML = "<span>1</span>"
                commentPageViewer.id = "hj-pages"
                paging.appendChild(commentPageViewer)

                const nextButton = document.createElement("div")
                nextButton.innerHTML = "<span>[다음으로]</span>"
                nextButton.id = "hj-next-button"
                nextButton.onclick = () => {
                    getNextCommentPage()
                }
                paging.appendChild(nextButton)

                paging.classList.add("hj-page-box")

                zentai.appendChild(reviewListContainer)
                zentai.appendChild(paging)
            }

            reviewListContainer.innerHTML = ""
            for (const review of reviewDataList) {
                const madeReviewBox = makeReviewBox(review)
                reviewListContainer.appendChild(madeReviewBox)
            }

            // 작성을 완료하고 입력 박스들을 비움
            passwordInput.value = ""
            authorInput.value = ""
            contentInput.value = ""

            // 평점 별 초기화
            const starList = document.getElementsByClassName("hj-star")
            for (const star of starList) {
                star.classList.remove("checked")
            }
            clickedValue = null
        } catch (e) {
            console.log(e)
            alert("원인을 알 수 없는 오류가 발생했습니다")
        }
    })
</script>
<script>
    const swiper = new Swiper(".swiper", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        pagination: {
            el:".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        }
    })
</script>
</body>
</html>
