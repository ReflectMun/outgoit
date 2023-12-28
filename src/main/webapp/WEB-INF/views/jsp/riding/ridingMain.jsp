<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OUT GO IT - riding </title>
    <link rel="stylesheet" href="/resources/static/kmh/css/main.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
</head>
<body>
    <!-- 헤더 영역 -->

    <div class="header"></div>

    <!-- 컨테이너 영역 -->

    <div class="container">

        <!-- 배너 영역 (슬라이드 들어가면 좋을듯!) -->

        <div class="banner-wrap camp swiper mySwiper">
            <div class="banner swiper-wrapper">
                <div class="swiper-slide"><img src="../kmh/img/riding_banner.jpg"></div>
                <div class="swiper-slide"><img src="../kmh/img/riding_banner.jpg"></div>
                <div class="swiper-slide"><img src="../kmh/img/riding_banner.jpg"></div>
                <div class="swiper-slide"><img src="../kmh/img/riding_banner.jpg"></div>
                <div class="swiper-slide"><img src="../kmh/img/riding_banner.jpg"></div>
            </div>
                <div class="banner-txt-wrap">
                    <div class="banner-title">
<%--                        <span>HKING</span>--%>
                         <div class="banner-sub-txt">
                            <span> &nbsp; Campsite &nbsp; Campfire &nbsp; Tent Pitching &nbsp; Sleeping Bag &nbsp; Fishing Spot &nbsp; Sunrise/Sunset Views &nbsp; Stargazing &nbsp; Nature Exploration &nbsp; Outdoor Enthusiast </span>
                         </div>
                    </div>
                </div>
        </div>

        <!-- 배너 여기까지 / 컨텐트 영역 (지도 API)-->

        <div class="content">
            <div class="map-txt-wrap">
                <div class="map-title">
                    <span>  </span>
                </div>
                <div class="map-sub-txt">
                    <span> 간단한 기능 설명하는 문장 하나 들어가면 좋을듯</span>
                </div>
            </div>
            <div class="metro-city-btn-menu">
                <div class="metro-city-btns">
                    <div class="metro-city-btn orange-btn" data-value="1" onclick="goMetroCity(this)">서울</div>
                    <div class="metro-city-btn orange-btn" data-value="7" onclick="goMetroCity(this)">인천</div>
                    <div class="metro-city-btn blue-btn" data-value="14" onclick="goMetroCity(this)">대전</div>
                    <div class="metro-city-btn blue-btn" data-value="21" onclick="goMetroCity(this)">세종</div>
                    <div class="metro-city-btn green-btn" data-value="10" onclick="goMetroCity(this)">광주</div>
                    <div class="metro-city-btn pink-btn" data-value="2" onclick="goMetroCity(this)">부산</div>
                    <div class="metro-city-btn pink-btn" data-value="5" onclick="goMetroCity(this)">대구</div>
                    <div class="metro-city-btn pink-btn" data-value="17" onclick="goMetroCity(this)">울산</div>
                </div>
            </div>
            <div class="search-result">
                <div class="map-all">
                    <div id="cycle-page-map"></div>
                    <div id="cycle-detail-slide"><jsp:include page="../../ms/pdf_test.jsp"></jsp:include></div>
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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=770a2850e8ce3177b209d2d94dc1e58b&libraries=services"></script>

    <script>
        var swiper = new Swiper(".mySwiper", {
            loop: true,
            autoplay: {
                delay: 5000,
            },
        });
    </script>
    <script type="text/javascript" src="/resources/static/ms/js/map.js"></script>
</body>
</html>