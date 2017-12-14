<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Редагування адреси</title>

<style>

.aligntop {
		margin-top: 20px;
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

	<div class="container" align="center">
	 <div class="page-header">
  <h1>Редагувати адресу</h1>
</div>

<form name="address" action="./updateAddress" method="post">
			<div class="input-group">
  <input type="text" name="city" class="form-control" placeholder="Місто" value="${updateAddress.city}" required>
</div>
		
		
			<form name="address" action="./updateAddress" method="post">
			<div class="input-group aligntop">
  <input type="text" name="street" class="form-control" placeholder="Вулиця" value="${updateAddress.street}" required>
</div>

			<form name="address" action="./updateAddress" method="post">
			<div class="input-group aligntop">
  <input type="text" name="houseNumber" class="form-control" placeholder="Будинок" value="${updateAddress.houseNumber}" required>
</div>
		
				<form name="address" action="./updateAddress" method="post">
			<div class="input-group aligntop">
  <input type="text" name="apartmentNumber" class="form-control" placeholder="Квартира" value="${updateAddress.apartmentNumber}" required>
</div>
		<input type="submit" value="Прийняти" class="btn btn-success aligntop"> 
	</form>	
	
</div>

</body>
</html>