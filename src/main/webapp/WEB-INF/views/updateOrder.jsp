<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Редагування замовлення</title>

	<style>
	
	.out {
    margin: 30px;
    
}

 .container select {
    width: 300px;
    margin-right: 5px;
    }

	.aligntop {
		margin-top: 20px;
	}
	
	
		
	</style>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
</head>
<body>

<nav class="navbar navbar-default">
<div class="container-fluid">
	<div class="navbar-header">
		<a href="./" class="navbar-brand">OPTIMAL ROUTE</a>
		</div>	
	<div>
		<ul class="nav navbar-nav">
			<li><a href="./">Закази</a></li>
			<li><a href="addresses">Адреси</a></li>
			<li><a href="clients">Клієнти</a></li>
			<li><a href="couriers">Кур'єри</a></li>
			<li><a href="map">Побудова маршруту</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
            <li><a  href="login">Логін такой-то</a></li>
            <li><a href="login">Вихід</a></li>
          </ul>
	</div>
</div>
</nav>

<div class="container" align="center">
   <div class="page-header">
  <h1>Редагувати заказ</h1>
</div>
		<form name="order" action="./updateOrder" method="post">
		<p>Адреса відправника:</p>
		<select id="senderAddress" name="senderAddress" >
               <c:forEach items="${addressesList}" var="item">
                <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>
                  <a href="./addAddress" class="btn btn-xs btn-success"  role="button"><span style="margin-right: 5px"  class="glyphicon glyphicon-plus"></span>Нова адреса</a>
                 
                           
                 <p>Адреса отримувача:</p>
		<select id="recipientAddress" name="recipientAddress" >
                <c:forEach items="${addressesList}" var="item">
                 <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>
                  <a href="./addAddress" class="btn btn-xs btn-success"  role="button"><span style="margin-right: 5px"  class="glyphicon glyphicon-plus"></span>Нова адреса</a>
                 	
		<p>Відправник:</p>
		<select id="sender" name="sender" >
                <c:forEach items="${clientsList}" var="item">
                 <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>
                  <a href="./addClient" class="btn btn-xs btn-success"  role="button"><span style="margin-right: 5px"  class="glyphicon glyphicon-plus"></span>Новий клієнт</a>
		<p>Отримувач:</p>
		<select id="recipient" name="recipient" >
                <c:forEach items="${clientsList}" var="item">
                 <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>
                  <a href="./addClient" class="btn btn-xs btn-success"  role="button"><span style="margin-right: 5px"  class="glyphicon glyphicon-plus"></span>Новий клієнт</a>
		<p>Кур'єр:</p>
		<select id="courier" name="courier" >
                <c:forEach items="${couriersList}" var="item">
                 <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>

					<a href="./addCourier" class="btn btn-xs btn-success"  role="button"><span style="margin-right: 5px"  class="glyphicon glyphicon-plus"></span>Новий кур'єр</a>
					
					
					<p>Статус</p>
		<select>
			<option>Не виконан</option>
			<option>Виконан</option>
		</select> 
		 <br>
		<input type="submit" value="Прийняти" class="btn btn-sm btn-warning aligntop"> 
		
		
	</form> 
</div>
</body>
</html>