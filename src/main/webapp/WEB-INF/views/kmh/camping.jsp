<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OUT GO IT - main</title>
    <link rel="stylesheet" href="/resources/static/kmh/css/main.css">
</head>
<body>
    <!-- 헤더 영역 -->
    <div class="header"></div>
    <!-- 컨테이너 영역 -->
    <div class="container">
        <!-- 배너 영역 (슬라이드 들어가면 좋을듯!) -->
        <div class="banner-wrap camp">
            <div class="banner">
                <div class="banner-txt-wrap">
                    <div class="banner-title">
                        <span>CAMPING</span>
                    </div>
                     <div class="banner-sub-txt"> 
                        <span> 캠핑에 대한 간단한 케치프레이즈 ^0^ </span>
                    </div>
                </div>
            </div>
        </div> 
        <!-- 배너 여기까지 / 컨텐트 영역 (지도 API)-->
        <div class="content">
            <div class="map-txt-wrap">
                <div class="map-title">
                    <span> Search </span>
                </div>
                <div class="map-sub-txt">
                    <span> 간단한 기능 설명하는 문장 하나 들어가면 좋을듯</span>
                </div>
            </div>
            <div class="map-wrap">
                <div class="map-all">
                    <div id="map"></div>
                    <div class="search-result-list"><h1>리스트 띄워주는 div</h1></div>
                </div>
            </div>
        </div>
        <!-- 컨텐트 영역 여기까지 -->
    </div> 
    <!--컨테이너 여기까지 -->
    <!-- 푸터 영역 -->
    <div class="footer"></div>

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=770a2850e8ce3177b209d2d94dc1e58b&libraries=services"></script>
    <script type="text/javascript" src="/resources/static/kmh/js/camping_area_search.js"></script>
</body>
</html>