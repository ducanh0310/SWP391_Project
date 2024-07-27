<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <!-- comment -->
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <!-- Libraries Stylesheet -->
        <link href="../../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="../../lib/animate/animate.min.css" rel="stylesheet">
        <link href="../../lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
        <link href="../../lib/twentytwenty/twentytwenty.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="../../css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="../../css/style.css" rel="stylesheet">

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
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- Collapse -->
                    <div class="collapse navbar-collapse" id="sidebarCollapse">
                        <!-- Navigation -->
                        <ul class="navbar-nav">
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
                                <a class="nav-link" href="ExaminationResultListController">
                                    <i class="bi bi-clipboard-check"></i></i> Examination Result List
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="viewservices">
                                    <i class="bi bi-person-lines-fill"></i> Service
                                </a>
                            </li>
                        </ul>
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
                    <!-- Breadcrumb -->
                    <nav aria-label="breadcrumb" class="main-breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="admin.jsp">Home</a></li>
                        </ol>
                    </nav>
                    <!-- /Breadcrumb -->

                    <div class="row gutters-sm">

                        <div class="col-md-8">
                            <div class="card mb-3" style="width: 800px">
                                <div style="text-align: center; font-size:25px">Examination Result Details</div>
                                <form action="EditExaminationResultController" method="post">
                                    <div class="card-body">

                                        <div class="row mt-3">
                                            <div class="col-md-6" style="width: 30%">
                                                <label class="labels">Examination Result ID</label>
                                                <input type="text" id="appID" name="appID" class="form-control" placeholder="" value="${edit.id}" readonly>
                                            </div>
                                            <div class="col-md-6" style="width: 30%">
                                                <label class="labels">Patient ID</label>
                                                <input type="text" id="patientID" name="patientID" class="form-control" placeholder=" " value="${edit.patientId}" readonly>
                                            </div>
                                            <div class="col-md-6" style="width: 40%">
                                                <label class="labels">Patient Name</label>
                                                <input type="text" id="patientName" name="patientName" class="form-control" placeholder="" value="${edit.patientName}" readonly>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-6">
                                                <label class="labels">Service</label>
                                                <input type="text" id="service" name="service" class="form-control" placeholder=" " value="${edit.service}" readonly>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="labels">Price</label>
                                                <input type="text" id="price" name="price" class="form-control" placeholder="" value="${edit.price}">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-6">
                                                <label class="labels">Doctor</label>
                                                <input type="text" id="doctor" name="doctor" class="form-control" placeholder=" " value="${edit.doctor}">
                                            </div>
                                            <div class="col-md-6">
                                                <label class="labels">Room</label>
                                                <input type="text" id="room" name="room" class="form-control" placeholder=" " value="${edit.room}">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-6">
                                                <label class="labels">Status</label>
                                                <select id="appointmentStatus" name="appointmentStatus" class="form-control">
                                                    <option value="Verifying" ${edit.status == 'Verifying' ? 'selected' : ''}>Verifying</option>
                                                    <option value="Not started" ${edit.status == 'Not started' ? 'selected' : ''}>Not started</option>
                                                    <option value="Completed" ${edit.status == 'Completed' ? 'selected' : ''}>Completed</option>
                                                    <option value="Cancelled" ${edit.status == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                                                    <option value="Empty" ${edit.status == 'Empty' ? 'selected' : ''}>Empty</option>
                                                </select>
                                            </div>

                                            <div class="col-md-6">
                                                <label class="labels">Pay status</label>
                                                <input type="text" id="payStatus" name="payStatus" class="form-control" placeholder=" " value="${edit.room}" readonly>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-6" style="width: 25%">
                                                <label class="labels" >Booking Date</label>
                                                <input type="text" id="bookingDate" name="bookingDate" class="form-control" placeholder="" value="${edit.bookingDate}" readonly>
                                            </div>
                                            <div class="col-md-6" style="width: 25%">
                                                <label class="labels">Start time</label>
                                                <input type="text" id="startTime" name="startTime" class="form-control" placeholder=" " value="${edit.startTime}" readonly>
                                            </div>
                                            <div class="col-md-6" style="width: 25%">
                                                <label class="labels">End time</label>
                                                <input type="text" id="endTime" name="endTime" class="form-control" placeholder=" " value="${edit.endTime}" readonly>
                                            </div>
                                        </div>
                                        <div class="row mt-3" >
                                            <div class="col-md-6" >
                                                <label class="labels" >Description</label>
                                                <textarea style="width: 205%" id="description" 
                                                          name="description" class="form-control" style="border-radius: 1px;"
                                                          placeholder="Enter description here" oninput="autoResize(this)">${edit.description}</textarea>
                                            </div>
                                        </div>
                                        <button class="btn btn-info " type="submit" style="margin-top: 10px">
                                            Save Changes
                                        </button>
                                    </div>
                                </form>
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
            <script src="lib/wow/wow.min.js"></script>
            <script src="lib/easing/easing.min.js"></script>
            <script src="lib/waypoints/waypoints.min.js"></script>
            <script src="lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="lib/tempusdominus/js/moment.min.js"></script>
            <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
            <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
            <script src="lib/twentytwenty/jquery.event.move.js"></script>
            <script src="lib/twentytwenty/jquery.twentytwenty.js"></script>
            <script src="js/main.js"></script>
            <!-- Template Javascript -->

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
            <script src="../../js/main.js"></script>

            <script>
                function autoResize(textarea) {
                    textarea.style.height = 'auto';
                    textarea.style.height = textarea.scrollHeight + 'px';
                }
            </script>
            <script>
                // Function to format time
                function formatTime(timeString) {
                    if (timeString) {
                        return timeString.split('.')[0]; // Split by '.' and take the first part
                    }
                    return timeString;
                }

                // Get the elements
                const startTimeInput = document.getElementById('startTime');
                const endTimeInput = document.getElementById('endTime');

                // Format the values
                startTimeInput.value = formatTime(startTimeInput.value);
                endTimeInput.value = formatTime(endTimeInput.value);
            </script>

    </body>

</html> 