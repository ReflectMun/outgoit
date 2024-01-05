<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OUT GO IT - main</title>
    <link rel="stylesheet" href="/resources/static/kmh/css/main.css">
    <link rel="stylesheet" href="/resources/static/kmh/css/main_media.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
</head>
<body>
<!-- 헤더 영역 -->

<div class="header"></div>

<!-- 컨테이너 영역 -->

<div class="mh-container">

    <!-- 배너 영역 (슬라이드 들어가면 좋을듯!) -->
    <div class="mh-banner-wrap camp swiper mySwiper">
        <div class="mh-banner swiper-wrapper">
            <div class="swiper-slide"><img src="/resources/static/kmh/img/Campingbanner.png"></div>
            <div class="swiper-slide"><img src="/resources/static/kmh/img/Campingbanner1.png"></div>
            <div class="swiper-slide"><img src="/resources/static/kmh/img/Campingbanner2.png"></div>
            <div class="swiper-slide"><img src="/resources/static/kmh/img/Campingbanner3.png"></div>
            <%--                <div class="swiper-slide"><img src="../kmh/img/camping_banner.jpg"></div>--%>
        </div>
        <div class="mh-banner-txt-wrap">
            <div class="mh-banner-title">
                <%--                        <span>CAMPING</span>--%>
                <div class="mh-banner-sub-txt">
                    <span> &nbsp; Campsite &nbsp; Campfire &nbsp; Tent Pitching &nbsp; Sleeping Bag &nbsp; Fishing Spot &nbsp; Sunrise/Sunset Views &nbsp; Stargazing &nbsp; Nature Exploration &nbsp; Outdoor Enthusiast </span>
                </div>
            </div>
        </div>
    </div>


    <!-- 배너 여기까지 / 컨텐트 영역 (지도 API)-->

    <div class="mh-content">
        <%--            날씨 부분--%>
        <div class="mh-weather-container">
            <div class="swiper" id="weather-list-swiper">
                <div class="swiper-wrapper">
                    <c:forEach var="data" items="${weathers}">
                        <div class="swiper-slide">
                            <span>${data.area}</span>&nbsp;
                            </nbsp><img style="width: 1.3vw; height: auto;" src="/resources/static/img/weather/${data.weatherIcon}.png" alt="">&nbsp;
                            <span>${data.temperature}℃</span>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
<%--            search--%>
        <div class="mh-map-txt-wrap">
            <div class="mh-map-title">
                <span> Camping Area Search </span>
            </div>
            <div class="mh-map-sub-txt">
                <span> 원하는 지역의 캠핑장을 찾아 캠핑을 즐기세요!</span>
            </div>
        </div>
        <div class="mh-search-wrap">
            <div class="mh-background-map">
                <div class="mh-area-search">
                    <input class="mh-search-input" id="search-box" placeholder="검색하고 싶은 지역을 입력해주세요"
                           onfocus="this.placeholder=''" onblur="this.placeholder='검색하고 싶은 지역을 입력해주세요'">
                    <button class="mh-button" id="submit-search"><span>Search</span></button>
                </div>
                <div class="mh-map-all">
                    <div id="map"></div>
                    <div id="search-result-list"><h1></h1></div>
                </div>
            </div>
        </div>
    </div>

    <!-- 컨텐트 영역 여기까지 -->

</div>

<!--컨테이너 여기까지 -->

<!-- 모달창 영역 -->

<!-- 모달창 영역 여기까지-->

<!-- 푸터 영역 -->

<div class="footer"></div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=770a2850e8ce3177b209d2d94dc1e58b&libraries=services"></script>
<script>
    var swiper = new Swiper(".mySwiper", {
        loop: true,
        autoplay: {
            delay: 5000,
        },
    });
</script>
<script src="/resources/static/rh/js/banner.js"></script>
<script type="text/javascript" src="/resources/static/kmh/js/draft1.js"></script>

</body>
</html>