<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
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

  <div align="left">
            <h1>Замовлення</h1>
            <h3 align="left"><a href="./addOrder">Новий заказ</a></h3>
            <table border="1">
                <th>Id</th>
                <th>Адреса відправника</th>
                <th>Адреса отримувача</th>
                <th>Відправник</th>
                <th>Отримувач</th>
                <th>Кур'єр id</th>
                <th>Дата заказу</th>
                <th>Статус</th>
                <th>Редагувати/Видалити</th>
   
                <c:forEach var="order" items="${ordersList}" varStatus="status">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.senderAddress.city}, ${order.senderAddress.street}, ${order.senderAddress.houseNumber}/${order.senderAddress.apartmentNumber}</td>
                    <td>${order.recipientAddress.city}, ${order.recipientAddress.street}, ${order.recipientAddress.houseNumber}/${order.recipientAddress.apartmentNumber}</td>
                    <td>${order.sender.surname} ${order.sender.name} ${order.sender.patronymic}</td>
                     <td>${order.recipient.surname} ${order.recipient.name} ${order.recipient.patronymic}</td>
                    <td>${order.courier.id}</td>
                    <td>${order.date}</td>
                    <td>${order.status}</td>
                    
                    <td>
                        <a href="./updateOrder?id=${order.id}">Редагувати</a>
                        &nbsp;  &nbsp;  &nbsp;	 &nbsp;	
                        <a href="./deleteOrder?id=${order.id}">Видалити</a>
                    </td>
                            
                </tr>
                </c:forEach>             
            </table>
        </div>

   


</body>
</html>
