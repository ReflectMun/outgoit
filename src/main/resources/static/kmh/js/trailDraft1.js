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
map.addOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN);
const ps = new kakao.maps.services.Places()
const infowindow = new kakao.maps.InfoWindow({ zIndex: 1 })

let markers = []
let polylines =[]
let latlngBounds = new kakao.maps.LatLngBounds()

try {


    submitSearch.addEventListener('click', async (e) => {
        const inputValue = searchBox.value
        if (!inputValue) {
            alert("검색어를 입력해주세요!")
        }

        deleteMarker()
        resultList.innerText = ""

         ps.keywordSearch(inputValue, async (data, status, pagination) => {

            if (status === kakao.maps.services.Status.OK) {
                const url = new URL("http://" + hostName + "/api/trail/search"+inputValue)

                url.searchParams.set("lati", data[0].y)

                url.searchParams.set("lngi", data[0].x)



                 const {data: resData} = await axios.get(url)

                 addMarker(data.slice(0, 1), resData)
                displayMarker()

                for (const trail of resData) {

                     console.log(JSON.stringify(resData, null, 2))
                    const trailLIne = trail['geometry']['coordinates'][0]

                     //console.log(trailLIne)
                    const path = []


                    for (const coord of trail) {
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
    function addMarker(places, resData) {
        for (const place of places) {
            const coord = new kakao.maps.LatLng(place.y, place.x)
            const marker = new kakao.maps.Marker({
                position: coord

            })
            //resultList.appendChild(makeListElement(resData))
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
        for (const polyLine of polylines) {
            polyLine.setMap(null)
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



function makeListElement(apiResData){
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
        hiddenForm.action = `/trail/detail/${apiResData['facltNm']}`

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

