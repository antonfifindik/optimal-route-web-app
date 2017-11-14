<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Draggable directions</title>
    <style>
        html, body {
        height: 100%;
        margin: 0;
        padding: 0;
        }
        #map {
        height: 100%;
        float: left;
        width: 63%;
        height: 100%;
        position: fixed !important;
        }
        #right-panel {
        float: right;
        width: 34%;
        height: 100%;
        }
        #right-panel {
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
        }

        #right-panel select, #right-panel input {
        font-size: 15px;
        }

        #right-panel select {
        width: 100%;
        }

        #right-panel i {
        font-size: 12px;
        }

        .panel {
        height: 100%;
        overflow: auto;
        }
    </style>
</head>
<body>
<div id="map"></div>
<div id="right-panel">
    <p>Загальна відстань: <span id="total"></span></p>
</div>
<script>
    
var directionsService;    
var directionsDisplay;   
    
function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
    center: {lat:  49.234167, lng: 28.458371} 
  });
    
    map.setMapTypeId (google.maps.MapTypeId.HYBRID);

  directionsService = new google.maps.DirectionsService;
  directionsDisplay = new google.maps.DirectionsRenderer({
    draggable: false,
    map: map,
    panel: document.getElementById('right-panel')
  });

  directionsDisplay.addListener('directions_changed', function() {
    computeTotalDistance(directionsDisplay.getDirections());
  });

}

        var waypts = [];

        function addAdress(adress) {
            waypts.push({location: adress,
        stopover: true})

            initMap();
        }


function displayRoute(origin, destination, service, display) {
  service.route({
    origin: origin,
    destination: destination,
    waypoints: waypts,
    travelMode: google.maps.TravelMode.DRIVING,
	optimizeWaypoints: true,
    avoidTolls: true
  }, function(response, status) {
    if (status === google.maps.DirectionsStatus.OK) {
      display.setDirections(response);
    } else {
      alert('Could not display directions due to: ' + status);
    }
  });
}

function computeTotalDistance(result) {
  var total = 0;
  var myroute = result.routes[0];
  for (var i = 0; i < myroute.legs.length; i++) {
    total += myroute.legs[i].distance.value;
  }
  total = total / 1000;
  document.getElementById('total').innerHTML = total + ' km';
}
    </script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2yYUDCCpAl1ZiP-pN5Xs6L4Ze2rekTIc&callback=initMap&language=uk">
</script>
</body>
</html>