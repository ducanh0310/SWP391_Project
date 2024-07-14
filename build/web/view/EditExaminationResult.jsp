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
                    <a href="index.jsp" class="navbar-brand p-0">
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
                                    <a class="nav-link" href="PatientController">
                                        <i class="bi bi-list-task"></i> Patient
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="ViewEmployeeList">
                                        <i class="bi bi-people"></i></i> Employee
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
                            <div style="text-align: center; font-size:25px">Appointment Details</div>
                            <div class="card mb-3">
                                <div class="card-body">

                                    <form action="EditExaminationResultController" method="post">

                                        <div class="mb-3">
                                            <label for="idInput" class="form-label">ID</label>
                                            <input type="text" id="idInput" name="id" value="${infor.id}" class="form-control" >
                                        </div>

                                        <div class="mb-3">
                                            <label for="patientIdInput" class="form-label">Patient ID</label>
                                            <input type="text" id="patientIdInput" name="patientId" value="${infor.patientId}" class="form-control" >
                                        </div>

                                        <div class="mb-3">
                                            <label for="patientNameInput" class="form-label">Patient Name</label>
                                            <input type="text" id="patientNameInput" name="patientName" value="${infor.patientName}" class="form-control">
                                        </div>

                                        <div class="mb-3">
                                            <label for="serviceInput" class="form-label">Service</label>
                                            <input type="text" id="serviceInput" name="service" value="${infor.service}" class="form-control" >
                                        </div>

                                        <div class="mb-3">
                                            <label for="priceInput" class="form-label">Price</label>
                                            <input type="text" id="priceInput" name="price" value="${infor.price}" class="form-control" >
                                        </div>

                                        <div class="mb-3">
                                            <label for="doctorInput" class="form-label">Doctor</label>
                                            <input type="text" id="doctorInput" name="doctor" value="${infor.doctor}" class="form-control">
                                        </div>

                                        <div class="mb-3">
                                            <label for="bookingDateInput" class="form-label">Booking Date</label>
                                            <input type="text" id="bookingDateInput" name="bookingDate" value="${infor.bookingDate}" class="form-control" >
                                        </div>

                                        <div class="mb-3">
                                            <label for="startTimeInput" class="form-label">Start Time</label>
                                            <input type="text" id="startTimeInput" name="startTime" value="${infor.startTime}" class="form-control" >
                                        </div>

                                        <div class="mb-3">
                                            <label for="endTimeInput" class="form-label">End Time</label>
                                            <input type="text" id="endTimeInput" name="endTime" value="${infor.endTime}" class="form-control" >
                                        </div>

                                        <div class="mb-3">
                                            <label for="roomInput" class="form-label">Room</label>
                                            <input type="text" id="roomInput" name="room" value="${infor.room}" class="form-control" >
                                        </div>

                                        <div class="mb-3">
                                            <label for="statusInput" class="form-label">Status</label>
                                            <input type="text" id="statusInput" name="status" value="${infor.status}" class="form-control" >
                                        </div>

                                        <div class="mb-3">
                                            <label for="payStatusInput" class="form-label">Pay Status</label>
                                            <input type="text" id="payStatusInput" name="payRevervationStatus" value="${infor.payRevervationStatus}" class="form-control" >
                                        </div>

                                        <div class="mb-3">
                                            <label for="descriptionInput" class="form-label">Description</label>
                                            <textarea id="descriptionInput" name="description" class="form-control" placeholder="Enter description"></textarea>
                                        </div>

                                        <button class="mb-3" type="submit">Save</button>
                                    </form>
                                    <div class="col-md-4">
                                        <div id="draftsList"></div>
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
                $(document).ready(function () {
                    // Sự kiện khi người dùng chọn file
                    $('#fileName').on('change', function (e) {
                        var file = e.target.files[0];
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            var content = e.target.result;
                            fillFormFields(content); // Gọi hàm để điền dữ liệu vào form
                        };

                        reader.readAsText(file); // Đọc file dưới dạng văn bản
                    });

                    // Hàm để điền dữ liệu vào các trường input trong form
                    function fillFormFields(content) {
                        var data = JSON.parse(content); // Giả sử dữ liệu trong file là JSON

                        // Điền dữ liệu từ object vào các trường input
                        $('#idInput').val(data.id);
                        $('#patientIdInput').val(data.patientId);
                        $('#patientNameInput').val(data.patientName);
                        $('#serviceInput').val(data.service);
                        $('#priceInput').val(data.price);
                        $('#doctorInput').val(data.doctor);
                        $('#bookingDateInput').val(data.bookingDate);
                        $('#startTimeInput').val(data.startTime);
                        $('#endTimeInput').val(data.endTime);
                        $('#roomInput').val(data.room);
                        $('#statusInput').val(data.status);
                        $('#payStatusInput').val(data.payRevervationStatus);
                        $('#descriptionInput').val(data.description);
                    }
                });

            </script>
    </body>

</html> 