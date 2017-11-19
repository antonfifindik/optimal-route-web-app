<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<h1>Редагувати заказ</h1>
		<form name="order" action="./updateOrder" method="post">
		<p>Адреса відправника:</p>
		<select id="senderAddress" name="senderAddress" >
               <c:forEach items="${addressesList}" var="item">
                <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>
                 <input type="button" class="button" value="Нова адреса" onclick="location.href='./addAddress'" />
                 
                           
                 <p>Адреса отримувача:</p>
		<select id="recipientAddress" name="recipientAddress" >
                <c:forEach items="${addressesList}" var="item">
                 <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>
                 <input type="button" class="button" value="Нова адреса" onclick="location.href='./addAddress'" />
                 	
		<p>Відправник:</p>
		<select id="sender" name="sender" >
                <c:forEach items="${clientsList}" var="item">
                 <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>
                 <input type="button" class="button" value="Новий клієнт" onclick="location.href='./addClient'" />
		<p>Отримувач:</p>
		<select id="recipient" name="recipient" >
                <c:forEach items="${clientsList}" var="item">
                 <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>
                 <input type="button" class="button" value="Новий клієнт" onclick="location.href='./addClient'" />
		<p>Кур'єр:</p>
		<select id="courier" name="courier" >
                <c:forEach items="${couriersList}" var="item">
                 <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>

					<input type="button" class="button" value="Новий кур'єр" onclick="location.href='./addCourier'" />
					
					
					<p>Статус</p>
		<select>
			<option>Не виконан</option>
			<option>Виконан</option>
		</select> 
		
		<input type="submit" value="OK"> 
		
		</div>
	</form> 

</body>
</html>