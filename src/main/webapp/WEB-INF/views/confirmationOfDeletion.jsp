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
	<h1>Підтвердіть видалення</h1>
	<form name="order" action="./deleteOrder" method="post">
		<p>id: ${orderForDelete.id}</p>
		<p>Адреса відправника: ${orderForDelete.senderAddress}</p>
		<p>Адреса отримувача: ${orderForDelete.recipientAddress}</p></p>
		<p>Відправник: ${orderForDelete.sender}</p>
		<p>Отримувач: ${orderForDelete.recipient}</p>
		<p>Кур'єр: ${orderForDelete.courier}</p>
		<p>Дата заказу: ${orderForDelete.date}</p>
		<p>Статус: ${orderForDelete.status}</p>
		<input type="submit" value="Видалити"> <input type="button" class="button" value="Отмена" onclick="location.href='./'" />	
	</form></div>
	
</body>
</html>