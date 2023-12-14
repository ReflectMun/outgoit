const mapContainer = document.getElementById("map")
const mapOption = {
    center: new kakao.maps.LatLng(37.57295965192006, 126.97690156991),
    level: 5
}
const map = new kakao.maps.Map(mapContainer, mapOption)
const geocode = new kakao.maps.services.Geocoder()
const infowindow = new kakao.maps.InfoWindow({ zIndex: 1 })

let latlngBounds = new kakao.maps.LatLngBounds()
let markers = []