<%-- 
    Document   : chooseServices
    Created on : Jun 12, 2024, 11:42:55 AM
    Author     : Vu Minh Quan
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DentCare - Dental Clinic Website Template</title>
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
                float: right; /* Dịch sang trái */
                margin-right: 20px;
            }



        </style>
    </head>

    <body>
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

        <!-- Edit Success Notification start-->
        <div id="editSuccessNotification" class="position-fixed top-0 end-0 p-3" style="z-index: 1060;">
            <div id="editSuccessAlert" class="alert alert-success alert-dismissible fade show mb-0" role="alert">
                ${success}
                <button type="button" class="btn-close" id="closeEditNotificationButton" aria-label="Close"></button>
                <div class="progress mt-2" style="height: 4px;">
                    <div id="editSuccessProgressBar" class="progress-bar progress-bar-animated bg-success" role="progressbar" style="width: 0%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
        </div>
        <!-- Edit Success Notification end-->

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
                        - Service: <input type="text" id="serviceDelete" name="serviceName" readonly=""><br>
                        - Room: <input type="text" id="roomDelete" name="room" readonly=""><br>
                        - Doctor: <input type="text" id="doctorDelete" name="doctorName" readonly=""><br>
                        - Date: <input type="text" id="dateDelete" name="date" readonly=""><br>
                        - Time: <input type="text" id="timeDelete" name="time" readonly="">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <form action="deleteAppointment" method="POST">
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


        <!-- Topbar Start -->
        <div class="container-fluid bg-light ps-5 pe-0 d-none d-lg-block">
            <div class="row gx-0">
                <div class="col-md-6 text-center text-lg-start mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center">
                        <small class="py-2"><i class="far fa-clock text-primary me-2"></i>Opening Hours: Mon - Tues : 6.00 am - 10.00 pm, Sunday Closed </small>
                    </div>
                </div>
                <div class="col-md-6 text-center text-lg-end">
                    <div class="position-relative d-inline-flex align-items-center bg-primary text-white top-shape px-5">
                        <div class="me-3 pe-3 border-end py-2">
                            <p class="m-0"><i class="fa fa-envelope-open me-2"></i>info@example.com</p>
                        </div>
                        <div class="py-2">
                            <p class="m-0"><i class="fa fa-phone-alt me-2"></i>+012 345 6789</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm px-5 py-3 py-lg-0">
            <a href="index.jsp" class="navbar-brand p-0">
                <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>DentCare</h1>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0">
                    <a href="index.jsp" class="nav-item nav-link">Home</a>
                    <a href="about.jsp" class="nav-item nav-link">About</a>
                    <a href="service.jsp" class="nav-item nav-link">Service</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu m-0">
                            <a href="price.jsp" class="dropdown-item">Pricing Plan</a>
                            <a href="team.jsp" class="dropdown-item">Our Dentist</a>
                            <a href="testimonial.jsp" class="dropdown-item">Testimonial</a>
                            <a href="appointment.jsp" class="dropdown-item active">Appointment</a>
                        </div>
                    </div>
                    <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                </div>
                <button type="button" class="btn text-dark" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fa fa-search"></i></button>
                <a href="bookAppointment" class="btn btn-primary py-2 px-4 ms-3">Appointment</a>
            </div>
        </nav>
        <!-- Navbar End -->



        <!-- Full Screen Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content" style="background: rgba(9, 30, 62, .7);">
                    <div class="modal-header border-0">
                        <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center justify-content-center">
                        <div class="input-group" style="max-width: 600px;">
                            <input type="text" class="form-control bg-transparent border-primary p-3" placeholder="Type search keyword">
                            <button class="btn btn-primary px-4"><i class="bi bi-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Full Screen Search End -->


        <!-- Hero Start -->
        <div class="container-fluid bg-primary py-5 hero-header mb-5">
            <div class="row py-3">
                <div class="col-12 text-center">
                    <h1 class="display-3 text-white animated zoomIn">Appointment</h1>
                    <a href="" class="h4 text-white">Home</a>
                    <i class="far fa-circle text-white px-2"></i>
                    <a href="" class="h4 text-white">Appointment</a>
                </div>
            </div>
        </div>
        <!-- Hero End -->

        <main class="py-6 bg-surface-secondary">
            <div class="container-fluid">
                <h4>Note</h4>
                <ul>
                    <li>- You must pay a reservation fee before we can confirm your appointment.</li>
                    <li>- If you cancel your appointment, your paying reservation fee does not refund.</li>
                    <li>- If you do not come to the examination, your appointment will be automatically canceled at the end of the day.</li>
                    <li>- If your appointment are confirmed, please wait a minute.</li>
                    <li>- If you have paid the reservation fee and your appointment has not been confirmed, we sincerely apologize and you can edit another slot or you can contact to us by the information in the upper right corner.<b style="color: red">(rare occur)</b></li>

                </ul>
            </div>
        </main>

        <!--View Medical Appointment History Start-->
        <main class="py-6 bg-surface-secondary">
            <div class="container-fluid">                   
                <div class="card shadow border-0 mb-7">
                    <div class="card-header">
                        <h5 class="mb-0">Medical Appointment History</h5>
                    </div>
                    <div style="color: red; margin-left: 10px">${payNotification}</div>
                    <!-- Filter Dropdown -->
                    <div class="dropdown mb-3">
                        <button class="btn btn-primary dropdown-toggle" type="button" id="filterDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            Filters
                        </button>
                        <form method="POST">
                            <ul class="dropdown-menu" aria-labelledby="filterDropdown">
                                <li>
                                    <div class="form-check">
                                        <input type="checkbox" name="filterService" value="true"> Service:
                                        <select name="service">
                                            <option value="">Select</option>
                                            <c:forEach items="${requestScope.arrService}" var="bAH">
                                                <option value="${bAH.service.name}">${bAH.service.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-check">
                                        <input type="checkbox" name="filterDoctor" value="true"> Doctor:
                                        <select name="doctor">
                                            <option value="">Select</option>
                                            <c:forEach items="${requestScope.arrDoctor}" var="bAH">
                                                <option value="${bAH.doctor.name}">${bAH.doctor.name}</option>                                                  
                                            </c:forEach>
                                        </select>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check">
                                        <input type="checkbox" name="filterPrice" value="true"> Price of Service:
                                        <select name="price">
                                            <option value="">Select</option>
                                            <c:forEach items="${requestScope.arrPrice}" var="bAH">
                                                <option value="${bAH.service.price}">${bAH.service.price}$</option>                                                  
                                            </c:forEach>
                                        </select>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check">
                                        <input type="checkbox" name="filterPayment" value="true"> Payment:
                                        <select name="payment">
                                            <option value="">Select</option>
                                            <c:forEach items="${requestScope.arrPay}" var="bAH">
                                                <option value="${bAH.reservationStatus}">${bAH.reservationStatus}</option>                                                  
                                            </c:forEach>
                                        </select>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check">
                                        <input type="checkbox" name="filterTime" value="true"> Examination Time:
                                        <select name="time">
                                            <option value="">Select</option>
                                            <c:forEach items="${requestScope.arrDate}" var="bAH">
                                                <option value="${bAH.date}">${bAH.date}</option>                                                  
                                            </c:forEach>
                                        </select>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check">
                                        <input type="checkbox" name="filterRoom" value="true"> Room:
                                        <select name="room">
                                            <option value="">Select</option>
                                            <c:forEach items="${requestScope.arrRoom}" var="bAH">
                                                <option value="${bAH.room.name}">${bAH.room.name}</option>                                                  
                                            </c:forEach>
                                        </select>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check">
                                        <input type="checkbox" name="filterStatus" value="true"> Status:
                                        <select name="status">
                                            <option value="">Select</option>
                                            <c:forEach items="${requestScope.arrStatus}" var="bAH">
                                                <option value="${bAH.statusBook.name}">${bAH.statusBook.name}</option>                                                  
                                            </c:forEach>
                                        </select>

                                    </div>
                                </li>
                                <li>
                                    <button class="btn btn-primary" type="submit">Apply</button>
                                </li>
                            </ul>
                    </div>
                    </form>

                    <div class="table-responsive">
                        <table class="table table-hover table-nowrap" id="myTable">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col">No <i class="fas fa-sort"></th>
                                    <th scope="col">Service <i class="fas fa-sort"></th>
                                    <th scope="col">Price of Service <i class="fas fa-sort"></th>
                                    <th scope="col">Payment <i class="fas fa-sort"></th>
                                    <th scope="col">Doctor <i class="fas fa-sort"></th>
                                    <th scope="col">Examination Time <i class="fas fa-sort"></th>                                   
                                    <th scope="col">Room <i class="fas fa-sort"></th>
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
                                            <span>${bAH.service.name}</span>
                                        </td>
                                        <td>
                                            <span>${bAH.service.price}$</span>
                                        </td>
                                        <td>
                                            <span>
                                                <c:if test="${bAH.reservationStatus =='Not pay'}">
                                                    Don't pay reservation fee(Not pay).
                                                </c:if>
                                                <c:if test="${bAH.reservationStatus =='Pay reser'}">
                                                    50$ (Reservation fee/Pay reser)
                                                </c:if>
                                                <c:if test="${bAH.reservationStatus =='Pay ser'}">
                                                    Paid service(Pay ser)
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
                                            <span>${bAH.room.name}</span>
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
                                                <button type="button" class="btn btn-sm btn-neutral edit-button" data-bs-toggle="modal" data-bs-target="#confirmEditModal" 
                                                        data-id="${bAH.ID}" data-service="${bAH.service.name}" data-room="${bAH.room.name}" data-doctor="${bAH.doctor.name}"
                                                        data-date="${bAH.date}" data-time="${bAH.slot.startedTime}-${bAH.slot.endTime}">Edit</button>

                                                <button type="button" class="btn btn-sm btn-neutral delete-button" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal"
                                                        data-id="${bAH.ID}" data-service="${bAH.service.name}" data-room="${bAH.room.name}" data-doctor="${bAH.doctor.name}"
                                                        data-date="${bAH.date}" data-time="${bAH.slot.startedTime}-${bAH.slot.endTime}" >
                                                    Cancel
                                                </button>
                                                <c:if test="${bAH.reservationStatus =='Not pay'}">
                                                    <button class="btn btn-sm btn-neutral delete-button" onclick="window.location.href = '../choosePayment?id=${bAH.ID}';">
                                                        Pay 
                                                    </button>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${bAH.statusBook.id == 2}">
                                                <button type="button" class="btn btn-sm btn-neutral delete-button" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal"
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
        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light py-5 wow fadeInUp" data-wow-delay="0.3s" style="margin-top: -75px;">
            <div class="container pt-5">
                <div class="row g-5 pt-4">
                    <div class="col-lg-3 col-md-6">
                        <h3 class="text-white mb-4">Quick Links</h3>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Our Services</a>
                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Latest Blog</a>
                            <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Contact Us</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h3 class="text-white mb-4">Popular Links</h3>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Our Services</a>
                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Latest Blog</a>
                            <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Contact Us</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h3 class="text-white mb-4">Get In Touch</h3>
                        <p class="mb-2"><i class="bi bi-geo-alt text-primary me-2"></i>123 Street, New York, USA</p>
                        <p class="mb-2"><i class="bi bi-envelope-open text-primary me-2"></i>info@example.com</p>
                        <p class="mb-0"><i class="bi bi-telephone text-primary me-2"></i>+012 345 67890</p>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h3 class="text-white mb-4">Follow Us</h3>
                        <div class="d-flex">
                            <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square rounded" href="#"><i class="fab fa-instagram fw-normal"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid text-light py-4" style="background: #051225;">
            <div class="container">
                <div class="row g-0">
                    <div class="col-md-6 text-center text-md-start">
                        <p class="mb-md-0">&copy; <a class="text-white border-bottom" href="#">Your Site Name</a>. All Rights Reserved.</p>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <p class="mb-0">Designed by <a class="text-white border-bottom" href="https://htmlcodex.com">HTML Codex</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


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

                                                                    "paginate": {
                                                                        "first": "First",
                                                                        "last": "Last",
                                                                        "next": "Next",
                                                                        "previous": "Previous"
                                                                    }
                                                                },
                                                                "dom": '<"header_wrap"lf>t<"footer_wrap"ip>',
                                                                "pagingType": "full_numbers",
                                                                "searching": false,
                                                                "pageLength": 10

                                                            });
                                                        });



