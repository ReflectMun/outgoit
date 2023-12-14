<%--
  Created by IntelliJ IDEA.
  User: butterflakes
  Date: 2023/12/11
  Time: 0:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Spring Boot 3 JSP Page</title>
    <meta charset="UTF-8">
</head>
<body>
    <div>
        <div id="map-container" style="width: 500px; height: 400px;"></div>
        <input id="search-box">
        <button id="search-button">검색하기</button>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=770a2850e8ce3177b209d2d94dc1e58b&libraries=services"></script>
    <script>
        const hostName = window.location.host
        const mapContainer = document.getElementById('map-container')
        const searchSubmitButton = document.getElementById("search-button")
        const searchBox = document.getElementById("search-box")

        const mapOption = {
            center: new kakao.maps.LatLng(37.57295965192006, 126.97690156991),
            level: 5
        }
        const map = new kakao.maps.Map(mapContainer, mapOption)
        const geocoder = new kakao.maps.services.Geocoder()
        const infowindow = new kakao.maps.InfoWindow({ zIndex: 1 })

        let latlngBounds = new kakao.maps.LatLngBounds()
        let markers = []

        searchSubmitButton.addEventListener('click', async (e) => {
            const inputValue = searchBox.value
            const reqUrl = "http://" + hostName + "/api/camping/search/" + inputValue
            try{
                const { data: resData }  = await axios.get(reqUrl)

                if(resData[0]['errorMessage']){
                    alert(resData[0]['errorMessage'])
                    return
                }

                deleteMarker()

                for(const campingArea of resData){
                    geocoder.addressSearch(campingArea.addr1, (result, status) => {
                        if(status === kakao.maps.services.Status.OK){
                            const coord = new kakao.maps.LatLng(result[0].y, result[0].x)
                            addMarker(result[0], coord, campingArea.facltNm)
                            displayMarker()
                        }
                    })
                }
            }
            catch (e){
                console.log(e)
            }
        })

        function addMarker(place, coord, areaName){
            const marker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(place.y, place.x)
            })

            kakao.maps.event.addListener(marker, 'click', () => {
                map.panTo(coord)
            })

            kakao.maps.event.addListener(marker, 'mouseover', () => {
                infowindow.setContent('<div style="padding: 5px; font-size:12px;">' + areaName + '</div>')
                infowindow.open(map, marker)
            })

            kakao.maps.event.addListener(marker, 'mouseout', () => {
                infowindow.close()
            })

            latlngBounds.extend(coord)
            markers.push(marker)
        }

        function deleteMarker(){
            for(const marker of markers){
                marker.setMap(null)
            }

            markers = []
            latlngBounds = new kakao.maps.LatLngBounds()
        }

        function displayMarker(){
            for(const marker of markers){
                marker.setMap(map)
            }
            map.setBounds(latlngBounds)
        }
    </script>
</body>
</html>
