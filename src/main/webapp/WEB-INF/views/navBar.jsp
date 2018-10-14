<%--
  Created by IntelliJ IDEA.
  User: naji
  Date: 2/10/2018
  Time: 8:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>navbar</title>

    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <!-- Brand/logo -->
        <a class="navbar-brand" href="#">
            <img src="<spring:url value="/avatar/naji.png"/>" alt="logo" style="width:40px;">
        </a>

        <!-- Links -->
        <ul class="navbar-nav">
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle active" href="/events/" id="navbardrop" data-toggle="dropdown">
                    schedule
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/schedule/">personal schedule</a>
                    <a class="dropdown-item" href="#">professional schedule search</a>

                </div>
            </li>
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle active" href="/events/" id="navbardrop" data-toggle="dropdown">
                    meetings & tasks
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/events/">show All events</a>
                    <%--<a class="dropdown-item" href="/events/addEvent">add an event</a>--%>
                    <%--<a class="dropdown-item" href="/events/edit-${0}-event">edit event</a>--%>
                    <%--<a class="dropdown-item" href="#">delete event</a>--%>
                </div>
            </li>
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle active" href="/events/" id="navbardrop" data-toggle="dropdown">
                    settings
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">edit personal information</a>
                    <a class="dropdown-item" href="#">user management</a>
                    <a class="dropdown-item" href="#">other users permissions to this profile</a>

                </div>
            </li>
        </ul>
    </nav>
</head>
<body>

</body>
</html>