//
//                                                        function searchServices(event) {
//                                                            var keyword = event.target.value.toLowerCase();
//                                                            var rows = document.querySelectorAll("#appointmentHistoryBody tr");
//
//                                                            rows.forEach(function (row) {
//                                                                var text = row.textContent.toLowerCase();
//                                                                var displayStyle = text.includes(keyword) ? "table-row" : "none";
//                                                                row.style.display = displayStyle;
//                                                            });
//                                                        }






                                                        $(document).ready(function () {
                                                            let editId;
                                                            let service;
                                                            let room;
                                                            let doctor;
                                                            let date;
                                                            let time;
                                                            $('.edit-button').click(function (event) {
                                                                event.preventDefault(); // Prevent the default anchor behavior
                                                                editId = $(this).data('id');
                                                                service = $(this).data('service');
                                                                room = $(this).data('room');
                                                                doctor = $(this).data('doctor');
                                                                date = $(this).data('date');
                                                                time = $(this).data('time');

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
                                                                }, 40); // Tốc độ giảm thanh tiến độ (milliseconds)
                                                            }

                                                            // Close notification button handler
                                                            $('#closeEditNotificationButton').click(function () {
                                                                $('#editSuccessNotification').hide();
                                                            });

                                                            // Check for success message from the server
                                                            let successMessage = '${sessionScope.success}';
                                                            if (successMessage) {
                                                                showEditSuccessNotification();
                                                            }

                                                            //Delete appointment
                                                            $('.delete-button').click(function (event) {
                                                                event.preventDefault(); // Prevent the default anchor behavior
                                                                deleteId = $(this).data('id');
                                                                service = $(this).data('service');
                                                                room = $(this).data('room');
                                                                doctor = $(this).data('doctor');
                                                                date = $(this).data('date');
                                                                time = $(this).data('time');

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
                                                                }, 40); // Tốc độ giảm thanh tiến độ (milliseconds)
                                                            }

                                                            // Close notification button handler
                                                            $('#closeNotificationButton').click(function () {
                                                                $('#deleteSuccessNotification').hide();
                                                            });

                                                            // Check for success message from the server
                                                            let deleteSuccess = '${sessionScope.deleteSuccess}';
                                                            if (deleteSuccess) {
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
                                                                }, 40); // Tốc độ giảm thanh tiến độ (milliseconds)
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
    </body>

</html>
