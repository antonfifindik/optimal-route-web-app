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

  <div align="left">
            <h1>Кур'єри</h1>
            <h3 align="left"><a href="./addCourier">Новий кур'єр</a></h3>
            <table border="1">
                <th>Id</th>
                <th>Призвище</th>
                <th>Ім'я</th>
                <th>По батькові</th>
                <th>Номер телефону</th>
                <th>Редагувати/Видалити</th>
   
                <c:forEach var="courier" items="${couriersList}" varStatus="status">
                <tr>
                    <td>${courier.id}</td>
                    <td>${courier.surname}</td>
                    <td>${courier.name}</td>
                    <td>${courier.patronymic}</td>
                     <td>${courier.phoneNumber}</td>
                    
                    
                    <td>
                        <a href="./updateCourier?id=${courier.id}">Редагувати</a>
                        &nbsp;  &nbsp;  &nbsp;	 &nbsp;	
                        <a href="./deleteCourier?id=${courier.id}">Видалити</a>
                    </td>
                            
                </tr>
                </c:forEach>             
            </table>
        </div>

</body>
</html>