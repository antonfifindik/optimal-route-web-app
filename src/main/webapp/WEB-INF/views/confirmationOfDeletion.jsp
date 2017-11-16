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
	<form name="order" action="./deleteOrder" method="post">
		<p>id: ${orderForDelete.id}</p>
		<p>Адреса відправника: ${orderForDelete.senderAddress.city} ${orderForDelete.senderAddress.street} ${orderForDelete.senderAddress.houseNumber}/${orderForDelete.senderAddress.apartmentNumber}</p>
		<p>Адреса отримувача: ${orderForDelete.recipientAddress.city} ${orderForDelete.recipientAddress.street} ${orderForDelete.recipientAddress.houseNumber}/${orderForDelete.recipientAddress.apartmentNumber}</p></p>
		<p>Відправник: ${orderForDelete.id}</p>
		<input type="submit" value="OK"> <input type="button" class="button" value="Отмена" onclick="location.href='./'" />	
	</form></div>
	
</body>
</html>