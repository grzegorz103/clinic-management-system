<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Komputer
  Date: 17.01.2019
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="shared/header.jsp"/>
<div class="container">
    <c:if test="${!empty list}">
        <h2>Moje wizyty</h2>

        <table class="table table-bordered">
            <tr class="bg-primary">
                <th>#ID</th>
                <th>Nazwa usługi</th>
                <th>Cena</th>
                <th>Data</th>
                <th>Dentysta</th>
                <th>Status</th>
                <th>Opinia</th>
            </tr>
            <c:forEach items="${list}" var="visit">
                <tr>
                    <td>${visit.id}</td>
                    <td>${visit.operation.name}</td>
                    <td>${visit.operation.price}zł</td>
                    <td>${visit.date} godzina ${visit.hour}:00</td>
                    <td>${visit.personel.name} ${visit.personel.surname}</td>
                    <c:if test="${visit.status == 'DONE'}">
                        <td><a href="/transaction/pay/${visit.id}">
                            Zrealizowano, kliknij by zapłacić</a>
                        </td>
                        <td><a href="/review/form?u=${visit.user.id}&p=${visit.personel.id}">Wystaw opinię</a></td>
                    </c:if>
                    <c:if test="${visit.status=='NOT_DONE'}">
                        <td>Nie zrealizowano</td>
                    </c:if>
                    <c:if test="${visit.status == 'PAID'}">
                        <td>Zapłacono</td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty list}">
        Brak wizyt
    </c:if>
</div>
</body>
</html>
