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
		<a href="./home" class="navbar-brand">OPTIMAL ROUTE</a>
		</div>	
	<div>
		<ul class="nav navbar-nav">
			<li><a href="./home">Закази</a></li>
			<li><a href="addresses">Адреси</a></li>
			<li><a href="clients">Клієнти</a></li>
			<li><a href="couriers">Кур'єри</a></li>
			<li><a href="map">Побудова маршруту</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
            <li><a href="#">${account}</a></li>
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
		<div style="display: flex; justify-content:center;" class="aligntop">
		<select class="form-control" id="senderAddress" name="senderAddress" required>
		<option  selected value="${updateOrder.senderAddress.id}">${updateOrder.senderAddress}</option>
               <c:forEach items="${addressesList}" var="item">
               
               <c:if test="${item.id ne updateOrder.senderAddress.id}">
 				<option value ="${item.id}">${item}</option>
				</c:if>
           
                </c:forEach>
                 </select>
                  <a href="./addAddress" class="btn btn-sm btn-primary"  role="button"><span style="margin-right: 5px"  class="glyphicon glyphicon-home"></span>Нова адреса</a>
                 </div>
                           
		<div style="display: flex; justify-content:center;" class="aligntop">
		<select class="form-control" id="recipientAddress" name="recipientAddress"  required>
		<option  selected value="${updateOrder.recipientAddress.id}">${updateOrder.recipientAddress}</option>
                <c:forEach items="${addressesList}" var="item">
                 
               <c:if test="${item.id ne updateOrder.recipientAddress.id}">
 				<option value ="${item.id}">${item}</option>
				</c:if>
           
                </c:forEach>
                 </select>
                  <a href="./addAddress" class="btn btn-sm btn-primary"  role="button"><span style="margin-right: 5px"  class="glyphicon glyphicon-home"></span>Нова адреса</a>
                 	
                 	</div>
                 	
		<div style="display: flex; justify-content:center;" class="aligntop">
		<select class="form-control" id="sender" name="sender" required>
		<option  selected value="${updateOrder.sender.id}">${updateOrder.sender}</option>
                <c:forEach items="${clientsList}" var="item">
                 
               <c:if test="${item.id ne updateOrder.sender.id}">
 				<option value ="${item.id}">${item}</option>
				</c:if>
           
                </c:forEach>
                 </select>
                  <a href="./addClient" class="btn btn-sm btn-primary"  role="button"><span style="margin-right: 5px"  class="glyphicon glyphicon-user"></span>Новий клієнт</a>
                  
                  </div>
                  
		<div style="display: flex; justify-content:center;" class="aligntop">
		<select class="form-control" id="recipient" name="recipient"  required>
		<option  selected value="${updateOrder.recipient.id}">${updateOrder.recipient}</option>
                <c:forEach items="${clientsList}" var="item">
                
                 <c:if test="${item.id ne updateOrder.recipient.id}">
 				<option value ="${item.id}">${item}</option>
				</c:if>
				
                </c:forEach>
                 </select>
                  <a href="./addClient" class="btn btn-sm btn-primary"  role="button"><span style="margin-right: 5px"  class="glyphicon glyphicon-user"></span>Новий клієнт</a>
                  
                  </div>
                  
		<div style="display: flex; justify-content:center;" class="aligntop">
		<select class="form-control" id="courier" name="courier"  required>
		<option  selected value="${updateOrder.courier.id}">${updateOrder.courier}</option>
                <c:forEach items="${couriersList}" var="item">
                
                 <c:if test="${item.id ne updateOrder.courier.id}">
 				<option value ="${item.id}">${item}</option>
				</c:if>
				
                </c:forEach>
                 </select>

					<a href="./addCourier" class="btn btn-sm btn-primary"  role="button"><span style="margin-right: 5px"  class="glyphicon glyphicon-send"></span>Новий кур'єр</a>
				</div>	
					
		<div style="display: flex; justify-content:center;" class="aligntop">
		<select class="form-control" id="status" name="status"  required>
			<option>Не виконано</option>
			<option>Виконано</option>
		</select> 
		</div>
		
		<input type="submit" value="Прийняти" class="btn btn-success aligntop " >  
		
		
	</form> 
</div>
</body>
</html>