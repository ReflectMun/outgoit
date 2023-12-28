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
            href="/resources/static/rh/css/hiking.css"
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
    <div class="rh-hiking-safety-titleBox">
        <div class="rh-hiking-safety-title">
            <div>Safety</div>
            <div style="text-align: right">Information</div>
        </div>
    </div>
    <div class="rh-hiking-content">
        <!-- 내용 -->
        <div class="rh-hiking-wood">
            <!-- 통나무 -->
            <div class="rh-hiking-wood-titleBox">
                <!-- 통나무 타이틀 -->
                <div class="rh-hiking-wood-title">
                    숙지해야 할 안전사항을 안내드려요
                </div>
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
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/checklist.png"
                                  alt=""></div>
                        <div class="rh-card-set">하이킹 준비</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content1">
                        <div class="rh-redPin-textView">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        &nbsp;&nbsp;기상정보를 확인하고 이에 맞는 산행 용품을 준비해 주세요. 체온 유지에 용이한 긴 옷을 입고 등산 스틱, 미끄럼 방지 기능이
                        있는 등산화를 갖춰요.
                        <br> &nbsp;또한 고열량의 비상식량과 충분한 물을 준비하고 조금씩 자주 먹어요. 탈수, 탈진, 저혈당을 예방할 수 있어요.
                        <div class="rh-back-set rh-pointer" id="back1">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>

                <div class="rh-hiking-wood-main">
                    <div class="rh-hiking-wood-mainPost">
                        <div class="rh-redPin-height" id="hikingSafety2Pin">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        <div class="rh-card-set" id="line">야생동물 대처법
                        </div>
                        <div class="rh-hiking-animal first rh-pointer" id="bee">
                            <img src="/resources/static/img/icon/bee.png" alt="">
                            <span>말벌</span>
                        </div>
                        <div id="beeC">
                            &nbsp;말벌집을 발견하면 재빨리 벗어나야 해요. 만약 말벌에 쏘일 경우
                            20m 이상 벗어나 주변에 도움을 요청하세요. 또한 산에 있는 벌들은 어두운 색상을
                            보면 공격성이 강해져요. 되도록 밝은색의 등산복을 착용해 주세요.
                        </div>
                        <div class="rh-hiking-animal first rh-pointer" id="snake">
                            <img src="/resources/static/img/icon/snake.png" alt="">
                            <span>뱀</span>
                        </div>
                        <div id="snakeC">
                            &nbsp;살모사를 제외한 대부분의 뱀은 공격성을 드러내지 않기 때문에 먼저 밟거나 하지 않으면 공격하지 않아요. 만약 뱀을 만났을 경우 가만히 제자리에 서서 뱀이 다른 곳으로 지나가길 기다리거나, 뱀이 이동하지 않는다면 우회해서 돌아가야 해요.
                            <br> &nbsp;뱀에 물렸다면 상처 부위를 끈이나 고무줄로 묶어 최대한 독이 퍼지지 않게 하고 최대한 빨리 병원에서 치료받아야 해요. 입으로 독을 빨아내는 것과 소독을 위해 상처부위를 술로 씻어내는 것은 아무런 효과가 없어 좋지 않은 대처법이에요.
                        </div>

                        <div class="rh-hiking-animal first rh-pointer" id="pig">
                            <img src="/resources/static/img/icon/boar.png" alt="">
                            <span>멧돼지</span>
                        </div>
                        <div id="pigC">
                            &nbsp;멧돼지는 평균 50km의 속도를 낼 수 있으며 후각은 좋으나 시력이 좋지 않아요. 따라서 소리치거나 돌을 던지는 행위는 멧돼지를 자극해요. 또한 멧돼지는 헤엄칠 수
                            있으니 물가로 피하는 건 위험해요. 쫓아와도 뛰지 말고 멧돼지를 똑바로 바라보며 천천히 가까운 나무나 바위로 숨어요. 만약 공격이 시작되면 높은 곳으로 이동해요.
                        </div>
                        <div class="rh-hiking-animal first rh-pointer" id="dog">
                            <img src="/resources/static/img/icon/dog.png" alt="">
                            <span>맹견</span>
                        </div>
                        <div id="dogC">
                            &nbsp;갑자기 도망치는 행동은 개의 추적 본능을 유발해요.
                            눈을 마주치는 행동 또한 공격적인 의사로 보일 수 있어 얼굴을 살짝 돌리고 개의 행동을 주시해야 해요.
                            해당 장소에서 벗어날 경우 가방이나 신발 등을 던져 개의 관심을 돌린 후 탈출해야 해요.
                            <br>&nbsp;만약 물렸을 경우, 상처 부위를 5분 정도 비누로 깨끗하게 씻고 바로 병원으로 이동해야 해요. 광견병 감염 여부는 바로 알 수 없기 때문에 일정 기간 이후 발열, 구토, 두통, 흥분,
                            물을 두려워하거나 불안해하는 증상을 보이면 뇌척수액과 혈액을 통한 조직검사가 필요해요.
                        </div>
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
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/hiking.png"
                                  alt=""></div>
                        <div class="rh-card-set">하이킹 시간</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content3">
                        <div class="rh-redPin-textView">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        &nbsp;아침 일찍 하이킹을 시작하고 해 지기 한두 시간 전에는 하산해 주세요.
                        하루 최대 8시간 동안 진행하고, 체력의 30%는 비축해요.
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
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/map.png"
                                  alt=""></div>
                        <div class="rh-card-set">사고 발생 대비</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content4">
                        <div class="rh-redPin-textView">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        &nbsp;하이킹 코스는 미리 파악해 두고, 현재 위치를 주기적으로 확인하여 사고 발생을 대비해요. 또한 지정된 탐방로를 이용하며 만약 길을
                        잘못 들었다면 원래 있던 곳으로 되돌아 가야 해요. 만일 사고가 발생했을 시 다목적 위치 표지판을 보고 구조 요청을 해 주세요.
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
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/hikingNG.png"
                                  alt=""></div>
                        <div class="rh-card-set">금지사항</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content5">
                        <div class="rh-redPin-textView">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        &nbsp;음주, 흡연, 취사는 금지예요. <br/>
                        &nbsp;화재 위험이 있기에 화기는 소지하지 않는 것이 좋아요. <br>
                        &nbsp;또한 음주 후 하이킹 시 혈중 알코올 농도 상승, 혈압 상승 유발로 인한 심뇌혈관질관 위험, 저체온증으로 인한 조난 위험, 낙상 사고 위험이 증가해요.
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
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/pain.png"
                                  alt=""></div>
                        <div class="rh-card-set">식중독</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content6">
                        <div class="rh-redPin-textView">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        &nbsp;계곡물이나 약수 등은 안전성이 확인되지 않았으니 함부로 마시면 식중독과 복통을 일으킬 수 있어요. 약수터를 이용할 땐 반드시 공인기관의 먹는 물 수질검사 성적서를
                        확인해야 해요.
                        <br>&nbsp;또한 먹다 남은 음식은 장시간 이동 중 상할 우려가 있으므로 집으로 다시 챙겨와 섭취하지 않도록 해요.
                        <div class="rh-back-set rh-pointer" id="back6">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>
                <div class="rh-hiking-wood-main">
                    <div class="rh-pointer" id="icon7">
                        <div class="rh-redPin-height">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        <div><img style="margin: 10% 0%" width="45%"
                                  src="/resources/static/img/icon/nationalpark.png" alt=""></div>
                        <div class="rh-card-set">산림 보호</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content7">
                        <div class="rh-redPin-textView">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        &nbsp;하이킹 중 발생한 쓰레기는 코스 내에 마련된 쓰레기통이나 가정으로 가져가 버려야 해요. 허락받지 않은 곳에서의 임산물 채취 또한 산림을 훼손하는 일이에요.
                        <div class="rh-back-set rh-pointer" id="back7">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>
                <div class="rh-hiking-wood-main" id="animal">
                    <div class="rh-pointer" id="icon9">
                        <div class="rh-redPin-height">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        <div><img style="margin: 10% 0%" width="45%"
                                  src="/resources/static/img/icon/wildanimals.png"
                                  alt=""></div>
                        <div class="rh-card-set">야생동물 신고</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content9">
                        <div class="rh-redPin-textView">
                            <img class="rh-redPin" src="/resources/static/img/기타/pin.png" alt="">
                        </div>
                        <table class="rh-animal-card" border="1">
                            <tr>
                                <td>지역</td>
                                <td>기관명</td>
                                <td>연락처</td>
                            </tr>
                            <tr>
                                <td>강원</td>
                                <td>강원야생동물구조센터</td>
                                <td>033-250-7504</td>
                            </tr>
                            <tr>
                                <td>
                                    경기<br/>
                                    <span style="font-size: 0.7vw">(남부)</span>
                                </td>
                                <td>경기야생동물구조센터</td>
                                <td>031-8008-6212</td>
                            </tr>
                            <tr>
                                <td>
                                    경기<br/>
                                    <span style="font-size: 0.7vw">(북부)</span>
                                </td>
                                <td>경기북부야생동물관리센터</td>
                                <td>031-8030-4451</td>
                            </tr>
                            <tr>
                                <td>경남</td>
                                <td>경남야생동물센터</td>
                                <td>055-754-9575</td>
                            </tr>
                            <tr>
                                <td>경북</td>
                                <td>경북야생동물구조관리센터</td>
                                <td>054-840-8251</td>
                            </tr>
                            <tr>
                                <td>부산</td>
                                <td>부산야생동물치료센터</td>
                                <td>051-209-2093</td>
                            </tr>
                            <tr>
                                <td>울산</td>
                                <td>울산야생동물구조관리센터</td>
                                <td>052-256-5322</td>
                            </tr>
                            <tr>
                                <td>전남</td>
                                <td>전남야생동물구조관리센터</td>
                                <td>061-749-4800</td>
                            </tr>
                            <tr>
                                <td>전북</td>
                                <td>전북야생동물구조관리센터</td>
                                <td>063-850-0983</td>
                            </tr>
                            <tr>
                                <td>제주</td>
                                <td>제주야생동물구조센터</td>
                                <td>064-752-9982</td>
                            </tr>
                            <tr>
                                <td>충남</td>
                                <td>충남야생동물구조센터</td>
                                <td>041-330-1666</td>
                            </tr>
                            <tr>
                                <td>충북</td>
                                <td>충북야생동물센터</td>
                                <td>043-249-1455</td>
                            </tr>
                            <tr>
                                <td>서울</td>
                                <td>서울시야생동물센터</td>
                                <td>02-880-8659</td>
                            </tr>
                            <tr>
                                <td>대전</td>
                                <td>대전야생동물구조관리센터</td>
                                <td>042-821-7930</td>
                            </tr>
                            <tr>
                                <td>인천</td>
                                <td>인천야생동물구조관리센터</td>
                                <td>032-858-9702</td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <p>
                        <span style="background: yellow">
                        로드킬 등 동물이 죽은 경우
                        </span>
                                        <br/>전국 고속도로:
                                        1588-2504<br/>
                                        고속도로 외 일반도로 및 국도: 지역번호+120/128
                                    </p>
                                    <p>
                                        <span style="background: yellow">위협적인 야생동물을 만나 긴급신고가 필요한 경우</span>
                                        <br/>
                                        119
                                    </p>
                                </td>
                            </tr>
                        </table>
                        <div class="rh-back-set rh-pointer" id="back9">돌아가기 <img width="20%"
                                                                                 src="/resources/static/img/icon/next.png"
                                                                                 alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
