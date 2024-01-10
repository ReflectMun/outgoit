<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Swiper demo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="/static/css/riding_slider.css"/>
</head>

<body>
<!-- Swiper -->
<div class="swiper mySwiper1 swiper-h swiperHeight">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <div class="swiper mySwiper2 swiper-v">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" id="slide-guide-card">
                        <div id="metro-city"></div>
                        <span class="thumbnail-txt">광역시</span>
                        <div id="slide-guide"><img src="/static/cycle_detail/slide-guide-icon.png"></div>
                    </div>
                    <c:forEach begin="1" end="22" var="i">
                        <div class="swiper-slide" data-value="${i}"><img class="cycle-page-img" src="/resources/static/cycle_detail/${i}.jpg">
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="swiper mySwiper3 swiper-v">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div id="gyeong-gi"></div>
                        <span class="thumbnail-txt">경기도</span>
                    </div>
                    <c:forEach begin="23" end="30" var="i">
                        <div class="swiper-slide" data-value="${i}"><img class="cycle-page-img" src="/resources/static/cycle_detail/${i}.jpg">
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="swiper mySwiper4 swiper-v">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div id="gang-won"></div>
                        <span class="thumbnail-txt">강원도</span>
                    </div>
                    <c:forEach begin="31" end="43" var="i">
                        <div class="swiper-slide" data-value="${i}"><img class="cycle-page-img" src="/resources/static/cycle_detail/${i}.jpg">
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="swiper mySwiper5 swiper-v">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div id="chung-cheong"></div>
                        <span class="thumbnail-txt">충청도</span>
                    </div>
                    <c:forEach begin="44" end="57" var="i">
                        <div class="swiper-slide" data-value="${i}"><img class="cycle-page-img" src="/resources/static/cycle_detail/${i}.jpg">
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="swiper mySwiper6 swiper-v">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div id="jeol-la"></div>
                        <span class="thumbnail-txt">전라도</span>
                    </div>
                    <c:forEach begin="58" end="80" var="i">
                        <div class="swiper-slide" data-value="${i}"><img class="cycle-page-img" src="/resources/static/cycle_detail/${i}.jpg">
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="swiper mySwiper7 swiper-v">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div id="gyeong-sang"></div>
                        <span class="thumbnail-txt">경상도</span>
                    </div>
                    <c:forEach begin="81" end="96" var="i">
                        <div class="swiper-slide" data-value="${i}"><img class="cycle-page-img" src="/resources/static/cycle_detail/${i}.jpg">
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="swiper mySwiper8 swiper-v">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div id="jeju"></div>
                        <span class="thumbnail-txt">제주도</span>
                    </div>
                    <c:forEach begin="97" end="100" var="i">
                        <div class="swiper-slide" data-value="${i}"><img class="cycle-page-img" src="/resources/static/cycle_detail/${i}.jpg">
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>
    <div class="swiper-pagination"></div>
</div>

<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->

</body>

</html>
