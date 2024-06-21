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

            .table-container {
                max-height: 200px; /* Adjust as needed */
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
                <a href="appointment.jsp" class="btn btn-primary py-2 px-4 ms-3">Appointment</a>
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


        <!-- Appointment Start -->
        <div class="container-fluid bg-primary bg-appointment mb-5 wow fadeInUp" data-wow-delay="0.1s" style="margin-top: 90px;">
            <div class="container" >
                <div class="row gx-5">


                    <!-- Search slot -->
                    <div class="col-lg-6 py-5">
                        <div class="appointment-form h-100 d-flex flex-column justify-content-center text-center p-5 wow zoomIn" data-wow-delay="0.6s" >
                            <h1 class="text-white mb-4">Search Slot</h1>
                            <form id="search-form" action="" method="POST">
                                <div class="date mb-3" id="dateBook" name="dateBook" >
                                    <input type="date" name="date" class="form-control bg-light border-0 datetimepicker-input" placeholder="Appointment Date" style="height: 40px;" value="${DateServiceAppointment.date}">
                                </div>

                                <select class="form-select bg-light border-0 mb-3" id="service" name="service" style="height: 40px;">
                                    <c:forEach items="${requestScope.arrService}" var="service">
                                        <option value="${service.id}" <c:if test="${service.id == DateServiceAppointment.service.id}">selected</c:if>>${service.name}</option>
                                    </c:forEach>
                                </select>

                                <div>
                                    <button class="btn btn-dark w-100 py-3" type="submit" id="search-slot-button">Search Slot</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Slot content start-->
                    <div id="replacement-content" class="col-lg-6 py-5 wow zoomIn hidden" data-wow-delay="0.1s">
                        <div class="bg-primary d-flex flex-column p-5" style="height: 300px;">
                            <h1 class="text-white mb-4">Slot</h1>
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
                                                    <button type="button" class="btn btn-primary book-button" data-bs-toggle="modal" data-bs-target="#confirmModal" 
                                                            data-date="${DateServiceAppointment.date}" data-idService="${DateServiceAppointment.service.id}" data-idDoctor="${slots.doctor.id}" 
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
        
        <!--Confirmation Modal Start(only change slot)-->                
        <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmModalLabel">Confirm Booking</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Room: <input type="text" id="room" name="room" readonly=""><br>
                        Doctor: <input type="text" id="doctor" name="doctorName" readonly=""><br>
                        Time: <input type="text" id="time" name="time" readonly="">
                    </div>
                    <div class="modal-footer">
                        <form id="book-form" action="confirmEditSlot?id=${idAppointment}" method="POST">
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
                        Room: <input type="text" id="confirmRoom1" name="room" readonly=""><br>
                        Doctor: <input type="text" id="confirmDoctor1" name="doctorName" readonly=""><br>
                        Time: <input type="text" id="confirmTime1" name="time" readonly="">
                        <form action="confirmEditSlot" method="POST">
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
                        Room: <input type="text" id="confirmRoom2" name="room" readonly=""><br>
                        Doctor: <input type="text" id="confirmDoctor2" name="doctorName" readonly=""><br>
                        Time: <input type="text" id="confirmTime2" name="time" readonly="">
                        <form action="confirmEditSlot?id=${idAppointment}" method="POST">
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
        <!-- Confirmation Modal End (change date, service, slot)-->

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

        <!-- Template Javascript -->
        <script src="../js/main.js"></script>

        <script>
            // Modal for only change slot start
            document.addEventListener("DOMContentLoaded", function () {
                const confirmModal = document.getElementById('confirmModal');
                const bookForm = document.getElementById('book-form');
                confirmModal.addEventListener('show.bs.modal', function (event) {
                    const button = event.relatedTarget;
                    const date = button.getAttribute('data-date');
                    const idService = button.getAttribute('data-idService');
                    const idDoctor = button.getAttribute('data-idDoctor');
                    const idSlot = button.getAttribute('data-idSlot');
                    const idRoom = button.getAttribute('data-idRoom');
                    const room = button.getAttribute('data-room');
                    const doctor = button.getAttribute('data-doctor');
                    const time = button.getAttribute('data-time');
                    
                    document.getElementById('date').value = date;
                    document.getElementById('idService').value = idService;
                    document.getElementById('idDoctor').value = idDoctor;
                    document.getElementById('idSlot').value = idSlot;
                    document.getElementById('idRoom').value = idRoom;
                    document.getElementById('room').value = room;
                    document.getElementById('doctor').value = doctor;
                    document.getElementById('time').value = time;
                    
                });
            });
            // Modal for only change slot end 


            //Change date, service and slot 
            document.getElementById('search-form').addEventListener('submit', function (event) {
                event.preventDefault(); // Ngăn chặn việc gửi form truyền thống

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

                                // Create and append the select button cell
                                var selectButtonCell = document.createElement('td');
                                var selectButton = document.createElement('button');
                                selectButton.textContent = 'Book';
                                selectButton.className = 'btn btn-primary';
                                selectButton.addEventListener('click', function () {
                                    //Set slot details in modal
                                    document.getElementById('confirmRoom1').value = showSlot.room;
                                    document.getElementById('confirmDoctor1').value = showSlot.doctor;
                                    document.getElementById('confirmTime1').value = showSlot.startedTime + ' - ' + showSlot.endTime;
                                    document.getElementById('confirmSlotId1').value = showSlot.idSlot;
                                    document.getElementById('confirmDoctorId1').value = showSlot.idDoctor;
                                    document.getElementById('confirmRoomId1').value = showSlot.idRoom;
                                    document.getElementById('confirmDate1').value = showSlot.date;
                                    document.getElementById('confirmServiceId1').value = showSlot.idService;



                                    // Also set data in the second form if necessary
                                    document.getElementById('confirmRoom2').value = showSlot.room;
                                    document.getElementById('confirmDoctor2').value = showSlot.doctor;
                                    document.getElementById('confirmTime2').value = showSlot.startedTime + ' - ' + showSlot.endTime;
                                    document.getElementById('confirmSlotId2').value = showSlot.idSlot;
                                    document.getElementById('confirmDoctorId2').value = showSlot.idDoctor;
                                    document.getElementById('confirmRoomId2').value = showSlot.idRoom;
                                    document.getElementById('confirmDate2').value = showSlot.date;
                                    document.getElementById('confirmServiceId2').value = showSlot.idService;
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
                            alert(response.message);
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
