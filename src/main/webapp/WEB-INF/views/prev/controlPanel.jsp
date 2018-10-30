<%--
  Created by IntelliJ IDEA.
  User: naji
  Date: 1/14/2018
  Time: 10:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- Latest compiled and minified CSS -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<link href='<spring:url value="/css/fullcalendar.css"/>' rel='stylesheet' />
<link href='<spring:url value="/css/fullcalendar.print.css"/>' rel='stylesheet' media='print' />

<%--<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js'></script>--%>
<script src="<spring:url value="/js/jquery.js"/>"></script>
<script src="<spring:url value="/js/moment.js"/>"></script>
<script src="<spring:url value="/js/moment-jalaali.js"/>"></script>

<script src='<spring:url value="/js/fullcalendar.min.js"/>'></script>
<script src="<spring:url value="/js/fa.js"/>"></script>
<%--<script src='<spring:url value="/js/mmm.js"/>'></script>--%>

<!-- libraries of token input-->
<script type="text/javascript" src="<spring:url value="/js/jquery.tokeninput.js"/>"></script>
<link rel="stylesheet" href="<spring:url value="/css/token-input.css"/>" type="text/css" />
<link rel="stylesheet" href="<spring:url value="/css/token-input-facebook.css"/>" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<!-- Popper JS -->
<script src='<spring:url value="/js/popper.min.js"/>'></script>


<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<!--links of schedule plugin-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">

<!--<link rel="stylesheet" href="<%--<spring:url value="/js/fullcalendar.js"/>"--%> type="text/css"/>-->

