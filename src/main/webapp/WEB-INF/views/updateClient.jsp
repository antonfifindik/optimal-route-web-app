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
	<form name="client" action="./updateClient" method="post">
	<p>Призвище:</p>
		<input title="Surname" type="text" name="surname" value="${updateClient.surname}">
		<p>Ім'я:</p>
		<input title="Name" type="text" name="name" value="${updateClient.name}">
		<p>По-батькові:</p>
		<input title="Patronymic" type="text" name="patronymic" value="${updateClient.patronymic}">
		<p>Номер телефону:</p>
		<input title="PhoneNumber" type="text" name="phoneNumber" value="${updateClient.phoneNumber}">
		<input type="submit" value="OK">	
	</form>
	</div>

</body>
</html>