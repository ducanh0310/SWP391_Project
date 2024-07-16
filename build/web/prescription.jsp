<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="./css/style.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
        <link href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' rel='stylesheet' type='text/css'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.1/animate.min.css' rel='stylesheet' type='text/css'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular.min.js' rel='stylesheet' type='text/css'>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular.min.js"></script>
    </head>
    <style>
        /* RESET RULES
 ?????????????????????????????????????????????????? */
        @import url("https://fonts.googleapis.com/css?family=Lato:400,700&display=swap");

        :root {
            --page-header-bgColor: #242e42;
            --page-header-bgColor-hover: #1d2636;
            --page-header-txtColor: #dde9f8;
            --page-header-headingColor: #7889a4;
            --page-header-width: 220px;
            --page-content-bgColor: #f0f1f6;
            --page-content-txtColor: #171616;
            --page-content-blockColor: #fff;
            --white: #fff;
            --black: #333;
            --blue: #00b9eb;
            --red: #ec1848;
            --border-radius: 4px;
            --box-shadow: 0 0 10px -2px rgba(0, 0, 0, 0.075);
            --switch-bgLightModeColor: #87cefa;
            --switch-sunColor: gold;
            --switch-moonColor: #f4f4f4;
            --switch-bgDarkModeColor: #1f1f27;
        }

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        ul {
            list-style: none;
        }

        a,
        button {
            color: inherit;
        }

        a {
            text-decoration: none;
        }

        button {
            background: none;
            cursor: pointer;
        }

        input {
            -webkit-appearance: none;
        }

        [type="checkbox"] {
            position: absolute;
            left: -9999px;
        }

        label {
            cursor: pointer;
        }

        button,
        input {
            border: none;
        }

        svg {
            display: block;
        }

        body {
            font: 16px/1.5 "Lato", sans-serif;
        }


        /* HEADER STYLES
        ?????????????????????????????????????????????????? */
        .page-header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            overflow: auto;
            padding-top: 20px;
            width: var(--page-header-width);
            color: var(--page-header-txtColor);
            background: var(--page-header-bgColor);
        }

        .page-header nav {
            display: flex;
            flex-direction: column;
            min-height: 100%;
        }

        .page-header .logo {
            display: block;
            margin: 0 15px;
        }

        .page-header .logo svg {
            max-width: 120px;
            fill: var(--white);
        }

        .page-header .toggle-mob-menu {
            display: none;
            margin-left: 5px;
            padding: 4px;
            background: var(--page-content-blockColor);
            border-radius: var(--border-radius);
        }

        .page-header .toggle-mob-menu svg {
            fill: var(--black);
            transition: transform 0.2s;
        }

        .page-header .admin-menu {
            display: flex;
            flex-direction: column;
            flex-grow: 1;
            margin-top: 35px;
        }

        .page-header .admin-menu li:nth-last-child(2) {
            margin-bottom: 35px;
        }

        .page-header .admin-menu li:last-child {
            margin-top: auto;
            margin-bottom: 20px;
        }

        .page-header .admin-menu li > * {
            width: 100%;
            padding: 12px 15px;
        }

        .page-header .admin-menu .switcher {
            display: inline-block;
            width: auto;
        }

        .page-header .admin-menu .menu-heading h3 {
            text-transform: uppercase;
            letter-spacing: 0.15em;
            font-size: 12px;
            margin-top: 12px;
            color: var(--page-header-headingColor);
        }

        .page-header .admin-menu svg {
            width: 20px;
            height: 20px;
            fill: var(--page-header-txtColor);
            margin-right: 10px;
        }

        .page-header .admin-menu a,
        .page-header .admin-menu button {
            display: flex;
            align-items: center;
            font-size: 0.9rem;
        }

        .page-header .admin-menu a:hover,
        .page-header .admin-menu a:focus,
        .page-header .admin-menu button:hover,
        .page-header .admin-menu button:focus {
            background: var(--page-header-bgColor-hover);
            color: var(--blue);
            outline: none;
        }

        .page-header .admin-menu a:hover svg,
        .page-header .admin-menu a:focus svg,
        .page-header .admin-menu button:hover svg,
        .page-header .admin-menu button:focus svg {
            fill: var(--blue);
        }


        /* PAGE CONTENT STYLES
        ?????????????????????????????????????????????????? */
        .page-content {
            position: relative;
            left: var(--page-header-width);
            width: calc(100% - var(--page-header-width));
            min-height: 100vh;
            padding: 30px;
            color: var(--page-content-txtColor);
            background: var(--page-content-bgColor);
        }
        .page-content {
            position: relative;
            left: var(--page-header-width);
            width: calc(100% - var(--page-header-width));
            min-height: 100vh;
            padding: 0;
            color: var(--page-content-txtColor);
            background: var(--page-content-bgColor);
        }
        .search-and-user {
            display: grid;
            grid-template-columns: 1fr auto;
            grid-column-gap: 50px;
            align-items: center;
            background: var(--page-content-bgColor);
            margin-bottom: 30px;
        }

        .search-and-user form {
            position: relative;
        }

        .search-and-user [type="search"] {
            width: 100%;
            height: 50px;
            font-size: 1.5rem;
            padding-left: 15px;
            background: var(--page-content-blockColor);
            color: var(--white);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }

        .search-and-user ::placeholder {
            color: var(--page-content-txtColor);
        }

        .search-and-user form svg {
            width: 26px;
            height: 26px;
            fill: var(--page-content-txtColor);
        }

        .search-and-user form button {
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
        }

        .search-and-user .admin-profile {
            display: flex;
            align-items: center;
        }

        .search-and-user .admin-profile .greeting {
            margin: 0 10px 0 20px;
        }

        .search-and-user .admin-profile svg {
            width: 30px;
            height: 30px;
        }

        .search-and-user .admin-profile .notifications {
            position: relative;
        }

        .search-and-user .admin-profile .badge {
            display: flex;
            align-items: center;
            justify-content: center;
            position: absolute;
            top: -10px;
            right: -3px;
            width: 18px;
            height: 18px;
            border-radius: 50%;
            font-size: 10px;
            color: var(--white);
            background: var(--red);
        }

        .page-content .grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 30px;
        }

        .page-content .grid > article {
            display: flex;
            height: 300px;
            background: var(--page-content-blockColor);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }

        .page-content .grid > article:first-child,
        .page-content .grid > article:last-child {
            grid-column: 1 / -1;
        }


        /* MQ RULES
        ?????????????????????????????????????????????????? */
        @media screen and (max-width: 767px) {
            .page-header,
            .page-content {
                position: static;
                width: 100%;
            }

            .page-header {
                padding: 10px;
            }

            .page-header nav {
                flex-direction: row;
            }

            .page-header .logo {
                margin: 0;
            }

            .page-header .logo svg {
                width: 83px;
                height: 35px;
            }

            .page-header .toggle-mob-menu {
                display: block;
            }

            .page-header .admin-menu {
                position: absolute;
                left: 98px;
                top: 57px;
                margin-top: 0;
                z-index: 2;
                border-radius: var(--border-radius);
                background: var(--page-header-bgColor);
                visibility: hidden;
                opacity: 0;
                transform: scale(0.95);
                transition: all 0.2s;
            }

            .page-header .admin-menu li:nth-last-child(2) {
                margin-bottom: 12px;
            }

            .page-header .admin-menu li:last-child button,
            .search-and-user .admin-profile .greeting {
                display: none;
            }

            .page-content {
                min-height: 0;
                padding: 10px;
            }

            .page-content .grid {
                grid-gap: 10px;
            }

            .search-and-user {
                position: absolute;
                left: 131px;
                top: 10px;
                padding: 0;
                grid-column-gap: 5px;
                width: calc(100% - 141px);
                border-radius: var(--border-radius);
                background: transparent;
            }

            .search-and-user [type="search"] {
                font-size: 1rem;
                height: 35px;
            }

            .search-and-user form svg {
                width: 18px;
                height: 18px;
            }

            .search-and-user .admin-profile svg {
                fill: var(--white);
            }
        }

        @media screen and (max-width: 400px) {
            .page-content .grid > article {
                grid-column: 1 / -1;
            }
        }


        /* BODY CLASSES
        ?????????????????????????????????????????????????? */
        .mob-menu-opened .toggle-mob-menu svg {
            transform: rotate(180deg);
        }

        .mob-menu-opened .page-header .admin-menu {
            transform: scale(1);
            visibility: visible;
            opacity: 1;
        }

        @media screen and (min-width: 768px) {
            .collapsed .page-header {
                width: 40px;
            }

            .collapsed .page-header .admin-menu li > * {
                padding: 10px;
            }

            .collapsed .page-header .logo,
            .collapsed .page-header .admin-menu span,
            .collapsed .page-header .admin-menu .menu-heading {
                display: none;
            }

            .collapsed .page-header .admin-menu svg {
                margin-right: 0;
            }

            .collapsed .page-header .collapse-btn svg {
                transform: rotate(180deg);
            }

            .collapsed .page-content {
                left: 40px;
                width: calc(100% - 40px);
            }
        }


        /* SWITCH STYLES
        ?????????????????????????????????????????????????? */
        .switch label {
            display: grid;
            grid-template-columns: auto auto;
            grid-column-gap: 10px;
            align-items: center;
            justify-content: flex-start;
        }

        .switch span:first-child {
            position: relative;
            width: 50px;
            height: 26px;
            border-radius: 15px;
            box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.4);
            background: var(--switch-bgLightModeColor);
            transition: all 0.3s;
        }

        .switch span:first-child::before,
        .switch span:first-child::after {
            content: "";
            position: absolute;
            border-radius: 50%;
        }

        .switch span:first-child::before {
            top: 1px;
            left: 1px;
            width: 24px;
            height: 24px;
            background: var(--white);
            z-index: 1;
            transition: transform 0.3s;
        }

        .switch span:first-child::after {
            top: 50%;
            right: 8px;
            width: 10px;
            height: 10px;
            transform: translateY(-50%);
            background: var(--switch-sunColor);
            box-shadow: 0 0 4px 2px #ffdb1a;
        }

        .switch [type="checkbox"]:checked + label span:first-child {
            background: var(--switch-bgDarkModeColor);
        }

        .switch [type="checkbox"]:focus + label span:first-child {
            box-shadow: 0 3px 5px rgba(255, 255, 255, 0.25);
        }

        .switch [type="checkbox"]:checked + label span:first-child::before {
            transform: translateX(24px);
        }

        .switch [type="checkbox"]:checked + label span:first-child::after {
            left: 12px;
            width: 15px;
            height: 15px;
            background: transparent;
            box-shadow: -2px -5px 0 var(--switch-moonColor);
            transform: translateY(-50%) rotate(-72deg);
        }


        /* LIGHT MODE STYLES
        ?????????????????????????????????????????????????? */
        .light-mode {
            --page-header-bgColor: #f1efec;
            --page-header-bgColor-hover: #b9e4e0;
            --page-header-txtColor: #2c303a;
            --page-header-headingColor: #979595;
            --page-content-bgColor: #fff;
            --box-shadow: 0 0 10px -2px rgba(0, 0, 0, 0.25);
        }

        .light-mode .page-header .admin-menu a:hover,
        .light-mode .page-header .admin-menu a:focus,
        .light-mode .page-header .admin-menu button:hover,
        .light-mode .page-header .admin-menu button:focus {
            color: var(--black);
        }

        .light-mode .page-header .logo svg,
        .light-mode .page-header .admin-menu a:hover svg,
        .light-mode .page-header .admin-menu a:focus svg,
        .light-mode .page-header .admin-menu button:hover svg,
        .light-mode .page-header .admin-menu button:focus svg {
            fill: var(--black);
        }

        .light-mode .switch [type="checkbox"]:focus + label span:first-child {
            box-shadow: 0 3px 5px rgba(0, 0, 0, 0.25);
        }

        @media screen and (max-width: 767px) {
            .light-mode .search-and-user .admin-profile svg {
                fill: var(--black);
            }
        }


        /* FOOTER
        ?????????????????????????????????????????????????? */
        .page-footer {
            font-size: 1rem;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            margin-top: 10px;
        }

        .page-footer a {
            margin-left: 4px;
        }

        [class^=col-]{
            padding-top:10px;
            padding-bottom:10px;
        }
        .contact-builder{
            background:#fff;
        }

        .container{
            background:#fff;
            padding-bottom:40px;
            padding-top:20px;
        }
        .fav{
            background:orange;
        }
        .glyphicon{
            padding-right:5px;
            color:#333;
        }
        .btn-primary, .btn-danger{
            .glyphicon{
                padding-right:5px;
                color:#fff;
            }
        }

        .table-striped>tbody>tr:nth-of-type(odd), .table-striped>tbody>tr:nth-of-type(even){
            &.favorite {
                background:rgba(234,88,114,0.2);
                .glyphicon-heart{
                    color:#EA5872;
                }
            }
        }


        form{
            padding-bottom:10px;
            padding-top:10px;
        }

        footer[class^=col-]{
            opacity:0.5;
            margin-top:40px;
            img{
                height:30px;
            }
        }
        th{
            cursor:pointer;
        }
        table{
            min-width:500px;
            width:100%;
        }
        .table-wrap{
            overflow-x:auto;
            width:100%;
        }
        .page-header {
            padding-bottom: 9px;
            margin: 0;
            border-bottom: 1px solid #eee;
        }
        .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
            padding: 8px;
            line-height: 1.42857143;
            vertical-align: top;
            border-top: 1px solid #ddd;
            font-size: small;
        }
        .text-primary {
            --x-text-opacity: 1;
            color: #06a3da !important;
        }
        .m-0 {
            margin-left: 10px !important;
        }
        body{
            background: #f7f7ff;
            margin-top:0px;
        }

        .col-md-7 {
            width: 100%;
        }
        .col-md-offset-1 {
            margin-left: 0;
        }
        .col-md-offset-1 {
            margin-left: 300px;
        }
        .col-md-3 {
            width: 50%;
        }

    </style>
    <body>
        <svg style="display:none;">
    <symbol id="file-symbol" viewBox="0 0 16 16">
        <path d="M13,4V16H3V0h7l3,3ZM12,4H10V2h1v1h1Zm-2,0V2h1v2Zm3,0V4h1v9H3V1H9v3h3Z" />
    </symbol>
    <symbol id="capsule-symbol" viewBox="0 0 16 16">
        <path d="M13.5,2.5a4,4,0,0,0-5.66,0l-5,5a4,4,0,1,0,5.66,5.66l5-5A4,4,0,0,0,13.5,2.5Zm-5,10a2,2,0,1,1,0-2.83A2,2,0,0,1,8.5,12.5Z" />
    </symbol>
    </svg>
    <header class="page-header">
        <nav>
            <a href="index.jsp" class="navbar-brand p-0">
                <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>DentCare</h1>
            </a>
            <button class="toggle-mob-menu" aria-expanded="false" aria-label="open menu">
                <svg width="20" height="20" aria-hidden="true">
                <use xlink:href="#down"></use>
                </svg>
            </button>
            <ul class="admin-menu">
                <li class="menu-heading">
                    <h3>Doctor/Nurse</h3>
                </li>
                <li>
                    <a href="doctorAndNurse.jsp">
                        <svg>
                        <use xlink:href="#file-symbol"></use>
                        </svg>
                        <span>Result</span>
                    </a>
                </li>
                <li>
                    <a href="searchExamPatient.jsp">
                        <svg>
                        <use xlink:href="#capsule-symbol"></use>
                        </svg>
                        <span>Prescription</span>
                    </a>
                </li>

                </li>

                <li>
                    <div class="switch">
                        <input type="checkbox" id="mode" checked>
                        <label for="mode">
                            <span></span>
                            <span>Dark</span>
                        </label>
                    </div>

                </li>
            </ul>
        </nav>
    </header>
    <section class="page-content">

        <section class="grid">
            <article>
                <div ng-app="contactList" ng-controller="nameAdderController as nameAdder">
                    <div class="container">
                        <div class="row">
                            <header class="col-md-offset-1 col-md-10">
                                <h1>Prescription List</h1>
                                <hr>
                            </header>
                        </div>

                        <div class="row">
                            <div class="col-md-offset-1 col-md-3 module contact-builder">

                                <form class="form" ng-submit="addContact()" ng-hide="editing">
                                    <h4>New Prescription</h4>
                                    <div class="form-group">
                                        <label for="name">Name:</label>
                                        <input type="text" id="name" class="form-control" value="${patientResult.pid.name}" readonly ng-model="nameBox">
                                    </div>
                                    <div class="form-group">
                                        <label for="exam_date">Exam Date:</label>
                                        <input type="text" id="exam_date" class="form-control" value="${patientResult.exam_date}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="duration">Duration:</label>
                                        <input type="text" id="diagnosis" class="form-control" value="${patientResult.diagnosis}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="symptoms">Symptoms:</label>
                                        <input type="text" id="symptoms" class="form-control" value="${patientResult.symptoms}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="test_result">Test Result:</label>
                                        <input type="text" id="test_result" class="form-control" value="${patientResult.test_result}" readonly>
                                    </div>                           
                                    <div class="form-group">
                                        <input type="type" id="medication" class="form-control" placeholder="Medication" ng-model="medicationBox" required> 
                                    </div>
                                    <div class="form-group">
                                        <input type="type" id="dosage" class="form-control" placeholder="Dosage" ng-model="dosageBox" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="type" id="duration" class="form-control" placeholder="Duration" ng-model="durationBox" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="type" id="notes" class="form-control" placeholder="Notes" ng-model="notesBox" required>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i>Add Prescription</button>
                                        <button type="reset" class="btn btn-default">Reset</button>
                                    </div>
                                </form>

                                <form ng-submit="editContact()" ng-show="editing" class="animated flipInY">
                                    <h4>Edit Prescription</h4>
                                    <div class="form-group">
                                        <label for="name">Name:</label>
                                        <input type="text" id="exam_date" class="form-control" value="${patientResult.pid.name}" >
                                    </div>
                                    <div class="form-group">
                                        <label for="exam_date">Exam Date:</label>
                                        <input type="text" id="exam_date" class="form-control" value="${patientResult.exam_date}" >
                                    </div>
                                    <div class="form-group">
                                        <label for="duration">Duration:</label>
                                        <input type="text" id="diagnosis" class="form-control" value="${patientResult.diagnosis}" >
                                    </div>
                                    <div class="form-group">
                                        <label for="symptoms">Symptoms:</label>
                                        <input type="text" id="symptoms" class="form-control" value="${patientResult.symptoms}" >
                                    </div>
                                    <div class="form-group">
                                        <label for="test_result">Test Result:</label>
                                        <input type="text" id="test_result" class="form-control" value="${patientResult.test_result}" >
                                    </div>                                                              
                                    <div class="form-group">
                                        <input type="type" id="medication" class="form-control" placeholder="Medication" ng-model="medicationBox">
                                    </div>
                                    <div class="form-group">
                                        <input type="type" id="dosage" class="form-control" placeholder="Dosage" ng-model="dosageBox">
                                    </div>
                                    <div class="form-group">
                                        <input type="type" id="duration" class="form-control" placeholder="Duration" ng-model="durationBox">
                                    </div>
                                    <div class="form-group">
                                        <input type="type" id="notes" class="form-control" placeholder="Notes" ng-model="notesBox">
                                    </div>

                                    <div class="form-group">
                                        <button type="submit" class="btn btn-default">Edit Prescription</button>
                                        <button ng-click="openEdit()" class="btn btn-default">Cancel</button>
                                    </div>
                                </form>

                            </div>
                            <div class="col-md-7 module contact-list">
                                <form>
                                    <div class="form-group">
                                        <input placeholder="Search Names" class="form-control" ng-model="filters.name"></input>
                                    </div>
                                    <div class="form-group">
                                        <input type="checkbox" ng-model="exactMatch"> Exact Match</input>
                                    </div>
                                    <div class="form-group pull-right">
                                        <button type="button" class="btn btn-danger" ng-click="deleteAll()"><i class="glyphicon glyphicon-trash"></i> Delete All Contacts</button>
                                    </div>
                                </form>
                                <div class="table-wrap clearfix">
                                    <table class="table table-hover table-striped table-responsive">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th ng-click="nameSorter()">Name</th>      
                                                <th>Phone</th>
                                                <th>Medication</th>
                                                <th>Dosage</th>
                                                <th>Duration</th>
                                                <th>Notes</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="obj in nameList| filter:filters:exactMatch | filter:filterFavs track by $index" class="{{obj.favorite}} animated fadeIn">
                                                <td>{{$index + 1}}</td>
                                                <td>{{obj.name}}</td>
                                                <td>{{obj.phone}}</td>
                                                <td>{{obj.medication}}</td>
                                                <td>{{obj.dosage}}</td>
                                                <td>{{obj.duration}}</td>
                                                <td>{{obj.notes}}</td>
                                                <td class="text-right">
                                                    <a href="#" ng-click="openEdit($index)"><i class="glyphicon glyphicon-pencil"></i></a>
                                                    <a href="#" ng-click="removeName($index)"><i class="glyphicon glyphicon-trash"></i></a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <!-- Pagination -->
                                    <!-- ... -->
                                </div>
                                <div class="col-md-6 text-right">
                                    <!-- Save Draft and Submit buttons -->
                                    <button type="button" class="btn btn-default" ng-click="saveDraft()">Save Draft</button>
                                    <button type="button" class="btn btn-primary" ng-click="submitForm()">Submit</button>
                                </div>
                            </div>

                        </div>
                    </div>

            </article>

        </section>

    </section>

