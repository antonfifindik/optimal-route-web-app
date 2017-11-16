<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	<form name="address" action="./addAddress" method="post">
	<p>Місто:</p>
		<input title="City" type="text" name="city">
		<p>Вулиця:</p>
		<input title="Street" type="text" name="street">
		<p>Номер будинку:</p>
		<input title="HouseNumber" type="text" name="houseNumber">
		<p>Номер квартири:</p>
		<input title="ApartmentNumber" type="text" name="apartmentNumber">
		<input type="submit" value="OK">	
	</form>
	</div>
	
</body>
</html>