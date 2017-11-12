<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Привіт світ!!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

  <div align="left">
            <h1>Замовлення</h1>
            <h3 align="left"><a href="./addOrder">Новий заказ</a></h3>
            <table border="1">
                <th>Id</th>
                <th>Адреса</th>
                <th>Відправник</th>
                <th>Отримувач</th>
                <th>Кур'єр id</th>
                <th>Дата заказу</th>
                <th>Статус</th>
                <th>Оновити/Видалити</th>
   
                <c:forEach var="order" items="${ordersList}" varStatus="status">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.address.city}, ${order.address.street}, ${order.address.houseNumber}/${order.address.apartmentNumber}</td>
                    <td>${order.sender.surname} ${order.sender.name} ${order.sender.patronymic}</td>
                     <td>${order.recipient.surname} ${order.recipient.name} ${order.recipient.patronymic}</td>
                    <td>${order.courier.id}</td>
                    <td>${order.date}</td>
                    <td>${order.status}</td>
                    
                    <td>
                        <a href="./updateOrder?id=${order.id}">Оновити</a>
                        &nbsp;  &nbsp;  &nbsp;	 &nbsp;	
                        <a href="./deleteOrder?id=${order.id}">Видалити</a>
                    </td>
                            
                </tr>
                </c:forEach>             
            </table>
        </div>

    <select class="selectpicker" >
                <c:forEach items="${ordersList}" var="item">
                 <option value ="${item.sender}">${item.sender}</option>
                </c:forEach>
                 </select>


</body>
</html>
