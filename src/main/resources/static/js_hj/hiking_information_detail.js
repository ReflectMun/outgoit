document.addEventListener('DOMContentLoaded', async function () {
    const trailPath = document.getElementById("trail-area-path").value
    console.log(trailPath)
    const trailString = '['+trailPath+']';
    const trailPathArray = JSON.parse(trailString);
    const longitudes = trailPathArray.map(coord => coord[0][0]);
    const latitudes = trailPathArray.map(coord => coord[0][1]);
    console.log(longitudes)

// 경도와 위도의 평균값을 계산합니다.
    const averageLongitude = longitudes.reduce((acc, val) => acc + val, 0) / longitudes.length;
    const averageLatitude = latitudes.reduce((acc, val) => acc + val, 0) / latitudes.length;
    let markers = []

    const hostName = window.location.host
    const mapContainer = document.getElementById("hj-map-container")
    const mapOption = {
        center: new kakao.maps.LatLng(37.57295965192006, 126.97690156991),
        level: 5
    }

    const map = new kakao.maps.Map(mapContainer, mapOption)
    map.addOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN);

    let polylines =[]
    let latlngBounds = new kakao.maps.LatLngBounds()

  try {
      const path = []


      for (const coord of trailPathArray) {

          for(const line of coord) {

              path.push(new kakao.maps.LatLng(line[1], line[0]))
          }
      }

      const polyLine = new kakao.maps.Polyline({
          path: path,
          strokeWeight: 6.5,
          strokeColor: '#FF0000',
          strokeOpacity: 1,
          strokeStyle: 'solid'
      })

      function setCenter() {
          // 이동할 위도 경도 위치를 생성합니다
          let moveLatLon = new kakao.maps.LatLng(averageLatitude, averageLongitude);

          // 지도 중심을 이동 시킵니다
          map.setCenter(moveLatLon);
      }

      function panTo() {
          // 이동할 위도 경도 위치를 생성합니다
          let moveLatLon = new kakao.maps.LatLng(averageLatitude, averageLongitude);

          // 지도 중심을 부드럽게 이동시킵니다
          // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
          map.panTo(moveLatLon);
      }


      setCenter()
      panTo()
      polylines.push(polyLine)
      polyLine.setMap(map)
  }
  catch (e){
        console.log(e)
      alert("오류발생")
  }
});