 <%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Out Go It</title>
    <link rel="stylesheet" type="text/css" href="/resources/static/css/footer.css">
    <link rel="stylesheet" type="text/css" href="/resources/static/css/header.css">
    <link rel="stylesheet" type="text/css" href="/resources/static/css/menu.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="/resources/static/js/menu.js"></script>
  </head>
  <body>





  <%-- 헤더 시작 --%>
    <div class="hj-container">
      <div class="hj-header">
        <div class="hj-logo-container" onclick="location.href='/hiking'">
          <div class="hj-logo">  </div>
          <!-- 로고 이미지 넣기 -->
          <div class="hj-title">시간을 느리게, 경험을 깊게</div>
          <!-- 글자 나중에    -->
        </div>
        <div class="hj-right">
          <div class="hj-tracking hj-font" onclick="location.href='/camping'">
            <span>C</span><span>a</span><span>m</span><span>p</span
          ><span>i</span><span>n</span><span>g</span>
          </div>
          <div class="hj-tracking hj-font" onclick="location.href='/hiking'">
            <span>H</span><span>i</span><span>k</span><span>i</span><span>n</span><span>g</span>
          </div>
          <div class="hj-riding hj-font" onclick="location.href='/riding'">
            <span>R</span><span>i</span><span>d</span><span>i</span
          ><span>n</span><span>g</span>
          </div>
          <div class="hj-menu-tab"><div class="hj-menu-icon" id="icon"></div></div>
        </div>
      </div>

      <%-- 헤더 끝--%>

      <%-- 메뉴 디브--%>
      <div class="hj-overlay" id="hj-overlay">
        <div class="hj-star-container">
        </div>
        <div class="hj-star-container-2"></div>
        <div class="hj-star-container-3"></div>
        <div class="hj-star-container-4"></div>
        <div class="hj-box-1">
          <div class="hj-row-1">
            <div class="hj-col-1">
              <div class="hj-menu-icon-2"></div>
            </div>
          </div>
        </div>

        <div class="hj-box">
          <div class="hj-row hj-menu-txt">
            <div class="hj-col">
              <lavel><div class="hj-home" id="hj-home" onclick="location.href='/hiking'"><span>Home</span></div></lavel>


            </div>
          </div>
        </div>
        <div class="hj-box">
          <div class="hj-row hj-menu-txt">
            <div class="hj-col-2">
              <div class="hj-story" onclick="location.href='/hiking/history'"><span>하이킹 이야기</span></div>

            </div>
          </div>
        </div>
        <div class="hj-box">
          <div class="hj-row hj-menu-txt">
            <div class="hj-col-3">
              <div class="hj-info" onclick="location.href='/hiking/safety'"><span>안전 정보</span></div>

            </div>
          </div>
        </div>
        <div class="hj-box">
          <div class="hj-row hj-menu-txt">
            <div class="hj-col-4">
              <div class="hj-guide" onclick="location.href='/hiking/beginner'"><span>초보자 가이드</span></div>

            </div>
          </div>
        </div>

        <div class="hj-menu-img"></div>

      </div>

      <%-- 메뉴 끝--%>

      <%-- contents page--%>
      <div class="hj-camping-content-page">
        <jsp:include page="${hikingContentPage}" />
        <!-- 컨텐츠 페이지 인클루드로 설정 -->
      </div>

      <%-- 컨텐트 페이지 끝--%>

      <!-- 푸터 시작 -->
      <div class="hj-container-footer">
        <div class="hj-footer-pic">
          <img src="/resources/static/img/header_footer/tree.png" alt=""/>
        </div>
        <div class="hj-footer">
          <div class="hj-footer-box hj-footer-box-first">
            <div class="hj-footer-garo">
              <div class="hj-footer-col">
                <div class="hj-footer-logo"></div>
                <div class="hj-footer-kobox">
                  <div class="hj-footer-kozin">
                    <span onclick="">개인정보 처리 방침</span>
                  </div>
                  <div class="hj-footer-design">
                    <span onclick="location.href='/design'">디자인 출처</span>
                  </div>
                </div>
              </div>
            </div>
            <div class="hj-footer-garo2">
              <div class="hj-footer-col">

                <div class="hj-footer-kobox2">
                  <div class="hj-footer-tel">
                    <div class="hj-tel-icon"></div>
                    <div class="hj-tel"><sapn>telephone</sapn></div>
                  </div>
                  <div class="hj-footer-location">
                    <div class="hj-location-icon"></div>
                    <div class="hj-location"><sapn>location</sapn></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="hj-footer-box2">
            <div class="hj-footer-garo3">
              <div class="hj-footer-col">

                <div class="hj-footer-kobox3">
                  <div class="hj-footer-camp" onclick="location.href='/camping'">

                  </div>
                  <div class="hj-footer-tracking" onclick="location.href='/hiking'">

                  </div>
                  <div class="hj-footer-riding" onclick="location.href='/riding'">
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
