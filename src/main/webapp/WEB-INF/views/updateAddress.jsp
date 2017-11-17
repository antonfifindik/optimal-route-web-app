<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="navigation">
			<ul>
			    <li><a href="./" class="active"><span>Закази</span></a></li>
			    <li><a href="addresses"><span>Адреси</span></a></li>
			    <li><a href="clients"><span>Клієнти</span></a></li>
			    <li><a href="couriers"><span>Кур'єри</span></a></li>
			    <li><a href="#"><span>Побудова маршруту</span></a></li>
			</ul>
		</div>

	<div align="center">
	<form name="address" action="./updateAddress" method="post">
	<p>Місто:</p>
		<input title="City" type="text" name="city" value="${updateAddress.city}">
		<p>Вулиця:</p>
		<input title="Street" type="text" name="street" value="${updateAddress.street}">
		<p>Номер будинку:</p>
		<input title="HouseNumber" type="text" name="houseNumber" value="${updateAddress.houseNumber}">
		<p>Номер квартири:</p>
		<input title="ApartmentNumber" type="text" name="apartmentNumber" value="${updateAddress.apartmentNumber}">
		<input type="submit" value="OK">	
	</form>
	</div>

</body>
</html>