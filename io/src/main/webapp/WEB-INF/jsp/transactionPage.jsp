<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Komputer
  Date: 17.01.2019
  Time: 19:02
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
        <br>
        <h2>Podsumowanie transakcji</h2>

        <table class="table table-bordered">
            <tr class="bg-primary">
                <th>ID transakcji</th>
                <th>Nazwa usługi</th>
                <th>Zysk</th>
                <th>Data wizyty</th>
                <th>Klient</th>
                <th>Status</th>
            </tr>
            <c:forEach items="${list}" var="transaction">
                <tr>
                    <td>${transaction.id}</td>
                    <td>${transaction.visit.operation.name}</td>
                    <td>${transaction.visit.operation.price}zł</td>
                    <td>${transaction.date} godzina ${transaction.visit.hour}</td>
                    <td>${transaction.user.name} ${transaction.user.surname}</td>
                    <c:if test="${transaction.status == 'NOT_PAID'}">
                        <td>Nie zapłacono</td>
                    </c:if>
                    <c:if test="${transaction.status == 'PAID'}">
                        <td>Zapłacono</td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>

        <br/>
        <br/>
        <h2>Przychód z wizyt: ${sum} zł</h2>
    </c:if>

    <c:if test="${empty list}">
        Brak transakcji
    </c:if>
    <hr>
    <h2>Historia wizyt</h2>


    <form:form class="form-inline" form:method="post" modelAttribute="search">
        <form:input class="form-control mr-sm-2" type="search" placeholder="Szukaj" aria-label="Search"
                    path="phrase"/>
        <button class="btn blue-gradient" type="submit">Szukaj</button>
    </form:form>
    <a class="btn peach-gradient" href="<c:url value="/transaction/clear"/>">Wyczyść</a>

    <c:if test="${!empty history.content}">
        <table class="table table-bordered">
            <tr class="bg-primary">
                <th>#ID</th>
                <th>Nazwa usługi</th>
                <th>Cena</th>
                <th>Data</th>
                <th>Dentysta</th>
                <th>Pacjent</th>
                <th>Status</th>
            </tr>
            <c:forEach items="${history.content}" var="visit">
                <tr>
                    <td>${visit.id}</td>
                    <td>${visit.operation.name}</td>
                    <td>${visit.operation.price}zł</td>
                    <td>${visit.date} godzina ${visit.hour}:00</td>
                    <td>${visit.personel.name} ${visit.personel.surname}</td>
                    <td>${visit.user.name} ${visit.user.surname}</td>
                    <c:if test="${visit.status == 'DONE'}">
                        <td>
                            Zrealizowano, nie zapłacono
                        </td>
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

        <c:url var="prevPageUrl" value="/transaction/summary?page=${history.number - 1}&size=${history.size}"/>
        <c:url var="nextPageUrl" value="/transaction/summary?page=${history.number + 1}&size=${history.size}"/>

        <c:url var="firstPageUrl" value="/transaction/summary?page=0&size=${history.size}"/>
        <c:url var="lastPageUrl" value="/transaction/summary?page=${history.totalPages - 1}&size=${history.size}"/>

        <nav aria-label="Page navigation example">
            <ul class="pagination pg-blue">
                <li ${history.first?'class="page-item disabled"':'page-item'}>
                    <a href="${history.first?"#":firstPageUrl}" class="page-link">
                        <span>First</span>
                    </a>
                </li>

                <li ${history.first?'class="page-item disabled"':'page-item'}>
                    <a href="${history.first?'#':prevPageUrl}" class="page-link">
                        <span>&laquo;</span>
                    </a>
                </li>

                <c:forEach var="pageIdx" begin="${0}" end="${history.totalPages-1}">
                    <c:url var="pageUrl" value="/transaction/summary?page=${pageIdx}&size=${history.size}"/>
                    <li ${pageIdx == history.number?'class="page-item active"':'page-item'}>
                        <a href="${pageUrl}" class="page-link">${pageIdx+1}</a>
                    </li>
                </c:forEach>

                <li ${history.last?'class="page-item disabled"':'page-item'}>
                    <a href="${history.last?'#':nextPageUrl}" class="page-link">
                        <span>&raquo;</span>
                    </a>
                </li>

                <li ${history.last?'class="page-item disabled"':'page-item'}>
                    <a href="${history.last?"#":lastPageUrl}" class="page-link">
                        <span>Last</span>
                    </a>
                </li>
            </ul>
        </nav>
        <nav>
            <ul class="pagination pg-blue">
                <c:set var="pageSizes" value="${[10, 20, 30, 50]}"/>
                <c:forEach var="size" items="${pageSizes}">
                    <c:url var="pageUrl" value="/transaction/summary?page=${history.number}&size=${size}"/>
                    <li class="page-item">
                        <a href="${pageUrl}" class="page-link">${size}</a>
                    </li>
                </c:forEach>
            </ul>
        </nav>
    </c:if>
</div>
</body>
</html>
