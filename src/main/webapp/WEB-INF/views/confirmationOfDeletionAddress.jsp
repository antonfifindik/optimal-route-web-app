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
	<h1>Підтвердіть видалення</h1>
	<form name="address" action="./deleteAddress" method="post">
		<p>id: ${addressForDelete.id}</p>
		<p>Місто: ${addressForDelete.city}</p>
		<p>Вулиця: ${addressForDelete.street}</p></p>
		<p>Номер будинку: ${addressForDelete.houseNumber}</p>
		<p>Номер квартири: ${orderForDelete.apartmentNumber}</p>
		
		<input type="submit" value="Видалити"> <input type="button" class="button" value="Отмена" onclick="location.href='./addresses'" />	
	</form></div>
	

</body>
</html>