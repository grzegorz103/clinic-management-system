<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Komputer
  Date: 17.01.2019
  Time: 18:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="shared/header.jsp"/>
<div class="container" style="width: 50%">
    <form:form method="POST" modelAttribute="operation">
        <br/>
        <div class="form-group">
            <form:input path="name" cssClass="form-control" placeholder="Nazwa zabiegu"
                        autofocus="true" cssErrorClass="form-control is-invalid"/>
        </div>

        <div class="form-group">
            <form:input path="price" cssClass="form-control" placeholder="Cena"
                        autofocus="true" cssErrorClass="form-control is-invalid"/>
        </div>

        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6">

                <input type="submit" class="btn btn-lg btn-primary btn-block" value="Dodaj"/>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6">
            </div>
        </div>
    </form:form>
</div>
</body>
</html>
