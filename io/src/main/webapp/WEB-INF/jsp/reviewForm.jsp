<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Komputer
  Date: 17.01.2019
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="shared/header.jsp"/>
<div class="container" style="width:60%"">
<form:form method="POST" action="/review/form?user=${param.u}&personel=${param.p}" modelAttribute="review">

<div class="form-group">
    <form:textarea path="text" cssClass="form-control" placeholder="Treść opinii"
                   autofocus="true" cssErrorClass="form-control is-invalid"/>
</div>

<div class="form-group">
    Wybierz ocenę: <form:select path="rating">
    <form:option value="1" label="1"/>
    <form:option value="2" label="2"/>
    <form:option value="3" label="3"/>
    <form:option value="4" label="4"/>
    <form:option value="5" label="5"/>
</form:select>

    <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6">
            <input type="submit" class="btn btn-success" value="Wystaw"/>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6">
        </div>
    </div>
    </form:form>
</div>
</body>
</html>
