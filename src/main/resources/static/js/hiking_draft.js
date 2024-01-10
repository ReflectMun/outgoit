const hostName = window.location.host
const mapContainer = document.getElementById("map")
const searchBox = document.getElementById("search-box")
const submitSearch = document.getElementById("submit-search")
const resultList = document.getElementById("search-result-list")
const mapOption = {
    center: new kakao.maps.LatLng(37.57295965192006, 126.97690156991), level: 5
}

const map = new kakao.maps.Map(mapContainer, mapOption)

// 지도에 지형정보 버튼 기능
let isTerrainAdded = false;
const trailTerrain = document.getElementById("trail-road-btn")
trailTerrain.addEventListener('click', (e) =>{
    if (!isTerrainAdded) {
        map.addOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN);
        isTerrainAdded = true;
    } else {
        map.removeOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN);
        isTerrainAdded = false;
    }
})

const ps = new kakao.maps.services.Places()
const infowindow = new kakao.maps.InfoWindow({zIndex: 1})

let markers = []
let polylines = []
let latlngBounds = new kakao.maps.LatLngBounds()

searchBox.addEventListener("keyup", (e) => {
    if (e.key === "Enter") {
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
                // resData - data에서 get요청으로 검색된 등산로만 뽑아내서 담음.

                let index = 0;
                const trailName = [] // 등산로 이름 담을 배열
                // 경도 위도 뽑는 작업

                // 겹치는 이름 넘버링 작업을 위한 배열 만들기
                // 배열에 이름, 아이디값만 넣기
                for (const trail of resData){
                    trailName.push([trail.properties.mntn_nm, trail.id]) // 이름, 아이디값 추가하기
                }

                addMarker(data.slice(0, 1), resData, data, trailName)

                for (const trail of resData) {
                    const trailLIne = trail['geometry']['coordinates'][0]
                    const path = []

                    for (const coord of trailLIne) {
                        path.push(new kakao.maps.LatLng(coord[1], coord[0]))

                    }


                    // 지정된 무지개색 7가지 랜덤으로 뽑는 메서드
                    function getRandomPastelRainbowColor() {

                        const pastelRainbowColors = ['#ff92ae', // 빨간색
                            '#ff9e57', // 주황색
                            '#ffd97b', // 노란색
                            '#caff6e', // 초록색
                            '#98eeff', // 연하늘색
                            '#0080ff', // 파란색
                            '#ca93ff'  // 보라색
                        ];

                        // 랜덤한 인덱스 선택
                        const randomColor = Math.floor(Math.random() * pastelRainbowColors.length);


                        // 랜덤한 파스텔 무지개 색상 반환
                        return pastelRainbowColors[randomColor];
                    }

                    // 기존 폴리라인
                    const polyLine = new kakao.maps.Polyline({
                        path: path,
                        strokeWeight: 6.5,
                        strokeColor: getRandomPastelRainbowColor(),
                        strokeOpacity: 1,
                        strokeStyle: 'solid',
                    })


                    polylines.push(polyLine)
                    polyLine.setMap(map)

                    // 마커 등산로 별로 만들기 테스트 중
                    const trailInfoBox = document.getElementsByClassName("camping-area-info-box")
                    let refPosition = trailLIne.length >> 1;
                    const trailRouteCoordX = trailLIne[refPosition][0]
                    const trailRouteCoordY = trailLIne[refPosition][1]
                    addHiddenMarker(trailRouteCoordX, trailRouteCoordY, trailInfoBox[index])
                    index = index + 1;
                }


                displayMarker()

            }
        })

    })
} catch (e) {
    console.log(e)
    alert("오류발생")
}



function addMarker(places, resData, data, trailName) {

    for (const place of places) {
        const coord = new kakao.maps.LatLng(place.y, place.x)
        const marker = new kakao.maps.Marker({
            position: coord

        })
        addListElementsToResultList(resData, data, trailName)

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





function addHiddenMarker(x, y, infoBox) {
    const coord = new kakao.maps.LatLng(y, x)
    const marker = new kakao.maps.Marker({
        position: coord
    })

    infoBox.addEventListener('click', (e) => {
        map.panTo(coord)
    })

    latlngBounds.extend(coord)
    markers.push(marker)
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
    for (let i = 1; i < markers.length; i++) {
        markers[i].setMap(null)
    }
}


function addListElementsToResultList(name, data, trailName) {

        // 중복된 이름 체크, 중복된 이름에는 넘버링
        const nameCountMap = new Map();
        const result = trailName.map(([name, id]) => {
            if (!nameCountMap.has(name)) {
                nameCountMap.set(name, 1);
            } else {
                const count = nameCountMap.get(name) + 1;
                nameCountMap.set(name, count);
            }

            const count = nameCountMap.get(name);
            const numberedName = count > 1 ? `${name} 루트${count}` : name;

            return [numberedName, id];
        });

        for (const [index, n] of result.entries()) {

            const child = document.createElement("div");
            child.classList.add("camping-area-info-box");
            const childCampingAreaName = document.createElement("div");
            childCampingAreaName.innerHTML = `<span>${n[0]}</span>`;
            childCampingAreaName.classList.add("camping-area-name");
            childCampingAreaName.setAttribute("data-value", n); // n 자체를 값을 넣어버림?
            const childButtonWrapper = document.createElement("div");

            const openDetailButton = document.createElement("button");
            lngi = data[0].x
            lati = data[0].y
            let trailRouteId = n.id
            openDetailButton.innerText = "등산로 정보 보기";
            openDetailButton.classList.add("open-detail-button");
            openDetailButton.addEventListener("click", (e) => {
                const hiddenForm = document.createElement("form");
                hiddenForm.style.display = "none";
                hiddenForm.method = "post";
                hiddenForm.action = `/hiking/detail/${lngi}/${lati}/${index}/${trailRouteId}`;

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
