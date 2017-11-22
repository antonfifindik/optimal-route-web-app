<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title>Signin Template for Bootstrap</title>
    
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>  
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  
           <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>  
           <script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>            
           <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css" />  
			<script  src="https://cdn.datatables.net/plug-ins/1.10.16/i18n/Ukrainian.json"></script>


  </head>

  <body style="background-color: #eee;">

    <div style="width:300px; margin-top:10%;" class="container">
 
      <form class="form-signin" role="form" action="./login" method="post">
        <h2 class="form-signin-heading">Авторизація</h2>
        <input style="height: 43px; font-size: 16px; " name="login" type="login" class="form-control" placeholder="Логін" required autofocus>
        <input style="height: 43px; font-size: 16px;" name="password" type="password" class="form-control" placeholder="Пароль" required>
        <label style="margin-left: 9%;" class="checkbox">
          <input type="checkbox" value="remember-me"> Запам'ятати мене
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Увійти</button>
      </form>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>