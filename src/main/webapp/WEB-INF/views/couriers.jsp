<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Кур'єри</title>
	<style>
	
	.out {
    margin: 10px;
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
			<li class="active"><a href="couriers">Кур'єри</a></li>
			<li><a href="map">Побудова маршруту</a></li>
		</ul>
	</div>
</div>
</nav>

   <div class="out" align="left">
            <div class="page-header">
  <h1>Кур'єри</h1>
</div>
            
             <a href="./addCourier" class="btn btn-success"  role="button"><span style="margin-right: 5px" class="glyphicon glyphicon-plus"></span>Новий Кур'єр</a>

            
             <table class="table table-striped table-hover table-condensed table-responsive">
                <th>Id</th>
                <th>Призвище</th>
                <th>Ім'я</th>
                <th>По батькові</th>
                <th>Номер телефону</th>
                <th>Редагувати/Видалити</th>
   
                <c:forEach var="courier" items="${couriersList}" varStatus="status">
                <tr>
                    <td class="info">${courier.id}</td>
                    <td>${courier.surname}</td>
                    <td>${courier.name}</td>
                    <td>${courier.patronymic}</td>
                     <td>${courier.phoneNumber}</td>
                    
                    
                     <td class="warning">
                        <a href="./updateCourier?id=${courier.id}" class="btn btn-xs btn-warning"  role="button"><span style="margin-right: 5px" class="glyphicon glyphicon-pencil"></span>Редагувати</a>
                       
                        <a href="./deleteCourier?id=${courier.id}" class="btn btn-xs btn-danger"  role="button"><span style="margin-right: 5px" class="glyphicon glyphicon-trash"></span>Видалити</a>
                    </td>
                            
                </tr>
                </c:forEach>             
            </table>
        </div>

</body>
</html>