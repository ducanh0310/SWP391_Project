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
        <link href="../img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="../lib/animate/animate.min.css" rel="stylesheet">
        <link href="../lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
        <link href="../lib/twentytwenty/twentytwenty.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="../css/style.css" rel="stylesheet">


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

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <style>

            .table-container {
                max-height: 500px; /* Adjust as needed */
                overflow-y: auto;
            }
            .table {
                width: 100%;
                margin-bottom: 1rem;
                color: #fff;
            }
            .table th,
            .table td {
                padding: 0.75rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }
            .table th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
            }
            .table tbody + tbody {
                border-top: 2px solid #dee2e6;
            }
            .table .table {
                background-color: #212529;
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

            .search-input {
                position: relative;
                display: inline-block;
            }

            .search-input input {
                height: 40px;
                width: 350px; /* ?i?u ch?nh ?? r?ng phù h?p v?i giao di?n c?a b?n */
                padding: 0 40px 0 15px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 5px;
                outline: none;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .search-input .autocom-box {
                position: absolute;
                top: 45px; /* ?i?u ch?nh kho?ng cách c?a h?p tìm ki?m autocomplete */
                left: 0;
                width: 100%;
                background: #fff;
                border: 1px solid #ccc;
                border-top: none;
                max-height: 200px;
                overflow-y: auto;
                z-index: 1000;
                display: none;
            }

            .search-input .icon {
                position: absolute;
                top: 0;
                right: 0;
                height: 40px;
                width: 40px;
                text-align: center;
                line-height: 40px;
                cursor: pointer;
                color: #aaa;
            }

        </style>
    </head>

    <body>
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary m-1" role="status">
                <span class="sr-only">Loading...</span>
            </div>
            <div class="spinner-grow text-dark m-1" role="status">
                <span class="sr-only">Loading...</span>
            </div>
            <div class="spinner-grow text-secondary m-1" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->
        <!-- Dashboard -->
        <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
            <!-- Vertical Navbar -->
            <nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg" id="navbarVertical">
                <div class="container-fluid">
                    <!-- Toggler -->
                    <button class="navbar-toggler ms-n2" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarCollapse" aria-controls="sidebarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- Brand -->
                    <a href="index.html" class="navbar-brand p-0">
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
                                <a class="nav-link" href="viewAppointmentHistory">
                                    <i class="bi bi-clock"></i> Appointment
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../PatientController">
                                    <i class="bi bi-list-task"></i> Patient
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../ViewEmployeeList">
                                    <i class="bi bi-people"></i></i> Employee
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
                                <a class="nav-link" href="../employee/profile/view">
                                    <i class="bi bi-person-square"></i> Account
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../logout">
                                    <i class="bi bi-box-arrow-left"></i> Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Main content -->
            <div class="h-screen flex-grow-1 overflow-y-lg-auto">
                <header class="border-bottom ">
                    <div class="row gx-0">
                        <div class="col-md-6 text-center text-lg-start mb-2 mb-lg-0">
                            <div class="d-inline-flex align-items-center">
                                <small class="py-2"><i class="fa fa-map-marker-alt text-primary me-2"></i>${emInfo.branch.city}</small>
                            </div>
                        </div>
                        <div class="col-md-6 text-center text-lg-end">
                            <div class="position-relative d-inline-flex align-items-center bg-primary text-white top-shape px-5">
                                <div class="me-3 pe-3 border-end py-2">
                                    <c:if test="${emInfo.employeeType=='r'}">
                                        <p class="m-0">Receptionist</p>
                                    </c:if>
                                    <c:if test="${emInfo.employeeType=='d'}">
                                        <p class="m-0">Doctor</p>
                                    </c:if>
                                    <c:if test="${emInfo.employeeType=='h'}">
                                        <p class="m-0">Nurse</p>
                                    </c:if>
                                    <c:if test="${emInfo.employeeType=='b'}">
                                        <p class="m-0">Branch Manager</p>
                                    </c:if>
                                </div>
                                <div class="py-2">
                                    <p class="m-0"><a href="" style="color: #ffffff">${username}</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>


                <!-- Appointment Start -->
                <div class="container-fluid mb-5 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 90px;">
                    <div class="container" >
                        <div class="row gx-5">
                            <!-- Search slot -->
                            <div class="col-lg-12 py-5">
                                <div class="appointment-form h-100 d-flex flex-column justify-content-center text-center p-5 wow zoomIn" data-wow-delay="0.6s" >
                                    <h1 class="text-white mb-4">Search Slot</h1>
                                    <form id="search-form" action="" method="POST">
                                        <div class="date mb-3" id="dateBook" name="dateBook" >
                                            <input type="date" name="date" id="appointmentDate" class="form-control bg-light border-0 datetimepicker-input" placeholder="Appointment Date" style="height: 40px;" value="${DateServiceAppointment.date}">
                                        </div>

                                        <select class="form-select bg-light border-0 mb-3" id="service" name="service" style="height: 40px;">
                                            <option selected>---Select A Service---</option>
                                            <c:forEach items="${requestScope.arrService}" var="service">
                                                <c:if test="${service.type == 'a'}">
                                                    <option value="${service.id}" <c:if test="${service.id == DateServiceAppointment.service.id}">selected</c:if>>${service.name} (${service.price}$)</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>

                                        <!-- Hidden input field for service name -->
                                        <input type="hidden" id="serviceName" name="serviceName" value="">


                                        <div>
                                            <button class="btn btn-dark w-100 py-3" type="submit" id="search-slot-button">Search Slot</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!-- Slot content start-->
                            <div id="replacement-content" class="col-lg-12 py-5 wow zoomIn hidden" data-wow-delay="0.1s">
                                <div class="bg-primary d-flex flex-column p-5" style="height: 300px;">
                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <h1 class="text-white mb-0">Slot</h1>
                                        <div class="search-input">
                                            <input type="text" placeholder="Type to search.." onkeyup="searchServices(event)">
                                            <div class="autocom-box">
                                                <!-- Các m?c s? ???c chèn t? JavaScript -->
                                            </div>
                                            <div class="icon"><i class="fas fa-search"></i></div>
                                        </div>
                                    </div>
                                    <div class="table-container">
                                        <table class="table text-white">
                                            <thead>
                                                <tr>
                                                    <th><h4>Room</h4></th>
                                                    <th><h4>Doctor</h4></th>
                                                    <th><h4>Time</h4></th>
                                                    <th><h4>Select Slot</h4></th>
                                                </tr>
                                            </thead>
                                            <tbody id="slotPlace">
                                                <c:forEach items="${requestScope.arrRestSlot}" var="slots">
                                                    <tr>
                                                        <td>${slots.room.name}</td>
                                                        <td>${slots.doctor.name}</td>
                                                        <td>${slots.startedTime}-${slots.endTime}</td>
                                                        <td>
                                                            <button type="button" class="btn btn-primary book-button" data-bs-toggle="modal" data-bs-target="#confirmModal" data-patientId="${DateServiceAppointment.patient.id}" data-patientName="${DateServiceAppointment.patient.name}"
                                                                    data-date="${DateServiceAppointment.date}" data-idService="${DateServiceAppointment.service.id}" data-nameService="${DateServiceAppointment.service.name}" data-idDoctor="${slots.doctor.id}" 
                                                                    data-idSlot="${slots.id}" data-idRoom="${slots.room.id}" data-room="${slots.room.name}" data-doctor="${slots.doctor.name}" 
                                                                    data-time="${slots.startedTime}-${slots.endTime}">Book</button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- Slot content end-->
                        </div>
                    </div>
                </div>
                <!-- Appointment End -->

                <!-- Announce that now has not slot start -->
                <div class="modal fade" id="confirmEmptyModal" tabindex="-1" aria-labelledby="confirmEditModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="confirmEmptyModalLabel">Confirm Edit</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                - You need to fill in all the information.<br>
                                - If you have filled in all the information, you need to book other day. Because
                                all of slot have been booked or today's working hours have ended!

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- Announce that now has not slot end -->


                <!--Confirmation Modal Start(only change slot)-->                
                <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="confirmModalLabel">Confirm Booking</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Patient: <input type="text" id="patientName" name="patientName" readonly=""><br>
                                Service: <input type="text" id="nameService" name="nameService" readonly="" style="width: 50%"><br>
                                Room: <input type="text" id="room" name="room" readonly=""><br>
                                Doctor: <input type="text" id="doctor" name="doctorName" readonly=""><br>
                                Date: <input type="text" id="dateDisplay" name="date" readonly=""><br>
                                Time: <input type="text" id="time" name="time" readonly="">
                            </div>
                            <div class="modal-footer">
                                <form id="book-form" action="confirmEditSlot?id=${idAppointment}" method="POST">
                                    <input type="hidden" name="patientId" id="patientId">
                                    <input type="hidden" name="date" id="date">
                                    <input type="hidden" name="idService" id="idService">
                                    <input type="hidden" name="idDoctor" id="idDoctor">
                                    <input type="hidden" name="idSlot" id="idSlot">
                                    <input type="hidden" name="idRoom" id="idRoom">                
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-primary">Confirm</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Confirmation Modal End(only change slot) -->

                <!--Confirmation Modal Start(change date, service, slot)-->                
                <div class="modal fade" id="confirmModalDSS" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="confirmModalLabel">Confirm Slot Selection</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <!--Fake form-->
                            <div class="modal-body" style="display: none">
                                Patient: <input type="text" id="confirmPatient1" name="patientName" readonly=""><br>
                                Service: <input type="text" id="confirmServiceName1" name="serviceName" readonly="" style="width: 50%"><br>
                                Room: <input type="text" id="confirmRoom1" name="room" readonly=""><br>
                                Doctor: <input type="text" id="confirmDoctor1" name="doctorName" readonly=""><br>
                                Date: <input type="text" id="confirmDateDisplay1" name="date" readonly=""><br>
                                Time: <input type="text" id="confirmTime1" name="time" readonly="">
                                <form action="confirmEditSlot" method="POST">
                                    <input type="hidden" id="confirmPatientId1" name="idPatient">
                                    <input type="hidden" id="confirmSlotId1" name="idSlot">
                                    <input type="hidden" id="confirmDoctorId1" name="idDoctor">
                                    <input type="hidden" id="confirmRoomId1" name="idRoom">
                                    <input type="hidden" id="confirmDate1" name="date">
                                    <input type="hidden" id="confirmServiceId1" name="idService">
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                        <input type="submit" class="btn btn-primary" value="Confirm">
                                    </div>
                                </form>
                            </div>
                            <!--Real form-->
                            <div class="modal-body">
                                Patient: <input type="text" id="confirmPatient2" name="patientName" readonly=""><br>
                                Service: <input type="text" id="confirmServiceName2" name="serviceName" readonly=""><br>
                                Room: <input type="text" id="confirmRoom2" name="room" readonly=""><br>
                                Doctor: <input type="text" id="confirmDoctor2" name="doctorName" readonly=""><br>
                                Date: <input type="text" id="confirmDateDisplay2" name="date" readonly=""><br>
                                Time: <input type="text" id="confirmTime2" name="time" readonly="">
                                <form action="confirmEditSlot?id=${idAppointment}" method="POST">
                                    <input type="hidden" id="confirmPatientId2" name="idPatient">
                                    <input type="hidden" id="confirmSlotId2" name="idSlot">
                                    <input type="hidden" id="confirmDoctorId2" name="idDoctor">
                                    <input type="hidden" id="confirmRoomId2" name="idRoom">
                                    <input type="hidden" id="confirmDate2" name="date">
                                    <input type="hidden" id="confirmServiceId2" name="idService">

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                        <input type="submit" class="btn btn-primary" value="Confirm">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Confirmation Modal End (change date, service, slot)-->

            <div style="margin-top: 160px;"></div>
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

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../lib/wow/wow.min.js"></script>
        <script src="../lib/easing/easing.min.js"></script>
        <script src="../lib/waypoints/waypoints.min.js"></script>
        <script src="../lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="../lib/tempusdominus/js/moment.min.js"></script>
        <script src="../lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="../lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        <script src="../lib/twentytwenty/jquery.event.move.js"></script>
        <script src="../lib/twentytwenty/jquery.twentytwenty.js"></script>
        <script src="../js/main.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script>

                                                function searchServices(event) {
                                                    var keyword = event.target.value.toLowerCase();
                                                    var rows = document.querySelectorAll("#slotPlace tr");

                                                    rows.forEach(function (row) {
                                                        var text = row.textContent.toLowerCase();
                                                        var displayStyle = text.includes(keyword) ? "table-row" : "none";
                                                        row.style.display = displayStyle;
                                                    });
                                                }

                                                //Validate time
                                                // L?y ph?n t? input
                                                const appointmentDateInput = document.getElementById('appointmentDate');

                                                // L?y ngày hi?n t?i
                                                const today = new Date();

                                                // ??nh d?ng ngày thành chu?i yyyy-mm-dd
                                                const formattedToday = today.toISOString().split('T')[0];

                                                // ??t thu?c tính min cho input
                                                appointmentDateInput.setAttribute('min', formattedToday);


                                                // Modal for only change slot start
                                                document.addEventListener("DOMContentLoaded", function () {
                                                    const confirmModal = document.getElementById('confirmModal');
                                                    const bookForm = document.getElementById('book-form');
                                                    confirmModal.addEventListener('show.bs.modal', function (event) {
                                                        const button = event.relatedTarget;
                                                        const patientId = button.getAttribute('data-patientId');
                                                        const patientName = button.getAttribute('data-patientName');
                                                        const date = button.getAttribute('data-date');
                                                        const idService = button.getAttribute('data-idService');
                                                        const idDoctor = button.getAttribute('data-idDoctor');
                                                        const idSlot = button.getAttribute('data-idSlot');
                                                        const idRoom = button.getAttribute('data-idRoom');
                                                        const room = button.getAttribute('data-room');
                                                        const doctor = button.getAttribute('data-doctor');
                                                        const time = button.getAttribute('data-time');
                                                        const nameService = button.getAttribute('data-nameService');

                                                        document.getElementById('patientId').value = patientId;
                                                        document.getElementById('patientName').value = patientName;
                                                        document.getElementById('date').value = date;
                                                        document.getElementById('idService').value = idService;
                                                        document.getElementById('idDoctor').value = idDoctor;
                                                        document.getElementById('idSlot').value = idSlot;
                                                        document.getElementById('idRoom').value = idRoom;
                                                        document.getElementById('room').value = room;
                                                        document.getElementById('doctor').value = doctor;
                                                        document.getElementById('time').value = time;
                                                        document.getElementById('nameService').value = nameService;
                                                        document.getElementById('dateDisplay').value = date;

                                                    });
                                                });
                                                // Modal for only change slot end 


                                                function updateServiceName() {
                                                    var serviceDropdown = document.getElementById("service");
                                                    var selectedOption = serviceDropdown.options[serviceDropdown.selectedIndex];
                                                    var serviceName = selectedOption.text;
                                                    document.getElementById("serviceName").value = serviceName;
                                                }
                                                //Change date, service and slot 
                                                document.getElementById('search-form').addEventListener('submit', function (event) {
                                                    event.preventDefault(); // Ng?n ch?n vi?c g?i form truy?n th?ng
                                                    updateServiceName();
                                                    var element = $(this);

                                                    $.ajax({
                                                        url: 'editAppointment?id=${idAppointment}',
                                                        type: 'POST',
                                                        data: element.serializeArray(), // Serializes the form data.
                                                        dataType: 'json',
                                                        success: function (response) {
                                                            // Log the response for debugging
                                                            console.log(response);

                                                            if (response.success) {


                                                                // Clear previous slot data
                                                                $('#slotPlace').empty();

                                                                // Populate the slot table
                                                                response.slots.forEach(function (showSlot) {
                                                                    // Log showSlot for debugging
                                                                    console.log('Slot:', showSlot);

                                                                    // Create a new row element
                                                                    var row = document.createElement('tr');

                                                                    // Create and append the room cell
                                                                    var roomCell = document.createElement('td');
                                                                    roomCell.textContent = showSlot.room;
                                                                    row.appendChild(roomCell);

                                                                    // Create and append the doctor cell
                                                                    var doctorCell = document.createElement('td');
                                                                    doctorCell.textContent = showSlot.doctor;
                                                                    row.appendChild(doctorCell);

                                                                    // Create and append the time cell
                                                                    var timeCell = document.createElement('td');
                                                                    timeCell.textContent = showSlot.startedTime + ' - ' + showSlot.endTime;
                                                                    row.appendChild(timeCell);

                                                                    // Create and append the id of slot cell
                                                                    var idSlotCell = document.createElement('td');
                                                                    idSlotCell.textContent = showSlot.idSlot;
                                                                    idSlotCell.style.display = 'none'; // Make the cell hidden
                                                                    row.appendChild(idSlotCell);

                                                                    // Create and append the id of doctor cell
                                                                    var idDoctorCell = document.createElement('td');
                                                                    idDoctorCell.textContent = showSlot.idDoctor;
                                                                    idDoctorCell.style.display = 'none'; // Make the cell hidden
                                                                    row.appendChild(idDoctorCell);

                                                                    // Create and append the id of room cell
                                                                    var idRoomCell = document.createElement('td');
                                                                    idRoomCell.textContent = showSlot.idRoom;
                                                                    idRoomCell.style.display = 'none'; // Make the cell hidden
                                                                    row.appendChild(idRoomCell);

                                                                    // Create and append the date cell
                                                                    var dateCell = document.createElement('td');
                                                                    dateCell.textContent = showSlot.date;
                                                                    dateCell.style.display = 'none'; // Make the cell hidden
                                                                    row.appendChild(dateCell);

                                                                    // Create and append the id of service cell
                                                                    var idServiceCell = document.createElement('td');
                                                                    idServiceCell.textContent = showSlot.idService;
                                                                    idServiceCell.style.display = 'none'; // Make the cell hidden
                                                                    row.appendChild(idServiceCell);

                                                                    // Create and append the id of service cell
                                                                    var nameServiceCell = document.createElement('td');
                                                                    nameServiceCell.textContent = showSlot.serviceName;
                                                                    nameServiceCell.style.display = 'none'; // Make the cell hidden
                                                                    row.appendChild(nameServiceCell);
                                                                    
                                                                    // Create and append the id of patient cell
                                                                    var idPatient = document.createElement('td');
                                                                    idPatient.textContent = showSlot.patientId;
                                                                    idPatient.style.display = 'none'; // Make the cell hidden
                                                                    row.appendChild(idPatient);

                                                                    // Create and append the select button cell
                                                                    var selectButtonCell = document.createElement('td');
                                                                    var selectButton = document.createElement('button');
                                                                    selectButton.textContent = 'Book';
                                                                    selectButton.className = 'btn btn-primary';
                                                                    selectButton.addEventListener('click', function () {
                                                                        //Set slot details in modal
                                                                        document.getElementById('confirmPatient1').value = showSlot.patientId;
                                                                        document.getElementById('confirmRoom1').value = showSlot.room;
                                                                        document.getElementById('confirmDoctor1').value = showSlot.doctor;
                                                                        document.getElementById('confirmTime1').value = showSlot.startedTime + ' - ' + showSlot.endTime;
                                                                        document.getElementById('confirmSlotId1').value = showSlot.idSlot;
                                                                        document.getElementById('confirmDoctorId1').value = showSlot.idDoctor;
                                                                        document.getElementById('confirmRoomId1').value = showSlot.idRoom;
                                                                        document.getElementById('confirmDate1').value = showSlot.date;
                                                                        document.getElementById('confirmServiceId1').value = showSlot.idService;
                                                                        document.getElementById('confirmServiceName1').value = showSlot.serviceName;
                                                                        document.getElementById('confirmDateDisplay1').value = showSlot.date;


                                                                        // Also set data in the second form if necessary
                                                                        document.getElementById('confirmPatient2').value = showSlot.patientId;
                                                                        document.getElementById('confirmRoom2').value = showSlot.room;
                                                                        document.getElementById('confirmDoctor2').value = showSlot.doctor;
                                                                        document.getElementById('confirmTime2').value = showSlot.startedTime + ' - ' + showSlot.endTime;
                                                                        document.getElementById('confirmSlotId2').value = showSlot.idSlot;
                                                                        document.getElementById('confirmDoctorId2').value = showSlot.idDoctor;
                                                                        document.getElementById('confirmRoomId2').value = showSlot.idRoom;
                                                                        document.getElementById('confirmDate2').value = showSlot.date;
                                                                        document.getElementById('confirmServiceId2').value = showSlot.idService;
                                                                        document.getElementById('confirmServiceName2').value = showSlot.serviceName;
                                                                        document.getElementById('confirmDateDisplay2').value = showSlot.date;
                                                                        // Show modal
                                                                        var confirmModal = new bootstrap.Modal(document.getElementById('confirmModalDSS'));
                                                                        confirmModal.show();
                                                                    });
                                                                    selectButtonCell.appendChild(selectButton);
                                                                    row.appendChild(selectButtonCell);

                                                                    // Append the row to the table
                                                                    document.getElementById('slotPlace').appendChild(row);

                                                                });



                                                            } else {
                                                                // Function to show the modal
                                                                function showModal() {
                                                                    var myModal = new bootstrap.Modal(document.getElementById('confirmEmptyModal'));
                                                                    myModal.show();
                                                                }

                                                                // Example: Call this function when needed
                                                                showModal();
                                                            }
                                                        },
                                                        error: function (xhr, status, error) {
                                                            console.error('Error:', error);
                                                        }
                                                    });
                                                });
        </script>
    </body>
</html>