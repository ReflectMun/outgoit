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
const ps = new kakao.maps.services.Places()
const infowindow = new kakao.maps.InfoWindow({ zIndex: 1 })

let markers = []
let polylines =[]
let latlngBounds = new kakao.maps.LatLngBounds()

submitSearch.addEventListener('click', async (e) => {
    const inputValue = searchBox.value

    deleteMarker()

    ps.KeywordSerch(inputValue, async (data, status, pagination) =>
    {
        if (status === kakao.maps.services.Status.OK) {

            addMarker(data.slice(0, 1))
            displayMarker()


            const url = new URL("http://" + hostName + "/api/trail/search")

            url.searchParams.set("lati", data[0].y)
            url.searchParams.set("lngi", data[0].x)

            const {data: resData} = await axios.get(url)

            for (const trail of resData) {
                const trailLIne = trail['geometry']['coordinates'][0]
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





