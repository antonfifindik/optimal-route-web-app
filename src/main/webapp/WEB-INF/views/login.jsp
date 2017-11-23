<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
 

    <title>Signin Template for Bootstrap</title>
    
     <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


  </head>

  <body style="background-color: #eee;">

    <div style="width:300px; margin-top:10%;" class="container">
 
      	<form class="form-signin" role="form" name="account" action="./login" method="post">
        <h2 class="form-signin-heading">Авторизація</h2>
        <input style="height: 43px; font-size: 16px;" name="login" type="login" class="form-control" placeholder="Логін" required autofocus>
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