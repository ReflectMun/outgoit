document.addEventListener('DOMContentLoaded', async function () {

    const trailPath = document.getElementById("trail-area-path").value
    const trailString = '['+trailPath+']';
    const trailPathArray = JSON.parse(trailString);




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
    showTrailLine()
    function showTrailLine() {
        try {
            deleteMarker()
            let refPosition = []
            for (let i = 0; i < 3; i++) {
                if (i === 0) refPosition.push(0)
                else if (i === 2) refPosition.push(trailPathArray[0].length - 1)
                else refPosition.push(trailPathArray[0].length >> 1)
            }
            for (const refPos of refPosition) {
                const makerLngi = trailPathArray[0][refPos][0]
                const makerLati = trailPathArray[0][refPos][1]
                const coord = new kakao.maps.LatLng(makerLati, makerLngi)
                addMarker(coord)
            }

            const path = []


            for (const coord of trailPathArray) {
                for (const line of coord) {

                    path.push(new kakao.maps.LatLng(line[1], line[0]))
                }
            }

            const polyLine = new kakao.maps.Polyline({
                path: path,
                strokeWeight: 6.5,
                strokeColor: '#1c6f1c',
                strokeOpacity: 1,
                strokeStyle: 'solid'
            })


            polylines.push(polyLine)
            polyLine.setMap(map)
            displayMarker()


        } catch (e) {
            console.log(e)
            alert("오류발생")
        }
    }
    function addMarker(coord){
        const marker = new kakao.maps.Marker({
            position: coord
        })

        latlngBounds.extend(coord)
        markers.push(marker)
    }

    function displayMarker(){
        for (const marker of markers){
            marker.setMap(map)
        }
        map.setBounds(latlngBounds)
        for (let i =0; i <markers.length; i++){
            markers[i].setMap(null)
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
});