<html>
<head>
    <title>control panel</title>

    <style>
        body {
            font-family: TimesNewRoman,Times New Roman
        }
        .modal-header {
            background-color: #86b7ff;
        }
        .modal-footer{
            background-color: #86b7ff;
        }
        #dropDown{
            width: 100%;
        }

    </style>

    <!--include a navigation bar in page-->

    <div id="includedContent"></div>

    <script>
        $(function(){
            $("#includedContent").load("/navBar");
        });
    </script>

    <script>


        $(document).ready(function() {

            <%--var scheduleInformation=${personalSchedule};--%>

            var eventClickE; //keeps calEvent on edditing a period(event click method)
            var addData;
            var saveStart; //saving the start point of a period on adding new schedule (select method)
            var saveEnd;   //saving the finish point of a period on adding new schedule (select method)
            var AddOrEdit=true; // if it's the add action it's true if it's edit action it's false

            var test;
            function isOverlapping(event){
                // "calendar" on line below should ref the element on which fc has been called
                console.log("isoverlapping function");
                var array = $('#calendar').fullCalendar('clientEvents');

                for(i in array){
                    if (event.end > array[i].start && event.start < array[i].end){

                        return true;
                    }
                }
                return false;
            }

            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                isJalaali : true,
                isRTL : true,
                lang : "fa",
//                isRTL: false,
//                weekends: false, //if we want to hide the hidden days we will set the weekends false
                now: "2018-02-25T00:00:00" ,
                defaultDate: '2018-01-01', //default displaying time (attention: this variable gets only the date)
                navLinks: true, // can click day/week names to navigate views
                selectable: true, //can select the periods and make schedules
                selectHelper: true,
                showNonCurrentDates: false,
                aspectRatio: 1.35,
                overlap: false,
                eventOverlap:false,
                prev: 'right-single-arrow',
                next: 'left-single-arrow',

                //for editing the text
                eventClick: function(calEvent, jsEvent, view) {

                    console.log("event click function");
                    //couldn't find an id in these variables
                    //alert(calEvent.id);alert(jsEvent.id);alert(view.id);

                    $("#participantsTag").tokenInput("clear");

                    //change mode to edit
                    AddOrEdit=false;

                    //saving the calEvent
                    eventClickE=calEvent;
                    console.log(calEvent.participants);



                    //getting the description value
                    $('#description').val(calEvent.title);

                    //this start and end will recieve the start date and time and the finish date and time
                    $('#startTime').val(calEvent.start);
                    $('#finishTime').val(calEvent.end);

                    //update the previous session

                    var eventType=eventClickE.eventType;

                    if(eventType=="event"){
                        $('#event').attr('checked', 'checked');

                    }else if(eventType=="meeting"){
                        $('#meeting').attr('checked', 'checked');
                    }

                    var place=eventClickE.placeCode;
                    $( "#dropDown" ).val(place);

                    console.log("eventClick");
                    console.log(eventClickE.participants);

                    //participant ****
                    for ( var i = 0, l = eventClickE.participants.length; i < l; i++ ) {
                        $("#participantsTag").tokenInput("add",  eventClickE.participants[i]);
                    }



                    //displaying the modal
                    $('#editEventModel').modal('show');

                },

                select: function(start, end) {
                    console.log("select function");
                    console.log(start);
                    console.log(end);

                    $("#participantsTag").tokenInput("clear");
                    eventData = {

                        start: start,
                        end: end,

                    };

                    if(!isOverlapping(eventData)){

                        $('#description').val("");
                        saveStart=start;
                        saveEnd=end;


                        //change mode to add
                        AddOrEdit=true;

                        //displaying the modal
                        $('#editEventModel').modal('show');
                    }else{

                        $('#overlap').modal('show');
                    }




                    //$('#calendar').fullCalendar('unselect');
                },
                eventResize: function(event, delta, revertFunc) {

                    console.log("event resize function");
                    //checking the forbidden periods (if period is invalid reverFunc else continue)
                    console.log("event");
                    console.log(event);
                    console.log("delta");
                    console.log(delta);



                    if (!confirm("are you sure you want to change schedule?")) {
                        revertFunc();
                    }else{
                        //we have to save the changes using ajax
                        var saveEvent= {
                            eventId:event.id,
                            description: event.title,
                            startTime: event.start._d,
                            finishTime: event.end._d,
                            eventType: event.eventType,
                            allDay: event.allDay,
                            place: {
                                placeCode: event.placeCode
                            }
                        };
                        console.log()
                        var temp = JSON.stringify(saveEvent);

                        $.ajax({
                            type: 'post',
                            url:'https://localhost:8443/schedule/updateResizeDrag',
                            data:  temp,
                            contentType: 'application/json',
                            success: function(result){

                                console.log(result);

                                if(result.includes("success")){
                                    //sucess


                                }else if(result=="placeDuplicate"){

                                    alert("this place is reserved by another event at the same time");
                                    revertFunc();
                                }

                            },
                            error: function(XMLHttpRequest, textStatus, errorThrown){
                                console.log(errorThrown);
                                alert("error occurred");
                                revertFunc();
                            }

                        });




                    }

                },

                eventDrop: function(event, delta, revertFunc) {

                    console.log("eventDrop")
                    console.log(event);
                    console.log(event.start);


                    var defaultDuration = moment.duration($('#calendar').fullCalendar('option', 'defaultTimedEventDuration')); // get the default and convert it to proper type
                    var end = event.end || event.start.clone().add(defaultDuration); // If there is no end, compute it
                    event.end=end;
                    console.log("end");
                    console.log(end._d);
                    console.log(event.start._d);

                    if (!confirm("Are you sure about this change?")) {
                        revertFunc();
                    }else{
                        //saving the changes through ajax


                        var saveEvent= {
                            eventId:event.id,
                            description: event.title,
                            startTime: event.start._d,
                            finishTime:end._d,
                            eventType: event.eventType,
                            allDay: event.allDay,
                            place: {
                                placeCode: event.placeCode
                            }
                        };
                        console.log()
                        var temp = JSON.stringify(saveEvent);

                        $.ajax({
                            type: 'post',
                            url:'https://localhost:8443/schedule/updateResizeDrag',
                            data:  temp,
                            contentType: 'application/json',
                            success: function(result){

                                console.log(result);

                                if(result.includes("success")){

                                    //success


                                }else if(result=="placeDuplicate"){

                                    alert("this place is reserved by another event at the same time");
                                    revertFunc();
                                }

                            },
                            error: function(XMLHttpRequest, textStatus, errorThrown){
                                console.log(errorThrown);
                                alert("error occurred");
                                revertFunc();
                            }

                        });

                    }

                },
                editable: true,
                eventLimit: true, // allow "more" link when too many events depends on rows height
                events: ${personalScheduleInFullCalendarFormat}
//                events:[
//
//                    {id: '17',title: 'some description',start: '2017-12-25T07:00:00.000Z',finish: '2017-12-25T12:00:00.000Z'}
//                ]
//                events:[
//                    {
//                        title: 'Meeting',
//                        start: '2018-02-25T10:30:00',
//                        end: '2018-02-25T12:30:00',
//                overlap:false
//
//                    }
//                ]

//                events:[
//                    {id: '17',title: 'some description',start: '2017-12-25T07:00:00.000',overlap:false,eventType: 'task',placeCode: '1',participants:[{"name": "mina","id": "mina","password": "81dc9bdb52d04dc20036dbd8313ed055","nationalId": "455633","email": "mina@gmail","username": "mina","family": "khoshnevisan","position": "developer"}],end: '2017-12-25T10:30:00.000'}
//        ]

            });

            console.log([

                {id: '17',title: 'some description',start: '2017-12-25T07:00:00.000Z',finish: '2017-12-25T10:00:00.000Z'}
            ])
            console.log(${personalScheduleInFullCalendarFormat});
            console.log([
                {
                    title: 'Meeting',
                    start: '2018-02-25T10:30:00',
                    end: '2018-02-25T12:30:00',

                }
            ])

            $( "#saveButton" ).click(function() {

                console.log("save button click function");
                if(AddOrEdit){

                    //the action is add

                    var participants=$("#participantsTag").tokenInput("get");


                    //change the formate of participants to server participants

                    var saveEvent={
                        description:$('#description').val(),
                        startTime:saveStart._d,
                        finishTime:saveEnd._d,
                        eventType:$('input[name=optradio]:checked').val(),
                        place:{
                            placeCode:$('#dropDown').find(":selected").val()
                        }
                        ,employees: participants
                        ,employees:$("#participantsTag").tokenInput("get")

                    };

                    console.log(saveEvent);
                    var temp = JSON.stringify(saveEvent);

                    $.ajax({
                        type: 'post',
                        url:'https://localhost:8443/schedule/addNewSchedule',
                        data:  temp,
                        contentType: 'application/json',
                        success: function(result){

                            console.log(result);

                            if(result.includes("success")){

                                //apply the changes to jQuery array for further display
                                var serverId=parseInt(result);

                                //apply the changes to display
                                var eventData;

                                //updating the value of description
                                eventData = {
                                    id:serverId,
                                    title: $('#description').val(),
                                    start: saveStart,
                                    end: saveEnd,
                                    overlap:false,
                                    eventType:$('input[name=optradio]:checked').val(),
                                    placeCode:$('#dropDown').find(":selected").val(),
                                    participants:$("#participantsTag").tokenInput("get")


                                };
                                //adding the event description
                                $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true



                            }else if(result=="placeDuplicate"){

                                alert("this place is reserved by another event at the same time");

                            }

                        },
                        error: function(XMLHttpRequest, textStatus, errorThrown){
                            console.log(errorThrown);
                            alert("error occured");
                            console.log(errorThrown);
                        }

                    });

                }else{
                    //the action is edit

                    var participants=$("#participantsTag").tokenInput("get");

                    console.log(participants);

                    //sending an ajax to server in order to update the event
                    var updateEvent={
                        eventId:eventClickE.id,
                        description:$('#description').val(),
                        startTime:eventClickE.start._d,
                        finishTime:eventClickE.end._d,
                        eventType:$('input[name=optradio]:checked').val(),
                        allDay: eventClickE.allDay,
                        place:{
                            placeCode:$('#dropDown').find(":selected").val()
                        },
                        employees:$("#participantsTag").tokenInput("get")

                    };
                    console.log(updateEvent);
                    var temp = JSON.stringify(updateEvent);

                    $.ajax({
                        type: 'post',
                        url:'https://localhost:8443/schedule/updateSchedule',
                        data:  temp,
                        contentType: 'application/json',
                        success: function(result){

                            console.log(result);

                            if(result.includes("success")){


                                eventClickE.title=$('#description').val();
                                eventClickE.overlap=false;
                                eventClickE.eventType=$('input[name=optradio]:checked').val();
                                eventClickE.placeCode=$('#dropDown').find(":selected").val();
                                eventClickE.participants=$("#participantsTag").tokenInput("get");

                                $('#calendar').fullCalendar('updateEvent', eventClickE);


                            }else if(result=="placeDuplicate"){

                                alert("this place is reserved by another event at the same time");

                            }

                        },
                        error: function(XMLHttpRequest, textStatus, errorThrown){
                            console.log(errorThrown);
                            alert("error occurred");
                            console.log(errorThrown);

                        }

                    });


                    //updating the event description

                    //apply the changes to jQuery array for further display

                }

            });

            $( "#deleteButton" ).click(function() {

                console.log("delete button click function");

                if(AddOrEdit){
                    //the action is add- no action needed

                }else {
                    //the action is edit

                    if (confirm("are you sure you want to delete this event?")) {
                        var updateEvent = {
                            eventId: eventClickE.id,
                            description: $('#description').val(),
                            startTime: eventClickE.start,
                            finishTime: eventClickE.end,
                            eventType: $('input[name=optradio]:checked').val(),
                            place: {
                                placeCode: $('#dropDown').find(":selected").val()
                            },


                        };
                        // console.log(updateEvent);
                        var temp = JSON.stringify(updateEvent);


                        //deleting event with ajax
                        $.ajax({
                            type: 'post',
                            url: 'https://localhost:8443/schedule/deleteEvent',
                            data: temp,
                            contentType: 'application/json',
                            success: function (result) {

                                console.log(result);

                                if (result == "success") {

                                    //deleting the event from calendar
                                    $('#calendar').fullCalendar('removeEvents', eventClickE.id);

                                }

                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                console.log(errorThrown);
                                alert("error occurred");

                            }

                        });


                    }
                }
            });

            // jquery script for autocomplete tags with ajax
            $("#participantsTag").tokenInput("https://localhost:8443/Employee/findEmployee" , {
                preventDuplicates: true
                ,theme: "facebook"
                ,noResultsText: "No result"
                ,searchingText: "Searching..."
                ,tokenLimit :10
                ,divId:"dropDownParticipants"

                ,resultsFormatter: function(item){ return "<li><p>"+item.name+" "+item.family+" "+item.position+"</p></li>" }
                ,tokenFormatter: function(item) { return "<li><p>" + item.name + " " + item.family +"-"+item.position+ "</p></li>" }

            });

            <%--var initialArray=${personalScheduleInFullCalendarFormat};--%>
            <%--for(i in initialArray){--%>
            <%--$('#calendar').fullCalendar('renderEvent', i, true);--%>
            <%--}--%>
        });




    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("input[type=button]").click(function () {
                alert("Would submit: " + $(this).siblings("input[type=text]").val());
            });
        });
    </script>

