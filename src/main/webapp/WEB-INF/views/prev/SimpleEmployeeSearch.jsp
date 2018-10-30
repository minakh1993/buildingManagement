<%--
  Created by IntelliJ IDEA.
  User: naji
  Date: 2/17/2018
  Time: 9:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <title>simple employee search</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <link href='<spring:url value="/css/fullcalendar.css"/>' rel='stylesheet' />
    <link href='<spring:url value="/css/fullcalendar.print.css"/>' rel='stylesheet' media='print' />

    <%--<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js'></script>--%>
    <script src="<spring:url value="/js/jquery.js"/>"></script>
    <script src="<spring:url value="/js/moment.js"/>"></script>
    <script src='<spring:url value="/js/fullcalendar.js"/>'></script>
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

</head>
<body>




<div>



    <script type="text/javascript">
        $(document).ready(function() {


            $("#token-input-list-facebook").tokenInput("http://localhost:8081/Employee/findEmployee" , {
                preventDuplicates: true
                ,theme: "facebook"
                ,noResultsText: "No result"
                ,searchingText: "Searching..."
//                ,tokenLimit :2
                ,divId:"test"
                ,width: 800
                ,zindex:0
//                ,animateDropdown: false
                //prePopulate is the selected options matrix
//                ,onAdd: function (item) {
//                    alert("Added " + item.name);
//                },
//                onDelete: function (item) {
//                    alert("Deleted " + item.name);
//                }
//


                ,prePopulate: [

                    {id:"4",name: "test", family: "Slurms MacKenzie", position:"developer" , disabled:true , "readonly":true},


                ]

                ,resultsFormatter: function(item){ return "<li><p>"+item.name+" "+item.family+" "+item.position+"</p></li>" }
                ,tokenFormatter: function(item) { return "<li><p>" + item.name + " " + item.family +"-"+item.position+ "</p></li>" }


            });


            $("#show").click(function(){
            var result= $("#token-input-list-facebook").tokenInput("get");
            console.log(result);

            });

            $("#modal").click(function(){
                $('#editEventModel').modal('show');
            });
        });






    </script>

    <br><br><br>


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

                    <%--<input type="text" id="token-input-list-facebook" name="blah" />--%>
                    <%--<div id="test">--%>

                    <%--</div>--%>

                    <br><br><br><br><br><br>
                </div>
            </div>
        </div>
    </div>

    <%--<button id="show">show result</button>--%>

    <button id="modal">show result</button>

    <input type="text" id="token-input-list-facebook" name="blah" />
    <div id="test">

    </div>
</div>


<%--<input type="text" id="token-input-list-facebook" name="blah" />--%>
<%--<div id="test">--%>


<%--</div>--%>
</body>
</html>
