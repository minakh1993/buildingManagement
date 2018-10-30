<!DOCTYPE html>
<%--
  Created by IntelliJ IDEA.
  User: mina
  Date: 18/10/2018
  Time: 04:13 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="fa" dir="rtl">
<head>
    <title><c:out value="${pageTitle}"/></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <%@ page import = "java.util.ResourceBundle" %>

<%--<meta name="viewport" content="width=device-width, initial-scale=1"/>--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script type="text/javascript" src="<spring:url value="/js/lib/jquery-3.2.1.min.js"/>"></script>
    <script type="text/javascript" src="<spring:url value="/js/lib/bootstrap.min.js"/>"></script>
    <script type="text/javascript" src="<spring:url value="/js/lib/alertify.js"/>"></script>
    <script type="text/javascript" src="<spring:url value="/js/lib/persian-date-0.1.8.min.js"/>"></script>

    <script type="text/javascript" src="<spring:url value="/js/lib/persian-datepicker-0.4.5.min.js"/>"></script>
    <script type="text/javascript" src="<spring:url value="/js/charge.js"/>"></script>


    <link rel="stylesheet" href="<spring:url value="/css/lib/bootstrap.css"/>" type="text/css">
    <link rel="stylesheet" href="<spring:url value="/css/lib/bootstrap-rtl.css"/>" type="text/css">
    <link rel="stylesheet" href="<spring:url value="/css/fonts/font-awesome/font-awesome.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<spring:url value="/css/font.css"/>" type="text/css">
    <link rel="stylesheet" href="<spring:url value="/css/lib/animate.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<spring:url value="/css/lib/application.css"/>" type="text/css">
    <link rel="stylesheet" href="<spring:url value="/css/lib/alertify.css"/>" type="text/css">
    <link rel="stylesheet" href="<spring:url value="/css/lib/persian-datepicker-0.4.5.min.css"/>" type="text/css">




    <%--<script src="<spring:url value="/js/lib/jquery-3.3.1.min.js"/>"></script>
    <script src="<spring:url value="/js/lib/popper.min.js"/>"></script>
    <script src="<spring:url value="/js/lib/bootstrap.js"/>"></script>
    <link rel="stylesheet" href="<spring:url value="/css/lib/bootstrap.css"/>" type="text/css">
    <link rel="stylesheet" href="<spring:url value="/css/font.css"/>" type="text/css">--%>



    <%--<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <!-- Brand/logo -->
        <a class="navbar-brand" href="#">
            <img src="<spring:url value="/avatar/building2.jpg"/>" alt="logo" style="width:40px;">
        </a>

        <!-- Links -->
        <ul class="navbar-nav">
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle active" href="/events/" id="navbardrop" data-toggle="dropdown">
                    مدیریت
                </a>
                <div class="dropdown-menu" align="center" style="direction: rtl">
                    <a class="dropdown-item" href="/Charge/" >مدیریت شارژ </a>
                    &lt;%&ndash;<a class="dropdown-item" href="#">search schedules</a>
                    <a class="dropdown-item" href="#">add schedule</a>
                    <a class="dropdown-item" href="#">edit schedule</a>
                    <a class="dropdown-item" href="#">delete schedule</a>&ndash;%&gt;
                </div>
            </li>

        </ul>
    </nav>--%>

</head>
<body>

<div class="full-width">
    <div id="content">

        <section>
            <div class="content-wrapper">
                <h3 class="animated lightSpeedIn" style="margin-right: 0; margin-left: 0">
                    <i class="fa fa-th-large text-success"></i>
                    سامانه مدیریت ساختمان
                </h3>
                <div id="loading" style="display: none;">
                    <i class="fa fa-spinner fa-pulse fa-3x fa-fw" style="color: #00aff0"></i>
                </div>
                <div role="tabpanel" class="tab-pane fade active in" id="building">
                    <div class="panel panel-primary animated fadeInUp animation-delay-5">
                        <div class="panel-heading">شارژ

                        </div>
                        <div class="panel-body">
                            <div id="tabs" role="tabpanel">
                                <!-- Nav tabs -->
                                <div class="card-block">
                                    <!-- Tab panes -->
                                    <div class="tab-content">

                                        <div role="tabpanel" class="tab-pane active" id="chargeManagement">
                                            <div class="col-md-6">
                                                <div class="panel panel-default panel-info">

                                                    <div class="panel-heading ">
                                                        <h4 class="panel-title">
                                                            <a data-toggle="addChargeCollapse" data-parent="#accordion" href="#addChargeCollapse">

                                                                افزودن شارژ
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="addChargeCollapse" class="panel-collapse ">

                                                        <div class="row" align="center">
                                                            <div class="col-md-4"></div>
                                                            <div class="col-md-4">

                                                            <form id="addChargeForm" novalidate>

                                                                <div class="form-group row">
                                                                    <label class="control-label" for="date">تاریخ</label>
                                                                    <div class="input-group">
                                                                        <input id="date" name="date" type="text"
                                                                               class="form-control text-center date hasDatepicker"/>
                                                                        <div class="input-group-addon" data-targetselector="#birthDate">
                                                                            <span class="fa fa-calendar"></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="control-label" for="type"> نوع</label>
                                                                    <select id="type" name="type" class="form-control">
                                                                        <option value="0">لطفا انتخاب کنید</option>
                                                                            <option value="cost">هزینه</option>
                                                                            <option value="charge">شارژ</option>
                                                                    </select>

                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="control-label" for="description"> شرح</label>
                                                                    <input id="description" name="description" type="text" class="form-control" />
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="control-label" for="amount">مبلغ</label>
                                                                    <input id="amount" name="amount" type="number" class="form-control" style="width: 160px !important;"/>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="control-label" for="blockNumber">شماره واحد</label>
                                                                    <select id="blockNumber" name="blockNumber" class="form-control">
                                                                        <option value="0">لطفا انتخاب کنید</option>
                                                                        <c:forEach var="item" items="${blockNumberMap}">
                                                                            <option value="${item.key}">${item.value}</option>
                                                                        </c:forEach>
                                                                    </select>

                                                                </div>
                                                                <div class="row pt-2">
                                                                    <div class="col-md-6" align="center">
                                                                    <button id="save" type="button"
                                                                            data-clearForm="false"
                                                                            class="mb-sm btn btn-purple btn-outline"
                                                                            data-toggle="" >
                                                                        ذخیره
                                                                    </button>
                                                                    </div>
                                                                    <div class="col-md-6" align="center">

                                                                        <button id="receiveTrackingNumber" type="button"
                                                                                data-clearForm="false"
                                                                                class="mb-sm btn btn-purple btn-outline"
                                                                                data-toggle="" style="display:none;">
                                                                            دریافت فیش
                                                                        </button>

                                                                    </div>
                                                                </div>
                                                            </form>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">

                                                <div class="panel panel-default panel-info">

                                                    <div class="panel-heading ">
                                                        <h4 class="panel-title">
                                                            <a data-toggle="searchChargeCollapse" data-parent="#accordion" href="#searchChargeCollapse">

                                                                جستجوی سوابق شارژ
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="searchChargeCollapse" class="panel-collapse ">

                                                        <div class="row">
                                                            searching sharge table
                                                        </div>

                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
</body>
</html>

