<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Підтвердження видалення</title>

<style>

.aligntop {
		margin-top: 20px;
		margin-right: 7px;
	}
	
	.marginleft {
		margin-left: 43%;
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
			<li><a href="map">Побудова маршруту</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
            <li><a href="#">${account.login}</a></li>
            <li><a href="login">Вихід</a></li>
          </ul>
	</div>
</div>
</nav>

		<div align="center">
	 <div class="page-header">
  <h1 class="text-danger">Підтвердження видалення</h1>
</div>
	<form name="courier" action="./deleteCourier" method="post">
	
		<dl class="text-justify marginleft">
<dt class="text-danger">ID:</dt>
<dd>${courierForDelete.id}</dd>
<dt class="text-info">Прізвище:</dt>
<dd>${courierForDelete.surname}</dd>
<dt class="text-info">Ім'я:</dt>
<dd>${courierForDelete.name}</dd>
<dt class="text-primary">По-батькові:</dt>
<dd>${courierForDelete.patronymic}</dd>
<dt class="text-primary">Номер телефону:</dt>
<dd>${courierForDelete.phoneNumber}</dd>

</dl>
		

		
		<input type="submit" value="Видалити" class="btn btn-danger aligntop">  <input type="button" class="btn btn-default aligntop" value="Отмена" onclick="location.href='./'" />	
	</form></div>

</body>
</html>