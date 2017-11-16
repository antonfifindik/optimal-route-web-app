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
            <h1>Адреси</h1>
            <h3 align="left"><a href="./addAddress">Нова адреса</a></h3>
            <table border="1">
                <th>Id</th>
                <th>Місто</th>
                <th>Вулиця</th>
                <th>Номер будинку</th>
                <th>Квартира</th>
                <th>Редагувати/Видалити</th>
   
                <c:forEach var="address" items="${addressesList}" varStatus="status">
                <tr>
                    <td>${address.id}</td>
                    <td>${address.city}</td>
                    <td>${address.street}</td>
                    <td>${address.houseNumber}</td>
                     <td>${address.apartmentNumber}</td>
                    
                    <td>
                        <a href="./updateAddress?id=${address.id}">Редагувати</a>
                        &nbsp;  &nbsp;  &nbsp;	 &nbsp;	
                        <a href="./deleteAddress?id=${address.id}">Видалити</a>
                    </td>
                            
                </tr>
                </c:forEach>             
            </table>
        </div>
</body>
</html>