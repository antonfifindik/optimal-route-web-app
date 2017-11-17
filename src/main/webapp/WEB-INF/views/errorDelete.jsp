<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Неможливо видалити цей запис, так як є пов'язані з нею записи.</h1>
	<h3>${errorMessage}</h3>
	<input type="button" class="button" value="Ок" onclick="location.href='./'" />
</body>
</html>