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
			<li><a href="./home">Замовлення</a></li>
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

<!--   <button class="btn btn-info" type="button" onclick="calculationOfTheOptimalRouteDemo()">Построить оптимальный маршрут без учёта отправителей</button>  -->
   <button style="margin-bottom: 10px; margin-left: 20px;" class="btn btn-success" type="button" onclick="calculationOfTheOptimalRouteNew()"><span style="margin-right: 5px" class="glyphicon glyphicon-road"></span>Прокласти маршрут</button>
   <button style="margin-bottom: 10px; margin-left: 10px;" class="btn btn-primary" type="button" onclick="window.print()"><span style="margin-right: 5px" class="glyphicon glyphicon-print"></span>Роздрук. маршрут</button>
   <button style="margin-bottom: 10px; margin-left: 10px;" class="btn btn-primary" type="button" onclick="cleanMap()"><span style="margin-right: 5px" class="glyphicon glyphicon-globe"></span>Очистити мапу</button>
   
   <div id="canvas"> 
   
   <table id='table'  style="width: 45%; margin-left: 20px; float: left;" class="table table-striped table-hover table-condensed table-responsive table-bordered">
   <th width="5%">id</th>
   <th>Адреса</th>
   <th>Клієнт</th>
   <th width="17%">Відпр/отрим</th>
   <th width="26%"></th>
   <c:forEach var="item" items="${ordersForCourierList}" varStatus="status">
   <tr>
   <td>${item.idOrder}</td>
   <td>${item.address}</td>
   <td>${item.client.getShortName()}</td>
   <td>${item.orderType == 'SENDER' ? 'Відправник':'Отримувач'}</td>
   <td class="active">
   	<a href="./infoOrder?id=${item.idOrder}" class="btn btn-xs btn-warning"  role="button"><span style="margin-right: 5px" class="glyphicon glyphicon-comment"></span>Інфо</a>
     <a href="./trueOrder?id=${item.idOrder}" class="btn btn-xs btn-success"  role="button"><span style="margin-right: 5px" class="glyphicon glyphicon-ok"></span>Виконано</a>
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
    var geocoder;
    var map;
    var waypts = [];
    var markers = [];
    
    function initMap(array) {
    	
    	
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 13,
            center: {lat: 49.234167, lng: 28.458371}
        });
        map.setMapTypeId(google.maps.MapTypeId.HYBRID);
        directionsService = new google.maps.DirectionsService;
        directionsDisplay = new google.maps.DirectionsRenderer({
        	polylineOptions: {
                strokeWeight: 5,
                strokeOpacity: 0.8,
      //          strokeColor:  '#000080'
    //  				strokeColor: '#836FFF'
      					strokeColor: '#009ACD'
            },
            draggable: false,
            map: map,
            suppressMarkers: true
        });
        distanceService = new google.maps.DistanceMatrixService();
        directionsDisplay.addListener('directions_changed', function () {
            computeTotalDistance(directionsDisplay.getDirections());
        });
  
        geocoder = new google.maps.Geocoder();
       	var labels = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16'];
       	 if(array.length > 0) {
       		 for(var i = 0; i < array.length; i++) {
       			addMarkerByAddress(geocoder, map, array[i].address, labels[i], array[i].info, array[i].type);	 
       		 }
       		
       	 }
    }
      
    
    function addMarkerByAddress(geocoder, map, address, newLabel, infoContent, type) {
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
     //       map.setCenter(results[0].geometry.location);
     var contentString = '<div id="content">'+
     '<div id="siteNotice">'+
     '</div>'+
     '<h3 id="firstHeading" class="firstHeading">Інформація</h3><br>'+
     '<div id="bodyContent">'+
     '<p>' +
     '<b>Адреса:</b> ' + address + 
     '</p>' +
     '</div>'+
     '</div>';
     
     var infowindow = new google.maps.InfoWindow({
          content: infoContent
        });
     
     var startColor = '#CDCD00';
     var senderColor = '#B0C4DE';
     var recipientColor = '#FF7F50';
     var image;
     
     if(type == 'start') {
    	 image = {
 				path: 'M 0,0 C -2,-20 -10,-22 -10,-30 A 10,10 0 1,1 10,-30 C 10,-22 2,-20 0,0 z',
 		        fillColor: startColor,
 		        fillOpacity: 1,
 		        strokeColor: '#000',
 		        strokeWeight: 1,
 		        scale: 1.2,
 		       labelOrigin: new google.maps.Point(0, -27)
 		};
     }
     else if(type == 'sender') {
    	 image = {
  				path: 'M 0,0 C -2,-20 -10,-22 -10,-30 A 10,10 0 1,1 10,-30 C 10,-22 2,-20 0,0 z',
  		        fillColor: senderColor,
  		        fillOpacity: 1,
  		        strokeColor: '#000',
  		        strokeWeight: 1,
  		        scale: 1.2,
  		       labelOrigin: new google.maps.Point(0, -27)
  		};
     }
     else if(type == 'recipient') {
    	 image = {
  				path: 'M 0,0 C -2,-20 -10,-22 -10,-30 A 10,10 0 1,1 10,-30 C 10,-22 2,-20 0,0 z',
  		        fillColor: recipientColor,
  		        fillOpacity: 1,
  		        strokeColor: '#000',
  		        strokeWeight: 1,
  		        scale: 1.2,
  		       labelOrigin: new google.maps.Point(0, -27)
  		};
     }

     
            var marker = new google.maps.Marker({
              map: map,
              position: results[0].geometry.location,
              label: {text: newLabel, color: "black"},
              icon: image
            });
			
            marker.addListener('click', function() {
                infowindow.open(map, marker);
              });
            
            
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });	
        
      }
    
    
    function addDirectionMarkers(geocoder, map) {
    		
    		var blabla = ['Вінниця, Соборна, 20', 'Вінниця, Соборна, 50', 'Вінниця, Соборна, 30'];
    	
    		for(var i = 0; i < blabla.length; i++) {
    			addMarkerByAddress(geocoder, map, blabla[i]);
    		}
    		
    		
      }
      
      function addAdress(adress) {
          waypts.push({
              location: adress,
              stopover: true
          });
		
        
  //        initMap();
      }
      
      
      function displayRoute(origin, destination, service, display) {
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
  
         'use strict';
         
         class Order {
        	  constructor(id, address, type, status, shortAddress, shortName) {
        	    this.id = id;
        	    this.address = address;
        	    this.type = type;
        	    this.status = status;
        	    this.shortAddress = shortAddress
        	    this.shortName = shortName;
        	  }
        	}
         
         
         class MarkerInfo {
       	  constructor(address, info, type) {
       	    this.address = address;
       	 	this.info = info;
       	 	this.type = type;
       	  }
       	}
     
         
         var orders = []; // массив объектов типа Order
         var ttable = document.getElementById("table");
         var idRows = 1;
         var idid = [];
         
         function cleanMap() {
       	  waypts = [];
       	  orders = [];
       	  idRows = 1;
       	  initMap();
         }
         
         function calculationOfTheOptimalRoute(origin) {
        	 $.ajax({
                 type: 'GET',
                 url: './getTenAddressesByCourier',
                 success: function (response) {
                 var addresses = [];
                 var destinations = [];
                 
                 for(var i = 0, j = 0; i < response.length; i+=5, j++) {
                	 orders.push(new Order(response[i], response[i + 1], response[i + 2], false, response[i + 3], response[i + 4]));
                	 addresses.push(response[i + 1]);
                	 destinations.push(response[i + 1]);
                 }            
                 
          	  var origin = 'Вінниця, Юності 1';     //начальная точка
          	  
        
          	  
         	  addresses.unshift(origin);
         	 
          	  
               	 
               	distanceService.getDistanceMatrix(
             			  {
             			    origins: addresses,
             			    destinations: destinations,
             			    travelMode: 'DRIVING',
             			    unitSystem: google.maps.UnitSystem.METRIC,
             		        avoidHighways: false,
             		        avoidTolls: false
             			  }, callbackcalculationOfTheOptimalRoute);
                 
               	  
                 },
                 error: function (err) {
                     alert('Error..');
                 }
             });
         }        
         
         function callbackcalculationOfTheOptimalRoute(response, status) {
        	 
        	 var originList = response.originAddresses;
        	 var destinationList = response.destinationAddresses;
        	 var dict = [];
        	 var markersInfo = [];
			 
        	 for(var i = 0; i < orders.length; i++) {
        		 orders[i].address = destinationList[i];
        	 }
        	 
        	 
			 let mapDest = new Map();
        	 
        	 for(var i = 0; i < orders.length; i++) {
        		 mapDest.set(orders[i].id, false); 
        	 }
				   	 
        	 dict.push(originList[0]);
	 
        	 for(var i = 0; i < originList.length; i++) {
        		 
        		 if(dict.length == destinationList.length + 1) {
        			 break;
        		 }
        		 
        		 var minDist = 100000;
        		 var nearestId = 0;
        		 var nearestOrderId = 0;
				
        		 if(dict[dict.length - 1] == originList[i]) {                //если последний элемент в финальной цепочке равен
 
        			 for(var j = 0; j < destinationList.length; j++) {
        				 
        				 if(originList[i] != destinationList[j]) {
        					 					 
        						 if(orders[j].status == false) {
        							 
        							 if(orders[j].type == 'SENDER') {  //если отправитель
						 
   								 if(response.rows[i].elements[j].distance.value < minDist) {
        		            	    			minDist = response.rows[i].elements[j].distance.value;
        		            	    			nearestId = j;          	    		
        		            	    		}				 
        							 }
        							 
        							 if(orders[j].type == 'RECIPIENT' && mapDest.get(orders[j].id) == true) {  //если получатель и отправитель уже добавлен
        								 
        								 if(response.rows[i].elements[j].distance.value < minDist) {
     		            	    			minDist = response.rows[i].elements[j].distance.value;
     		            	    			nearestId = j;  		            	  
     		            	    		}     							 
        							 }      							 
        						 }
        				 }
        			 }
        			 
        			 if(orders[nearestId].type == 'SENDER') {
        				dict.push(destinationList[nearestId]);
                		 orders[nearestId].status = true;
                		 mapDest.set(orders[nearestId].id, true);
                		 
                		 
                		 markersInfo.push(new MarkerInfo(orders[nearestId].address, '<div id="content">'+
                			     '<div id="siteNotice">'+
                			     '</div>'+
                			     '<h3 id="firstHeading" class="firstHeading">Інформація:</h3><br>'+
                			     '<div id="bodyContent">'+
                			     '<p>' +
                			     '<b>Адреса:</b> ' + orders[nearestId].address + 
                			     '<b><br>ID заказу:</b> ' + orders[nearestId].id +
                			     '<b><br>Ім\'я клієнта:</b> ' + orders[nearestId].shortName +
                			     '<b><br>Тип:</b> ' + 'Відправник' +
                			     '</p>' +
                			     '</div>'+
                			     '</div>', 'sender'));
                		 
                		 
                			i = 0;
                			j = 0;
                			 ttable.rows[idRows].cells[0].innerHTML = orders[nearestId].id;
                			 ttable.rows[idRows].cells[1].innerHTML = orders[nearestId].shortAddress;
                			 ttable.rows[idRows].cells[2].innerHTML = orders[nearestId].shortName;
                			 ttable.rows[idRows].cells[3].innerHTML = 'Відправник';
                			 idRows++;
                			
        			 }
        			 if(orders[nearestId].type == 'RECIPIENT') {
        				 dict.push(destinationList[nearestId]);
        				 orders[nearestId].status = true;
        				 
        				 
        				 markersInfo.push(new MarkerInfo(orders[nearestId].address, '<div id="content">'+
                			     '<div id="siteNotice">'+
                			     '</div>'+
                			     '<h3 id="firstHeading" class="firstHeading">Інформація:</h3><br>'+
                			     '<div id="bodyContent">'+
                			     '<p>' +
                			     '<b>Адреса:</b> ' + orders[nearestId].address + 
                			     '<b><br>ID заказу:</b> ' + orders[nearestId].id +
                			     '<b><br>Ім\'я клієнта:</b> ' + orders[nearestId].shortName +
                			     '<b><br>Тип:</b> ' + 'Отримувач' +
                			     '</p>' +
                			     '</div>'+
                			     '</div>', 'recipient'));
 				 
                		 i = 0;
             			 j = 0;
             			
             			 ttable.rows[idRows].cells[0].innerHTML = orders[nearestId].id;
             			 ttable.rows[idRows].cells[1].innerHTML = orders[nearestId].shortAddress;
             			 ttable.rows[idRows].cells[2].innerHTML = orders[nearestId].shortName;
             			 ttable.rows[idRows].cells[3].innerHTML = 'Отримувач';
             		//	 ttable.rows[idRows].cells[3].innerHTML =  ttable.rows[orders[nearestId].id].cells[3].innerHTML;
             			 idRows++;
        			 } 
        		 }
        	 }
     
        	 for(var i = 1; i < dict.length - 1; i++) {
        		 addAdress(dict[i]);
        	 }
       
        	 
        	 markersInfo.unshift(new MarkerInfo(dict[0], '<div id="content">'+
    			     '<div id="siteNotice">'+
    			     '</div>'+
    			     '<h3 id="firstHeading" class="firstHeading">Інформація:</h3><br>'+
    			     '<div id="bodyContent">'+
    			     '<p>' +
    			     '<b>Адреса:</b> ' + dict[0] + 
    			     '<b><br>Тип:</b> ' + 'Початкова адреса та кінцева адреса' +
    			     '</p>' +
    			     '</div>'+
    			     '</div>', 'start'));
        	 
        	 initMap(markersInfo);
        	 displayRoute(dict[0], dict[dict.length - 1], directionsService, directionsDisplay);
    	}
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         function calculationOfTheOptimalRouteNew(origin) {
        	 $.ajax({
                 type: 'GET',
                 url: './getTenAddressesByCourier',
                 success: function (response) {
                 var addresses = [];
                 var destinations = [];
                 
                 for(var i = 0, j = 0; i < response.length; i+=5, j++) {
                	 orders.push(new Order(response[i], response[i + 1], response[i + 2], false, response[i + 3], response[i + 4]));
                	 addresses.push(response[i + 1]);
                	 destinations.push(response[i + 1]);
                 }            
                 
          	  var origin = 'Вінниця, Юності 1';     //начальная точка
         	  addresses.unshift(origin);
               	 
               	distanceService.getDistanceMatrix(
             			  {
             			    origins: addresses,
             			    destinations: destinations,
             			    travelMode: 'DRIVING',
             			    unitSystem: google.maps.UnitSystem.METRIC,
             		        avoidHighways: false,
             		        avoidTolls: false
             			  }, callbackcalculationOfTheOptimalRouteNew);
                 
               	  
                 },
                 error: function (err) {
                     alert('Error..');
                 }
             });
         }        
         
         function callbackcalculationOfTheOptimalRouteNew(response, status) {
				
        	 var originList = response.originAddresses;
        	 var destinationList = response.destinationAddresses;
             let mapDest = new Map;
             
             var minDict = [];
             var currentDict;
             var minFullDistance;
        	 
        	  for(var i = 0; i < orders.length; i++) {
        		 orders[i].address = destinationList[i];
                 mapDest.set(orders[i].id, false); 
        	 }
        	 
             for(var i = 0; i < orders.length; i++) {
                 if(orders[i].type == 'SENDER') {
                	 currentDict = [];
                     currentDict.push(new Order('100', originList[0], 'START', true, 'null', 'null'));
                     currentDict.push(orders[i]);
                	 mapDest.set(orders[i].id, true);
                     orders[i].status = true;
                     
                	 
                     for(var j = 0; j < originList.length; j++) {
                         
                         if(currentDict.length == destinationList.length + 1) {
                             break;
                         }
                         
                         var minDist = 100000;
        		         var nearestId = 0;
                         
                         if(currentDict[currentDict.length - 1].address == originList[j]) {    //если последний адресс в текущем маршруте равен
                             
                             for(var k = 0; k < destinationList.length; k++) {    //j k
                                 
                                 if(originList[j] != destinationList[k]) {
                                     
                                     if(orders[k].status == false) {
                                         
                                            if(orders[k].type == 'SENDER') {
                                                 if(response.rows[j].elements[k].distance.value < minDist) {
        		            	    			minDist = response.rows[j].elements[k].distance.value;
        		            	    			nearestId = k;          	    		
        		            	    		}		
                                            } 
                                            
                                            if(orders[k].type == 'RECIPIENT' && mapDest.get(orders[k].id) == true) {
                                                if(response.rows[j].elements[k].distance.value < minDist) {
        		            	    			minDist = response.rows[j].elements[k].distance.value;
        		            	    			nearestId = k;          	    		
        		            	    		}	
                                            }
                                         
                                     }
                                     
                                     
                                 }
                                 
                                 
                             }
                             if(orders[nearestId].type == 'SENDER') {
                                 currentDict.push(orders[nearestId]);
                                 orders[nearestId].status = true;
                                 mapDest.set(orders[nearestId].id, true);
                                 j = 0;
                                 k = 0;
                             }
                            else if(orders[nearestId].type == 'RECIPIENT') {
                                 currentDict.push(orders[nearestId]);
                                 orders[nearestId].status = true;
                                 j = 0;
                                 k = 0;
                            } 
                            
                         }
                         
                     }    
                
                     
//                   alert(minFullDistance == undefined ? 'ДА!!!!!!!' : 'НЕЕЕЕТ');         
                     
                for(var l = 0; l < orders.length; l++) {
        		 orders[l].status = false;
                 mapDest.set(orders[l].id, false); 
        	 }
                   
                     
                     for(var b = 0; b < currentDict.length; b++) {
                         alert(currentDict[b].address + '   ' + i);
                     }
                     
                 } //конец if(orders[i].type == 'SENDER') 
             }
             
    	}
         

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2yYUDCCpAl1ZiP-pN5Xs6L4Ze2rekTIc&callback=initMap&language=uk">
    async defer></script>
  </body>
</html>