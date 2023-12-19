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
                    <div class="rh-pointer" id="icon1">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/bikeCheck.png"
                                  alt=""></div>
                        <div class="rh-card-set">라이딩 체크리스트</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content1">
                        자전거를 타기 전, 아래의 사항을 체크해야 해요. <br/><br/>• 브레이크
                        오염 상태 <br/>• 안장 높낮이, 각도 <br/>• 서스펜션 윤활, 청소
                        <br/>• 공기압 체크 <br/>• 체인 상태 확인 및 관리
                        <div class="rh-back-set rh-pointer" id="back1">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div class="rh-riding-wood-mainPost" id="riding-content2">
                        <div class="rh-card-set" id="line">자전거 종류</div>
                        <div class="rh-riding-wood-beginner-zone first rh-pointer" id="mtb">
                            <img src="/resources/static/img/icon/mtb.png" alt="">
                            산악자전거
                        </div>
                        <div id="mtbC">
                            거친 지형, 산악 지형, 트레일 등에서 주로 사용돼요. <br>
                            두꺼운 타이어와 견고한 프레임으로 튼튼하게 설계돼 부드러운 주행을 제공하며 충격을 흡수해 줘요.<br>
                            낮은 기어 비율을 가지고 있어 오르막이나 어려운 지형에서 효과적이에요.<br>
                        </div>
                        <div class="rh-riding-wood-beginner-zone rh-pointer" id="rb">
                            <img src="/resources/static/img/icon/rb.png" alt="">
                            도로자전거
                        </div>
                        <div id="rbC">
                           급속한 도로 주행 및 경주에 적합해요. <br>
                            가벼운 프레임과 기하학적인 디자인으로 편안한 자세를 유지해 빠르고 효율적으로 이동할 수 있으며, 얇고 좁은 고압 타이어로 공기 저항을 최소화하여 높은 속도를 유지할 수 있어요.
                        </div>
                        <div class="rh-riding-wood-beginner-zone rh-pointer" id="hb">
                            <img width="10%" src="/resources/static/img/icon/hb.png" alt="">
                            하이브리드<br> 자전거
                        </div>
                        <div id="hbC">
                           산악 자전거와 도로 자전거의 특징을 결합한 디자인으로 다목적으로 사용할 수 있는 범용적인 자전거예요.<br>
                            중간 크기의 타이어와 경량 프레임으로 도로와 경로에서 안정적인 주행, 편안한 자세와 높은 편의성을 제공해요.<br>
                        </div>
                        <div class="rh-back-set rh-pointer" id="back2">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div class="rh-pointer" id="icon3">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/ridingSafe.png"
                                  alt=""></div>
                        <div class="rh-card-set">안전장비 착용</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content3">
                        안전모, 안전경, 장갑, 팔다리 보호대 등 안전장비 착용은 필수예요.
                        또한 주행 전 적절한 스트레칭도 중요해요.
                        <div class="rh-back-set rh-pointer" id="back3">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div class="rh-pointer" id="icon4">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/wildanimals.png"
                                  alt=""></div>
                        <div class="rh-card-set">라이딩 스킬</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content4">
                        교통이 복잡한 지역으로 나가기 전, 공원 같은 차량이 적은 곳에서
                        주행을 시작해 기본적인 라이딩 기술을 익혀요.
                        <div class="rh-back-set rh-pointer" id="back4">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div class="rh-pointer" id="icon5">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/waterBottle.png"
                                  alt=""></div>
                        <div class="rh-card-set">수분 섭취</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content5">
                        라이딩 중 체내 수분 공급이 원활하지 않으면 운동 능력이 저하되고 근육 경련, 탈진, 탈수 증세가 발생해요. 이를 예방하기 위해 충분한 수분 섭취가 필요해요. <br>
                        특히 스포츠 드링크는 체내에서 빠져나간 전해질을 채우는 데에 도움이 되고, 음료는 갈증이 오기 전 미리 마셔야 해요.
                        <div class="rh-back-set rh-pointer" id="back5">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div class="rh-pointer" id="icon6">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/communi.png"
                                  alt=""></div>
                        <div class="rh-card-set">커뮤니케이션</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content6">
                        다른 라이더나 차량과의 상호작용에 주의를 기울여요. 손 신호 등을
                        이용해 자신의 의도를 알리는 것도 중요해요.
                        <div class="rh-back-set rh-pointer" id="back6">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div class="rh-pointer" id="icon7">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/bikeRule.png"
                                  alt=""></div>
                        <div class="rh-card-set">자전거 도로교통 규칙</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content7">
                        초보 라이더가 준수해야 하는 주요 사항이에요. <br><br>
                        1. 동료와 나란히 라이딩을 진행할 경우 반대편 도로까지 침범하여 사고가 날 수 있으니 이와 같은 행동은 자제하는 것이 좋아요. <br>
                        2. 앞, 뒤 자전거와 일정 간격을 유지하여 라이딩을 진행해 주세요. 간혹 급정거를 할 경우, 뒤에 있는 자전거가 더 많은 피해를 입을 확률이 높아요. 최소 3m의 간격을
                        유지하는 편이 좋아요. <br>
                        3. 사고 예방을 위해 시속은 20km 이하로 유지해요.
                        <div class="rh-back-set rh-pointer" id="back7">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div class="rh-pointer" id="icon8">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/ridingBest.png"
                                  alt=""></div>
                        <div class="rh-card-set">초보 라이더 베스트</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content8">
                        초보 라이더가 이용하기 좋을 장소를 선정했어요.
                        <div class="rh-back-set rh-pointer" id="back8">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>
                <div class="rh-riding-wood-main" style="display: block" id="best">
                    <div class="rh-riding-wood-main-best">
                        <div class="rh-riding-wood-mainPost-best rh-pointer" id="best1">
                            <div onclick="location.href=''" class="rh-riding-wood-mainPost-bestText">
                                <div>춘천</div>
                                <div class="bestText2">의암호 둘레길</div>
                            </div>
                        </div>
                    </div>
                    <div class="rh-riding-wood-main-best">
                        <div class="rh-riding-wood-mainPost-best rh-pointer" id="best2">
                            <div onclick="location.href=''" class="rh-riding-wood-mainPost-bestText">
                                <div>인천-서울</div>
                                <div class="bestText2">아라뱃길</div>
                            </div>
                        </div>
                    </div>
                    <div class="rh-riding-wood-main-best">
                        <div class="rh-riding-wood-mainPost-best rh-pointer" id="best3">
                            <div onclick="location.href=''" class="rh-riding-wood-mainPost-bestText">
                                <div>대전</div>
                                <div class="bestText2">둔산대교-대청댐</div>
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
