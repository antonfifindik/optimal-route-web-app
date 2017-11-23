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
  
    <div id="map"></div>
    <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
        	center: {lat:  49.234167, lng: 28.458371},
          zoom: 12
        });
        map.setMapTypeId (google.maps.MapTypeId.HYBRID);
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2yYUDCCpAl1ZiP-pN5Xs6L4Ze2rekTIc&callback=initMap&language=uk">
    async defer></script>
  </body>
</html>