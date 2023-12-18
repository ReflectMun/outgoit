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
                    <div id="icon1">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/checklist.png"
                                  alt=""></div>
                        <div class="rh-card-set">탈수 주의...ㅋ</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content1">
                        고열량의 비상식량과 충분한 물을 준비하고, 조금씩 자주 먹어요.
                        탈수, 탈진, 저혈당을 예방할 수 있어요.
                        <div class="rh-back-set" id="back1">돌아가기 <img width="20%" src="/resources/static/img/icon/next.png" alt=""> </div>
                    </div>
                </div>
                <div class="rh-hiking-wood-main">
                    <div id="icon2">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/beeSnake.png"
                                  alt=""></div>
                        <div class="rh-card-set">야생동물 대처방법</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content2" style="margin-top: 10%;">
                       <div>
                           • 벌 <br>
                           말벌집을 발견하면 재빨리 벗어나야 해요. 만약 말벌에 쏘일 경우
                           20m 이상 벗어나 주변에 도움을 요청하세요. 또한 산에 있는 벌들은 어두운 색상을
                           보면 공격성이 강해져요. 되도록 밝은색의 등산복을 착용해 주세요.
                       </div>
                        <div>
                            • 뱀 <br>
                            뱀을 만났다면 되도록 자리를 피하고, 뱀에 물렸다면 상처 부위를
                            헝겊으로 묶은 다음 최대한 빨리 병원에서 치료받아야 해요.
                        </div>
                        <div class="rh-back-set" id="back2">돌아가기 <img width="20%" src="/resources/static/img/icon/next.png" alt=""> </div>
                    </div>
                </div>
                <div class="rh-hiking-wood-main">
                    <div id="icon3">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/hiking.png"
                                  alt=""></div>
                        <div class="rh-card-set">하이킹 시간</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content3">
                        아침 일찍 시작하고 해 지기 한두 시간 전에는 하산해 주세요.
                        하루 최대 8시간 동안 진행하고, 체력의 30%는 비축해요
                        <div class="rh-back-set" id="back3">돌아가기 <img width="20%" src="/resources/static/img/icon/next.png" alt=""> </div>
                    </div>
                </div>
                <div class="rh-hiking-wood-main">
                    <div id="icon4">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/weather2.png"
                                  alt=""></div>
                        <div class="rh-card-set">하이킹 준비</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content4">
                        기상정보를 확인하고 이에 맞는 산행 용품을 준비해 주세요. 체온을
                        잘 유지할 수 있도록 긴 옷을 입고 등산 스틱, 미끄럼 방지 기능이
                        있는 등산화를 갖추는 것이 좋아요.
                        <div class="rh-back-set" id="back4">돌아가기 <img width="20%" src="/resources/static/img/icon/next.png" alt=""> </div>
                    </div>
                </div>
                <div class="rh-hiking-wood-main">
                    <div id="icon5">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/hikingNG.png"
                                  alt=""></div>
                        <div class="rh-card-set">금지사항</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content5">
                        음주, 흡연, 취사는 금지예요. <br/>
                        화재 위험이 있기에 화기는 소지하지 않는 것이 좋아요. <br>
                        또한 음주 후 하이킹 시 혈중 알코올 농도 상승, 혈압 상승 유발로 인한 심뇌혈관질관 위험, 저체온증으로 인한 조난 위험, 낙상 사고 위험이 증가해요.
                        <div class="rh-back-set" id="back5">돌아가기 <img width="20%" src="/resources/static/img/icon/next.png" alt=""> </div>
                    </div>
                </div>
                <div class="rh-hiking-wood-main">
                    <div id="icon6">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/signpost1.png"
                                  alt=""></div>
                        <div class="rh-card-set">현 위치 확인</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content6">
                        현재 위치를 중간중간 확인하여 사고 발생을 대비해요. 만일 사고가
                        발생했을 시 다목적위치표지판을 보고 구조 요청해 주세요.
                        <div class="rh-back-set" id="back6">돌아가기 <img width="20%" src="/resources/static/img/icon/next.png" alt=""> </div>
                    </div>
                </div>
                <div class="rh-hiking-wood-main">
                    <div id="icon7">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/map.png"
                                  alt=""></div>
                        <div class="rh-card-set">등산로 파악</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content7">
                        등산로는 미리 파악해 두고, 지정된 탐방로를 이용해요. 만약 길을
                        잘못 들었다면 원래 있던 곳으로 되돌아 가야 해요.
                        <div class="rh-back-set" id="back7">돌아가기 <img width="20%" src="/resources/static/img/icon/next.png" alt=""> </div>
                    </div>
                </div>
                <div class="rh-hiking-wood-main">
                    <div id="icon8">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/pain.png"
                                  alt=""></div>
                        <div class="rh-card-set">식중독</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content8">
                        계곡물이나 샘물 등은 안전성이 확인되지 않았으니 함부로 마시면 안
                        돼요.
                        <div class="rh-back-set" id="back8">돌아가기 <img width="20%" src="/resources/static/img/icon/next.png" alt=""> </div>
                    </div>
                </div>
                <div class="rh-hiking-wood-main" id="animal">
                    <div id="icon9">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/wildanimals.png"
                                  alt=""></div>
                        <div class="rh-card-set">야생동물 신고</div>
                    </div>
                    <div class="rh-hiking-wood-mainPost" id="content9">
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
                        <div class="rh-back-set" id="back9">돌아가기 <img width="20%" src="/resources/static/img/icon/next.png" alt=""> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
