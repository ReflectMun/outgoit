<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="/resources/static/css_hj/campinformation.css" />
  </head>
  <body>
    <div class="hj-container2">
      <!-- 정보 div -->
      <div class="hj-info">
        <div class="hj-info-box">
          <div class="hj-info-name-img">
            <div class="hj-info-name">캠핑장 이름</div>
          </div>
        </div>
        <!-- 판 밑에 연결하는 div -->
        <div class="hj-contact-box">
          <div class="hj-contact">
            <div class="hj-contact-right"></div>
            <div class="hj-contact-left"></div>
          </div>
        </div>
        <!-- 실제 정보 들어있는 div중 사진 -->
        <div class="hj-content1">
          <div class="hj-content-box">
            <div class="hj-content-pic">
              <div class="hj-content-inside-box">
                <div class="hj-content-img">
                  <div class="hj-content-img-link">
                    <img src="../img/다운로드.jpg" alt="" />
                  </div>
                </div>
                <!-- 정보 부분 -->
                <div class="hj-content-detail">
                  <div class="hj-no">번호:</div>
                  <div class="hj-time">운영 기간 +시간:</div>
                  <div class="hj-addr">주소:</div>
                  <div class="hj-ability">부대시설:</div>
                  <div class="hj-etc">기타사항:</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 코멘트 입력 부분 -->
      <div class="hj-comment">
        <div class="hj-info-box">
          <div class="hj-info-name-img">
            <div class="hj-info-name">Comment</div>
          </div>
        </div>
        <!--  -->
        <div class="hj-contact-box">
          <div class="hj-contact">
            <div class="hj-contact-right"></div>
            <div class="hj-contact-left"></div>
          </div>
        </div>
        <div class="hj-content1">
          <div class="hj-content-box">
            <div class="hj-content-pic">
              <div class="hj-content-inside-box2">
                <div class="hj-content-detail2">
                  <div class="hj-content-zentai-box">
                    <div class="hj-review-star">
                      <div class="hj-star">☆</div>
                      <div class="hj-star">☆</div>
                      <div class="hj-star">☆</div>
                      <div class="hj-star">☆</div>
                      <div class="hj-star">☆</div>
                    </div>
                    <div class="hj-input">
                      <div class="hj-input-content">
                        <div class="hj-nickname">
                          <input type="text" placeholder="닉네임" name="id" />
                        </div>
                        <div class="hj-pw">
                          <input type="text" placeholder="비번" name="pw" />
                        </div>
                      </div>
                      <div class="hj-review-content">
                        <input
                          type="text"
                          placeholder="비방글은 삭제 조치 됩니다."
                        />
                      </div>
                      <div class="hj-btn">
                        <button>확인</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="hj-review">
        <div class="hj-contact-box">
          <div class="hj-contact">
            <div class="hj-contact-right"></div>
            <div class="hj-contact-left"></div>
          </div>
        </div>
        <div class="hj-content1">
          <div class="hj-content-box">
            <div class="hj-content-pic">
              <div class="hj-content-inside-box2">
               
                  <div class="hj-content-detail2">
                    <div class="hj-content-zentai-box">
                      <div class="hj-review-star">
                        <div class="hj-star">☆</div>
                        <div class="hj-star">☆</div>
                        <div class="hj-star">☆</div>
                        <div class="hj-star">☆</div>
                        <div class="hj-star">☆</div>
                      </div>
                      <div class="hj-input">
                        <div class="hj-input-content">
                          <div class="hj-nickname">닉넴</div>
                        </div>
                        <div class="hj-review-content">한줄평</div>
                      </div>
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
