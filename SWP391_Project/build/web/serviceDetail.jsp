<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>DentCare - Dental Clinic</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/ti-icons@0.1.2/css/themify-icons.css">
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

            .page-title{
                font-weight:500;
                font-size:26px;
                padding-left:20px;
            }
            body{

                background-color: #eee;
            }

            table th , table td{
                text-align: center;
            }

            table tr:nth-child(even){
                background-color: #e4e3e3
            }

            th {
                background: #333;
                color: #fff;
            }


            .icon-box.medium {
                font-size: 20px;
                width: 50px;
                height: 50px;
                line-height: 50px;
            }
            .icon-box {
                font-size: 30px;
                margin-bottom: 33px;
                display: inline-block;
                color: #ffffff;
                height: 65px;
                width: 65px;
                line-height: 65px;
                background-color: #59b73f;
                text-align: center;
                border-radius: 0.3rem;
            }
            .social-icon-style2 li a {
                display: inline-block;
                font-size: 14px;
                text-align: center;
                color: #ffffff;
                background: #59b73f;
                height: 41px;
                line-height: 41px;
                width: 41px;
            }
            .rounded-3 {
                border-radius: 0.3rem !important;
            }

            .social-icon-style2 {
                margin-bottom: 0;
                display: inline-block;
                padding-left: 10px;
                list-style: none;
            }

            .social-icon-style2 li {
                vertical-align: middle;
                display: inline-block;
                margin-right: 5px;
            }

            a, a:active, a:focus {
                color: #616161;
                text-decoration: none;
                transition-timing-function: ease-in-out;
                -ms-transition-timing-function: ease-in-out;
                -moz-transition-timing-function: ease-in-out;
                -webkit-transition-timing-function: ease-in-out;
                -o-transition-timing-function: ease-in-out;
                transition-duration: .2s;
                -ms-transition-duration: .2s;
                -moz-transition-duration: .2s;
                -webkit-transition-duration: .2s;
                -o-transition-duration: .2s;
            }

            .text-secondary, .text-secondary-hover:hover {
                color: #59b73f !important;
            }
            .display-25 {
                font-size: 1.4rem;
            }



            p {
                margin: 0 0 20px;
            }

            .mb-1-6, .my-1-6 {
                margin-bottom: 1.6rem;
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
                    <a href="javascript:location.reload()" class="navbar-brand p-0">
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
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-md-7 col-lg-4 mb-5 mb-lg-0 wow fadeIn">
                                <div class="card border-0 shadow">
                                    <img src="https://www.bootdey.com/img/Content/avatar/avatar6.png" alt="...">
                                    <div class="card-body p-1-9 p-xl-5">
                                        <div class="mb-4">
                                            <h3 class="h2 mb-0">${detail.procedure_name}</h3>
                                            <span class="h2 text-primary">${detail.price}$</span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="ps-lg-1-6 ps-xl-5">
                                    <div class="mb-5 wow fadeIn">
                                        <div class="text-start mb-1-6 wow fadeIn">
                                            <h2 class="h1 mb-0 text-primary">#Description</h2>
                                        </div>
                                        <p class="mb-0">${detail.description}</p>
                                    </div>
                                    <div class="mb-5 wow fadeIn">
                                        <div class="text-start mb-1-6 wow fadeIn">
                                            <h2 class="h1 mb-0 text-primary">#Procedure</h2>
                                        </div>
                                        <p class="mb-0">${detail.procedure} </p><br>
                                        <p class="mb-0">${detail.procedure2} </p><br>
                                        <p class="mb-0">${detail.procedure3} </p><br>
                                        <p class="mb-0">${detail.procedure4} </p><br>
                                        <p class="mb-0">${detail.procedure5} </p>

                                    </div>

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
            }
        </script>
    </body>
</html>