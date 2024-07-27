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
                    <div class="container-fluid">
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
                            <hr style="border: 1px solid black">
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
                </div>
            </nav>
            <!-- Main content -->

            <div class="container">
                <br>
                <div class="main-body">
                    <div class="row gutters-sm">
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <img src="https://static.vecteezy.com/system/resources/previews/019/879/186/non_2x/user-icon-on-transparent-background-free-png.png" alt="Admin" class="rounded-circle" width="150">
                                        <div class="mt-3">
                                            ${patients.name}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card mt-3">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0">Representative name</h6>
                                        <span>${representative.name}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0">Relationship with patient</h6>
                                        <span>${representative.relationship}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0">Representative phone</h6>
                                        <span> ${representative.phone}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0">Representative email</h6>
                                        <span>${representative.email}</span>
                                    </li>

                                </ul>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="card mb-3">
                                <div class="card-body">

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 ">
                                            ${patients.name}
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">SIN</h6>
                                        </div>
                                        <div class="col-sm-9 ">
                                            ${patients.sin}
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 ">
                                            ${patients.email}
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone</h6>
                                        </div>
                                        <div class="col-sm-9 ">
                                            ${patients.phone}
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Birthday</h6>
                                        </div>
                                        <div class="col-sm-9 ">
                                            ${patients.dob}
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Gender</h6>
                                        </div>
                                        <div class="col-sm-9 ">
                                            <c:choose>
                                                <c:when test="${patients.gender == 'M'}">Male</c:when>
                                                <c:when test="${patients.gender == 'F'}">Female</c:when>
                                                <c:otherwise>${patients.gender}</c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Address</h6>
                                        </div>
                                        <div class="col-sm-9 ">
                                            ${patients.address}
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <a class="btn btn-info "  href="editpatientdetail?pid=${patients.id}">Edit</a>
                                        </div>
                                    </div>
                                </div>
                            </div>





                        </div>
                    </div>

                </div>
            </div>


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

            <script>
                // Lấy giá trị từ biến history.dop
                var dopValue = "${history.dop}";
                var dopValue2 = "${history.appointment_description}";
                // Kiểm tra nếu giá trị là NULL
                if (dopValue === "NULL" || dopValue === "") {
                    // Nếu là NULL hoặc rỗng, hiển thị "No data"
                    document.getElementById("dateSpan").textContent = "No Data";
                } else {
                    // Nếu không phải NULL, hiển thị giá trị
                    document.getElementById("dateSpan").textContent = dopValue;
                }

                if (dopValue2 === "NULL" || dopValue2 === "") {
                    // Nếu là NULL hoặc rỗng, hiển thị "No data"
                    document.getElementById("dateSpan2").textContent = "No Data";
                } else {
                    // Nếu không phải NULL, hiển thị giá trị
                    document.getElementById("dateSpan2").textContent = dopValue2;
                }

            </script>
    </body>

</html> 