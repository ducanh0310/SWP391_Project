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

            /* Position notification at top right */
            #deleteSuccessNotification {
                display: none;
            }

            #editSuccessNotification {
                display: none;
            }

            #bookSuccessNotification {
                display: none;
            }



            /* Style for the progress bar */
            .progress-bar {
                transition: width 5s linear;
            }

            /* Position notification at top right */
            #notificationContainer {
                display: none; /* Hide by default */
            }

            /* Style for the progress bar */

            #editSuccessNotification #deleteSuccessNotification #bookSuccessNotification{
                display: none;
                position: fixed;
                top: 20px;
                right: 20px;
                z-index: 1060;
            }

            .status-verify {
                color: blue;
            }
            .status-done {
                color: green;
            }
            .status-cancel {
                color: red;
            }
            .status-not-started {
                color: black;
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


            /* DataTable Customization */



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



            .dataTables_filter input[type="search"] {
                border: 2px solid #000;
                font-weight: bold;
                border-radius: 10px;
                padding: 5px 5px;
                height: 35px;
            }
            /*            .mb-0{
                            font-weight:500;
                            font-size:26px;
                            padding-left:20px;
                        }*/
            /* DataTable Customization */
            .dataTables_wrapper .dataTables_paginate {
                display: flex;
                justify-content: center; /* Center align pagination */
                margin-top: 20px; /* Adjust as needed */
            }

            .dataTables_wrapper .dataTables_paginate .paginate_button {
                padding: 5px 10px;
                margin: 0 2px;
                border-radius: 3px;
                background-color: #06a3da;
                color: white !important;
                cursor: pointer;
                border: none; /* Remove border */
            }

            .dataTables_wrapper .dataTables_paginate .paginate_button.current,
            .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
                background-color: #005f7f;
                border: 1px solid #005f7f;
            }

            .dataTables_wrapper .dataTables_paginate .paginate_button:active {
                background-color: #004156;
                border: 1px solid #004156;
            }



            .dataTables_wrapper .dataTables_length{
                margin-left: 20px;
                margin-bottom: 20px;
            }
            .dataTables_wrapper .dataTables_filter{
                margin-right: 20px;
                margin-bottom: 20px;
            }
            .dataTables_wrapper .dataTables_info {
                margin-top: 20px;
                margin-left: 20px;
            }

            .dataTables_wrapper .dataTables_length,
            .dataTables_wrapper .dataTables_filter
            {
                float: right; /* D?ch sang tr?i */
                margin-right: 20px;
            }

            .service-list {
                display: none;
            }
            
            .hidden {
                display: none;
            }

        </style>
    </head>

    <body>
        <div class="modal fade" id="confirmApproveModal" tabindex="-1" aria-labelledby="confirmApproveModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmApproveModalLabel">Confirm Approve</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to approve this appointment?<br>
                        <!--                        - Patient: <input type="text" id="patientName" name="patientName" readonly=""><br>
                                                - Service: <input type="text" id="serviceName" name="serviceName" readonly=""><br>
                                                - Room: <input type="text" id="room" name="room" readonly=""><br>
                                                - Doctor: <input type="text" id="doctor" name="doctorName" readonly=""><br>
                                                - Date: <input type="text" id="date" name="date" readonly=""><br>
                                                - Time: <input type="text" id="time" name="time" readonly="">-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary" id="confirmApproveButton">Approve</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Book Success Notification start-->
        <div id="bookSuccessNotification" class="position-fixed top-0 end-0 p-3" style="z-index: 1060;">
            <div id="bookSuccessAlert" class="alert alert-success alert-dismissible fade show mb-0" role="alert">
                ${bookSuccess}
                <button type="button" class="btn-close" id="closeBookNotificationButton" aria-label="Close"></button>
                <div class="progress mt-2" style="height: 4px;">
                    <div id="bookSuccessProgressBar" class="progress-bar progress-bar-animated bg-success" role="progressbar" style="width: 0%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
        </div>
        <!-- Book Success Notification end-->
        <!-- Verify edit booking appointment start -->
        <div class="modal fade" id="confirmEditModal" tabindex="-1" aria-labelledby="confirmEditModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmEditModalLabel">Confirm Edit</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to edit this appointment?<br>
                        - Patient: <input type="text" id="patientName" name="patientName" readonly=""><br>
                        - Service: <input type="text" id="serviceName" name="serviceName" readonly=""><br>
                        - Room: <input type="text" id="room" name="room" readonly=""><br>
                        - Doctor: <input type="text" id="doctor" name="doctorName" readonly=""><br>
                        - Date: <input type="text" id="date" name="date" readonly=""><br>
                        - Time: <input type="text" id="time" name="time" readonly="">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary" id="confirmEditButton">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Verify edit booking appointment end -->


        <!-- Verify cancelled booking appointment start -->
        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Deletion</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to cancel this appointment?<br>
                        - Patient: <input type="text" id="patientNameDelete" name="patientName" readonly=""><br>
                        - Service: <input type="text" id="serviceDelete" name="serviceName" readonly=""><br>
                        - Room: <input type="text" id="roomDelete" name="room" readonly=""><br>
                        - Doctor: <input type="text" id="doctorDelete" name="doctorName" readonly=""><br>
                        - Date: <input type="text" id="dateDelete" name="date" readonly=""><br>
                        - Time: <input type="text" id="timeDelete" name="time" readonly="">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <form action="cancelAppointment" method="POST">
                            <input type="hidden" id="idDelete" name="idDelete">
                            <button type="submit" class="btn btn-danger" id="confirmDeleteButton">Confirm</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <!-- Verify cancelled booking appointment start -->

        <!-- Deleted Success Notification start-->
        <div id="deleteSuccessNotification" class="position-fixed top-0 end-0 p-3" style="z-index: 1060;">
            <div id="deleteSuccessAlert" class="alert alert-danger alert-dismissible fade show mb-0" role="alert">
                ${deleteSuccess}
                <button type="button" class="btn-close" id="closeNotificationButton" aria-label="Close"></button>
                <div class="progress mt-2" style="height: 4px;">
                    <div id="deleteSuccessProgressBar" class="progress-bar progress-bar-animated bg-danger" role="progressbar" style="width: 0%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
        </div>
        <!-- Deleted Success Notification end-->

        <!-- Edit Success Notification start-->
        <div id="editSuccessNotification" class="position-fixed top-0 end-0 p-3" style="z-index: 1060;">
            <div id="editSuccessAlert" class="alert alert-success alert-dismissible fade show mb-0" role="alert">
                ${successEditAdmin}
                <button type="button" class="btn-close" id="closeEditNotificationButton" aria-label="Close"></button>
                <div class="progress mt-2" style="height: 4px;">
                    <div id="editSuccessProgressBar" class="progress-bar progress-bar-animated bg-success" role="progressbar" style="width: 0%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
        </div>
        <!-- Edit Success Notification end-->

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

                <!--View Medical Appointment History Start-->
                <main class="py-6 bg-surface-secondary">

                    <div class="col-lg-6 py-5 text-start">
                        <div class="appointment-form h-100 d-flex flex-column justify-content-center text-center p-5 wow zoomIn text-start"  style="background-color: white; border: 1px solid black;"  data-wow-delay="0.6s">
                            <h1 class="text-primary mb-4 text-start">Search Slot</h1>
                            <form id="search-form" action="bookAppointment" method="POST" onsubmit="return validateForm()">
                                <div class="date mb-3 text-start" id="dateBook" name="dateBook" data-target-input="nearest">
                                    <input type="date" name="date" id="appointmentDate" class="form-control bg-light border-0 datetimepicker-input" placeholder="Appointment Date" style="height: 40px;">
                                </div>
                                <div class="mb-3 text-start">
                                    <button type="button" class="btn btn-secondary" onclick="toggleServiceList()"><b style="color: black">Select Services</b></button>
                                    <ul class="list-group mt-3 service-list" id="service-list">
                                        <c:forEach items="${requestScope.arrService}" var="service">
                                            <c:if test="${service.type == 'a'}">
                                                <li class="list-group-item">
                                                    <label>
                                                        <input type="checkbox" id="service" name="service" value="${service.id}"> <b style="color: black">${service.name} (${service.price}$)</b>
                                                    </label>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <br>
                                <div>
                                    <button class="btn btn-dark w-100 py-3" type="submit" id="search-slot-button">Search Slot</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </main>
                <!--View Medical Appointment History End-->




                <!-- Replacement content start-->
                <div id="replacement-content" class=" wow zoomIn hidden" data-wow-delay="0.1s">

                    <div class="d-flex flex-column p-5" style="background-color: white; border: 1px solid black;">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h1 class="text-white mb-0">Slot</h1>
                            <div class="search-input">
                                <input type="text" style="background-color: white; border: 1px solid black;" placeholder="Type to search.." onkeyup="searchServices(event)">
                                <div class="autocom-box">
                                    <!-- C?c m?c s? ???c ch?n t? JavaScript -->
                                </div>
                                <div class="icon"><i class="fas fa-search"></i></div>
                            </div>
                        </div>
                        <p style="color:black">***If you book 2 different services, you should not choose the same time slot for the 2 services.***</p>
                        <div class="table-container">
                            <table class="table text-black">
                                <thead>
                                    <tr>
                                        <th><h4>Select</h4></th>
                                        <th><h4>Service</h4></th>
                                        <th><h4>Room</h4></th>
                                        <th><h4>Doctor</h4></th>
                                        <th><h4>Time</h4></th>

                                    </tr>
                                </thead>
                                <tbody id="slotPlace">

                                </tbody>
                            </table>
                        </div>
                        <div class="text-center mt-4">
                            <button class="btn btn-primary" onclick="submitSelectedSlots()">Book Appointment</button>
                        </div>
                        <!--<a class="btn btn-light" href="">Appointment</a>-->
                    </div>
                </div>
                <!-- Replacement content end-->

                <!--Confirmation Modal Start-->                
                <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="confirmModalLabel">Confirm Appointments</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div id="slotDetailsContainer">
                                    <!--Slot details will be dynamically inserted here--> 
                                </div>
                                <form id="confirm-form" action="ConfirmSlotAdminController" method="POST">
                                    <input type="hidden" name="paID" value="${param.pid}">
                                    <!--Hidden inputs to submit selected slots' data--> 
                                    <div id="hiddenInputsContainer"></div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                        <input type="submit" class="btn btn-primary" value="Confirm">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="confirmModal-noneSlot" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="confirmModalLabel">Notification</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div id="slotDetailsContainer1">
                                    Please select at least one slot.
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Confirmation Modal End -->

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


                <div style="margin-top: 160px;"></div>
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

                        function toggleServiceList() {
                            var serviceList = document.getElementById('service-list');
                            if (serviceList.style.display === 'none' || serviceList.style.display === '') {
                                serviceList.style.display = 'block';
                            } else {
                                serviceList.style.display = 'none';
                            }
                        }

                        function showModal() {
                            var myModal = new bootstrap.Modal(document.getElementById('confirmEmptyModal'));
                            myModal.show();
                        }
                        function validateForm() {
                            var appointmentDate = document.getElementById('appointmentDate').value;

                            var services = document.querySelectorAll('input[name="service"]:checked');
                            var isServiceSelected = services.length > 0;

                            if (!isServiceSelected || appointmentDate === "") {
                                showModal();
                                return false;
                            }

                            return true;
                        }

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

                        // L?y ng?y hi?n t?i
                        const today = new Date();

                        // ??nh d?ng ng?y th?nh chu?i yyyy-mm-dd
                        const formattedToday = today.toISOString().split('T')[0];

                        // ??t thu?c t?nh min cho input
                        appointmentDateInput.setAttribute('min', formattedToday);

                        function updateServiceName() {
                            var serviceDropdown = document.getElementById("service");
                            var selectedOption = serviceDropdown.options[serviceDropdown.selectedIndex];
                            var serviceName = selectedOption.text;
                            document.getElementById("serviceName").value = serviceName;
                        }

                        document.getElementById('search-form').addEventListener('submit', function (event) {
                            event.preventDefault(); // Ng?n ch?n vi?c g?i form truy?n th?ng
                            //updateServiceName();
                            var element = $(this);

                            $.ajax({
                                url: 'BookingAppointment',
                                type: 'POST',
                                data: element.serializeArray(), // Serializes the form data.
                                dataType: 'json',
                                success: function (response) {
                                    // Log the response for debugging
                                    console.log(response);

                                    if (response.success) {
                                        // Hide initial content and show replacement content
                                        //document.getElementById('initial-content').style.display = 'none';
                                        var replacementContent = document.getElementById('replacement-content');
                                        replacementContent.style.display = 'block';

                                        // Clear previous slot data
                                        $('#slotPlace').empty();

                                        // Populate the slot table
                                        response.slots.forEach(function (showSlot) {
                                            // Log showSlot for debugging
                                            console.log('Slot:', showSlot);

                                            // Create a new row element
                                            var row = document.createElement('tr');

                                            //Create and append the checkbox
                                            var checkboxCell = document.createElement('td');
                                            var checkbox = document.createElement('input');
                                            checkbox.type = 'checkbox';
                                            checkbox.name = 'selectedSlots';
                                            checkbox.value = JSON.stringify(showSlot); // Convert slot object to JSON string
                                            checkboxCell.appendChild(checkbox);
                                            row.appendChild(checkboxCell);

                                            //Create and append the service 
                                            var serviceCell = document.createElement('td');
                                            serviceCell.textContent = showSlot.serviceName;
                                            row.appendChild(serviceCell);

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
                        function submitSelectedSlots() {
                            var selectedSlots = [];
                            document.querySelectorAll('input[name="selectedSlots"]:checked').forEach(function (checkbox) {
                                selectedSlots.push(JSON.parse(checkbox.value)); // Parse JSON string back to object
                            });

                            if (selectedSlots.length > 0) {
                                // Get the container for displaying slot details and hidden inputs
                                var slotDetailsContainer = document.getElementById('slotDetailsContainer');
                                var hiddenInputsContainer = document.getElementById('hiddenInputsContainer');

                                // Clear previous contents
                                slotDetailsContainer.innerHTML = '';
                                hiddenInputsContainer.innerHTML = '';

                                selectedSlots.forEach(function (slot, index) {
                                    // Create and append appointment container
                                    var appointmentDiv = document.createElement('div');

                                    // Create and append appointment heading
                                    var heading = document.createElement('h5');
                                    heading.textContent = 'Appointment ' + (index + 1);
                                    appointmentDiv.appendChild(heading);

                                    // Create and append service detail
                                    var serviceDetail = document.createElement('p');
                                    serviceDetail.textContent = 'Service: ' + slot.serviceName;
                                    appointmentDiv.appendChild(serviceDetail);

                                    // Create and append room detail
                                    var roomDetail = document.createElement('p');
                                    roomDetail.textContent = 'Room: ' + slot.room;
                                    appointmentDiv.appendChild(roomDetail);

                                    // Create and append doctor detail
                                    var doctorDetail = document.createElement('p');
                                    doctorDetail.textContent = 'Doctor: ' + slot.doctor;
                                    appointmentDiv.appendChild(doctorDetail);

                                    // Create and append date detail
                                    var dateDetail = document.createElement('p');
                                    dateDetail.textContent = 'Date: ' + slot.date;
                                    appointmentDiv.appendChild(dateDetail);

                                    // Create and append time detail
                                    var timeDetail = document.createElement('p');
                                    timeDetail.textContent = 'Time: ' + slot.startedTime + ' - ' + slot.endTime;
                                    appointmentDiv.appendChild(timeDetail);

                                    // Append a horizontal line for separation
                                    var hr = document.createElement('hr');
                                    appointmentDiv.appendChild(hr);

                                    // Append the appointment details to the container
                                    slotDetailsContainer.appendChild(appointmentDiv);

                                    // Create and append hidden inputs for each slot
                                    var slotIdInput = document.createElement('input');
                                    slotIdInput.type = 'hidden';
                                    slotIdInput.name = 'slots[' + index + '][slotId]';
                                    slotIdInput.value = slot.idSlot;
                                    hiddenInputsContainer.appendChild(slotIdInput);

                                    var doctorIdInput = document.createElement('input');
                                    doctorIdInput.type = 'hidden';
                                    doctorIdInput.name = 'slots[' + index + '][doctorId]';
                                    doctorIdInput.value = slot.idDoctor;
                                    hiddenInputsContainer.appendChild(doctorIdInput);

                                    var roomIdInput = document.createElement('input');
                                    roomIdInput.type = 'hidden';
                                    roomIdInput.name = 'slots[' + index + '][roomId]';
                                    roomIdInput.value = slot.idRoom;
                                    hiddenInputsContainer.appendChild(roomIdInput);

                                    var dateInput = document.createElement('input');
                                    dateInput.type = 'hidden';
                                    dateInput.name = 'slots[' + index + '][date]';
                                    dateInput.value = slot.date;
                                    hiddenInputsContainer.appendChild(dateInput);

                                    var serviceIdInput = document.createElement('input');
                                    serviceIdInput.type = 'hidden';
                                    serviceIdInput.name = 'slots[' + index + '][serviceId]';
                                    serviceIdInput.value = slot.idService;
                                    hiddenInputsContainer.appendChild(serviceIdInput);
                                });

                                // Show modal
                                var confirmModal = new bootstrap.Modal(document.getElementById('confirmModal'));
                                confirmModal.show();
                            } else {
                                var confirmModal = new bootstrap.Modal(document.getElementById('confirmModal-noneSlot'));
                                confirmModal.show();
                            }
                        }

        </script>
    </body>
</html>