<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



		<form name="order" action="./addOrder" method="post">
		<p>Адреса</p>
		<select class="selectpicker" >
                <c:forEach items="${addressesList}" var="item">
                 <option value ="${item}">id${item.id} ${item.city} ${item.street} ${item.houseNumber} ${item.apartmentNumber}</option>
                </c:forEach>
                 </select>
                 <input type="button" class="button" value="Новий заказ" onclick="location.href='./addAddress'" />
                 	
		<p>Відправник</p>
		<select class="selectpicker" >
                <c:forEach items="${clientsList}" var="item">
                 <option value ="${item}">id${item.id} ${item.surname} ${item.name} ${item.patronymic}</option>
                </c:forEach>
                 </select>
                 <input type="submit" value="Новий клієнт">
		<p>Отримувач</p>
		<select class="selectpicker" >
                <c:forEach items="${clientsList}" var="item">
                 <option value ="${item}">id${item.id} ${item.surname} ${item.name} ${item.patronymic}</option>
                </c:forEach>
                 </select>
                 <input type="submit" value="Новий клієнт">
		<p>Кур'єр</p>
		<select class="selectpicker" >
                <c:forEach items="${couriersList}" var="item">
                 <option value ="${item}">id${item.id} ${item.surname} ${item.name} ${item.patronymic}</option>
                </c:forEach>
                 </select>

					<input type="submit" value="Новий кур'єр">
	</form>
	<input type="submit" value="OK">	

</body>
</html>