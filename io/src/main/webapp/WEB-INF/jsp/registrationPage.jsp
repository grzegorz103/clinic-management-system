<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Komputer
  Date: 17.01.2019
  Time: 15:29
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

    <form:form modelAttribute="user">
        <h1 style="text-align:center">Proszę, zarejestruj się</h1>
        Pola wymagane
        <div class="form-group">
            <form:errors path="username" cssClass="alert alert-danger" element="div"/>
        </div>
        <form:errors path="username" cssStyle="color:red"/>

        <div class="form-group">
            <form:input path="username" cssClass="form-control" placeholder="Nazwa użytkownika"
                        autofocus="true" cssErrorClass="form-control is-invalid"/>
        </div>

        <div class="form-group">
            <form:password path="password" cssClass="form-control"
                           placeholder="Hasło" cssErrorClass="form-control is-invalid"/>
        </div>

        <div class="form-group">
            <form:input path="name" cssClass="form-control" placeholder="Imię"
                        autofocus="true" cssErrorClass="form-control is-invalid"/>
        </div>

        <div class="form-group">
            <form:input path="surname" cssClass="form-control" placeholder="Nazwisko"
                        autofocus="true" cssErrorClass="form-control is-invalid"/>
        </div>

        <div class="form-group">
            <form:input path="pesel" cssClass="form-control" placeholder="PESEL"
                        autofocus="true" cssErrorClass="form-control is-invalid"/>
        </div>
        <!-- / Collapse buttons -->

        <!-- Collapsible element -->

            <div class="mt-3">
                <div class="form-group">
                    <form:input path="address.city" cssClass="form-control" placeholder="Miasto"
                                autofocus="true" cssErrorClass="form-control is-invalid"/>
                </div>
            </div>


            <div class="mt-3">
                <div class="form-group">
                    <form:input path="address.street" cssClass="form-control" placeholder="Ulica"
                                autofocus="true" cssErrorClass="form-control is-invalid"/>
                </div>
            </div>


            <div class="mt-3">
                <div class="form-group">
                    <form:input path="address.house_number" cssClass="form-control" placeholder="Numer domu/mieszkania"
                                autofocus="true" cssErrorClass="form-control is-invalid"/>
                </div>
            </div>


            <div class="mt-3">
                <div class="form-group">
                    <form:input path="address.postcode" cssClass="form-control" placeholder="Kod pocztowy"
                                autofocus="true" cssErrorClass="form-control is-invalid"/>
                </div>
            </div>


        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6">
                <input type="submit" class="btn btn-lg btn-primary btn-block" value="Zarejestruj"/>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6">
            </div>
        </div>
</div>
    </form:form>
</body>

</html>
