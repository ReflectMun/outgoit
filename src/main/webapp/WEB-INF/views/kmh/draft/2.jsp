<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OUT GO IT - main</title>
    <link rel="stylesheet" href="/resources/static/kmh/css/camping.css">
    <link rel="stylesheet" href="/resources/static/css_hj/camp_information.css">
    <script src="/resources/static/js_hj/campinformation.js"></script>
</head>
<body>
    <!-- 헤더 영역 -->

    <div class="header"></div>

    <!-- 컨테이너 영역 -->

    <div class="container">

        <!-- 배너 영역 (슬라이드 들어가면 좋을듯!) -->

        <div class="banner-wrap camp">
            <div class="banner">
                <div class="banner-txt-wrap">
                    <div class="banner-title">
                        <span>CAMPING</span>
                    </div>
                     <div class="banner-sub-txt"> 
                        <span> 캠핑에 대한 간단한 케치프레이즈 ^0^ </span>
                    </div>
                </div>
            </div>
        </div>

        <!-- 배너 여기까지 / 컨텐트 영역 (지도 API)-->

        <div class="content">
            <div class="map-txt-wrap">
                <div class="map-title">
                    <span> Search </span>
                </div>
                <div class="map-sub-txt">
                    <span> 간단한 기능 설명하는 문장 하나 들어가면 좋을듯</span>
                </div>
            </div>
            <div class="camping-area-search">
                <input id="search-box" placeholder="검색하고 싶은 지역!">
                <button id="submit-search">검색!</button>
            </div>
            <div class="search-result">
                <div class="map-all">
                    <div id="map"></div>
                    <div id="search-result-list"><h1>리스트 띄워주는 div</h1></div>
                </div>
            </div>
        </div>

        <!-- 컨텐트 영역 여기까지 -->

    </div>

    <!--컨테이너 여기까지 -->

    <!-- 모달창 영역 -->

    <div id="hj-container2">
        <!-- 정보 div -->
        <div id="hj-info">
            <div class="hj-info-box">
<%--                <div id="hj-close-btn"> <button>닫기</button></div>--%>
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
                    <div id="hj-close-btn"> <button>닫기</button></div>
                    <!-- 팝업 클릭했을떄 뜨는 디브 -->
                    <div id="hj-content-plus-container">
                        더보기 정보들 떠야하는 페이지
                    </div>
                    <div id="hj-overlay-popup"></div>
                    <!-- 칠판에 쓰인 분필 -->
                    <div id="hj-content-box-comment"><span>OUT GO IT</span></div>
                    <!-- 이미지 부분 -->
                    <div id="hj-content-inside-box">
                        <div id="hj-content-img">
                            <div id="hj-content-img-link">
                                <img src="${thumbnail}">
                            </div>
                        </div>
                        <!-- 정보 부분 -->
                        <div id="hj-content-detail">
                            <div id="hj-no">번호: ${telephoneNumber}</div>
                            <div id="hj-time">운영 기간 + 시간: ${periodOfOperation}</div>
                            <div id="hj-addr">주소: ${address}</div>
                            <div id="hj-ability">부대시설: ${subsidiaryFacilities}</div>
                            <div id="hj-etc">기타사항: ${etc}</div>
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
                                        <div class="hj-star">✰</div>
                                        <div class="hj-star">✰</div>
                                        <div class="hj-star">✰</div>
                                        <div class="hj-star">☆</div>
                                        <div class="hj-star">☆</div>
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
                                    <!-- 작성된 리뷰들을 아래 모양대로 출력해야함 -->

                                    <!-- 닉넴 한줄평 보여주는 곳  -->
                                    <div id="hj-review-content-box">
                                        <div id="hj-review-stars">
                                            <div class="hj-review-star">☆</div>
                                            <div class="hj-review-star">★</div>
                                        </div>
                                        <br>
                                        <div id="hj-review-nickname">닉네임: ${review.author}</div>
                                        <div id="hj-review-comment">한줄평: ${review.content}</div>
                                        <div id="hj-edit-box">
                                            <div id="hj-edit-icon">...</div>
                                        </div>
                                        <div id="hj-edit-drop">
                                            <div><input type="text" placeholder="비밀번호"> </div>
                                            <div class="hj-edit-part">수정</div>
                                            <div class="hj-edit-part">삭제</div>
                                        </div>
                                    </div>
                                    <div id="hj-page-box">
                                        <div id="hj-prev-button"><span>[맨 처음]</span></div>
                                        <div id="hj-pages"><span>[페이지 번호들]</span></div>
                                        <div id="hj-next-button"><span>[맨 끝]</span></div>
                                    </div>
                                    <h2 id="hj-no-review">아직 작성된 리뷰가 없습니다</h2>
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

    <!-- 모달창 영역 여기까지-->

    <!-- 푸터 영역 -->

    <div class="footer"></div>

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=770a2850e8ce3177b209d2d94dc1e58b&libraries=services"></script>
    <script type="text/javascript" src="/resources/static/kmh/js/draft2.js"></script>
</body>
</html>