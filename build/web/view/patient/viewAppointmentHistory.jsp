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

            /* Style for the progress bar */
            .progress-bar {
                transition: width 5s linear;
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
        <!-- Deleted Success Notification start-->
        <div id="deleteSuccessNotification" class="position-fixed top-0 end-0 p-3" style="z-index: 1060;">
            <div id="deleteSuccessAlert" class="alert alert-danger alert-dismissible fade show mb-0" role="alert">
                Appointment cancelled successfully!
                <div class="progress mt-2" style="height: 4px;">
                    <div id="deleteSuccessProgressBar" class="progress-bar progress-bar-animated bg-danger" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
        </div>
        <!-- Deleted Success Notification end-->

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

        <!--View Medical Appointment History Start-->
        <main class="py-6 bg-surface-secondary">
            <div class="container-fluid">                   
                <div class="card shadow border-0 mb-7">
                    <div class="card-header">
                        <h5 class="mb-0">Medical Appointment History</h5>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover table-nowrap">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">Service</th>
                                    <th scope="col">Price of Service</th>
                                    <th scope="col">Doctor</th>
                                    <th scope="col">Day</th>
                                    <th scope="col">Slot</th>
                                    <th scope="col">Room</th>
                                    <th scope="col">Status</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.bookingAppointmentHistory}" var="bAH">
                                    <tr>
                                        <td>
                                            <input type="text" value="1" style="width: 10px" readonly="">
                                        </td>
                                        <td>
                                            <input type="text" value="${bAH.service.name}" readonly="">
                                        </td>
                                        <td>
                                            <input type="text" value="${bAH.service.price}$" readonly="">
                                        </td>
                                        <td>
                                            <input type="text" value="${bAH.doctor.name}" readonly="" >
                                        </td>
                                        <td>
                                            <input type="text" value="${bAH.date}" readonly="" >
                                        </td>
                                        <td>
                                            <input type="text" value="${bAH.slot.startedTime}-${bAH.slot.endTime}" readonly="">
                                        </td>
                                        <td>
                                            <input type="text" value="${bAH.room.name}" readonly="">
                                        </td>

                                        <td>
                                            <input type="text" value="${bAH.statusBook.name}" readonly="" >
                                        </td>
                                        
                                        <td class="text-end">
                                            <a href="editAppointment?id=${bAH.ID}" class="btn btn-sm btn-neutral">Edit</a>
                                            <button type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>



                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer border-0 py-5">
                        <span class="text-muted text-sm">Showing 10 items out of 250 results found</span>
                    </div>
                </div>
            </div>
        </main>
        <!--View Medical Appointment History End-->


        <!-- Verify cancelled booking appointment start -->

        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Deletion</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to cancel this appointment?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger" id="confirmDeleteButton">Delete</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Verify cancelled booking appointment start -->

        <!-- Note Start -->
        <main class="py-6 bg-surface-secondary">
            <div class="container-fluid">
                <h4>Note</h4>
                <ul>
                    <li>- <b style="color:blue">Verifying:</b> Your booking appointment are verifying.</li>
                    <li>- <b style="color:red">Cancel:</b> Your booking appointment were cancelled.</li>
                    <li>- <b style="color:black">Not Started</b>: You have successfully scheduled an appointment but have not seen the doctor yet.</li>
                    <li>- <b style="color: #157347">Done</b>: You have completed the medical examination.</li>

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

        <!-- Template Javascript -->
        <script src="../js/main.js"></script>

        <script>
            $(document).ready(function () {
                $('#confirmDeleteButton').on('click', function () {
                    // Simulate deletion process
                    $('#confirmDeleteModal').modal('hide'); // Hide the confirmation modal

                    // Show success notification
                    $('#deleteSuccessNotification').fadeIn();

                    // Start progress bar animation
                    var progressBar = $('#deleteSuccessProgressBar');
                    progressBar.css('width', '100%');
                    progressBar.addClass('progress-bar-animated');

                    // Hide notification and reset progress bar after 5 seconds
                    setTimeout(function () {
                        $('#deleteSuccessNotification').fadeOut();
                        progressBar.css('width', '0%');
                        progressBar.removeClass('progress-bar-animated');
                    }, 5000);
                });
            });
        </script>
    </body>

</html>
