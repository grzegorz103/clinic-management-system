<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Komputer
  Date: 17.01.2019
  Time: 16:09
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
        <h2>Cennik usług</h2>

        <table class="table table-bordered">
            <tr class="bg-primary">
                <th>#ID</th>
                <th>Nazwa usługi</th>
                <th>Cena</th>
                <security:authorize access="hasRole('PERSONEL')">
                    <th>Zapisz</th>
                </security:authorize>
            </tr>
            <c:forEach items="${list}" var="operation">
                <tr>
                    <form:form method="POST" modelAttribute="item">
                        <td>${operation.id}</td>
                        <form:input path="id" type="hidden" value="${operation.id}"/>
                        <security:authorize access="hasRole('USER') or isAnonymous()">
                            <th>${operation.name}</th>
                        </security:authorize>
                        <security:authorize access="hasRole('USER') or isAnonymous()">
                            <td>${operation.price}</td>
                        </security:authorize>

                        <security:authorize access="hasRole('PERSONEL')">
                            <td><form:input path="name" value="${operation.name}"/></td>
                        </security:authorize>

                        <security:authorize access="hasRole('PERSONEL')">
                            <td><form:input path="price" value="${operation.price}"/></td>
                            <td>
                                <button type="submit" class="btn blue-gradient">Zapisz</button>
                            </td>
                        </security:authorize>
                    </form:form>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty list}">
        Brak usług
    </c:if>
</div>
</body>
</html>
