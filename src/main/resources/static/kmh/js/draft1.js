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
const geocoder = new kakao.maps.services.Geocoder()
const infowindow = new kakao.maps.InfoWindow({ zIndex: 1 })

let latlngBounds = new kakao.maps.LatLngBounds()
let markers = []

submitSearch.addEventListener("click", async (e) => {
    const searchKeyword = searchBox.value
    if(!searchKeyword) {
        alert("검색어를 입력해주세요!")
    }
    const reqUrl = "http://" + hostName + "/api/camping/search/" + searchKeyword

    try{
        const { data: resData } = await axios.get(reqUrl)

        if(resData[0]['errorMessage']){
            alert(resData[0]['errorMessage'])
            return
        }

        deleteMarker()
        resultList.innerText = ""

        for(const campingAreaData of resData){
            geocoder.addressSearch(campingAreaData['addr1'], (result, status) => {
                if(status === kakao.maps.services.Status.OK){
                    const coord = new kakao.maps.LatLng(result[0].y, result[0].x)
                    addMarker(result[0], coord, campingAreaData)
                    displayMarker()
                }
            })
        }
    }
    catch (e){
        alert("오류발생")
        console.log(e)
    }
})

function addMarker(searchRes, coord, resData){
    const marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(searchRes.y, searchRes.x)
    })

    resultList.appendChild(makeListElement(searchRes, resData))

    kakao.maps.event.addListener(marker, 'click', () => {
        map.panTo(coord)
    })

    kakao.maps.event.addListener(marker, 'mouseover', () => {
        infowindow.setContent('<div style="padding: 5px; font-size:12px;">' + resData['facltNm'] + '</div>')
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
function makeListElement(searchData, apiResData){
    const child = document.createElement("div")
    child.classList.add("camping-area-info-box")

    const childCampingAreaName = document.createElement("div")
    childCampingAreaName.innerHTML = `<h2>${apiResData['facltNm']}</h2>`
    childCampingAreaName.classList.add("camping-area-name")

    const childButtonWrapper = document.createElement("div")

    const openDetailButton = document.createElement("button")
    openDetailButton.innerText = "캠핑장 정보 보기"
    openDetailButton.classList.add("open-detail-button")
    openDetailButton.addEventListener("click", (e) => {
        const hiddenForm = document.createElement("form")
        hiddenForm.style.display = "none"
        hiddenForm.method = "post"
        hiddenForm.action = `/camping/detail/${apiResData['facltNm']}`

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

    child.appendChild(childCampingAreaName)
    child.appendChild(childButtonWrapper)

    return child
}