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
    
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
  </head>
  <body>
  
  <nav class="navbar navbar-inverse">
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
		 <li><a href="#">${account.login}</a></li>
            <li><a href="login">Вихід</a></li>
          </ul>
	</div>
</div>
</nav>

<div class="out" align="left">
<div class="page-header">
  <h1>Побудова маршруту <span class="label label-primary">кур'єр: ${account.login}</span></h1>  
  </div>
  </div>

   <button class="btn btn-info" type="button" onclick="calculationOfTheOptimalRouteDemo()">Построить оптимальный маршрут без учёта отправителей</button>
   <button class="btn btn-primary" type="button" onclick="calculationOfTheOptimalRoute()">Построить оптимальный маршрут</button>
   
   <div> 
   
   <table  style="width: 45%; margin-left: 20px; float: left;" class="table table-striped table-hover table-condensed table-responsive table-bordered">
   <th width="5%">id</th>
   <th>Адреса</th>
   <th width="17%">Відпр/отрим</th>
   <th width="26%"></th>
   <c:forEach var="item" items="${ordersForCourierList}" varStatus="status">
   <tr>
   
   <td>${item.idOrder}</td>
   <c:if test="${item.orderType == 'SENDER'}">
   <td class='info'>${item.address}</td>
   </c:if>
   <c:if test="${item.orderType == 'RECIPIENT'}">
   <td class='warning'>${item.address}</td>
   </c:if>
   <c:if test="${item.orderType == 'SENDER'}">
   <td class='info'>${item.orderType == 'SENDER' ? 'Відправник':'Отримувач'}</td>
   </c:if>
   <c:if test="${item.orderType == 'RECIPIENT'}">
   <td class='warning'>${item.orderType == 'SENDER' ? 'Відправник':'Отримувач'}</td>
   </c:if>
   <td class="active">
   	<a href="./infoOrder?id=${order.id}" class="btn btn-xs btn-warning"  role="button"><span style="margin-right: 5px" class="glyphicon glyphicon-map-marker"></span>Інфо</a>
     <a href="./trueOrder?id=${order.id}" class="btn btn-xs btn-success"  role="button"><span style="margin-right: 5px" class="glyphicon glyphicon-ok"></span>Виконано</a>
   </td>
   </tr>
   </c:forEach>   
   </table>
   
   </div>
   
   
    <div id="map"></div>
    <script>
    var directionsService;
    var directionsDisplay;
    var distanceService;
    
    var map;

    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 12,
            center: {lat: 49.234167, lng: 28.458371}
        });

        map.setMapTypeId(google.maps.MapTypeId.HYBRID);

        directionsService = new google.maps.DirectionsService;
        directionsDisplay = new google.maps.DirectionsRenderer({
            draggable: false,
            map: map,
         
        });
        distanceService = new google.maps.DistanceMatrixService();

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
      
      
      
      function displayRouteDemo(origin, destination, service, display) {
          service.route({
              origin: origin,
              destination: destination,
              waypoints: waypts,
              travelMode: google.maps.TravelMode.DRIVING,
              optimizeWaypoints: false,
              avoidTolls: true
          }, function (response, status) {
              if (status === google.maps.DirectionsStatus.OK) {
                  display.setDirections(response);
              } else {
                  alert('Could not display directions due to: ' + status);
              }
          });
      }
    
         
         function calculationOfTheOptimalRouteDemo(origin) {
        	 $.ajax({
                 type: 'GET',
                 url: './getNewAddressAll',
                 success: function (response) {

                	 
                	var addresses = response; 
               	  var origin = 'Вінниця, Юності 1';
            	  addresses.unshift(origin);
            	  
            	  alert(addresses);
               	  
               	  distanceService.getDistanceMatrix(
               			  {
               			    origins: addresses,
               			    destinations: response,
               			    travelMode: 'DRIVING',
               			    unitSystem: google.maps.UnitSystem.METRIC,
               		        avoidHighways: false,
               		        avoidTolls: false
               			  }, callbackcalculationOfTheOptimalRouteDemo);
               	  
               	  
                 },
                 error: function (err) {
                     alert('Error..');
                 }
             });
         }
         
         
         function callbackcalculationOfTheOptimalRouteDemo(response, status) {
        	 var originList = response.originAddresses;
        	 var destinationList = response.destinationAddresses;
        	 var dict = [];
        	 dict.push(originList[0]);
        	 let mapDest = new Map();
        	 
        	 for(var i = 0; i < destinationList.length; i++) {
        		 mapDest.set(destinationList[i], false);
        		 
        	 }
        	 alert(mapDest.size);
	 
        	 for(var i = 0; i < originList.length; i++) {
        		 
        		 if(dict.length == destinationList.length) {
        			 break;
        		 }
        		 
        		 var minDist = 10000;
        		 var nearestId = 0;
				
        		 if(dict[dict.length - 1] == originList[i]) {                //если последний элемент в финальной цепочке равен
        			 for(var j = 0; j < destinationList.length; j++) {
            	    	 if(originList[i] != destinationList[j] && mapDest.get(destinationList[j]) == false) {
            	    		if(response.rows[i].elements[j].distance.value < minDist) {
            	    			minDist = response.rows[i].elements[j].distance.value;
            	    			nearestId = j;
       
            	    		}
            	    	 }
            	    	 
            	     }
            		 dict.push(destinationList[nearestId]);
            		 mapDest.set(destinationList[nearestId], true);
            		 mapDest.set(originList[i], true);
            			i = 0;
            			j = 0;
        		 }
  
       
        	 }
     
        	 for(var i = 1; i < dict.length - 1; i++) {
        		 addAdress(dict[i]);
        	 }
        	 
        	 displayRouteDemo(dict[0], dict[dict.length - 1], directionsService, directionsDisplay);
    	}
         
         
         
         
         
         
         
         
         
         
         
         function calculationOfTheOptimalRoute(origin) {
        	 $.ajax({
                 type: 'GET',
                 url: './getTenAddressesByCourier',
                 success: function (response) {

                 for(var i = 0; i < response.length; i++) {
                	 alert(response[i]);
                 }
                	
               	  
               	  
                 },
                 error: function (err) {
                     alert('Error..');
                 }
             });
         }
         
         
         function callbackcalculationOfTheOptimalRoute(response, status) {
        	 
    	}

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2yYUDCCpAl1ZiP-pN5Xs6L4Ze2rekTIc&callback=initMap&language=uk">
    async defer></script>
  </body>
</html>