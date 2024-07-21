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
                float: right; /* D?ch sang trái */
                margin-right: 20px;
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
                        <form action="cancel" method="POST">
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
                ${deleteSuccessAdmin}
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
                                <a class="nav-link" href="#">
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
                            <li class="nav-item">
                                <a class="nav-link" href="../viewservices">
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

                <!--View Medical Appointment History Start-->
                <main class="py-6 bg-surface-secondary">
                    <div class="container-fluid">                   
                        <div class="card shadow border-0 mb-7">
                            <div class="card-header">
                                <h5 class="mb-0">Medical Appointment History</h5>
                            </div>
                            <div style="color: red; margin-left: 10px">${payNotification}</div>
                            <div class="table-responsive">
                                <table class="table table-hover table-nowrap" id="myTable">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">No <i class="fas fa-sort"></th>
                                            <th scope="col">Patient Name <i class="fas fa-sort"></th>
                                            <th scope="col">Service<i class="fas fa-sort"></th>
                                            <th scope="col">Payment <i class="fas fa-sort"></th>
                                            <th scope="col">Doctor <i class="fas fa-sort"></th>
                                            <th scope="col">Examination Time <i class="fas fa-sort"></th>
                                            <th scope="col">Status <i class="fas fa-sort"></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody id="appointmentHistoryBody">
                                        <c:forEach items="${requestScope.bookingAppointmentHistory}" var="bAH" varStatus="status">
                                            <tr>
                                                <td>
                                                    <span>${status.index + 1}</span>
                                                </td>
                                                <td>
                                                    <span>${bAH.patient.name}</span>
                                                </td>
                                                <td>
                                                    <span>${bAH.service.name}</span>
                                                </td>
                                                <td>
                                                    <span>
                                                        <c:if test="${bAH.reservationStatus =='Not pay'}">
                                                            Don't pay reservation fee.
                                                        </c:if>
                                                        <c:if test="${bAH.reservationStatus =='Pay reser'}">
                                                            50$ (Reservation fee)
                                                        </c:if>
                                                        <c:if test="${bAH.reservationStatus =='Pay ser'}">
                                                            Paid service
                                                        </c:if>
                                                    </span>
                                                </td>
                                                <td>
                                                    <span>${bAH.doctor.name}</span>
                                                </td>
                                                <td>
                                                    <span>${bAH.date}</span><br>
                                                    <span>${bAH.slot.startedTime}-${bAH.slot.endTime}</span>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${bAH.statusBook.id == 1}">
                                                            <span class="status-verify">${bAH.statusBook.name}</span>
                                                        </c:when>
                                                        <c:when test="${bAH.statusBook.id == 3}">
                                                            <span class="status-done">${bAH.statusBook.name}</span>
                                                        </c:when>
                                                        <c:when test="${bAH.statusBook.id == 4}">
                                                            <span class="status-cancel">${bAH.statusBook.name}</span>
                                                        </c:when>
                                                        <c:when test="${bAH.statusBook.id == 2}">
                                                            <span class="status-not-started">${bAH.statusBook.name}</span>
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td class="text-end">
                                                    <c:if test="${bAH.statusBook.id == 1}">
                                                        <button type="button" class="btn btn-sm btn-neutral edit-button" data-bs-toggle="modal" data-bs-target="#confirmEditModal" data-patientname="${bAH.patient.name}" 
                                                                data-id="${bAH.ID}" data-service="${bAH.service.name}" data-room="${bAH.room.name}" data-doctor="${bAH.doctor.name}"
                                                                data-date="${bAH.date}" data-time="${bAH.slot.startedTime}-${bAH.slot.endTime}">Edit</button>

                                                        <button type="button" class="btn btn-sm btn-neutral approve-button" data-bs-toggle="modal" data-bs-target="#confirmApproveModal" data-patientname="${bAH.patient.name}" 
                                                                data-id="${bAH.ID}" data-service="${bAH.service.name}" data-room="${bAH.room.name}" data-doctor="${bAH.doctor.name}"
                                                                data-date="${bAH.date}" data-time="${bAH.slot.startedTime}-${bAH.slot.endTime}">Approve</button>
                                                        <button type="button" class="btn btn-sm btn-neutral delete-button" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal" data-patientname="${bAH.patient.name}"
                                                                data-id="${bAH.ID}" data-service="${bAH.service.name}" data-room="${bAH.room.name}" data-doctor="${bAH.doctor.name}"
                                                                data-date="${bAH.date}" data-time="${bAH.slot.startedTime}-${bAH.slot.endTime}" >
                                                            Cancel
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${bAH.statusBook.id == 2}">
                                                        <button> <a href="../AddExaminationResult?appId=${bAH.ID}"
                                                                    class="btn btn-sm btn-neutral">View</a>
                                                        </button>
                                                        <button type="button" class="btn btn-sm btn-neutral delete-button" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal" data-patientname="${bAH.patient.name}"
                                                                data-id="${bAH.ID}" data-service="${bAH.service.name}" data-room="${bAH.room.name}" data-doctor="${bAH.doctor.name}"
                                                                data-date="${bAH.date}" data-time="${bAH.slot.startedTime}-${bAH.slot.endTime}" >
                                                            Cancel
                                                        </button>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer border-0 py-5">

                            </div>
                        </div>
                    </div>
                </main>
                <!--View Medical Appointment History End-->




                <!-- Note Start -->
                <main class="py-6 bg-surface-secondary">
                    <div class="container-fluid">
                        <h4>Note</h4>
                        <ul>
                            <li>- <b style="color:blue">Verifying:</b> Your booking appointment are verifying.</li>
                            <li>- <b style="color:red">Cancel:</b> Your booking appointment were cancelled.</li>
                            <li>- <b style="color:black">Not Started</b>: You have successfully scheduled an appointment but have not seen the doctor yet.</li>
                            <li>- <b style="color: #157347">Completed</b>: You have completed the medical examination.</li>
                        </ul>
                    </div>
                </main>

                <!-- Note End -->


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

            $(document).ready(function () {
                $('#myTable').DataTable({
                    "language": {
                        "lengthMenu": "Show _MENU_",
                        "info": "Showing _START_ to _END_ of _TOTAL_ entries",
                        "infoEmpty": "Showing 0 to 0 of 0 entries",
                        "infoFiltered": "(filtered from _MAX_ total entries)",
                        "search": "Search:",
                        "paginate": {
                            "first": "First",
                            "last": "Last",
                            "next": "Next",
                            "previous": "Previous"
                        }
                    },
                    "dom": '<"header_wrap"lf>t<"footer_wrap"ip>',
                    "pagingType": "full_numbers",
                    "pageLength": 10

                });
            });




            function searchServices(event) {
                var keyword = event.target.value.toLowerCase();
                var rows = document.querySelectorAll("#appointmentHistoryBody tr");

                rows.forEach(function (row) {
                    var text = row.textContent.toLowerCase();
                    var displayStyle = text.includes(keyword) ? "table-row" : "none";
                    row.style.display = displayStyle;
                });
            }






            $(document).ready(function () {
                let patientname;
                let editId;
                let service;
                let room;
                let doctor;
                let date;
                let time;
                $('.edit-button').click(function (event) {
                    event.preventDefault(); // Prevent the default anchor behavior
                    editId = $(this).data('id');
                    patientname = $(this).data('patientname');
                    service = $(this).data('service');
                    room = $(this).data('room');
                    doctor = $(this).data('doctor');
                    date = $(this).data('date');
                    time = $(this).data('time');

                    document.getElementById('patientName').value = patientname;
                    document.getElementById('serviceName').value = service;
                    document.getElementById('room').value = room;
                    document.getElementById('doctor').value = doctor;
                    document.getElementById('date').value = date;
                    document.getElementById('time').value = time;
                    console.log("Edit ID: " + editId);  // Log the ID for debugging

                    // Redirect to the edit URL with the captured ID
                    if (editId) {
                        $('#confirmEditButton').click(function () {
                            window.location.href = 'editAppointment?id=' + editId;
                        });
                    }
                });

                //Edit appointment
                function showEditSuccessNotification() {
                    $('#editSuccessNotification').show();
                    let progressBar = $('#editSuccessProgressBar');
                    let width = 0;
                    let interval = setInterval(function () {
                        width++;
                        progressBar.css('width', width + '%');
                        if (width === 200) {
                            clearInterval(interval);
                            $('#editSuccessNotification').fadeOut();
                        }
                    }, 40); // T?c ?? gi?m thanh ti?n ?? (milliseconds)
                }

                // Close notification button handler
                $('#closeEditNotificationButton').click(function () {
                    $('#editSuccessNotification').hide();
                });
                $('.approve-button').click(function (event) {
                    event.preventDefault(); // Prevent the default anchor behavior
                    editId = $(this).data('id');
                    patientname = $(this).data('patientname');
                    service = $(this).data('service');
                    room = $(this).data('room');
                    doctor = $(this).data('doctor');
                    date = $(this).data('date');
                    time = $(this).data('time');

                    document.getElementById('patientName').value = patientname;
                    document.getElementById('serviceName').value = service;
                    document.getElementById('room').value = room;
                    document.getElementById('doctor').value = doctor;
                    document.getElementById('date').value = date;
                    document.getElementById('time').value = time;
                    console.log("Edit ID: " + editId);  // Log the ID for debugging

                    // Redirect to the edit URL with the captured ID
                    if (editId) {
                        $('#confirmApproveButton').click(function () {
                            window.location.href = 'approveAppointment?id=' + editId;
                        });
                    }
                });

                // Check for success message from the server
                let successMessage = '${sessionScope.successEditAdmin}';
                console.log(successMessage);
                if (successMessage) {
                    showEditSuccessNotification();
                }

                //Delete appointment
                $('.delete-button').click(function (event) {
                    event.preventDefault(); // Prevent the default anchor behavior
                    patientname = $(this).data('patientname');
                    deleteId = $(this).data('id');
                    service = $(this).data('service');
                    room = $(this).data('room');
                    doctor = $(this).data('doctor');
                    date = $(this).data('date');
                    time = $(this).data('time');

                    document.getElementById('patientNameDelete').value = patientname;
                    document.getElementById('serviceDelete').value = service;
                    document.getElementById('roomDelete').value = room;
                    document.getElementById('doctorDelete').value = doctor;
                    document.getElementById('dateDelete').value = date;
                    document.getElementById('timeDelete').value = time;
                    document.getElementById('idDelete').value = deleteId;
                });

                // Handle notification display for delete success
                function showDeleteSuccessNotification() {
                    $('#deleteSuccessNotification').show();
                    let progressBar = $('#deleteSuccessProgressBar');
                    let width = 0;
                    let interval = setInterval(function () {
                        width++;
                        progressBar.css('width', width + '%');
                        if (width === 200) {
                            clearInterval(interval);
                            $('#deleteSuccessNotification').fadeOut();
                        }
                    }, 40); // T?c ?? gi?m thanh ti?n ?? (milliseconds)
                }

                // Close notification button handler
                $('#closeNotificationButton').click(function () {
                    $('#deleteSuccessNotification').hide();
                });

                // Check for success message from the server
                let deleteSuccessAdmin = '${sessionScope.deleteSuccessAdmin}';
                if (deleteSuccessAdmin) {
                    showDeleteSuccessNotification();
                }

                function showBookSuccessNotification() {
                    $('#bookSuccessNotification').show();
                    let progressBar = $('#bookSuccessProgressBar');
                    let width = 0;
                    let interval = setInterval(function () {
                        width++;
                        progressBar.css('width', width + '%');
                        if (width === 200) {
                            clearInterval(interval);
                            $('#bookSuccessNotification').fadeOut();
                        }
                    }, 40); // T?c ?? gi?m thanh ti?n ?? (milliseconds)
                }

                // Close notification button handler
                $('#closeBookNotificationButton').click(function () {
                    $('#bookSuccessNotification').hide();
                });

                // Check for success message from the server
                let bookSuccess = '${sessionScope.bookSuccess}';
                if (bookSuccess) {
                    showBookSuccessNotification();
                }
            });
        </script>
        <script>
            document.getElementById('addExamResult').addEventListener('click', function () {
                var examId = this.getAttribute('data-id');
                window.location.href = '../AddExaminationResult?appId=' + examId;
            });
        </script>
    </body>
</html>