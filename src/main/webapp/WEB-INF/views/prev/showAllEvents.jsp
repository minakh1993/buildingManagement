<%--
  Created by IntelliJ IDEA.
  User: naji
  Date: 1/14/2018
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <a class="dropdown-item" href="/events/edit-${0}-event">edit event</a>
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


<div class="container">

    <div class="row">
        <div class="col-sm-1">

        </div>
        <div class="col-sm-10">
            <h1>Table of events</h1><br><br>
        </div>
        <div class="col-sm-1">

        </div>
    </div>



    <div class="row">

        <div class="col-sm-1">

        </div>
        <div class="col-sm-10">


            <div class="table-responsive">
                <table class="table table-striped table-hover" style="width:75%">
                    <thead>
                    <tr>
                        <td>eventId</td><td>description</td><td>date</td><td>startTime</td><td>finishTime</td><td>EventType</td><td>place</td><td colspan="2">action</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${Events}" var="event">
                        <tr>
                            <td>${event.eventId}</td>
                            <td>${event.description}</td>
                            <td>${event.startTime}</td>
                            <td>${event.finishTime}</td>
                            <td>${event.eventType}</td>
                            <td>${event.place}</td>


                            <td><a href="<c:url value='/events/edit-${event.eventId}-event' />">edit</a></td>
                            <td><a href="<c:url value='/events/delete-${event.eventId}-event' />">delete</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>


        <div class="col-sm-1">



        </div>
    </div>
</div>
</body>
</html>
