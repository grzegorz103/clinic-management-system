<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Komputer
  Date: 17.01.2019
  Time: 16:56
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
    <c:if test="${empty list}">Brak dostępnych zabiegów</c:if>
    <c:if test="${!empty list}">
        <form:form method="POST" modelAttribute="visit">
            </br>
            <div class="form-group">
                Wybierz zabieg: <form:select path="operation.id">
                <form:options items="${list}" itemValue="id" itemLabel="name"/>
            </form:select>
            </div>

            <div class="form-group">
                Wybierz godzinę: <form:select path="hour">
                <form:options items="${hours}"/>
            </form:select>
            </div>

            <div class="form-group">
                Wybierz dentystę: <form:select path="personel.id">
                <form:options items="${personel}" itemLabel="name" itemValue="id"/>
            </form:select>
            </div>

            <form:input type="date" path="date"/>

            <button type="submit" class="btn btn-raised btn-primary">OK</button>
        </form:form>
    </c:if>
</div>
</body>
</html>
