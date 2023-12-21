const hostName = window.location.host
const mapContainer = document.getElementById("map")
const searchBox = document.getElementById("search-box")
const submitSearch = document.getElementById("submit-search")
const resultList = document.getElementById("search-result-list")
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
submitSearch.addEventListener("click", async (e) => {
    const searchKeyword = searchBox.value
    if(!searchKeyword) {
        alert("검색어를 입력해주세요!")
    }
    const reqUrl = "http://" + hostName + "/api/cycle/search/" + searchKeyword

    const  {data: resData} = await axios.get(reqUrl)
    deleteMarker()
    resultList.innerText = ""

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
})

function addMarker(coord, resData){
    const marker = new kakao.maps.Marker({
        position: coord
    })
// 아직 구현 안해봄
//     resultList.appendChild(makeListElement(searchRes, resData))

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

/**
 * <div class="camping-area-info-box">
 *     <div class="camping-area-name">
 *         <h2>자전거길 이름</h2>
 *     </div>
 *     <div class="button-wrapper">
 *         <button class="open-detail-button">자전거길 정보 보기<button>
 *     </div>
 * </div>
 * */
function makeListElement(searchData, apiResData){
    const child = document.createElement("div")
    child.classList.add("camping-area-info-box")

    const childCycleRouteName = document.createElement("div")
    childCycleRouteName.innerHTML = `<h2>${apiResData}</h2>`
    childCycleRouteName.classList.add("camping-area-name")

    const childButtonWrapper = document.createElement("div")

    const openDetailButton = document.createElement("button")
    openDetailButton.innerText = "자전거길 지도 크게 보기"
    openDetailButton.classList.add("open-detail-button")
    openDetailButton.addEventListener("click", (e) => {
        alert(apiResData)
    })

    childButtonWrapper.classList.add("button-wrapper")
    childButtonWrapper.appendChild(openDetailButton)

    child.appendChild(childCycleRouteName)
    child.appendChild(childButtonWrapper)

    return child
}
