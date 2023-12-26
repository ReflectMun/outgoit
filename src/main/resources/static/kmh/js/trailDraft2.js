const hostName = window.location.host // 호스트 연결을 위해
const mapContainer = document.getElementById("map")
const searchBox = document.getElementById("search-box")
const submitSearch = document.getElementById("submit-search")
const resultList = document.getElementById("search-result-list")
const mapOption = {
    center: new kakao.maps.LatLng(37.57295965192006, 126.97690156991),
    level: 5
}

const map = new kakao.maps.Map(mapContainer, mapOption) // 맵 객체 생성
map.addOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN); // 지도에 산 굴곡 표시
const ps = new kakao.maps.services.Places() // 장소에서 위치 갖고오기
const infowindow = new kakao.maps.InfoWindow({ zIndex: 1 }) // 정보창 불러오기


let markers = []
let polylines = []
let latlngBounds = new kakao.maps.LatLngBounds() // 지도 위치 재설정

try {

    submitSearch.addEventListener('click', async (e) => {
        const inputValue = searchBox.value

        if (!inputValue) {
            alert("검색어를 입력해주세요!")
        }

        deleteMarker() // 검색했을때 기존에 있던 마크 삭제
        resultList.innerText = "" // 검색했을때 기존에 있던 정보들 삭제

        // 카카오 맵 kewordSearch 함수 사용
        // 입력값을 기반으로 장소를 검색함
        ps.keywordSearch(inputValue, async (data, status, pagination) => {
            // inputValue - 검색어.
            // data - 검색 결과를 포함하는 배열. 검색 결과는 콜백 함수의 매개변수로 전달됨.
            // status - 검색 상태.
            // pagination - 검색 결과의 페이지네이션 정보.


                if (status === kakao.maps.services.Status.OK) {
                    addMarker(data.slice(0, 1))
                    displayMarker()

                    const url = new URL("http://" + hostName + "/api/trail/search")

                    url.searchParams.set("lati", data[0].y)
                    url.searchParams.set("lngi", data[0].x)
                    // url.searchParams.set("test", data[0].category_name) // 0번째 배열의 카테고리
                    console.log(data[0].category_name) // ex) 여행 > 관광, 명소 > 등산로

                const {data: resData} = await axios.get(url)
                console.log(resData)
                // resData = FeatureData의 값임!!!!!!!!

                for (const trail of resData) {
                    console.log(trail)
                    // trail = date[0]번째의 geometry 값, properties 값이 들어있음.
                    const trailLIne = trail['geometry']['coordinates'][0]
                    console.log(trailLIne)
                    // resData의 경도 위도의 '값'만 뽑힘. 추출.

                    const path = []

                    for (const coord of trailLIne) {
                        path.push(new kakao.maps.LatLng(coord[1], coord[0]))
                    }

                    const polyLine = new kakao.maps.Polyline({
                        path: path,
                        strokeWeight: 10,
                        strokeColor: '#F7FE2E',
                        strokeOpacity: 0.7,
                        strokeStyle: 'dotted'
                    })

                    polylines.push(polyLine)
                    polyLine.setMap(map)

                }
            }
        })

    })
}
catch (e) {
    console.log(e)
    alert("오류발생")
}
    function addMarker(places) {
        for (const place of places) {
            const coord = new kakao.maps.LatLng(place.y, place.x)
            const marker = new kakao.maps.Marker({
                position: coord
            })

            resultList.appendChild(makeListElement(searchData, apiResData))
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

    function deleteMarker() {
        for (const marker of markers) {
            marker.setMap(null)
        }

        for (const line of polylines) {
            line.setMap(null)
        }


        latlngBounds = new kakao.maps.LatLngBounds()
        markers = []
        polylines = []

    }

    function displayMarker() {
        for (const marker of markers) {
            marker.setMap(map)
        }
        map.setBounds(latlngBounds)
    }

/**
 * <div class="camping-area-info-box">
 *     <div class="camping-area-name">
 *         <h2>캠핑장 이름</h2>
 *     </div>
 *     <div class="button-wrapper">
 *         <button class="open-detail-button">캠핑장 정보 보기<button>
 *     </div>
 * </div>
 * */


// 매개 변수 값을 어디서 갖고 오고 쓰는지 알 수가 없음.
// searchData => 카카오 // apiResData => 우리가 만든 apiData 값

function makeListElement(searchData, apiResData){
    const child = document.createElement("div")
    child.classList.add("hiking-area-info-box")

    const childHikingAreaName = document.createElement("div")
    // apiresData의 값을 어디서도 불러 올 수 없음.
    childHikingAreaName.innerHTML = `<h2>${apiResData['mntn_nm']}</h2>`
    childHikingAreaName.classList.add("hiking-area-name")

    const childButtonWrapper = document.createElement("div")

    const openDetailButton = document.createElement("button")
    openDetailButton.innerText = "등산로 정보 보기"
    openDetailButton.classList.add("open-detail-button")
    openDetailButton.addEventListener("click", (e) => {
        const hiddenForm = document.createElement("form")
        hiddenForm.style.display = "none"
        hiddenForm.method = "post"
        hiddenForm.action = `/trail/detail/${apiResData['mntn_nm']}`

        let tempInput
        for(const prop in apiResData){
            tempInput = document.createElement("input")
            tempInput.name = prop
            tempInput.value = apiResData[prop]

            hiddenForm.appendChild(tempInput)
        }

        document.body.appendChild(hiddenForm)
        hiddenForm.submit()
    })

    childButtonWrapper.classList.add("button-wrapper")
    childButtonWrapper.appendChild(openDetailButton)

    child.appendChild(childHikingAreaName)
    child.appendChild(childButtonWrapper)

    return child
}

