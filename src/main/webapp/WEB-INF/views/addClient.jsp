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
	<form name="client" action="./addClient" method="post">
	<p>Призвище</p>
		<input title="Surname" type="text" name="surname">
		<p>Ім'я</p>
		<input title="Name" type="text" name="name">
		<p>По батькові</p>
		<input title="Patronymic" type="text" name="patronymic">
		<p>Телефон</p>
		<input title="PhoneNumber" type="text" name="phoneNumber">
		<input type="submit" value="OK">	
	</form>
	</div>
	
</body>
</html>