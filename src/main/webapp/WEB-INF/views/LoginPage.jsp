<%--
  Created by IntelliJ IDEA.
  User: naji
  Date: 1/14/2018
  Time: 8:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--<link rel="style/stylesheet.css" href="http://www.w3schools.com/lib/w3.css">--%>
<html>
<head>
    <title>login page</title>

    <link rel="stylesheet" href="<spring:url value="/css/style.css"/>" type="text/css"/>

    <link href='<spring:url value="/css/bootstrap-select.min.css"/>' rel='stylesheet' />
</head>
<body>
<br><br><br>


<center>
<br><br><br><br>
<%--@elvariable id="employee" type=""--%>


<form:form method="POST" modelAttribute="employee" action="/">

    <table>
        <tr>
            <td><label for="username">username: </label> </td>
            <td><form:input path="username" id="username"  maxlength="10" /></td>
            <td><form:errors path="username" cssClass="error"/></td>
        </tr>

        <tr>
            <td><label for="password">Password: </label> </td>
            <td><form:input path="password" id="password" maxlength="10" /></td>
            <td><form:errors path="password" cssClass="error"/></td>
        </tr>

        <tr>
            <td>
                <input type="submit" value="enter"/>

            </td>
        </tr>


    </table>
</form:form>

</center>

<br>
${test}<br>
${pass}
</body>
</html>
