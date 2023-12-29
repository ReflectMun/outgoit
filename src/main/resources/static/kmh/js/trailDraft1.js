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

searchBox.addEventListener("keyup", (e) => {
    if(e.key === "Enter"){
        submitSearch.click()
    }
})

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
                const url = new URL("http://" + hostName + "/api/trail/search")

                url.searchParams.set("lati", data[0].y)
                url.searchParams.set("lngi", data[0].x)
                // data는 한라산을 검색했을때 한라산에 관련된 모든 정보

                const {data: resData} = await axios.get(url)
                // resData - data에서 등산로만 뽑아냄.
                console.log(data)
                console.log(resData)

                addMarker(data.slice(0, 1), resData, data)
                displayMarker()
                //const = [r,d,q,w,d,s,a,z,,c,,vv,g]

                //MAth.r 1~10d
                for (const trail of resData) {
                    // a[rint]
                    // 이게 등산로 하나.
                    // 이때 색깔 핸덤하나 생성
                    // console.log(resData)
                    //console.log(trail)

                    // console.log(JSON.stringify(resData['properties']['mntn_nm']))
                    //console.log(trail.properties.mntn_nm)
                    const trailLIne = trail['geometry']['coordinates'][0]

                    // console.log(trailLIne)
                    const path = []


                    for (const coord of trailLIne) {
                        path.push(new kakao.maps.LatLng(coord[1], coord[0]))

                    }
                    function getRandomColor() {
                        // 랜덤한 RGB 값을 생성
                        const randomColor = Math.floor(Math.random()*16777215).toString(16);

                        // 생성된 RGB 값을 색상 문자열로 변환
                        return '#' + randomColor;
                    }

                    const polyLine = new kakao.maps.Polyline({
                        path: path,
                        strokeWeight: 5,
                        strokeColor: getRandomColor(),
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
    function addMarker(places, resData, data) {

        for (const place of places) {
            const coord = new kakao.maps.LatLng(place.y, place.x)
            const marker = new kakao.maps.Marker({
                position: coord

            })
            addListElementsToResultList(resData, data)

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



// function makeListElement(name) {
//     // for (n of name) {
//          console.log(name)
//         // console.log(n);
//
//         console.log(name.properties.mntn_nm)
//
//         const child = document.createElement("div")
//         child.classList.add("camping-area-info-box")
//         const childCampingAreaName = document.createElement("div")
//         childCampingAreaName.innerHTML = `<h2>${n.properties.mntn_nm}</h2>`
//         childCampingAreaName.classList.add("camping-area-name")
//         const childButtonWrapper = document.createElement("div")
//
//         const openDetailButton = document.createElement("button")
//
//         openDetailButton.innerText = "캠핑장 정보 보기"
//         openDetailButton.classList.add("open-detail-button")
//         openDetailButton.addEventListener("click", (e) => {
//            const hiddenForm = document.createElement("form")
//             hiddenForm.style.display = "none"
//             hiddenForm.method = "post"
//             hiddenForm.action = `/trail/detail/${n.properties.mntn_nm}`
//             let tempInput
//
//             for (const prop in apiResData) {
//                 tempInput = document.createElement("input")
//                 tempInput.name = prop
//                 tempInput.value = apiResData[prop]
//                 hiddenForm.appendChild(tempInput)
//
//             }
//             document.body.appendChild(hiddenForm)
//
//             hiddenForm.submit()
//         })
//             childButtonWrapper.classList.add("button-wrapper")
//
//
//         childButtonWrapper.appendChild(openDetailButton)
//         child.appendChild(childCampingAreaName)
//
//         child.appendChild(childButtonWrapper)
//         return child
//
//         console.log(11)
//
//     // }
// }

function addListElementsToResultList(name, data) {
    // 등산로만 있는 것임.
    for (const [index, n] of name.entries()) {
        console.log(index)
        console.log(n);
        console.log(n.properties.mntn_nm);

        const child = document.createElement("div");
        child.classList.add("camping-area-info-box");
        const childCampingAreaName = document.createElement("div");
        childCampingAreaName.innerHTML = `<h2>${n.properties.mntn_nm}</h2>`;
        childCampingAreaName.classList.add("camping-area-name");
        const childButtonWrapper = document.createElement("div");

        const openDetailButton = document.createElement("button");
        console.log(n)
        lngi = data[0].x
        lati = data[0].y
        console.log(lngi) // 한라산 국립공원 (마크 핀)의 경도
        console.log(lati) // 한라산 국립공원 위도
        let trailRouteId = n.id
        openDetailButton.innerText = "등산로 정보 보기";
        openDetailButton.classList.add("open-detail-button");
        openDetailButton.addEventListener("click", (e) => {
            const hiddenForm = document.createElement("form");
            hiddenForm.style.display = "none";
            hiddenForm.method = "post";
            hiddenForm.action = `/hiking/detail/${lngi}/${lati}/${index}/${trailRouteId}`;
            // C로 간다

            let tempInput;


                tempInput = document.createElement("input");
                tempInput.name = n;
                tempInput.value = name;
                hiddenForm.appendChild(tempInput);

            document.body.appendChild(hiddenForm);
            hiddenForm.submit();
        });

        childButtonWrapper.classList.add("button-wrapper");

        childButtonWrapper.appendChild(openDetailButton);
        child.appendChild(childCampingAreaName);
        child.appendChild(childButtonWrapper);

        // 각각의 엘리먼트를 직접 추가
        resultList.appendChild(child);
    }



}
