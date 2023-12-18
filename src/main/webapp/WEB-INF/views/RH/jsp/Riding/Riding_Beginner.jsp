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
            href="../../../../../../../resources/static/rh/css/riding.css"
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
    <div class="rh-riding-titleBox">
        <div class="rh-riding-title">
            <div>Beginner</div>
            <div style="text-align: right">Guide</div>
        </div>
    </div>
    <div class="rh-riding-content">
        <!-- 내용 -->
        <div class="rh-riding-wood">
            <!-- 통나무 -->
            <div class="rh-riding-wood-titleBox">
                <!-- 통나무 타이틀 -->
                <div class="rh-riding-wood-title">초보자를 위해 준비했어요</div>
            </div>
            <div class="rh-riding-wood-bridgeBox">
                <!-- 통나무 다리 -->
                <div class="rh-riding-wood-bridgeSet">
              <span class="rh-riding-wood-bridge"> <!-- 다리1 --> </span
              ><span class="rh-riding-wood-bridge">
                <!-- 다리2 -->
              </span>
                </div>
            </div>
            <div class="rh-riding-wood-mainBox">
                <!-- 통나무 내용판 -->

                <div class="rh-riding-wood-main">
                    <div id="icon1">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/bikeCheck.png"
                                  alt=""></div>
                        <div class="rh-card-set">라이딩 체크리스트</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content1">
                        자전거를 타기 전, 아래의 사항을 체크해야 해요. <br/><br/>• 브레이크
                        오염 상태 <br/>• 안장 높낮이, 각도 <br/>• 서스펜션 윤활, 청소
                        <br/>• 공기압 체크 <br/>• 체인 상태 확인 및 관리
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div id="icon2">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/bike.png" alt="">
                        </div>
                        <div class="rh-card-set">자전거 선택</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content2">
                        산악 자전거, 도로 자전거, 하이브리드 자전거 등 여러 종류의
                        자전거가 있어요. 자신의 주행 스타일과 목적에 맞는 자전거를
                        선택해야 해요.
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div id="icon3">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/ridingSafe.png"
                                  alt=""></div>
                        <div class="rh-card-set">안전장비 착용</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content3">
                        안전모, 안전경, 장갑, 팔다리보호대 등 안전장비 착용은 필수예요.
                        또한 주행 전 적절한 스트레칭도 중요해요.
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div id="icon4">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/wildanimals.png"
                                  alt=""></div>
                        <div class="rh-card-set">라이딩 스킬</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content4">
                        교통이 복잡한 지역으로 나가기 전, 공원 같은 차량이 적은 곳에서
                        주행을 시작해 기본적인 라이딩 기술을 익혀요.
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div id="icon5">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/waterBottle.png"
                                  alt=""></div>
                        <div class="rh-card-set">수분 섭취</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content5">
                        탈진, 탈수 등을 예방하기 위해 충분한 수분 섭취가 필요해요.
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div id="icon6">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/communi.png"
                                  alt=""></div>
                        <div class="rh-card-set">커뮤니케이션</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content6">
                        다른 라이더나 차량과의 상호작용에 주의를 기울여요. 손 신호 등을
                        이용해 자신의 의도를 알리는 것도 중요해요.
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div id="icon7">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/bikeRule.png"
                                  alt=""></div>
                        <div class="rh-card-set">자전거 도로교통 규칙</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content7">
                        자전거 역시 도로 교통 참여자로 간주되기 때문에 교통 규칙을
                        준수해야 해요.
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div id="icon8">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/ridingBest.png"
                                  alt=""></div>
                        <div class="rh-card-set">초보 라이더 베스트</div>
                    </div>
                    <div id="content8">
                        초보 라이더가 이용하기 좋을 장소를 선정했어요.
                    </div>
                </div>
                <div class="rh-riding-wood-main" style="display: block" id="best">
                    <div class="rh-riding-wood-main-best">
                        <div class="rh-riding-wood-mainPost-best">
                            <div onclick="location.href=''" class="rh-riding-wood-mainPost-bestText">
                                <div>인천-서울</div>
                                <div class="bestText2">아라뱃길</div>
                            </div>
                        </div>
                    </div>
                    <div class="rh-riding-wood-main-best">
                        <div class="rh-riding-wood-mainPost-best">
                            <div onclick="location.href=''" class="rh-riding-wood-mainPost-bestText">
                                <div>강원 춘천</div>
                                <div class="bestText2">의암호 둘레길</div>
                            </div>
                        </div>
                    </div>
                    <div class="rh-riding-wood-main-best">
                        <div class="rh-riding-wood-mainPost-best">
                            <div onclick="location.href=''" class="rh-riding-wood-mainPost-bestText">
                                <div>대전</div>
                                <div class="bestText2">둔산대교~대청댐</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
