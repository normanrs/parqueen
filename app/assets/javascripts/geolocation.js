// function getGeoLocation() {
//   navigator.geolocation.getCurrentPosition(setGeoCookie);
// }
//
// function setGeoCookie(position) {
//   var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
//   document.cookie = "lat_lng=" + escape(cookie_val);
// }
var x = document.getElementById("location");

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else {
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
  x.innerHTML = "Latitude: " + position.coords.latitude +
  "<br>Longitude: " + position.coords.longitude;
}
