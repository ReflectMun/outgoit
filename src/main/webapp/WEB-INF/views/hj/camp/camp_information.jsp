<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${campingAreaName} 상세정보</title>
    <link rel="stylesheet" href="/resources/static/css_hj/campinformation.css" />
  </head>
  <body>
    <div class="hj-container2">
      <!-- 정보 div -->
      <div class="hj-info">
        <div class="hj-info-box">
          <div class="hj-info-name-img">
            <div class="hj-info-name">${campingAreaName}</div>
          </div>
        </div>
      </div>
      <!-- 판 밑에 연결하는 div -->

      <!-- 실제 정보 들어있는 div중 사진 -->
      <div class="hj-content1">
        <div class="hj-content-box">
          <!-- 칠판 효과 보더준 부분 -->
          <div class="hj-content-pic">
            <!-- 팝업 클릭했을떄 뜨는 디브 -->
            <div class="hj-content-plus-container">
              더보기 정보들 떠야하는 페이지
            </div>
            <div class="hj-overlay-popup"></div>
            <!-- 칠판에 쓰인 분필 -->
            <div class="hj-content-box-comment"><span>OUT GO IT</span></div>
           <!-- 이미지 부분 -->
            <div class="hj-content-inside-box">
              <div class="hj-content-img">
                <div class="hj-content-img-link">
                  <img src="${thumbnail}">
                </div>
              </div>
              <!-- 정보 부분 -->
              <div class="hj-content-detail">
                <div class="hj-no">번호: ${telephoneNumber}</div>
                <div class="hj-time">운영 기간 + 시간: ${periodOfOperation}</div>
                <div class="hj-addr">주소: ${address}</div>
                <div class="hj-ability">부대시설: ${subsidiaryFacilities}</div>
                <div class="hj-etc">기타사항: ${etc}</div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 코멘트 입력 부분 -->
      <div class="hj-comment">
        <div class="hj-info-box">
          <div class="hj-comment-name-img">
            <div class="hj-info-name">Comment</div>
          </div>
        </div>
        <!--  -->

        <div class="hj-content1">
          <div class="hj-content-box">
            <!-- 코멘트 칠판 효과 -->
            <div class="hj-comment-pic">
              <div class="hj-content-inside-box2">
                <div class="hj-content-detail2">
                  <div class="hj-content-zentai-box">
                    <!-- 별부분 -->
                    <div class="hj-review-star">
                      <div class="hj-star">☆</div>
                      <div class="hj-star">☆</div>
                      <div class="hj-star">☆</div>
                      <div class="hj-star">☆</div>
                      <div class="hj-star">☆</div>
                    </div>
                    <!-- 인풋 아이디 비번 부분 -->
                    <div class="hj-input">
                      <div class="hj-input-content">
                        <div class="hj-nickname">
                          <input
                            type="text"
                            class="hj-id-input"
                            placeholder="닉네임"
                            name="author"
                            id="comment-author-input"
                          />
                        </div>
                        <div class="hj-pw">
                          <input
                            type="text"
                            class="hj-pw-input"
                            placeholder="비번"
                            name="password"
                            id="comment-password-input"
                          />
                        </div>
                      </div>
                      <!-- 리뷰부분 -->
                      <div class="hj-review-content">
                        <input
                          type="text"
                          class="hj-review-input"
                          id="comment-content-input"
                          placeholder="비방글은 삭제 조치 됩니다."
                        />
                      </div>
                      <!-- 확인버튼 -->
                      <div class="hj-btn">
                        <button id="comment-submit-button" class="hj-btn-button">확인</button>
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
      <div class="hj-review">
        <div class="hj-content1">
          <div class="hj-review-content2-box">
            <div class="hj-review-pic">

              <!--  칠판 코멘트 -->
              <div class="hj-content-box-comment2"><span>Camping</span></div>
              <div class="hj-review-inside-box2">
                <div class="hj-review-detail2">
                  <div class="hj-review-zentai-box">

                    <!-- 작성된 리뷰들을 개별 출력하는 부분 -->
                    <c:choose>
                      <c:when test="${existReviews}">
                        <c:forEach items="${reviews}" var="review">
                          <!-- 닉넴 한줄평 보여주는 곳  -->
                          <div class="hj-review-content-box">
                            <div class="hj-review-stars">
                              <c:forEach var="i" begin="1" end="5" step="1">
                                <c:choose>
                                  <c:when test="${i > review.rating}">
                                    <div class="hj-review-star">☆</div>
                                  </c:when>
                                  <c:otherwise>
                                    <div class="hj-review-star">별</div>
                                  </c:otherwise>
                                </c:choose>
                              </c:forEach>
                            </div>

                            <br>

                            <div class="hj-review-nickname">닉네임: ${review.author}</div>

                            <div class="hj-review-comment">한줄평: ${review.content}</div>
                            <div class="hj-edit-box">
                              <div class="hj-edit-icon">...</div>
                            </div>
                            <div class="hj-edit-drop">
                              <div><input type="text" placeholder="비밀번호"> </div>
                              <div class="hj-edit-part">수정</div>
                              <div class="hj-edit-part">삭제</div>
                            </div>
                          </div>
                          <!-- 코멘트 보여주는 위치 여기까지 -->
                        </c:forEach>
                      </c:when>
                      <c:otherwise>
                        <h2>아직 작성된 리뷰가 없습니다</h2>
                      </c:otherwise>
                    </c:choose>

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

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="/resources/static/js_hj/campinformation.js"></script>
    <script>
      const commentSubmitButton = document.getElementById("comment-submit-button")
      commentSubmitButton.addEventListener("click", async (e) => {
        const author = document.getElementById("comment-author-input").value
        const password = document.getElementById("comment-password-input").value
        const content = document.getElementById("comment-content-input").value

        if(!author) {
          alert("닉네임을 입력해주세요!")
          return
        }

        if(!password){
          alert("비밀번호를 입력해주세요!")
          return;
        }

        if(!content){
          alert("댓글을 입력해주세요!")
          return;
        }

        try{
          const reqUrl = "/api/review/camping/submit"
          const { data: resData } = await axios.post(
            reqUrl,
            {
              author: author,
              password: password,
              content: content,
              // rating: ,
              campingAreaId: ${campingAreaNumber}
            }
          )

          if(resData['statusCode'] === 200){
            alert("리뷰 작성 성공")
          }
          else{
            alert(resData['errorMessage'])
          }
        }
        catch (e){
          console.log(e)
        }
      })
    </script>
  </body>
</html>
