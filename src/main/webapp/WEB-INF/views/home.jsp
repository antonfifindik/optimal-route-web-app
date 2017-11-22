<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>





	<title>Закази</title>
	
	
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

<nav class="navbar navbar-default">
<div class="container-fluid">
	<div class="navbar-header">
		<a href="./" class="navbar-brand">OPTIMAL ROUTE</a>
		</div>	
	<div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="./">Закази</a></li>
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

   <div class="out" align="left">
            <div class="page-header">
  <h1>Замовлення</h1>    
</div>
            
         
     	 <div class="bottom"> <a href="./addOrder" class="btn btn-success"   role="button"><span style="margin-right: 5px;" class="glyphicon glyphicon-plus"></span>Новий запис</a></div>     

           
            <table style="font-size:15px;" id="examples" class="table table-striped table-hover table-condensed table-responsive table-bordered">
            <thead> 
                <th width="1%">Id</th>
                <th>Адреса відправника</th>
                <th>Адреса отримувача</th>
                <th>Відправник</th>
                <th>Отримувач</th>
                <th width="7%">Дата</th>
             <th>Статус</th>     
                <th width="15%"></th>
   			</thead>
                <c:forEach var="order" items="${ordersList}" varStatus="status">
                <tr>
                    <td class="info">${order.id}</td>
                    <td>${order.senderAddress}</td>
                    <td>${order.recipientAddress}</td>
                    <td>${order.sender}</td>
                     <td>${order.recipient}</td>
                    <td>${order.date}</td>
        <td class="warning">${order.status == false ? 'Не виконано':'Виконано'}</td>            
                    
                    <td align="right" class="warning">
                        <a href="./updateOrder?id=${order.id}" class="btn btn-xs btn-warning"  role="button"><span style="margin-right: 5px" class="glyphicon glyphicon-pencil"></span>Редагувати</a>
                        <a href="./deleteOrder?id=${order.id}" class="btn btn-xs btn-danger"  role="button"><span style="margin-right: 5px" class="glyphicon glyphicon-trash"></span>Видалити</a>
                      
                    </td>
                     
                </tr>
                </c:forEach>      
                
                       
            </table>
            


            
            
        </div>


</body>
</html>



