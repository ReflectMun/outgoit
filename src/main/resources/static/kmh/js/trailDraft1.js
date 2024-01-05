const hostName = window.location.host
const mapContainer = document.getElementById("map")
const searchBox = document.getElementById("search-box")
const submitSearch = document.getElementById("submit-search")
const resultList = document.getElementById("search-result-list")
const mapOption = {
    center: new kakao.maps.LatLng(37.57295965192006, 126.97690156991), level: 5
}

const map = new kakao.maps.Map(mapContainer, mapOption)
map.addOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN);
const ps = new kakao.maps.services.Places()
const infowindow = new kakao.maps.InfoWindow({zIndex: 1})

let markers = []
let polylines = []
let latlngBounds = new kakao.maps.LatLngBounds()
let polyLineId = 0; // 폴리라인에 아이디 부여하려고 만듬

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
                // console.log(data)
                // console.log(resData)
                // resData - data에서 get요청으로 검색된 등산로만 뽑아내서 담음.


                // displayMarker()
                //const = [r,d,q,w,d,s,a,z,,c,,vv,g]

                //MAth.r 1~10d
                let index = 0;

                const trailName = [] // 등산로 이름 담을 배열
                // 경도 위도 뽑는 작업
                polyLineId = 0;
                for (const trail of resData){
                    trailName.push([trail.properties.mntn_nm, trail.id]) // 배열에 추가하기
                }
                addMarker(data.slice(0, 1), resData, data, trailName)
                for (const trail of resData) {
                    
                    const trailLIne = trail['geometry']['coordinates'][0]

                    const path = []



                    for (const coord of trailLIne) {
                        path.push(new kakao.maps.LatLng(coord[1], coord[0]))

                    }





                    // [
                    //     ['중복1', '중복1', '중복1'], // 중복된 이름들의 그룹
                    //     ['중복X1']
                    //     ['중복X2']
                    //     ['중복X3']
                    // ]
                    // 이렇게 만들어주는 메서드...ㅜㅜ
                    // function groupAndUniqueNames(trailName) {
                    //     const trailRoutes = {};
                    //     const duplicates = [];
                    //     trailName.forEach((item) => {
                    //         if (!trailRoutes[item]) {
                    //             trailRoutes[item] = [];
                    //         } else {
                    //             if (!duplicates.includes(item)) {
                    //                 duplicates.push(item); // 중복된 이름들의 그룹에 추가
                    //             }
                    //         }
                    //         trailRoutes[item].push(item);
                    //     });
                    //
                    //     const sameTrailRoutes = Object.values(trailRoutes).filter((group) => group.length > 1);
                    //     const uniqueNames = trailName.filter((item) => !duplicates.includes(item)); // 중복되지 않은 이름들의 배열
                    //
                    //     const result = sameTrailRoutes.concat(uniqueNames.map((name) => [name])); // 중복된 이름들의 그룹과 중복되지 않은 이름들을 각자의 배열로 재구성
                    //
                    //     return result;
                    // }
                    //
                    // const groupedAndUniqueNames = groupAndUniqueNames(trailName);
                    // console.log(groupedAndUniqueNames); // 중복된 이름들의 그룹과 각각의 중복되지 않은 이름이 별도의 배열로 담긴 배열

                    // // 이름을 그룹화하여 객체들을 묶는 함수
                    // function groupAndUniqueNames(resData) {
                    //     const grouped = {};
                    //
                    //     resData.forEach((resData) => {
                    //         const name = resData.properties.mntn_nm;
                    //
                    //         if (!grouped[name]) {
                    //             grouped[name] = [];
                    //         }
                    //         grouped[name].push(resData);
                    //     });
                    //
                    //     const result = [];
                    //     const groupedNames = Object.keys(grouped);
                    //
                    //     groupedNames.forEach((name) => {
                    //         result.push(grouped[name]);
                    //     });
                    //
                    //     return result;
                    // }
                    //
                    // const groupedAndUnique = groupAndUniqueNames(data);
                    // console.log(groupedAndUnique);

                    // 같은 이름의 등산로는 같은 색으로 만들기

                    // // 그룹된 선의 색으로 변환하는 메서드
                    // function getRandomPastelRainbowColor() {
                    //     const pastelRainbowColors = [
                    //         '#ff92ae', // 빨간색
                    //         '#ff9e57', // 주황색
                    //         '#ffd97b', // 노란색
                    //         '#caff6e', // 초록색
                    //         '#98eeff', // 연하늘색
                    //         '#0080ff', // 파란색
                    //         '#ca93ff'  // 보라색
                    //     ];
                    //
                    //     const randomColorIndex = Math.floor(Math.random() * pastelRainbowColors.length);
                    //     return pastelRainbowColors[randomColorIndex];
                    // }
                    //
                    // groupedDuplicates.forEach((group) => {
                    //     const color = getRandomPastelRainbowColor(); // 각 그룹에 랜덤 색상을 선택합니다.
                    //     group.forEach((trailName) => {
                    //         const polyline = findPolylineByTrailName(trailName); // 산책로 이름에 해당하는 폴리라인 객체를 찾습니다.
                    //         if (polyline) {
                    //             polyline.setStrokeColor(color); // 폴리라인 객체의 strokeColor를 랜덤 색상으로 변경합니다.
                    //         }
                    //     });
                    // });



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

                    // ex) 한라산을 검색했을때 생성되는 폴리라인 5개의 경도,위도 주소값 배열로 담김.





                    // 마커 등산로 별로 만들기 테스트 중
                    const trailInfoBox = document.getElementsByClassName("camping-area-info-box")
                    console.log(trailInfoBox)
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


// function addListElementsToResultList(name, data) {

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

function addListElementsToResultList(name, data, trailName) {
    // 등산로만 있는 것임.
        // console.log(index)
        // console.log(n);
        // console.log(n.properties.mntn_nm);
        // let trailRouteNames = []; // 추출한 등산로의 name값만 담을 것임.
        // const nameCount = {};
        // const numberedNames = [];
        //
        // trailName.forEach(name => {
        //     if (!nameCount[name]) {
        //         nameCount[name] = 1;
        //         numberedNames.push(name);
        //     } else {
        //         nameCount[name]++;
        //         const numberedName = `${name} ${nameCount[name]}`;
        //         numberedNames.push(numberedName);
        //     }
        // });

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


            // console.log(index)
            // console.log(n);
            // console.log(n.properties.mntn_nm); // 산 이름


            // 변경된 이름 출력 또는 사용

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
                // C로 간다

                let tempInput;


                tempInput = document.createElement("input");
                tempInput.name = n;
                tempInput.value = name;
                hiddenForm.appendChild(tempInput);

                document.body.appendChild(hiddenForm);
                hiddenForm.submit();

                // trailRouteNames.push(trailName);
                // 배열에 뽑은 trailName 추가
            });


            childButtonWrapper.classList.add("button-wrapper");

            childButtonWrapper.appendChild(openDetailButton);
            child.appendChild(childCampingAreaName);
            child.appendChild(childButtonWrapper);

            // 각각의 엘리먼트를 직접 추가
            resultList.appendChild(child);
        }


    }
