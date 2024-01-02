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

        #cycle-detail-slide {
            width: 35%;
            height: 35vw;
            margin-left: 1vw;
        }

        .swiper-v {
            width: 100%;
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

        /*슬라이드 시작 백그라운드 이미지 관련 코드*/
        #metro-city {
            background-image: url("/resources/static/cycle_detail/Metrocity.jpg");
            background-size: cover;
            width: 100%;
            height: 100%;
            filter: blur(2px);
            z-index: -1;
        }

        #gyeong-gi {
            background-image: url("/resources/static/cycle_detail/Gyeonggi.jpg");
            background-size: cover;
            background-position: right 40% bottom 0px;
            width: 100%;
            height: 100%;
            filter: blur(2px);
            z-index: -1;
        }

        #gang-won {
            background-image: url("/resources/static/cycle_detail/Gangwon.jpg");
            background-size: cover;
            width: 100%;
            height: 100%;
            filter: blur(2px);
            z-index: -1;
        }

        #chung-cheong {
            background-image: url("/resources/static/cycle_detail/Chungcheong.jpg");
            background-size: cover;
            width: 100%;
            height: 100%;
            filter: blur(2px);
            z-index: -1;
        }

        #gyeong-sang {
            background-image: url("/resources/static/cycle_detail/Gyeongsang.jpg");
            background-size: cover;
            width: 100%;
            height: 100%;
            filter: blur(2px);
            z-index: -1;

        }

        #jeol-la {
            background-image: url("/resources/static/cycle_detail/Jeolla.jpg");
            background-size: cover;
            width: 100%;
            height: 100%;
            filter: blur(2px);
            z-index: -1;
        }

        #jeju {
            background-image: url("/resources/static/cycle_detail/Jeju.jpeg");
            background-size: cover;
            background-position: right 60% bottom 0px;
            width: 100%;
            height: 100%;
            filter: blur(2px);
            z-index: -1;
        }

        .thumbnail-txt {
            font-family: 'SOYOMapleBoldTTF';
            position: absolute;
            color: #ffffff;
            font-size: 2vw;
            text-shadow: 2px 2px 1px #275634;
            filter: blur(0);
            z-index: 1;
        }

        /* 슬라이드 가이드 아이콘 */
        #slide-guide {
            position: absolute;
            display: none;
            z-index: 2;
            width: 30%;
            height: 30%;
            top: 50%;
            right: 10%;
        }
        #slide-guide-card:hover #slide-guide{
            display: flex;
            animation: 2.5s ease 0s 1 alternate forwards running slide-guide-motion;
        }
        @keyframes slide-guide-motion {
            0%{left: 10%; top: 50%; transform: translateX(170%)}
            50%{left: 10%; top: 50%; transform: translateX(0)}
            51%{left: 10%; top: 50%; transform: translate(170%, 50%)}
            99%{left: 10%; top: 50%; transform: translate(170%, -180%)}
            100%{visibility: hidden; left: 10%; top: 50%; transform: translate(170%, -180%)}
        }

        @media only screen and (max-width: 430px) and (max-height: 932px){
            .swiper{
                margin-left: auto;
                margin-right: auto;
                position: relative;
                overflow: hidden;
                list-style: none;
                padding: 0;
                z-index: 1;
                display: block;
                height: 65vw;
            }
            #cycle-detail-slide {
                width: 55%;
                height: 35vw;
                margin-left: 1vw;
            }
            .thumbnail-txt {
                font-family: 'SOYOMapleBoldTTF';
                position: absolute;
                color: #ffffff;
                font-size: 4vw;
                text-shadow: 2px 2px 1px #275634;
                filter: blur(0);
                z-index: 1;
            }

        }
    </style>
</head>

<body>
<!-- Swiper -->
<div class="swiper mySwiper1 swiper-h">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <div class="swiper mySwiper2 swiper-v">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" id="slide-guide-card">
                        <div id="metro-city"></div>
                        <span class="thumbnail-txt">광역시</span>
                        <div id="slide-guide"><img src="/resources/static/cycle_detail/slide-guide-icon.png"></div>
                    </div>
                    <c:forEach begin="1" end="22" var="i">
                        <div class="swiper-slide" data-value="${i}"><img src="/resources/static/cycle_detail/${i}.jpg">
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
                        <div class="swiper-slide" data-value="${i}"><img src="/resources/static/cycle_detail/${i}.jpg">
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
                        <div class="swiper-slide" data-value="${i}"><img src="/resources/static/cycle_detail/${i}.jpg">
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
                        <div class="swiper-slide" data-value="${i}"><img src="/resources/static/cycle_detail/${i}.jpg">
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
                        <div class="swiper-slide" data-value="${i}"><img src="/resources/static/cycle_detail/${i}.jpg">
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
                        <div class="swiper-slide" data-value="${i}"><img src="/resources/static/cycle_detail/${i}.jpg">
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
                        <div class="swiper-slide" data-value="${i}"><img src="/resources/static/cycle_detail/${i}.jpg">
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
