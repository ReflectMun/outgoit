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

    <!-- Demo styles -->
    <style>
        body {
            background: #eee;
            font-size: 14px;
            /*color: #000;*/
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        html,
        body {
            position: relative;
            height: 100%;
        }

        .swiper {
            width: 400px;
            height: 566px;
        }

        .swiper-slide {
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 18px;
            font-size: 22px;
            font-weight: bold;
            /*color: #fff;*/
        }

        img {
            width: 100%;
        }

    </style>
</head>

<body>
<!-- Swiper -->
<div class="swiper mySwiper swiper-h">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <div class="swiper mySwiper2 swiper-v">
                <div class="swiper-wrapper">
                <div class="swiper-slide"> 광역시</div>
                    <c:forEach begin="1" end="22" var="i">
                        <div class="swiper-slide" data-value="${i}"><img src="/resources/static/cycle_detail/${i}.jpg"></div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="swiper mySwiper3 swiper-v">
                <div class="swiper-wrapper">
                <div class="swiper-slide"> 경기도</div>
                    <c:forEach begin="23" end="30" var="i">
                        <div class="swiper-slide" data-value="${i}"><img src="/resources/static/cycle_detail/${i}.jpg"></div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="swiper mySwiper4 swiper-v">
                <div class="swiper-wrapper">
                <div class="swiper-slide"> 강원도</div>
                    <c:forEach begin="31" end="43" var="i">
                        <div class="swiper-slide" data-value="${i}"><img src="/resources/static/cycle_detail/${i}.jpg"></div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="swiper mySwiper5 swiper-v">
                <div class="swiper-wrapper">
                <div class="swiper-slide"> 충청도</div>
                    <c:forEach begin="44" end="57" var="i">
                        <div class="swiper-slide" data-value="${i}"><img src="/resources/static/cycle_detail/${i}.jpg"></div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="swiper mySwiper6 swiper-v">
                <div class="swiper-wrapper">
                <div class="swiper-slide"> 전라도</div>
                    <c:forEach begin="58" end="80" var="i">
                        <div class="swiper-slide" data-value="${i}"><img src="/resources/static/cycle_detail/${i}.jpg"></div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="swiper mySwiper7 swiper-v">
                <div class="swiper-wrapper">
                <div class="swiper-slide"> 경상도</div>
                    <c:forEach begin="81" end="96" var="i">
                        <div class="swiper-slide" data-value="${i}"><img src="/resources/static/cycle_detail/${i}.jpg"></div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="swiper mySwiper8 swiper-v">
                <div class="swiper-wrapper">
                <div class="swiper-slide"> 제주도</div>
                    <c:forEach begin="97" end="100" var="i">
                        <div class="swiper-slide" data-value="${i}"><img src="/resources/static/cycle_detail/${i}.jpg"></div>
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
