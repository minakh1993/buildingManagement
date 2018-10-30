<%--
  Created by IntelliJ IDEA.
  User: naji
  Date: 1/22/2018
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<html>
<head>
    <title>deleted</title>

    <link rel="stylesheet" href="<spring:url value="/css/style.css"/>" type="text/css"/>


    <title>list of all events</title>

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
                    <a class="dropdown-item" href="#">personal schedule</a>
                    <a class="dropdown-item" href="#">search schedules</a>
                    <a class="dropdown-item" href="#">add schedule</a>
                    <a class="dropdown-item" href="#">edit schedule</a>
                    <a class="dropdown-item" href="#">delete schedule</a>
                </div>
            </li>
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle active" href="/events/" id="navbardrop" data-toggle="dropdown">
                    meetings & tasks
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/events/">show All events</a>
                    <a class="dropdown-item" href="/events/addEvent">add an event</a>
                    <a class="dropdown-item" href="/events/edit-${0}-employee">edit event</a>
                    <a class="dropdown-item" href="#">delete event</a>
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



    <br>


</head>
<body>

<center>

    <b>deleted successfully</b>


</center>
</body>
</html>