</body>
<script>
    angular.module("contactList", [])
            .controller("nameAdderController", function ($scope) {

                // Set temp initial values for testing
                $scope.nameBox = "${patientResult.pid.name}";
                $scope.phoneBox = "";
                $scope.emailBox = "";
                $scope.medicationBox = "";
                $scope.dosageBox = "";
                $scope.durationBox = "";
                $scope.notesBox = "";
                //

                var nameList = [{name: "${patientResult.pid.name}",
                        favorite: "",
                        phone: "6664206967",
                        email: "",
                        medication: "Amoxicillin",
                        dosage: "500mg",
                        duration: "7 days",
                        notes: "Take with food"
                    }];
                $scope.nameList = nameList;
                $scope.selectedIndex = -1;

                $scope.openEdit = function ($index) {
                    if (!$scope.editing) {
                        // Edit contact is open
                        $scope.editing = true;
                        $scope.selectedIndex = $index;
                        $scope.nameBox = $scope.nameList[$index].name;
                        $scope.phoneBox = $scope.nameList[$index].phone;
                        $scope.medicationBox = $scope.nameList[$index].medication;
                        $scope.dosageBox = $scope.nameList[$index].dosage;
                        $scope.durationBox = $scope.nameList[$index].duration;
                        $scope.notesBox = $scope.nameList[$index].notes;
                    } else {
                        $scope.cancelEdit();
                    }
                };

                $scope.editContact = function () {
                    // Update existing contact
                    if ($scope.selectedIndex !== -1) {
                        $scope.nameList[$scope.selectedIndex].name = $scope.nameBox;
                        $scope.nameList[$scope.selectedIndex].phone = $scope.phoneBox;
                        $scope.nameList[$scope.selectedIndex].medication = $scope.medicationBox;
                        $scope.nameList[$scope.selectedIndex].dosage = $scope.dosageBox;
                        $scope.nameList[$scope.selectedIndex].duration = $scope.durationBox;
                        $scope.nameList[$scope.selectedIndex].notes = $scope.notesBox;
                        $scope.cancelEdit();
                    }
                };

                $scope.cancelEdit = function () {
                    $scope.editing = false;
                    $scope.selectedIndex = -1;
                    $scope.nameBox = "${patientResult.pid.name}";
                    $scope.phoneBox = "";
                    $scope.medicationBox = "";
                    $scope.dosageBox = "";
                    $scope.durationBox = "";
                    $scope.notesBox = "";
                };
                $scope.nameSorter = function () {
                    // Sort by name
                    $scope.nameList.sort(function (a, b) {
                        var x = a.name.toLowerCase();
                        var y = b.name.toLowerCase();
                        return x < y ? -1 : x > y ? 1 : 0;
                    });
                };
                // Sort onload
                $scope.nameSorter();
                $scope.addContact = function () {
                    // Add new contact
                    $scope.nameList.push({
                        name: $scope.nameBox,
                        phone: $scope.phoneBox || "",
                        email: $scope.emailBox || "",
                        medication: $scope.medicationBox || "",
                        dosage: $scope.dosageBox || "",
                        duration: $scope.durationBox || "",
                        notes: $scope.notesBox || ""
                    });
                    $scope.nameSorter();
                    $scope.emailBox = "";
                    $scope.nameBox = "${patientResult.pid.name}";
                    $scope.phoneBox = "";
                    $scope.medicationBox = "";
                    $scope.dosageBox = "";
                    $scope.durationBox = "";
                    $scope.notesBox = "";
                };
                $scope.removeName = function ($index) {
                    // Remove contact
                    var curName = $scope.nameList[$index].name;
                    $scope.nameList.splice($index, 1);
                    console.log(curName + " removed");
                };
                $scope.deleteAll = function () {
                    // Delete all contacts
                    $scope.nameList = [];
                };
                $scope.favSort = false;
                $scope.favToggle = function () {
                    // Toggle favorite sorting
                    $scope.favSort = !$scope.favSort;
                    console.log($scope.favSort);
                };
                $scope.filterFavs = function (obj) {
                    // Filter favorite contacts
                    return !$scope.favSort || obj.favorite === "favorite";
                };
            });

</script>
</html>