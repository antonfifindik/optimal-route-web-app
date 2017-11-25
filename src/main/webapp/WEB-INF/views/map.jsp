<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>  
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  
           <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>  
           <script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>            
           <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css" />  
			<script  src="https://cdn.datatables.net/plug-ins/1.10.16/i18n/Ukrainian.json"></script>
			
						
	<style>
	
	.out {
    margin: 20px;
}
	
	.bottom {
	margin-bottom: 10px;
	}
	
	</style>
    
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 65%;
        width: 50%;
        margin-right: 20px;
        float: right; 
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
  
  <nav class="navbar navbar-default">
<div class="container-fluid">
	<div class="navbar-header">
		<a href="./home" class="navbar-brand">OPTIMAL ROUTE</a>
		</div>	
	<div>
		<ul class="nav navbar-nav">
			<li><a href="./home">Закази</a></li>
			<li><a href="addresses">Адреси</a></li>
			<li><a href="clients">Клієнти</a></li>
			<li><a href="couriers">Кур'єри</a></li>
			<li class="active"><a href="map">Побудова маршруту</a></li>
		</ul>
		 <ul class="nav navbar-nav navbar-right">
		 <li><a href="#">${account}</a></li>
            <li><a href="login">Вихід</a></li>
          </ul>
	</div>
</div>
</nav>

<div class="out" align="left">
<div class="page-header">
  <h1>Побудова маршруту</h1>  
  </div>
  </div>
 <button class="btn" type="button" onclick="addAddressAsyncFirst()">Добавить первый адрес</button>
  <button class="btn" type="button" onclick="addAddressAsyncSecond()">Добавить второй адрес</button>
   <button class="btn" type="button" onclick="addAddressAsyncThird()">Добавить третий адрес</button>
   <button type="button" onclick="displayRouteAsync()">displayRouteAsync</button>
   <button type="button" onclick="addArrayAdressesAsync()">addArrayAddresses</button>
    <div id="map"></div>
    <script>
    var directionsService;
    var directionsDisplay;

    var map;

    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 11,
            center: {lat: 49.234167, lng: 28.458371}
        });

        map.setMapTypeId(google.maps.MapTypeId.HYBRID);

        directionsService = new google.maps.DirectionsService;
        directionsDisplay = new google.maps.DirectionsRenderer({
            draggable: false,
            map: map,
         
        });

        directionsDisplay.addListener('directions_changed', function () {
            computeTotalDistance(directionsDisplay.getDirections());
        });

    }
      
      
      var waypts = [];

      function addAdress(adress) {
          waypts.push({
              location: adress,
              stopover: true
          })

        //  map.addAdress(adress);
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
          }, function (response, status) {
              if (status === google.maps.DirectionsStatus.OK) {
                  display.setDirections(response);
              } else {
                  alert('Could not display directions due to: ' + status);
              }
          });
      }
    
      function addAddressAsyncFirst(adress) {
     	 $.ajax({
              type: 'GET',
              url: './getNewAddressFirst',
              data: {
                  nameOfVar: 'Address from request'
              },
              success: function (response) {
            	  
            	  addAdress(response);
           			addAdress('Vinnitsa, Lesi Ukrainky, 20');
           	
           			displayRouteAsync();
                 		
                 		
                 		
                 
						
              },
              error: function (err) {
                  alert('ERROR ');
              }
          });
      }
      
      function addAddressAsyncSecond(adress) {
      	 $.ajax({
               type: 'GET',
               url: './getNewAddressSecond',
               data: {
                   nameOfVar: 'Address from request'
               },
               success: function (response) {
                 
                       
                  		 addAdress(response)
                  		displayRouteAsync();
                 
               },
               error: function (err) {
                   alert('ERROR ');
               }
           });
       }
      
      
      function addAddressAsyncThird(adress) {
      	 $.ajax({
               type: 'GET',
               url: './getNewAddressThird',
               data: {
                   nameOfVar: 'Address from request'
               },
               success: function (response) {
                
                       
                  		 addAdress(response)
                  		
                  		displayRouteAsync();
                   
               },
               error: function (err) {
                   alert('ERROR ');
               }
           });
       }
      
      
      function addArrayAdressesAsync() {

          $.ajax({
              type: 'GET',
              url: './getArrayAddresses',
              success: function (response) {

            	  for (var i = 0; i < response.length; i++) {
            		  addAdress(response[i]);
            		}
            	  displayRouteAsync();
              },
              error: function (err) {
                  alert('ERROR displayRouteAsync function or in getAddresses controller');
              }
          });
      }
      
      
      
      
      function displayRouteAsync() {

          $.ajax({
              type: 'GET',
              url: './getAddresses',
              success: function (response) {

                  displayRoute(
                      response[0],
                      response[1],
                      directionsService,
                      directionsDisplay
                      
                  )
              },
              error: function (err) {
                  alert('ERROR displayRouteAsync function or in getAddresses controller');
              }
          });
      }
      
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2yYUDCCpAl1ZiP-pN5Xs6L4Ze2rekTIc&callback=initMap&language=uk">
    async defer></script>
  </body>
</html>