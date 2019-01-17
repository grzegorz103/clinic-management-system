<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Komputer
  Date: 17.01.2019
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.1/css/mdb.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.0/js/mdb.min.js"></script>
</head>
<body>
<!--Navbar-->
<nav class="navbar navbar-expand-lg navbar-dark primary-color">
    <div class="container">

        <!-- Navbar brand -->
        <a class="navbar-brand" href="/">Stomatologia</a>

        <!-- Collapse button -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
                aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Collapsible content -->
        <div class="collapse navbar-collapse" id="basicExampleNav">

            <!-- Links -->
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/operation/prices">Cennik
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
              <security:authorize access="isAnonymous()">
                  <li class="nav-item">
                      <a class="nav-link" href="/user/registration">Rejestracja</a>
                  </li>

                  <li class="nav-item">
                        <a class="nav-link" href="/login">Zaloguj sie</a>
                    </li>
                </security:authorize>

                <security:authorize access="isAuthenticated()">
                    <!-- Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"
                           aria-haspopup="true"
                           aria-expanded="false">Zarządzaj</a>
                        <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                            <security:authorize access="hasRole('USER')">
                                <a class="dropdown-item" href="/visit/form">Nowa wizyta</a>
                                <a class="dropdown-item" href="/visit/my">Moje wizyty</a>
                            </security:authorize>
                            <security:authorize access="hasRole('PERSONEL')">
                                <a class="dropdown-item" href="/operation/form">Nowy zabieg</a>
                                <a class="dropdown-item" href="/visit/history">Moje wizyty</a>
                            </security:authorize>
                            <security:authorize access="hasRole('BOSS')">
                                <a class="dropdown-item" href="/transaction/summary">Podsumowanie</a>
                                <a class="dropdown-item" href="/review/all">Opinie</a>
                            </security:authorize>
                        </div>
                    </li>
                <li class="nav-item">
                    <a class="nav-link" onclick="document.getElementById('logout').submit()">Witaj
                        <sec:authentication property="principal.username"/>, wyloguj się</a>
                </li>

                <form action="<c:url value="/logout"/>" id="logout" method="post" style="display: none;">
                    <sec:csrfInput/>
                </form>
                </security:authorize>

            </ul>
            <!-- Links -->

        </div>
        <!-- Collapsible content -->

    </div>
</nav>
<!--/.Navbar-->
</body>
</html>
