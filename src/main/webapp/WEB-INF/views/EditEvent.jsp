<%--
  Created by IntelliJ IDEA.
  User: naji
  Date: 1/16/2018
  Time: 11:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="application/javascript">
        $(document).ready(function () {
            $('#searchDes').on('click', function (e) {

                var x = $('#deText').val();

                $.ajax({url: "/events/serachByDescription/"+x
                    ,headers: {
                        'Accept': 'application/json'
                    }
                    , success: function(result){
                    alert(result);
                }});





            });
        });

    </script>
</head>

<body>


<br><br>

<div style="padding-left: 15cm">
    <b>search events by description:</b>
    <input type="text" id="deText">
    <button value="search" id="searchDes">search</button>

    <form method="get" action="">
        <%--<input type="text" name="eventDescription" id="eventDescription">--%>
        <br>
        <select>
            <options value="searchResultByDescription"></options>
        </select>

        <input type="button" value="edit" id="dsearch"><br>
    </form>


    <b>serch events by date:</b>


    <form:form method="POST" modelAttribute="eventForEdit" action="">


        <br><br>
        <label for="eventId" hidden>eventId: </label><br>
        <form:hidden path="eventId" id="eventId"/>
        <form:errors path="eventId" cssClass="error"/>

        <br><br>
        <label for="description">description: </label><br>
        <form:input path="description" id="description"/>
        <form:errors path="description" cssClass="error"/>



        <br><br>
        <label for="startTime">startTime: </label><br>
        <form:input path="startTime" id="startTime"/>
        <form:errors path="startTime" cssClass="error"/>


        <br><br>
        <label for="finishTime">finishTime: </label><br>
        <form:input path="finishTime" id="finishTime"/>
        <form:errors path="finishTime" cssClass="error"/>


        <br><br>
        <label for="eventType">EventType: </label><br>
        <form:select path="eventType">
            <form:option value="task"/>
            <form:option value="meeting"/></form:select>
        <form:errors path="eventType" cssClass="error"/>


        <br><br>
        <%--<label for="place">place: </label>--%>
        <%--<form:select path="place" items="${places}" />--%>

        place:<br>
        <form:select path="place.placeCode"><br>
            <form:option value="1" label="--Please Select"/>
            <form:options items="${places}" itemValue="placeCode"/>
        </form:select>

        <br><br>

        <%--<INPUT type="button" value="Add Row" onclick="addRow('dataTable')" />--%>

        <%--<INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable')" />--%>

        <%--<TABLE id="dataTable" width="350px" border="1">--%>
        <%--<TR>--%>
        <%--<TD><input type="checkbox" name="chk"/></TD>--%>
        <%--<TD>--%>


        <%--<form:select path="employees[1].username" items="${emps}" itemValue="username" />--%>
        <%----%>

        <%--</TD>--%>
        <%--</TR>--%>
        <%--</TABLE>--%>

        <br><br>
        <input type="submit" value="next step"/>


    </form:form>

</div>



</body>
</html>


