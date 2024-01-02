const mapContainer = document.getElementById("cycle-page-map")
const mapOption = {
    center: new kakao.maps.LatLng(37.57295965192006, 126.97690156991),
    level: 5
}

const map = new kakao.maps.Map(mapContainer, mapOption)
const infowindow = new kakao.maps.InfoWindow({ zIndex: 1 })

let latlngBounds = new kakao.maps.LatLngBounds()
let markers = []
let polyline = null
// const mapTypes = kakao.maps.MapTypeId.BICYCLE;
// map.addOverlayMapTypeId(mapTypes);
async function showCycleRoute(trackNumber){
    if(!trackNumber) {
        return
    }
    const reqUrl = "/api/cycle/search/" + trackNumber

    const  {data: resData} = await axios.get(reqUrl)
    deleteMarker()

    const refPosition = []
    for(let i = 0; i < 3; i++){
        if(i === 0) refPosition.push(0)
        else if(i === 2) refPosition.push(resData['path'].length - 1)
        else refPosition.push(resData['path'].length >> 1)
    }

    for(const refPos of refPosition) {
        const makerLngi = resData['path'][refPos].lngi
        const makerLati = resData['path'][refPos].lati
        const coord = new kakao.maps.LatLng(makerLati, makerLngi)
        addMarker(coord, resData)
    }

    const linePath = []
    for(const coord of resData['path']){
        linePath.push(new kakao.maps.LatLng(coord['lati'], coord['lngi']))
    }

    polyline = new kakao.maps.Polyline({
        path: linePath,
        strokeWeight: 5,
        strokeColor: '#0757F8',
        strokeOpacity: 0.8,
        strokeStyle: 'solid'
    })

    polyline.setMap(map)

    displayMarker()
}

function addMarker(coord, resData){
    const marker = new kakao.maps.Marker({
        position: coord
    })

    kakao.maps.event.addListener(marker, 'click', () => {
        map.panTo(coord)
    })

    kakao.maps.event.addListener(marker, 'mouseover', () => {
        infowindow.setContent('<div style="padding: 5px; font-size:12px;">' + resData['name'] + '</div>')
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

    if (polyline !== null) {
        polyline.setMap(null)
    }
    markers = []
    latlngBounds = new kakao.maps.LatLngBounds()
}

function displayMarker(){
    for(const marker of markers){
        marker.setMap(map)
    }
    map.setBounds(latlngBounds)
    markers[0].setMap(null)
    markers[2].setMap(null)
}

// ----------------- 자전거길 플러시 카드 ---------------------------------

const swiper1 = new Swiper(".mySwiper1", {
    direction: "vertical",
    spaceBetween: 50,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
});
const swiper2 = new Swiper(".mySwiper2", {
    effect: "cards",
    grabCursor: true,
    on: {
        realIndexChange: () => {
            const index = swiper2.realIndex
            const current_slide_data = swiper2.slides[index]
            showCycleRoute(current_slide_data.getAttribute("data-value"))
        }
    }
});
const swiper3 = new Swiper(".mySwiper3", {
    effect: "cards",
    grabCursor: true,
    on: {
        realIndexChange: () => {

            const index = swiper3.realIndex
            const current_slide_data = swiper3.slides[index]
            showCycleRoute(current_slide_data.getAttribute("data-value"))
        }
    }
});
const swiper4 = new Swiper(".mySwiper4", {
    effect: "cards",
    grabCursor: true,
    on: {
        realIndexChange: () => {

            const index = swiper4.realIndex
            const current_slide_data = swiper4.slides[index]
            showCycleRoute(current_slide_data.getAttribute("data-value"))
        }
    }
});
const swiper5 = new Swiper(".mySwiper5", {
    effect: "cards",
    grabCursor: true,
    on: {
        realIndexChange: () => {

            const index = swiper5.realIndex
            const current_slide_data = swiper5.slides[index]
            showCycleRoute(current_slide_data.getAttribute("data-value"))
        }
    }
});
const swiper6 = new Swiper(".mySwiper6", {
    effect: "cards",
    grabCursor: true,
    on: {
        realIndexChange: () => {

            const index = swiper6.realIndex
            const current_slide_data = swiper6.slides[index]
            showCycleRoute(current_slide_data.getAttribute("data-value"))
        }
    }
});
const swiper7 = new Swiper(".mySwiper7", {
    effect: "cards",
    grabCursor: true,
    on: {
        realIndexChange: () => {

            const index = swiper7.realIndex
            const current_slide_data = swiper7.slides[index]
            showCycleRoute(current_slide_data.getAttribute("data-value"))
        }
    }
});
const swiper8 = new Swiper(".mySwiper8", {
    effect: "cards",
    grabCursor: true,
    on: {
        realIndexChange: () => {

            const index = swiper8.realIndex
            const current_slide_data = swiper8.slides[index]
            showCycleRoute(current_slide_data.getAttribute("data-value"))
        }
    }
});

// 광역시 이동 기능
function goMetroCity(metroCityBtn){
    const metroNum = metroCityBtn.getAttribute("data-value")
    swiper2.slideTo(0, 100)
    swiper2.slideTo(metroNum, 1000)
    swiper1.slideTo(0, 1000)
}
// 자전거 도로 온오프 기능
let isOverlaying = false
const cycleRoadBtn = document.getElementById("cycle-road-btn")
const cycleRoadGuideDiv = document.getElementById("cycle-road-legend")
cycleRoadBtn.addEventListener('click', (e) =>{
    if (!isOverlaying){
        map.addOverlayMapTypeId(kakao.maps.MapTypeId.BICYCLE)
        cycleRoadGuideDiv.style.display = "block"
        isOverlaying = true
    } else {
        map.removeOverlayMapTypeId(kakao.maps.MapTypeId.BICYCLE)
        cycleRoadGuideDiv.style.display = "none"
        isOverlaying = false
    }
})
// 자전거 도로 범례 변경 버튼
const roadGuide = document.getElementById("road-guide")
const driveway = document.getElementById("driveway")
const amenities = document.getElementById("amenities")
const cycleRoadGuide = document.getElementById("cycle-road-guide")
// 도로안내
roadGuide.addEventListener('click', (e) => {
    cycleRoadGuide.style.backgroundPositionY = "24.2vw"
    cycleRoadGuide.style.height = "8vh"
})

// 진입로
driveway.addEventListener('click', (e) => {
    cycleRoadGuide.style.backgroundPositionY = "28.36vw"
    cycleRoadGuide.style.height = "8.5vh"
})

// 편의시설
amenities.addEventListener('click', (e) => {
    cycleRoadGuide.style.backgroundPositionY = "32.8vw"
    cycleRoadGuide.style.height = "9vh"
})