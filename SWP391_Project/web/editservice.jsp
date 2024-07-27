<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DentCare - Dental Clinic</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="../../img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="../../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="../../lib/animate/animate.min.css" rel="stylesheet">
        <link href="../../lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
        <link href="../../lib/twentytwenty/twentytwenty.css" rel="stylesheet" />
        <!-- BoxIcons v2.1.2 -->
        <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet">

        <!-- Roboto Font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">

        <!-- CSS File -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="../../css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="../../css/style.css" rel="stylesheet">
        <style>
            .main-container {
                width: 100%;
                height: 100vh;
                display: flex;
                flex-flow: column;
                justify-content: center;
                align-items: center;
            }


            .check-container {
                width: 6.25rem;
                height: 7.5rem;
                display: flex;
                flex-flow: column;
                align-items: center;
                justify-content: space-between;

                .check-background {
                    width: 100%;
                    height: calc(100% - 1.25rem);
                    background: linear-gradient(to bottom right, #5de593, #41d67c);
                    box-shadow: 0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset,
                        0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset;
                    transform: scale(0.84);
                    border-radius: 50%;
                    animation: animateContainer 0.75s ease-out forwards 0.75s;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    opacity: 0;

                    svg {
                        width: 65%;
                        transform: translateY(0.25rem);
                        stroke-dasharray: 80;
                        stroke-dashoffset: 80;
                        animation: animateCheck 0.35s forwards 1.25s ease-out;
                    }
                }

                .check-shadow {
                    bottom: calc(-15% - 5px);
                    left: 0;
                    border-radius: 50%;
                    background: radial-gradient(closest-side, rgba(73, 218, 131, 1), transparent);
                    animation: animateShadow 0.75s ease-out forwards 0.75s;
                }
            }

            @keyframes animateContainer {
                0% {
                    opacity: 0;
                    transform: scale(0);
                    box-shadow: 0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset,
                        0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset;
                }
                25% {
                    opacity: 1;
                    transform: scale(0.9);
                    box-shadow: 0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset,
                        0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset;
                }
                43.75% {
                    transform: scale(1.15);
                    box-shadow: 0px 0px 0px 43.334px rgba(255, 255, 255, 0.25) inset,
                        0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset;
                }
                62.5% {
                    transform: scale(1);
                    box-shadow: 0px 0px 0px 0px rgba(255, 255, 255, 0.25) inset,
                        0px 0px 0px 21.667px rgba(255, 255, 255, 0.25) inset;
                }
                81.25% {
                    box-shadow: 0px 0px 0px 0px rgba(255, 255, 255, 0.25) inset,
                        0px 0px 0px 0px rgba(255, 255, 255, 0.25) inset;
                }
                100% {
                    opacity: 1;
                    box-shadow: 0px 0px 0px 0px rgba(255, 255, 255, 0.25) inset,
                        0px 0px 0px 0px rgba(255, 255, 255, 0.25) inset;
                }
            }

            @keyframes animateCheck {
                from {
                    stroke-dashoffset: 80;
                }
                to {
                    stroke-dashoffset: 0;
                }
            }

            @keyframes animateShadow {
                0% {
                    opacity: 0;
                    width: 100%;
                    height: 15%;
                }
                25% {
                    opacity: 0.25;
                }
                43.75% {
                    width: 40%;
                    height: 7%;
                    opacity: 0.35;
                }
                100% {
                    width: 85%;
                    height: 15%;
                    opacity: 0.25;
                }
            }

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
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid transparent;
                border-radius: .25rem;
                margin-bottom: 1.5rem;
                box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
            }
            .me-2 {
                margin-right: .5rem!important;
            }

            .containerimg {
                max-width: 960px;
            }

            .avatar-upload {
                position: relative;
                max-width: 205px;
                margin: 50px auto;
            }
            .avatar-upload .avatar-edit {
                position: absolute;
                right: 12px;
                z-index: 1;
                top: 10px;
            }
            .avatar-upload .avatar-edit input {
                display: none;
            }
            .avatar-upload .avatar-edit input + label {
                display: inline-block;
                width: 34px;
                height: 34px;
                margin-bottom: 0;
                border-radius: 100%;
                background: #FFFFFF;
                border: 1px solid transparent;
                box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12);
                cursor: pointer;
                font-weight: normal;
                transition: all 0.2s ease-in-out;
            }
            .avatar-upload .avatar-edit input + label:hover {
                background: #f1f1f1;
                border-color: #d6d6d6;
            }
            .avatar-upload .avatar-edit input + label:after {
                content: "\f040";
                font-family: 'FontAwesome';
                color: #757575;
                position: absolute;
                top: 10px;
                left: 0;
                right: 0;
                text-align: center;
                margin: auto;
            }
            .avatar-upload .avatar-preview {
                width: 192px;
                height: 192px;
                position: relative;
                border-radius: 100%;
                border: 6px solid #F8F8F8;
                box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
            }
            .avatar-upload .avatar-preview > div {
                width: 100%;
                height: 100%;
                border-radius: 100%;
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
            }
            /* Ensure the dropdown is properly styled */
            .dropdown-menu {
                display: none;
                position: absolute;
                background-color: #fff;
                box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
                z-index: 1000;
                width: 100%;
                max-height: 200px;
                overflow-y: auto;
                margin-top: 0.25rem;
                border: 1px solid rgba(0, 0, 0, 0.15);
                border-radius: 0.25rem;
            }

            .dropdown-menu.show {
                display: block;
            }

            .dropdown-item {
                display: block;
                width: 100%;
                padding: 0.25rem 1.5rem;
                clear: both;
                font-weight: 400;
                color: #212529;
                text-align: inherit;
                white-space: nowrap;
                background-color: transparent;
                border: 0;
                cursor: pointer;
            }

            .dropdown-item:hover {
                background-color: #f8f9fa;
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
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- Collapse -->
                    <div class="collapse navbar-collapse" id="sidebarCollapse">
                        <!-- Navigation -->
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="appointment/viewAppointmentHistory">
                                    <i class="bi bi-clock"></i> Appointment
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="PatientController">
                                    <i class="bi bi-list-task"></i> Patient
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ViewEmployeeList">
                                    <i class="bi bi-people"></i></i> Employee
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="viewservices">
                                    <i class="bi bi-person-lines-fill"></i> Service
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
                                <a class="nav-link" href="employee/profile/view">
                                    <i class="bi bi-person-square"></i> Account
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="logout">
                                    <i class="bi bi-box-arrow-left"></i> Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Main content -->
            <div class="container">
                <div class="main-body">
                    <div class="row">
                        <div class="container-fluid mt-2">                   
                            <div class="card shadow border-0 mb-7">
                                <div class="card-header">
                                    <div class="mb-npx">
                                        <div class="row align-items-center">
                                            <div class="col-sm-6 col-12 mb-4 mb-sm-0">
                                                <!-- Title -->
                                                <h1 class="h2 mb-0 ls-tight">Edit Service</h1>
                                            </div>
                                            <!-- Actions -->
                                        </div>
                                    </div>
                                </div>
                                <!-- Nav -->
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <form action="editservice" method="POST">
                                        <input type="hidden" name="id" value="${service.procedure_id}">
                                        <div class="row mt-3">
                                            <div class="col-md-6">
                                                <label class="labels">Service Name*</label>
                                                <input type="text" name="name" class="form-control" value="${service.procedure_name}">
                                                <c:if test="${not empty requestScope.serviceError}">
                                                    <div class="text-danger">${requestScope.serviceError}</div>
                                                </c:if>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="labels">Price*</label>
                                                <input type="text" name="price" class="form-control" value="${service.price}">
                                                <c:if test="${not empty requestScope.priceError}">
                                                    <div class="text-danger">${requestScope.priceError}</div>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <label class="labels">Doctor's Name*</label>
                                                <input type="text" name="dName" id="searchDoctor" class="form-control" placeholder="Type to search..." value="${service.employee.name}" autocomplete="off">
                                                <input type="hidden" name="dId" id="selectedDoctorId">
                                                <div id="doctorDropdown" class="dropdown-menu" style="display: none; width: 100%;">
                                                    <c:forEach var="doctor" items="${listDoctor}">
                                                        <a class="dropdown-item" href="#" onclick="selectDoctor(${doctor.id}, '${doctor.name}')">${doctor.name}</a>
                                                    </c:forEach>
                                                </div>
                                                <c:if test="${not empty requestScope.dNameErrorr}">
                                                    <div class="text-danger">${requestScope.dNameErrorr}</div>
                                                </c:if>
                                                <c:if test="${not empty requestScope.dIdErrorr}">
                                                    <div class="text-danger">${requestScope.dIdErrorr}</div>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <label class="labels">Description*</label>
                                                <input type="text" name="description" class="form-control" value="${service.description}">
                                                <c:if test="${not empty descriptionError}">
                                                    <div class="text-danger">${descriptionError}</div>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="mt-5 text-center">
                                            <button class="btn btn-primary py-2 px-4 ms-3" type="submit">Update Service</button>
                                            <a class="btn btn-secondary py-2 px-4 ms-3" href="viewservices">Cancel</a>
                                        </div>
                                        <c:if test="${not empty requestScope.errorMessage}">
                                            <div class="mt-3 text-danger text-center">${requestScope.errorMessage}</div>
                                        </c:if>
                                    </form>





                                    <div id="result" class="main-container" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: #fff; z-index: 9999; justify-content: center; align-items: center; flex-direction: column; ">
                                        <div class="check-container">
                                            <div class="check-background">
                                                <svg viewBox="0 0 65 51" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M7 25L27.3077 44L58.5 7" stroke="white" stroke-width="13" stroke-linecap="round" stroke-linejoin="round" />
                                                </svg>
                                            </div>
                                            <div class="check-shadow"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="../../lib/wow/wow.min.js"></script>
            <script src="../../lib/easing/easing.min.js"></script>
            <script src="../../lib/waypoints/waypoints.min.js"></script>
            <script src="../../lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="../../lib/tempusdominus/js/moment.min.js"></script>
            <script src="../../lib/tempusdominus/js/moment-timezone.min.js"></script>
            <script src="../../lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
            <script src="../../lib/twentytwenty/jquery.event.move.js"></script>
            <script src="../../lib/twentytwenty/jquery.twentytwenty.js"></script>

            <!-- Template Javascript -->
            <script src="js/main.js"></script>

            <script>
                        document.getElementById('searchDoctor').addEventListener('input', function () {
                            var filter = this.value.toLowerCase();
                            var dropdown = document.getElementById('doctorDropdown');
                            var options = dropdown.getElementsByTagName('a');

                            var visible = false;
                            for (var i = 0; i < options.length; i++) {
                                var option = options[i];
                                if (option.text.toLowerCase().includes(filter)) {
                                    option.style.display = '';
                                    visible = true;
                                } else {
                                    option.style.display = 'none';
                                }
                            }
                            dropdown.style.display = filter ? 'block' : 'none';
                        });

                        function selectDoctor(id, name) {
                            document.getElementById('searchDoctor').value = name;
                            document.getElementById('selectedDoctorId').value = id;
                            document.getElementById('doctorDropdown').style.display = 'none';
                        }
            </script>
    </body>
</html> 