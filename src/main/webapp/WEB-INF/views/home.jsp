<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Закази</title>
	
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
</head>
<body>

<nav class="navbar navbar-default">
<div class="container-fluid">
	<div class="navbar-header">
		<a href="./" class="navbar-brand">OPTIMAL ROUTE</a>
		</div>	
	<div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="./">Закази</a></li>
			<li><a href="addresses">Адреси</a></li>
			<li><a href="clients">Клієнти</a></li>
			<li><a href="couriers">Кур'єри</a></li>
			<li><a href="map">Побудова маршруту</a></li>
		</ul>
	</div>
</div>
</nav>

  <div align="left">
            <h1>Замовлення</h1>
            
             <a href="./addOrder" class="btn btn-success"  role="button"><span style="margin-right: 5px" class="glyphicon glyphicon-plus"></span>Новий Заказ</a>
           

           
            <table class="table table-striped table-hover table-condensed">
                <th>Id</th>
                <th>Адреса відправника</th>
                <th>Адреса отримувача</th>
                <th>Відправник</th>
                <th>Отримувач</th>
                <th>Дата заказу</th>
                <th>Статус</th>
                <th>Редагувати/Видалити</th>
   
                <c:forEach var="order" items="${ordersList}" varStatus="status">
                <tr>
                    <td class="info">${order.id}</td>
                    <td>${order.senderAddress}</td>
                    <td>${order.recipientAddress}</td>
                    <td>${order.sender}</td>
                     <td>${order.recipient}</td>
                    <td>${order.date}</td>
                    <td class="warning">${order.status}</td>
                    
                    <td class="warning">
                        <a href="./updateOrder?id=${order.id}" class="btn btn-xs btn-warning"  role="button"><span style="margin-right: 5px" class="glyphicon glyphicon-pencil"></span>Редагувати</a>
                       
                        <a href="./deleteOrder?id=${order.id}" class="btn btn-xs btn-danger"  role="button"><span style="margin-right: 5px" class="glyphicon glyphicon-trash"></span>Видалити</a>
                    </td>
                            
                </tr>
                </c:forEach>             
            </table>
            
            

            
            
        </div>




</body>
</html>
