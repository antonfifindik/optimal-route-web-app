<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
			<li><a href="./">Закази</a></li>
			<li><a href="addresses">Адреси</a></li>
			<li><a href="clients">Клієнти</a></li>
			<li><a href="couriers">Кур'єри</a></li>
			<li><a href="map">Побудова маршруту</a></li>
		</ul>
	</div>
</div>
</nav>

<div align="center">
<h1>Новий заказ</h1>
		<form name="order" action="./addOrder" method="post">
		<p>Адреса відправника:</p>
		<select id="senderAddress" name="senderAddress" >
               <c:forEach items="${addressesList}" var="item">
                <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>
                 <input type="button" class="button" value="Нова адреса" onclick="location.href='./addAddress'" />
                 
                           
                 <p>Адреса отримувача:</p>
		<select id="recipientAddress" name="recipientAddress" >
                <c:forEach items="${addressesList}" var="item">
                 <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>
                 <input type="button" class="button" value="Нова адреса" onclick="location.href='./addAddress'" />
                 	
		<p>Відправник:</p>
		<select id="sender" name="sender" >
                <c:forEach items="${clientsList}" var="item">
                 <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>
                 <input type="button" class="button" value="Новий клієнт" onclick="location.href='./addClient'" />
		<p>Отримувач:</p>
		<select id="recipient" name="recipient" >
                <c:forEach items="${clientsList}" var="item">
                 <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>
                 <input type="button" class="button" value="Новий клієнт" onclick="location.href='./addClient'" />
		<p>Кур'єр:</p>
		<select id="courier" name="courier" >
                <c:forEach items="${couriersList}" var="item">
                 <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>

					<input type="button" class="button" value="Новий кур'єр" onclick="location.href='./addCourier'" />
					<input type="submit" value="OK"> </div>
	</form> 
		

</body>
</html>