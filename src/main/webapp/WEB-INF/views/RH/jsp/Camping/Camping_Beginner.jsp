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
            href="../../../../../../../resources/static/rh/css/camping.css"
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
    <div class="rh-camping-titleBox">
        <div class="rh-camping-title">
            <div>Beginner</div>
            <div style="text-align: right">Guide</div>
        </div>
    </div>
    <div class="rh-camping-content">
        <!-- 내용 -->
        <div class="rh-camping-wood">
            <!-- 통나무 -->
            <div class="rh-camping-wood-titleBox">
                <!-- 통나무 타이틀 -->
                <div class="rh-camping-wood-title">초보자를 위해 준비했어요</div>
            </div>
            <div class="rh-camping-wood-bridgeBox">
                <!-- 통나무 다리 -->
                <div class="rh-camping-wood-bridgeSet">
              <span class="rh-camping-wood-bridge"> <!-- 다리1 --> </span
              ><span class="rh-camping-wood-bridge">
                <!-- 다리2 -->
              </span>
                </div>
            </div>
            <div class="rh-camping-wood-mainBox">
                <!-- 통나무 내용판 -->

                <div class="rh-camping-wood-main">
                    <div id="icon1">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/stone.png" alt="">
                        </div>
                        <div class="rh-card-set">캠핑 필수 용품</div>
                    </div>
                    <div class="rh-camping-wood-mainPost" id="content1" style="margin-top: 15%">
                        • 텐트 <br/>
                        • 취사 도구<br/>
                        • 취사 재료 <br/>
                        • 수면용품(침낭, 매트 등) <br/>
                        • 테이블 <br/>
                        • 보냉팩(아이스박스, 보냉가방) <br/>
                        • 휴대용 랜턴 <br/>
                        • 구급약품 <br/>
                        • 계절에 따른 온/냉방 용품
                        <br/>
                        이외의 소화기, 구급용품 등은 캠핑장 내에 구비되어 있을 확률이 높으나, 비상용으로 구비해 두는 편이 좋아요.
                    </div>
                </div>
                <div class="rh-camping-wood-main">
                    <div id="icon2">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/howtouse.png"
                                  alt=""></div>
                        <div class="rh-card-set">장비 사용</div>
                    </div>
                    <div class="rh-camping-wood-mainPost" id="content2">
                        장비 사용 방법을 알아둬요. <br/>
                        제품 페이지나 SNS를 통해 사진 및 동영상으로 접근할 수 있어요.
                    </div>
                </div>
                <div class="rh-camping-wood-main">
                    <div id="icon3">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/weather3.png"
                                  alt=""></div>
                        <div class="rh-card-set">날씨 확인</div>
                    </div>
                    <div class="rh-camping-wood-mainPost" id="content3">
                        기온, 강수량, 바람 등을 고려해 <br/>
                        적절한 의류와 장비를 선택해요
                    </div>
                </div>
                <div class="rh-camping-wood-main">
                    <div id="icon4">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/deck2.png" alt="">
                        </div>
                        <div class="rh-card-set">캠핑장 선택</div>
                    </div>
                    <div class="rh-camping-wood-mainPost" id="content4">
                        근거리 캠핑장이나 국립공원 등 멀지 않고 편의시설이 잘 갖춰져
                        있는 곳을 선택해요. 처음부터 장거리 캠핑을 선택하면 텐트 피칭도
                        전에 피로해질 수 있어요.
                    </div>
                </div>
                <div class="rh-camping-wood-main">
                    <div class="rh-camping-wood-mainPost" id="camping-content5">
                        <div class="rh-camping-wood-beginner-zone first" id="stone">
                            <img src="/resources/static/img/icon/stone.png" alt="">
                            파쇄석
                        </div>
                        <div id="stoneC">
                            바닥이 돌로 이루어져 있고, 팩으로 텐트를 설치할 수
                            있어요. 데크보다 공간이 넓고 물 고임이 적어요. 하지만 돌로 인해
                            바닥이 울퉁불퉁하기 때문에 텐트 피칭 전 돌을 골고루 펴 주는 것이
                            좋아요.
                        </div>
                        <div class="rh-camping-wood-beginner-zone" id="deck">
                            <img src="/resources/static/img/icon/deck.png" alt="">
                            데크
                        </div>
                        <div id="deckC">
                            바닥이 목재로 이루어져 있고, 데크 크기에 따라 사용할 수
                            있는 텐트가 다르기 때문에 꼭 크기를 확인해야 해요. <br>일반 팩이 아닌 데크
                            전용 팩(오징어팩, 나사팩 등)을 사용해야 하며, 데크 전용 팩은
                            캠핑장마다 허용하는 것이 다르기 때문에 사전에 확인해야 해요.<br>
                            또한 화재 위험으로 인해 데크 위에서 화로대 사용은 불가해요.
                            화로대 사용 시 데크 밖에서 사용해야 해요.
                        </div>
                        <div class="rh-camping-wood-beginner-zone" id="grass">
                            <img width="10%" src="/resources/static/img/icon/grass.png" alt="">
                            잔디
                        </div>
                        <div id="grassC">
                            바닥이 잔디로 이루어져 있어요. 비가 오는 등 날씨가 좋지
                            않은 날엔 선택하지 않는 것이 좋아요. 또한 철수 시 장비에 잔디가
                            붙을 수 있어 관리가 필요해요.
                        </div>
                        <div class="rh-card-set" id="line">캠핑존 선택</div>
                    </div>
                </div>
                <div class="rh-camping-wood-main">
                    <div id="icon6">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/checklist.png"
                                  alt=""></div>
                        <div class="rh-card-set">캠핑장 이용 매너</div>
                    </div>
                    <div class="rh-camping-wood-mainPost" id="content6">
                        • 매너타임: 캠핑장마다 매너 타임(취침 타임)이라는 것이 존재해요.
                        해당 시간엔 목소리를 낮추고 시끄러운 음악을 틀지 않도록 해요.
                        <br/>
                        • 반려동물: 반려동물과 함께 캠핑을 할 시, 목줄과 배변 처리를
                        확실하게 해야 해요.<br/>• 다른 사이트를 침범해 타인을 방해하지
                        않도록 해요.<br/>
                        • 흡연은 지정된 공간에서만 가능해요.<br/>
                        • 아이와 함께하는 경우, 항상 보호자가 아이들을 주시하고 있어야
                        해요.
                    </div>
                </div>

                <div class="rh-camping-wood-main">
                    <div id="icon8">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/campingBest.png"
                                  alt=""></div>
                        <div class="rh-card-set">초보 캠퍼 베스트 캠핑장</div>
                    </div>
                    <div id="content8">
                        초보 캠퍼 이용하기 좋을 장소를 선정했어요.
                    </div>
                </div>
                <div class="rh-camping-wood-main" style="display: block" id="best">
                    <div class="rh-camping-wood-main-best">
                        <div class="rh-camping-wood-mainPost-best">
                            <div>이미지</div>
                            <div>1</div>
                        </div>
                    </div>
                    <div class="rh-camping-wood-main-best">
                        <div class="rh-camping-wood-mainPost-best">
                            <div>이미지</div>
                            <div>1</div>
                        </div>
                    </div>
                    <div class="rh-camping-wood-main-best">
                        <div class="rh-camping-wood-mainPost-best">
                            <div>이미지</div>
                            <div>1</div>
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
