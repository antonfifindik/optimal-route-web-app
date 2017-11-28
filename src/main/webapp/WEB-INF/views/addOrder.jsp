<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Новий заказ</title>

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

<nav class="navbar navbar-inverse">
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
            <li><a href="#">${account.login}</a></li>
            <li><a href="login">Вихід</a></li>
          </ul>
	</div>
</div>
</nav>



<div class="container" align="center">
   <div class="page-header">
  <h1>Новий заказ</h1>
</div>
		<form name="order" action="./addOrder" method="post">
		<div style="display: flex; justify-content:center;" class="aligntop">
		<select class="form-control" id="senderAddress" name="senderAddress" required>
		<option  selected disabled value=''>Адреса відправника</option>
               <c:forEach items="${addressesList}" var="item">
                <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>
             
                   <a   href="./addAddress" class="btn btn-sm btn-primary"  role="button"><span style="margin-right: 5px"  class="glyphicon glyphicon-home"></span>Нова адреса</a>
             </div>              
               
               <div style="display: flex; justify-content:center;" class="aligntop">
               
		<select class="form-control" id="recipientAddress" name="recipientAddress" required>
		<option  selected disabled value=''>Адреса отримувача</option>
                <c:forEach items="${addressesList}" var="item">
                 <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>
                 <a href="./addAddress" class="btn btn-sm btn-primary"  role="button"><span style="margin-right: 5px"  class="glyphicon glyphicon-home"></span>Нова адреса</a>
                 	</div>
		
		 <div style="display: flex; justify-content:center;" class="aligntop">
		
		<select  class="form-control"  id="sender" name="sender" required>
		
		<option  selected disabled value=''>Відправник</option>
                <c:forEach items="${clientsList}" var="item">
                 <option  value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>
                 <a href="./addClient" class="btn btn-sm btn-primary"  role="button"><span style="margin-right: 5px"  class="glyphicon glyphicon-user"></span>Новий клієнт</a>
                 
                 </div>
                 
		<div style="display: flex; justify-content:center;" class="aligntop">
		<select  class="form-control"  id="recipient" name="recipient" required>
		<option  selected disabled value=''>Отримувач</option>
                <c:forEach items="${clientsList}" var="item">
                 <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>
                 <a href="./addClient" class="btn btn-sm btn-primary"  role="button"><span style="margin-right: 5px"  class="glyphicon glyphicon-user"></span>Новий клієнт</a>
		</div>
		
		<div style="display: flex; justify-content:center;" class="aligntop">
		
		<select  class="form-control"  id="courier" name="courier" required>
		<option selected disabled value=''>Кур'єр</option>
                <c:forEach items="${couriersList}" var="item">
                 <option value ="${item.id}">${item}</option>
                </c:forEach>
                 </select>

					<a href="./addCourier" class="btn btn-sm btn-primary"  role="button"><span style="margin-right: 5px"  class="glyphicon glyphicon-send"></span>Новий кур'єр</a><br>
					</div>
					
					<input type="submit" value="Прийняти" class="btn btn-success aligntop " > 
					
					
	</form> 
		
</div>
</body>
</html>