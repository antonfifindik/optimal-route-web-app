<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Підтвердження видалення</title>

<style>

.aligntop {
		margin-top: 20px;
		margin-right: 7px;
	}
	
	.marginleft {
		margin-left: 43%;
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
	</div>
</div>
</nav>
	
	<div align="center">
	 <div class="page-header">
  <h1 class="text-danger">Підтвердження видалення</h1>
</div>
	<form name="order" action="./deleteOrder" method="post">
	
		<dl class="text-justify marginleft">
<dt class="text-danger">ID:</dt>
<dd>${orderForDelete.id}</dd>
<dt class="text-info">Адреса відправника:</dt>
<dd>${orderForDelete.senderAddress}</dd>
<dt class="text-info">Адреса отримувача:</dt>
<dd>${orderForDelete.recipientAddress}</dd>
<dt class="text-primary">Відправник:</dt>
<dd>${orderForDelete.sender}</dd>
<dt class="text-primary">Отримувач:</dt>
<dd>${orderForDelete.recipient}</dd>
<dt  class="text-primary">Кур'єр:</dt>
<dd>${orderForDelete.courier}</dd>
<dt  class="text-success">Дата замовлення:</dt>
<dd>${orderForDelete.date}</dd>
<dt  class="text-success">Статус замовлення:</dt>
<dd>${orderForDelete.status == false ? 'Не виконано':'Виконано'}</dd>
</dl>
		

		
		<input type="submit" value="Видалити" class="btn btn-danger aligntop">  <input type="button" class="btn btn-default aligntop" value="Отмена" onclick="location.href='./'" />	
	</form></div>
	
</body>
</html>