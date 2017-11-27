<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Кур'єри</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>  
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  
           <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>  
           <script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>            
           <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css" />  
			<script  src="https://cdn.datatables.net/plug-ins/1.10.16/i18n/Ukrainian.json"></script>

<script type="text/javascript" src="jquery.dataTables.js"></script>
 <script>  
 $(document).ready(function(){  
      $('#examples').DataTable( { "lengthMenu": [ 9, 15, 25, 50, 100],
          "language": {
          "sProcessing":   "Зачекайте...",
          "sLengthMenu":   "Показати _MENU_ записів",
          "sZeroRecords":  "Записи відсутні.",
          "sInfo":         "Записи з _START_ по _END_ із _TOTAL_ записів",
          "sInfoEmpty":    "Записи з 0 по 0 із 0 записів",
          "sInfoFiltered": "(відфільтровано з _MAX_ записів)",
          "sInfoPostFix":  "",
          "sSearch":       "Пошук:",
          "sUrl":          "",
          "oPaginate": {
              "sFirst": "Перша",
              "sPrevious": "Попередня",
              "sNext": "Наступна",
              "sLast": "Остання"
          },
          "oAria": {
              "sSortAscending":  ": активувати для сортування стовпців за зростанням",
              "sSortDescending": ": активувати для сортування стовпців за спаданням"
          }
      }
    	  
      });  
 });  
 </script>


	<style>
	
	.out {
    margin: 20px;
}

.bottom {
	margin-bottom: 10px;
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
			<li class="active"><a href="couriers">Кур'єри</a></li>
			<li><a href="map">Побудова маршруту</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
            <li><a href="#">${account}</a></li>
            <li><a href="login">Вихід</a></li>
          </ul>
	</div>
</div>
</nav>

   <div class="out" align="left">
            <div class="page-header">
  <h1>Кур'єри</h1>
</div>
            
          <div class="bottom">   <a href="./addCourier" class="btn btn-success"  role="button"><span style="margin-right: 5px" class="glyphicon glyphicon-plus"></span>Новий Кур'єр</a></div>

            
             <table style="font-size:15px;" id="examples" class="table table-striped table-hover table-condensed table-responsive table-bordered">
             <thead>
                <th width="1%">Id</th>
                <th>Призвище</th>
                <th>Ім'я</th>
                <th>По батькові</th>
                <th>Номер телефону</th>
                <th width="15%"></th>
   </thead>
                <c:forEach var="courier" items="${couriersList}" varStatus="status">
                <tr>
                    <td class="info">${courier.id}</td>
                    <td>${courier.surname}</td>
                    <td>${courier.name}</td>
                    <td>${courier.patronymic}</td>
                     <td>${courier.phoneNumber}</td>
                    
                    
                     <td align="right" class="warning">
                        <a href="./updateCourier?id=${courier.id}" class="btn btn-xs btn-warning"  role="button"><span style="margin-right: 5px" class="glyphicon glyphicon-pencil"></span>Редагувати</a>
                       
                        <a href="./deleteCourier?id=${courier.id}" class="btn btn-xs btn-danger"  role="button"><span style="margin-right: 5px" class="glyphicon glyphicon-trash"></span>Видалити</a>
                    </td>
                            
                </tr>
                </c:forEach>             
            </table>
        </div>

</body>
</html>

