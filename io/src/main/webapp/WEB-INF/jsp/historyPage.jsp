<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Komputer
  Date: 17.01.2019
  Time: 18:46
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
                <td>Pacjent</td>
                <th>Status</th>
            </tr>
            <c:forEach items="${list}" var="visit">
                <tr>
                    <td>${visit.id}</td>
                    <td>${visit.operation.name}</td>
                    <td>${visit.operation.price}zł</td>
                    <td>${visit.date} godzina ${visit.hour}:00</td>
                    <td>${visit.user.pesel} ${visit.user.name} ${visit.user.surname}</td>
                    <c:if test="${visit.status == 'DONE'}">
                        <td><a href="/visit/status/${visit.id}">Zrealizowano</a></td>
                    </c:if>
                    <c:if test="${visit.status=='NOT_DONE'}">
                        <td><a href="/visit/status/${visit.id}">
                            Niezrealizowano</a>
                        </td>
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