</head>
<body>

<div id='calendar'></div>


<div class="modal fade" id="editEventModel">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">add/edit an event</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">


                <div class="form-group">

                    <form:form method="POST" modelAttribute="eventAdding" action="">



                        <!--hidden attribute-->
                        <%--@declare id="eventtype"--%><label for="eventId" hidden>eventId: </label><br>
                        <form:hidden path="eventId" id="eventId"/>
                        <form:errors path="eventId" cssClass="error"/>




                        <label for="description">Description: </label><br>
                        <form:input path="description" id="description" class="form-control"/>
                        <form:errors path="description" cssClass="error"/>


                        <label hidden>startTime: </label>
                        <input  id="startTime" class="form-control" hidden/>



                        <label for="startTime" hidden>startTime: </label>
                        <form:hidden path="startTime" id="startTime" class="form-control" />
                        <form:errors path="startTime" cssClass="error" />


                        <label for="finishTime" hidden>finishTime: </label>
                        <form:hidden path="finishTime" id="finishTime"/>
                        <form:errors path="finishTime" cssClass="error"/>

                        <br>
                        <label for="eventType">EventType: </label><br>
                        <label class="radio-inline">
                            <input type="radio" name="optradio" value="task" id="task" checked>task
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="optradio" value="meeting" id="meeting">meeting
                        </label>
                        <br><br>

                        <label >Place: </label>

                        <div class="dropdown">
                            <form:select path="place.placeCode" class="dropdown-toggle" id="dropDown"><br>
                                <form:option value="1" label="select the place"/>
                                <form:options items="${places}" itemValue="placeCode" id="placeCode" />
                            </form:select>
                        </div>


                        <!-- putting a multiple select auto complete box for the memebers of meeting or the working employees-->
                        <br><br>

                        <label for="employees">Participants: </label><br>
                        <form:input path="employees" type="text" id="participantsTag" class="form-control"/>

                        <div id="dropDownParticipants">

                        </div>

                        <br><br><br><br>
                    </form:form>
                </div>

            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="deleteButton">delete</button><br>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="saveButton">save</button>

            </div>

        </div>
    </div>
</div>



<div class="modal fade" id="overlap">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-body">
                <h4 class="modal-title">warning</h4>
                <p>selected period overlaps another schedule</p>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="overlapOk">ok</button><br>


            </div>
        </div>
    </div>
</div>
<br><br><br><br>
<%--<div>--%>
<%--<input type="text" id="token-input-list-facebook"  />--%>
<%--</div>--%>
<br><br><br><br>
</body>
</html>
