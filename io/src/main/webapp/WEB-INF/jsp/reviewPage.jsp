<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Komputer
  Date: 17.01.2019
  Time: 21:44
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
        <h2>Opinie o personelu</h2>

        <table class="table table-bordered">
            <tr class="bg-primary">
                <th>#ID</th>
                <th>Pacjent</th>
                <th>Personel</th>
                <th>Data</th>
                <th>Treść</th>
                <th>Ocena</th>
            </tr>
            <c:forEach items="${list}" var="rev">
                <tr>
                    <td>${rev.id}</td>
                    <td>${rev.patient.name} ${rev.patient.surname}</td>
                    <td>${rev.personel.name} ${rev.personel.surname}</td>
                    <td>${rev.date}</td>
                    <td>${rev.text}</td>
                    <td>${rev.rating}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty list}">
        Brak opinii
    </c:if>
</div>
</body>
</html>
