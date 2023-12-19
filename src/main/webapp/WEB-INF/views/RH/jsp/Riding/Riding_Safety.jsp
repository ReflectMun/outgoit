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
    <div class="rh-riding-safety-titleBox">
        <div class="rh-riding-safety-title">
            <div>Safety</div>
            <div style="text-align: right">Information</div>
        </div>
    </div>
    <div class="rh-riding-content">
        <!-- 내용 -->
        <div class="rh-riding-wood">
            <!-- 통나무 -->
            <div class="rh-riding-wood-titleBox">
                <!-- 통나무 타이틀 -->
                <div class="rh-riding-wood-title">
                    숙지해야 할 안전사항을 안내드려요
                </div>
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
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/cross.png" alt="">
                        </div>
                        <div class="rh-card-set">횡단보도</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content1">
                        자전거 횡단보도가 있는 경우를 제외하고는 자전거에서 내려 끌고 가거나 들고 보행해야 해요.
                        <div class="rh-back-set rh-pointer" id="back1">돌아가기 <img width="20%" src="/resources/static/img/icon/next.png" alt=""> </div>
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div class="rh-pointer" id="icon2">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/cyclist.png"
                                  alt=""></div>
                        <div class="rh-card-set">안전장비</div>
                    </div>
                    <div  class="rh-riding-wood-mainPost" id="content2">
                        안전장비 착용은 필수! <br> 안전경, 장갑, 팔다리 보호대, 안전모 등
                        안전장비를 착용해야 해요. 또한 안전모 뒷부분엔 야간 운행에
                        대비해 반사체가 부착돼 있어야 해요.
                        <div class="rh-back-set rh-pointer" id="back2">돌아가기 <img width="20%" src="/resources/static/img/icon/next.png" alt=""> </div>
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div class="rh-pointer" id="icon3">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/light.png" alt="">
                        </div>
                        <div class="rh-card-set">야간 라이딩 시 필요한 것</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content3">
                        전조등과 후미등을 설치해요. 야간에 시야를 확보하고 상대방에게
                        위치를 알려 줌으로 충돌 사고를 예방할 수 있어요.
                        <div class="rh-back-set rh-pointer" id="back3">돌아가기 <img width="20%" src="/resources/static/img/icon/next.png" alt=""> </div>
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div class="rh-pointer" id="icon4">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/speedlimit.png"
                                  alt=""></div>
                        <div class="rh-card-set">속도위반 주의</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content4">
                        자전거는 도로교통법상 '차'에 해당해요. 시속 20km를 준수하며
                        안전거리를 유지해요. 음주 후 라이딩은 절대 금지예요.
                        <div class="rh-back-set rh-pointer" id="back4">돌아가기 <img width="20%" src="/resources/static/img/icon/next.png" alt=""> </div>
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div class="rh-pointer" id="icon5">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/phoneNG1.png"
                                  alt=""></div>
                        <div class="rh-card-set">전자기기 이용</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content5">
                        이어폰, 핸드폰 등은 자전거 운행 시 사용하지 않아요. 네비게이션이
                        필요한 경우, 핸드폰 거치대를 설치해야 해요.
                        <div class="rh-back-set rh-pointer" id="back5">돌아가기 <img width="20%" src="/resources/static/img/icon/next.png" alt=""> </div>
                    </div>
                </div>
                <div class="rh-riding-wood-main">
                    <div class="rh-pointer" id="icon6">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/bikeroad2.png"
                                  alt=""></div>
                        <div class="rh-card-set">자전거 도로</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content6">
                        자전거 도로가 없다면 도로 우측 가장자리에서 자동차와 같은
                        방향으로 직선 주행해야 해요. 보도를 통행할 수 있는 경우는 아래와
                        같아요. <br><br>
                        <div>
                        <div class="rh-riding-wood-mainPost-content6-set">
                            <span>1.&nbsp;&nbsp;</span>
                            <span>어린이, 노인 그 밖에 행정안정부령으로 정하는 신체장애인이 자전거를 운전하는 경우</span>
                        </div>
                        <div class="rh-riding-wood-mainPost-content6-set">
                            <span>2.&nbsp;&nbsp;</span>
                            <span>안전표지로 자전거 통행이 허용된 경우</span>
                        </div>
                        <div class="rh-riding-wood-mainPost-content6-set">
                            <span>3.&nbsp;&nbsp;</span>
                            <span>도로의 파손, 도로 공사나 그 밖의 장애 등으로 도로를 통항핼 수 없는 경우</span>
                        </div>
                    </div>
                        <div class="rh-back-set rh-pointer" id="back6">돌아가기 <img width="20%" src="/resources/static/img/icon/next.png" alt=""> </div>
                    </div>
                </div>
                <div class="rh-riding-wood-main" id="animal">
                    <div class="rh-pointer" id="icon9">
                        <div><img style="margin: 10% 0%" width="45%" src="/resources/static/img/icon/wildanimals.png"
                                  alt=""></div>
                        <div class="rh-card-set">야생동물 신고</div>
                    </div>
                    <div class="rh-riding-wood-mainPost" id="content9">
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
                        <div class="rh-back-set rh-pointer" id="back9">돌아가기 <img width="20%" src="/resources/static/img/icon/next.png" alt=""> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
