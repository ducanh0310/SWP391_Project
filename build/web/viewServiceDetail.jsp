<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>DentCare - Dental Clinic</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
        <link href="lib/twentytwenty/twentytwenty.css" rel="stylesheet" />
        <!-- BoxIcons v2.1.2 -->
        <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet">

        <!-- Roboto Font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">

        <!-- CSS File -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <style>
            .text-primary {
                --x-text-opacity: 1;
                color: #06a3da !important;
            }
            .m-0 {
                margin-left: 30px !important;
            }
            body{
                background: #f7f7ff;
                margin-top:0px;
            }
            table th , table td{
                text-align: center;
            }
            th {
                background: #333;
                color: #fff;
            }
            .header_wrap {
                padding:30px 0;
            }
            .content-bar{
                width: calc(100% - 40px);
                margin-left:20px;
                margin-top:10px;
                background:#fff;
                box-shadow: 0px 2px 10px 0px rgba(0,0,0,0.06);
                border-radius:12px;
                display:grid;
                grid-template-rows: 1fr;
                grid-template-columns: 0fr 1fr 1fr 3fr 0fr;
            }
            .page-title{
                font-weight:500;
                font-size:26px;
                padding-left:20px;
            }
            .itemnum{
                padding: 15px;
                color:gray;
                font-weight:300;
            }
            .itemtitle{
                padding:15px;
                padding-bottom:15px;
                color:black;
                min-width:200px;
                margin-left: 70px;
            }
            .itemprice{
                padding:15px;
                padding-bottom:15px;
                color:#319959;
                min-width:150px;
                margin-left: 100px;
            }
            .itemstock{

                padding:15px;
                padding-bottom:15px;
                color:black;
                font-weight:300;
            }
            .btncontainer{
                width:90px;
                background:none;
                margin-left: 350px;
            }
            .cbbtn{
                float:right;
                margin-right:10px;
                width:35px;
                height:35px;
                margin-top:7px;
                border-radius:12px;
                border:none;
            }

            @media only screen and (max-width: 780px) {
                .content-bar{
                    grid-template-columns: 0fr 1fr 0fr;
                }
                .itemprice{
                    display:none;
                }
                .itemstock{
                    display:none;
                }
                .cbbtn{
                    margin-top:5px;
                    margin-right:5px;
                }
            }
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }


            ::selection{
                color: #fff;
                background: #ff654a;
            }

            .wrapper{
                max-width: 450px;
                margin: 20px auto;
            }

            .wrapper .search-input{
                background: #fff;
                width: 100%;
                border-radius: 5px;
                position: relative;
                box-shadow: 0px 1px 5px 3px rgba(0,0,0,0.12);
            }

            .search-input input{
                height: 55px;
                width: 100%;
                outline: none;
                border: none;
                border-radius: 5px;
                padding: 0 60px 0 20px;
                font-size: 18px;
                box-shadow: 0px 1px 5px rgba(0,0,0,0.1);
            }

            .search-input.active input{
                border-radius: 5px 5px 0 0;
            }

            .search-input .autocom-box{
                padding: 0;
                opacity: 0;
                pointer-events: none;
                max-height: 280px;
                overflow-y: auto;
            }

            .search-input.active .autocom-box{
                padding: 10px 8px;
                opacity: 1;
                pointer-events: auto;
            }

            .autocom-box li{
                list-style: none;
                padding: 8px 12px;
                display: none;
                width: 100%;
                cursor: default;
                border-radius: 3px;
            }

            .search-input.active .autocom-box li{
                display: block;
            }
            .autocom-box li:hover{
                background: #efefef;
            }

            .search-input .icon{
                position: absolute;
                right: 0px;
                top: 0px;
                height: 55px;
                width: 55px;
                text-align: center;
                line-height: 55px;
                font-size: 20px;
                color: black;
                cursor: pointer;
            }
        </style>

    </head>

    <body>
        <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
            <!-- Vertical Navbar -->
            <nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg" id="navbarVertical">
                <div class="container-fluid">
                    <!-- Toggler -->
                    <button class="navbar-toggler ms-n2" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarCollapse" aria-controls="sidebarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- Brand -->
                    <a href="index.jsp" class="navbar-brand p-0">
                        <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>DentCare</h1>
                    </a>
                    <!-- Collapse -->
                    <div class="collapse navbar-collapse" id="sidebarCollapse">
                        <!-- Navigation -->
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="admin.jsp">
                                    <i class="bi bi-house"></i> Dashboard
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="PatientController">
                                    <i class="bi bi-list-task"></i> Patient
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="serviceDetail">
                                    <i class="bi bi-person-lines-fill"></i> Service
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-clipboard-check"></i> Treatment
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-clock"></i> Appointment
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-exclamation-square-fill"></i> Report
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-gear-fill"></i> Setting
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-people"></i> Users
                                </a>
                            </li>
                        </ul>
                        <!-- Divider -->
                        <hr class="navbar-divider my-5 opacity-20">
                        <!-- Navigation -->

                        <!-- Push content down -->
                        <hr>
                        <!-- User (md) -->
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-person-square"></i> Account
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-box-arrow-left"></i> Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Main content -->
            <div class="h-screen flex-grow-1 overflow-y-lg-auto">

                <!-- Main -->
                <main class="py-6 bg-surface-secondary">
                    <div class="container-fluid">
                        <div class="card shadow border-0 mb-7">                       
                            <div class="container">
                                <div class="header_wrap">  
                                    <div class="page-title">Service</div> 
                                    <div class="wrapper">
                                        <div class="search-input">
                                            <a href="" target="_blank" hidden></a>
                                            <input type="text" placeholder="Type to search.." onkeyup="searchServices(event)">
                                            <div class="autocom-box">
                                                <!-- Các mục sẽ được chèn từ JavaScript -->
                                            </div>
                                            <div class="icon"><i class="fas fa-search"></i></div>
                                        </div>
                                    </div>
                                    <c:forEach items="${services}" var="service" varStatus="loop">
                                        <div class="content-bar">
                                            <div class="itemnum">${loop.index + 1}</div>
                                            <div class="itemtitle">${service.procedure_name}</div>
                                            <div class="itemprice">$${service.price}</div>
                                            <div class="btncontainer">
                                                <button class="cbbtn"><i class="bi bi-trash" aria-hidden="true"></i></button>
                                                <button class="cbbtn"><i class="bi bi-pencil-square" aria-hidden="true"></i></button>
                                            </div>
                                        </div>
                                    </c:forEach> 
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <!-- Back to
<script src="js/suggestions.js"></script>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        <script src="lib/twentytwenty/jquery.event.move.js"></script>
        <script src="lib/twentytwenty/jquery.twentytwenty.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script> 
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script>
                                                var mnu = document.getElementById("mnu");
                                                var mstate = false;

                                                function slideMenu() {
                                                    mstate = !mstate;
                                                    if (mstate) {
                                                        mnu.style.left = "0px";
                                                        mnu.style.boxShadow = "100px 0px 300px 0px rgba(0,0,0,0.3)";
                                                    } else {
                                                        mnu.style.left = "-250px";
                                                        mnu.style.boxShadow = "0px 0px 00px 0px rgba(0,0,0,0.0)";
                                                    }
                                                }
                                                function searchServices(event) {
                                                    var keyword = event.target.value.toLowerCase();
                                                    var items = document.getElementsByClassName("itemtitle");

                                                    Array.from(items).forEach(function (item) {
                                                        var itemText = item.textContent.toLowerCase();
                                                        var contentBar = item.closest(".content-bar");

                                                        if (itemText.includes(keyword)) {
                                                            contentBar.style.display = "grid";
                                                        } else {
                                                            contentBar.style.display = "none";
                                                        }
                                                    });
                                                }
        </script>
    </body>
</html>