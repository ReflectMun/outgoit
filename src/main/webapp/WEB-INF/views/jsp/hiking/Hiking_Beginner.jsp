<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <link
            rel="stylesheet"
            href="../../../../../../../resources/static/rh/css/hiking.css"
    />
    <script
            src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"
    ></script>
    <script src="../../../../../../../resources/static/rh/js/card.js"></script>
</head>
<body>
<div>
    <div class="rh-hiking-titleBox">
        <div class="rh-hiking-title">
            <div>Beginner</div>
            <div style="text-align: right">Guide</div>
        </div>
    </div>
    <div class="rh-hiking-content">
        <!-- 내용 -->
        <div class="rh-hiking-wood">
            <!-- 통나무 -->
            <div class="rh-hiking-wood-titleBox">
                <!-- 통나무 타이틀 -->
                <div class="rh-hiking-wood-title">초보자를 위해 준비했어요</div>
            </div>
            <div class="rh-hiking-wood-bridgeBox">
                <!-- 통나무 다리 -->
                <div class="rh-hiking-wood-bridgeSet">
              <span class="rh-hiking-wood-bridge"> <!-- 다리1 --> </span
              ><span class="rh-hiking-wood-bridge">
                <!-- 다리2 -->
              </span>
                </div>
            </div>
            <div class="rh-hiking-wood-mainBox">
                <!-- 통나무 내용판 -->

                <div class="rh-hiking-wood-main">
                    <div class="rh-pointer" id="icon1">
                        <div class="rh-redPin-height">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/mountaineer.png"
                                  alt="">
                        </div>
                        <div class="rh-card-set">코스 선정</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content1">
                        <div class="rh-redPin-textView">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        &nbsp;처음부터 무리한 난이도의 코스를 선택하면 몸도 마음도 지치기 쉬워요. 가볍고 난이도가 낮은 코스부터 시작하는 것이 좋아요.
                        <br>&nbsp;고도 차이가 심하지 않고 길이 잘 정비되어 길을 잃을 염려가 없는 국립공원으로 지정된 곳을 추천해요.
                        <div class="rh-back-set rh-pointer" id="back1">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>
                <div class="rh-hiking-wood-main">
                    <div class="rh-pointer" id="icon2">
                        <div class="rh-redPin-height">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/hikingSafety.png"
                                  alt="">
                        </div>
                        <div class="rh-card-set">준비물</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content2">
                        <div class="rh-redPin-textView">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        &nbsp;기능성 의복, 모자, 배낭, 지도, 나침반, 손전등, 음식, 물, 무릎 보호대 등
                        기본적인 장비를 준비해요. 음식은 가볍고 고열량인 것으로 챙기는 것이 좋아요.
                        <br>&nbsp;가방은 가슴과 허리를 모두 잡아줄 수 있는 등산용 가방을 추천해요.
                        가볍고 부피가 큰 것은 아래쪽에 놓고 무거운 물건을 위쪽에 놓아요.
                        <div class="rh-back-set rh-pointer" id="back2">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>
                <div class="rh-hiking-wood-main">
                    <div class="rh-pointer" id="icon3">
                        <div class="rh-redPin-height">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/exercising.png"
                                  alt="">
                        </div>
                        <div class="rh-card-set">하이킹 전 준비운동</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content3">
                        <div class="rh-redPin-textView">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        &nbsp;본격적으로 하이킹을 시작하기 전, 스트레칭과 워밍업은 필수예요. 준비 운동은 근육 손상과 부상을
                        방지하고 하이킹 도중 편안함을 유지하는 데 도움이 돼요. <br>
                        &nbsp;또한 1시간 이상씩 무리해서 걷지 말고 2~30분에 한 번씩 5분 정도 휴식을 갖는 게 좋아요.
                        <div class="rh-back-set rh-pointer" id="back3">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>
                <div class="rh-hiking-wood-main">
                    <div class="rh-pointer" id="icon4">
                        <div class="rh-redPin-height">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/weather3.png"
                                  alt="">
                        </div>
                        <div class="rh-card-set">날씨 확인</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content4">
                        <div class="rh-redPin-textView">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        &nbsp; 일기예보 확인은 필수! <br>&nbsp;
                        극심한 더위나 추위가 있다면 상당히 힘이 들 수 있어요.
                        초보자라면 비나 눈, 혹은 다른 기상 이변이 있을 시 되도록 일정을 연기하거나 취소하는 것이
                        좋아요.
                        <div class="rh-back-set rh-pointer" id="back4">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>
                <div class="rh-hiking-wood-main">
                    <div class="rh-pointer" id="icon5">
                        <div class="rh-redPin-height">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/backpacker.png"
                                  alt="">
                        </div>
                        <div class="rh-card-set">그룹 하이킹</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content5">
                        <div class="rh-redPin-textView">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        &nbsp;하이킹에 대한 경험이 없을 시, 혼자 움직이는 것보단 그룹 하이킹을 추천해요. 주위
                        사람들과 도움을 주고받을 수 있고, 위급 상황이 있을 시 주위의 도움을 받기 수월해요.
                        <br> &nbsp;타인과 함께하는 하이킹이 불편하여 혼자 움직이고 싶다면 주변 사람에게 본인의 위치를 꼭 알리고 출발해요.
                        <div class="rh-back-set rh-pointer" id="back5">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>
                <div class="rh-hiking-wood-main">
                    <div class="rh-pointer" id="icon6">
                        <div class="rh-redPin-height">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/save-nature.png"
                                  alt="">
                        </div>
                        <div class="rh-card-set">자연 보호</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content6">
                        <div class="rh-redPin-textView">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        &nbsp;산림, 동물, 식물 등의 자연환경을 존중하는 태도를 가져야 해요.
                        자연공원에서의 임산물 채취는 자연공원법, 야생생물 보호 및 관리에
                        관한 법률, 산림자원의 조성 및 관리에 관한 법률에 의해 금지하고
                        있어요.
                        <br> &nbsp;또한 지정 장소 외에 쓰레기를 버리지 말고 불을 피우는
                        등의 위험 행위를 삼가야 해요.
                        <div class="rh-back-set rh-pointer" id="back6">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>

                    <div class="rh-hiking-wood-main">
                        <div class="rh-pointer" id="icon8">
                            <div class="rh-redPin-height">
                                <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                            </div>
                            <div><img style="margin: 10% 0%" width="45%"
                                      src="/resources/static/img/icon/mountainBest.png"
                                      alt="">
                            </div>
                            <div class="rh-card-set">초보 하이커 베스트 코스</div>
                        </div>
                        <div class="rh-hiking-wood-mainPost" id="content8">
                            <div class="rh-redPin-textView">
                                <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                            </div>
                            초보 하이커가 이용하기 좋을 장소를 선정했어요.
                            <div class="rh-back-set rh-pointer" id="back8">돌아가기 <img width="20%"
                                                                                     src="/resources/static/img/icon/next.png"
                                                                                     alt=""></div>
                        </div>
                    </div>
                    <div class="rh-hiking-wood-main" style="display: block" id="best">
                        <div class="rh-hiking-wood-main-best">
                            <div class="rh-hiking-wood-mainPost-best" id="best1">
                                <div class="rh-hiking-wood-mainPost-bestText">
                                    <div class="bestTextLocal">강원도</div>
                                    <div class="bestText2">오대산 - 노인봉</div>
                                </div>
                            </div>
                        </div>
                        <div class="rh-hiking-wood-main-best">
                            <div class="rh-hiking-wood-mainPost-best" id="best2">
                                <div class="rh-hiking-wood-mainPost-bestText">
                                    <div class="bestTextLocal">울산</div>
                                    <div class="bestText2">천황산</div>
                                </div>
                            </div>
                        </div>
                        <div class="rh-hiking-wood-main-best">
                            <div class="rh-hiking-wood-mainPost-best" id="best3">
                                <div class="rh-hiking-wood-mainPost-bestText">
                                    <div class="bestTextLocal">서울</div>
                                    <div class="bestText2">안산</div>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="rh-hiking-wood-main" style="visibility: hidden; height: 0;">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
