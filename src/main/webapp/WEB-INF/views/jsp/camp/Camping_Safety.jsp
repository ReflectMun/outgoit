<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      rel="stylesheet"
      href="/static/css/camping.css"
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
      <div class="rh-camping-safety-titleBox">
        <div class="rh-camping-safety-title">
          <div>Safety</div>
          <div style="text-align: right">Information</div>
        </div>
      </div>
      <div class="rh-camping-content">
        <!-- 내용 -->
        <div class="rh-camping-wood">
          <!-- 통나무 -->
          <div class="rh-camping-wood-titleBox">
            <!-- 통나무 타이틀 -->
            <div class="rh-camping-wood-title" id="campingTitleText">
              숙지해야 할 안전사항을 안내드려요
            </div>
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
              <div class="rh-pointer" id="icon1">
                <div>
                  <div class="rh-redPin-height">
                    <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                  </div>
                  <img style="margin: 10% 0%" width="45%" src="/static/img/icon/card/fire.png" alt="">
                </div>
                <div class="rh-card-set">화재 주의</div>
              </div>
              <div class="rh-camping-wood-mainPost" id="content1">
                <div class="rh-redPin-textView">
                  <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                </div>
                &nbsp;전기용품은 600w 이하로, 화로 이용 시 과대 불판 이용을 삼가고
                잔불 처리를 철저하게 해요. 또한 사이트 내 소화기 위치를 미리 파악해 둬야 해요.
                <div class="rh-back-set rh-pointer" id="back1">돌아가기 <img width="20%" src="/static/img/icon/card/next.png" alt=""> </div>
              </div>
            </div>
            <div class="rh-camping-wood-main">
              <div class="rh-pointer" id="icon2">
                <div>
                  <div class="rh-redPin-height">
                    <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                  </div>
                  <img style="margin: 10% 0%" width="45%" src="/static/img/icon/card/gass.png" alt=""></div>
                <div class="rh-card-set">가스 사용 주의</div>
              </div>
              <div class="rh-camping-wood-mainPost" id="content2">
                <div class="rh-redPin-textView">
                  <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                </div>
                &nbsp;밀폐된 공간에서 가스용품을 사용하면 위험해요. 사용 전 용품에 KC 마크가 있는지
                확인해요.<br>
                &nbsp;또한 겨울철 난방기구 이용 시 환기 가능한 장소에서 사용하고 휴대용 일산화탄소
                경보기를 준비해야 해요.
                <div class="rh-back-set rh-pointer" id="back2">돌아가기 <img width="20%" src="/static/img/icon/card/next.png" alt=""> </div>
              </div>
            </div>
            <div class="rh-camping-wood-main">
              <div class="rh-pointer" id="icon3">
                <div class="rh-redPin-height">
                  <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                </div>
                <div> <img style="margin: 10% 0%" width="45%" src="/static/img/icon/card/foodBear.png" alt=""></div>
                <div class="rh-card-set">야생동물 주의</div>
              </div>
              <div class="rh-camping-wood-mainPost" id="content3">
                <div class="rh-redPin-textView">
                  <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                </div>
                &nbsp;캠핑장에 방치된 음식물은 야생동물을 캠프 사이트로 유인하는
                역할을 해요. 안전한 캠핑을 위해 지정된 장소에 음식물 쓰레기를 배출해 주세요.
                <div class="rh-back-set rh-pointer" id="back3">돌아가기 <img width="20%" src="/static/img/icon/card/next.png" alt=""> </div>
              </div>
            </div>
            <div class="rh-camping-wood-main">
              <div class="rh-pointer" id="icon4">
                <div class="rh-redPin-height">
                  <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                </div>
                <div> <img style="margin: 10% 0%" width="45%" src="/static/img/icon/card/trash2.png" alt=""></div>
                <%--사진 1로 할지 2로 할지 고민--%>
                <div class="rh-card-set">쓰레기 배출</div>
              </div>
              <div class="rh-camping-wood-mainPost" id="content4">
                <div class="rh-redPin-textView">
                  <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                </div>
                &nbsp;캠핑 시 발생하는 쓰레기는 지정된 장소에 분리 배출해야 해요.
                기름이나 오수를 캠핑장 바닥에 버리는 것은 환경오염과 해충 발생의
                원인이 돼요. <br>&nbsp;만약 캠핑장 내에 쓰레기를 배출하는 곳이 없다면 가정으로 가지고 돌아가 배출해야 해요.
                <div class="rh-back-set rh-pointer" id="back4">돌아가기 <img width="20%" src="/static/img/icon/card/next.png" alt=""> </div>
              </div>
            </div>
            <div class="rh-camping-wood-main">
              <div class="rh-pointer" id="icon5">
                <div class="rh-redPin-height">
                  <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                </div>
                <div> <img style="margin: 10% 0%" width="45%" src="/static/img/icon/card/axe2.png" alt=""></div>
                <div class="rh-card-set">위험한 장비</div>
              </div>
              <div class="rh-camping-wood-mainPost" id="content5">
                <div class="rh-redPin-textView">
                  <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                </div>
                &nbsp;망치, 도끼, 팩, 폴, 파일 드라이버 등 충분히 흉기가 될 수 있는 캠핑장비는 사용 후 어린이들의 손이 닿지 않는
                곳에 보관해 주세요.
                <div class="rh-back-set rh-pointer" id="back5">돌아가기 <img width="20%" src="/static/img/icon/card/next.png" alt=""> </div>
              </div>
            </div>

            <div class="rh-camping-wood-main">
              <div class="rh-pointer" id="icon6">
                <div class="rh-redPin-height">
                  <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                </div>
                <div> <img style="margin: 10% 0%" width="45%" src="/static/img/icon/card/campNG.png" alt=""></div>
                <div class="rh-card-set">불법 야영 금지</div>
              </div>
              <div class="rh-camping-wood-mainPost" id="content6">
                <div class="rh-redPin-textView">
                  <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                </div>
                &nbsp;미등록 야영/취사행위 불가지역에서 캠핑을 하면 자연공원법
                제27조에 따라 불법야영은 50만 원 이하의 과태료, 불법취사는 20만
                원 이하의 과태료가 부과돼요.
                <div class="rh-back-set rh-pointer" id="back6">돌아가기 <img width="20%" src="/static/img/icon/card/next.png" alt=""> </div>
              </div>
            </div>
            <div class="rh-camping-wood-main">
              <div class="rh-pointer" id="camping-icon7">
                <div class="rh-redPin-height">
                  <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                </div>
                <div> <img style="margin: 10% 0%" width="45%" src="/static/img/icon/card/weather2.png" alt=""></div>
                <div class="rh-card-set">일기예보 확인</div>
              </div>
              <div class="rh-camping-wood-mainPost" id="camping-content7">
                <div class="rh-redPin-textView">
                  <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                </div>
                &nbsp;캠핑 전 기상 정보를 확인해요. 폭우가 내리면 즉시 철수
                후 안전한 장소로 대피해요. <br>&nbsp;만약 우중캠핑이 목적일 경우, 지대가
                높고 배수 시설이 잘 돼 있는 데크 캠핑장을 선택해요.
                <div class="rh-back-set rh-pointer" id="back7">돌아가기 <img width="20%" src="/static/img/icon/card/next.png" alt=""> </div>
              </div>
            </div>
            <div class="rh-camping-wood-main">
              <div class="rh-pointer" id="icon8">
                <div class="rh-redPin-height">
                  <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                </div>
                <div> <img style="margin: 10% 0%" width="45%" src="/static/img/icon/card/pain.png" alt=""></div>
                <div class="rh-card-set">식중독 예방</div>
              </div>
              <div class="rh-camping-wood-mainPost" id="content8">
                <div class="rh-redPin-textView">
                  <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                </div>
                &nbsp;실온에 오래 둔 음식은 식중독의 원인이 될 수 있으니 되도록 먹지
                않는 것이 좋아요. 또한 생고기, 민물어패류 등 날것은 기생충 감염의 우려가
                있으니 완전히 익혀 먹는 것이 안전해요.
                <div class="rh-back-set rh-pointer" id="back8">돌아가기 <img width="20%" src="/static/img/icon/card/next.png" alt=""> </div>
              </div>
            </div>
            <div class="rh-camping-wood-main" id="animal">
              <div class="rh-pointer" id="icon9">
                <div class="rh-redPin-height">
                  <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
                </div>
                <div> <img style="margin: 10% 0%" width="45%" src="/static/img/icon/card/wildanimals.png" alt=""></div>
                <div class="rh-card-set">야생동물 신고</div>
              </div>
              <div class="rh-camping-wood-mainPost" id="content9">
                <div class="rh-redPin-textView">
                  <img class="rh-redPin" src="/static/img/etc/pin.png" alt="">
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
                      경기<br />
                      <span style="font-size: 0.7vw">(남부)</span>
                    </td>
                    <td>경기야생동물구조센터</td>
                    <td>031-8008-6212</td>
                  </tr>
                  <tr>
                    <td>
                      경기<br />
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
                         <br />전국 고속도로:
                        1588-2504<br />
                        고속도로 외 일반도로 및 국도: 지역번호+120/128
                      </p>
                      <p>
                        <span  style="background: yellow">위협적인 야생동물을 만나 긴급신고가 필요한 경우</span>
                        <br />
                        119
                      </p>
                    </td>
                  </tr>
                </table>
                <div class="rh-back-set rh-pointer" id="back9">돌아가기 <img width="20%" src="/static/img/icon/card/next.png" alt=""> </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
