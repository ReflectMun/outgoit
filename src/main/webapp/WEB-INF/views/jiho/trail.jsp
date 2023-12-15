<%--
  Created by IntelliJ IDEA.
  User: butterflakes
  Date: 2023/12/12
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    let map = new kakao.maps.Map(mapContainer, mapOption)
    const ps = new kakao.maps.services.Places()
    const infowindow = new kakao.maps.InfoWindow({ zIndex: 1 })

    let markers = []
    let polylines = []
    let latlngBounds = new kakao.maps.LatLngBounds()

    searchSubmitButton.addEventListener("click", async (e) => {
      const inputValue = searchBox.value

      deleteMarker()

      ps.keywordSearch(inputValue, async (data, status, pagination) => {
        if(status === kakao.maps.services.Status.OK){


          addMarker(data.slice(0, 1))
          displayMarker()

          const baseUrl = new URL("http://" + hostName + "/api/trail/search")

          baseUrl.searchParams.set("lati", data[0].y)
          baseUrl.searchParams.set("lngi", data[0].x)

          const { data: resData } = await axios.get(baseUrl)

          for(const trail of resData){
            const trailLine = trail['geometry']['coordinates'][0]
            const path = []

            for(const coord of trailLine){
              path.push(new kakao.maps.LatLng(coord[1], coord[0]))
            }

            const polyline = new kakao.maps.Polyline({
              path: path,
              strokeWeight: 5,
              strokeColor: '#F7819F',
              strokeOpacity: 0.7,
              strokeStyle: 'solid'
            })

            polylines.push(polyline)
            polyline.setMap(map)
          }
        }
      })
    })

    function addMarker(places){
      for(const place of places){
        const coord = new kakao.maps.LatLng(place.y, place.x)
        const marker = new kakao.maps.Marker({
          position: coord
        })

        kakao.maps.event.addListener(marker, 'click', () => {
          map.panTo(coord)
        })

        kakao.maps.event.addListener(marker, 'mouseover', () => {
          infowindow.setContent('<div style="padding: 5px; font-size:12px;">' + place['place_name'] + '</div>')
          infowindow.open(map, marker)
        })

        kakao.maps.event.addListener(marker, 'mouseout', () => {
          infowindow.close()
        })

        latlngBounds.extend(coord)
        markers.push(marker)
      }
    }

    function deleteMarker(){
      for(const marker of markers){
        marker.setMap(null)
      }

      for(const line of polylines){
        line.setMap(null)
      }

      latlngBounds = new kakao.maps.LatLngBounds()
      markers = []
      polylines = []
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
