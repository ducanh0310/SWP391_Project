<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

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
                        <small class="py-2"><i class="far fa-clock text-primary me-2"></i>Opening Hours: Mon - Tues : 7.30 am - 5.30 pm, All day in week </small>
                    </div>
                </div>
                <div class="col-md-6 text-center text-lg-end">
                    <div class="position-relative d-inline-flex align-items-center bg-primary text-white top-shape px-5">
                        <div class="me-3 pe-3 border-end py-2">
                            <a class="m-0" >
                                <i class="fa fa-envelope-open me-2">dentCare23@ks.com</i>
                            </a>
                        </div>
                        <div class="py-2">
                            <p class="m-0"><i class="fa fa-phone-alt me-2"></i>012 345 6789</p>
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
                    <div class="form-group">
                        <div style="color: red"> ${error}</div>
                    </div>
                    <a href="index.jsp" class="nav-item nav-link active">Home</a>
                    <a href="about.jsp" class="nav-item nav-link">About</a>
                    <a href="service.jsp" class="nav-item nav-link">Service</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu m-0">
                            <a href="price.jsp" class="dropdown-item">Pricing Plan</a>
                            <a href="team.jsp" class="dropdown-item">Our Dentist</a>
                            <a href="testimonial.jsp" class="dropdown-item">Testimonial</a>
                            <a href="appointment.jsp" class="dropdown-item">Appointment</a>
                        </div>
                    </div>
                    <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                </div>
                <button type="button" class="btn text-dark" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fa fa-search"></i></button>
                    <c:choose>
                        <c:when test="${currentUser == null}">
                        <a href="login" class="btn btn-primary py-2 px-4 ms-3">Login/Register</a>
                    </c:when>
                    <c:otherwise>
                        <a href="logout" class="btn btn-primary py-2 px-4 ms-3">Logout</a>
                    </c:otherwise>
                </c:choose>
                <a href="patient/bookAppointment" class="btn btn-primary py-2 px-4 ms-3">Make Appointment</a>
                <!--                <a href="confirmpass" class="btn btn-primary py-2 px-4 ms-3">Change password</a>-->
                <!--<a href="patient/viewAppointmentHistory" class="btn btn-primary py-2 px-4 ms-3">View Appointment</a>-->
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


        <!-- Carousel Start -->
        <div class="container-fluid p-0">
            <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="w-100" src="img/carousel-1.jpg" alt="Image">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 900px;">
                                <h5 class="text-white text-uppercase mb-3 animated slideInDown">Keep Your Teeth Healthy</h5>
                                <h1 class="display-1 text-white mb-md-4 animated zoomIn">Take The Best Quality Dental Treatment</h1>
<!--                                <a href="appointment.jsp" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Appointment</a>
                                <a href="" class="btn btn-secondary py-md-3 px-md-5 animated slideInRight">Contact Us</a>-->
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="w-100" src="img/carousel-2.jpg" alt="Image">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 900px;">
                                <h5 class="text-white text-uppercase mb-3 animated slideInDown">Keep Your Teeth Healthy</h5>
                                <h1 class="display-1 text-white mb-md-4 animated zoomIn">Take The Best Quality Dental Treatment</h1>
<!--                                <a href="appointment.jsp" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Appointment</a>
                                <a href="" class="btn btn-secondary py-md-3 px-md-5 animated slideInRight">Contact Us</a>-->
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <!-- Carousel End -->





        <!-- About Start -->
        <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="row g-5">
                    <div class="col-lg-7">
                        <div class="section-title mb-4">
                            <h5 class="position-relative d-inline-block text-primary text-uppercase">About Us</h5>
                            <h1 class="display-5 mb-0">Perfect Oral Care with Dent Care</h1>
                        </div>
                        <h4 class="text-body fst-italic mb-4">Dent Care is proud to be a leading provider of comprehensive dental care services. </h4>
                        <p class="mb-4">We are committed to bringing you a radiant smile and optimal oral health through advanced solutions and a dedicated team of experts. Come to Dent Care to experience the difference and take care of your oral health today!</p>
                        <div class="row g-3">
                            <div class="col-sm-6 wow zoomIn" data-wow-delay="0.3s">
                                <h5 class="mb-3"><i class="fa fa-check-circle text-primary me-3"></i>Professional Staff</h5>
                                <h5 class="mb-3"><i class="fa fa-check-circle text-primary me-3"></i>Advanced technology</h5>
                            </div>
                            <div class="col-sm-6 wow zoomIn" data-wow-delay="0.6s">
                                <h5 class="mb-3"><i class="fa fa-check-circle text-primary me-3"></i>Personalized treatment plans</h5>
                                <h5 class="mb-3"><i class="fa fa-check-circle text-primary me-3"></i>Fair Prices</h5>
                            </div>
                        </div>
                        <a href="appointment.jsp" class="btn btn-primary py-3 px-5 mt-4 wow zoomIn" data-wow-delay="0.6s">Make Appointment</a>
                    </div>
                    <div class="col-lg-5" style="min-height: 500px;">
                        <div class="position-relative h-100">
                            <img class="position-absolute w-100 h-100 rounded wow zoomIn" data-wow-delay="0.9s" src="img/about.jpg" style="object-fit: cover;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->





        <!-- Service Start -->
        <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="row g-5 mb-5">
                    <div class="col-lg-5 wow zoomIn" data-wow-delay="0.3s" style="min-height: 400px;">
                        <div class="twentytwenty-container position-relative h-100 rounded overflow-hidden">
                            <img class="position-absolute w-100 h-100" src="img/before.jpg" style="object-fit: cover;">
                            <img class="position-absolute w-100 h-100" src="img/after.jpg" style="object-fit: cover;">
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="section-title mb-5">
                            <h5 class="position-relative d-inline-block text-primary text-uppercase">Our Services</h5>
                            <h1 class="display-5 mb-0">We Offer The Best Quality Dental Services</h1>
                        </div>
                        <div class="row g-5">
                            <div class="col-md-6 service-item wow zoomIn" data-wow-delay="0.6s">
                                <div class="rounded-top overflow-hidden">
                                    <img class="img-fluid" src="img/service-1.jpg" alt="">
                                </div>
                                <div class="position-relative bg-light rounded-bottom text-center p-4">
                                    <h5 class="m-0">Teeth Cleaning</h5>
                                </div>
                            </div>
                            <div class="col-md-6 service-item wow zoomIn" data-wow-delay="0.9s">
                                <div class="rounded-top overflow-hidden">
                                    <img class="img-fluid" src="img/service-2.jpg" alt="">
                                </div>
                                <div class="position-relative bg-light rounded-bottom text-center p-4">
                                    <h5 class="m-0">Wisdom tooth extraction</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-5 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="col-lg-7">
                        <div class="row g-5">
                            <div class="col-md-6 service-item wow zoomIn" data-wow-delay="0.3s">
                                <div class="rounded-top overflow-hidden">
                                    <img class="img-fluid" src="img/service-3.jpg" alt="">
                                </div>
                                <div class="position-relative bg-light rounded-bottom text-center p-4">
                                    <h5 class="m-0">Dentures</h5>
                                </div>
                            </div>
                            <div class="col-md-6 service-item wow zoomIn" data-wow-delay="0.6s">
                                <div class="rounded-top overflow-hidden">
                                    <img class="img-fluid" src="img/service-4.jpg" alt="">
                                </div>
                                <div class="position-relative bg-light rounded-bottom text-center p-4">
                                    <h5 class="m-0">Teeth Whitening</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 service-item wow zoomIn" data-wow-delay="0.9s">
                        <div class="position-relative bg-primary rounded h-100 d-flex flex-column align-items-center justify-content-center text-center p-4">
                            <h3 class="text-white mb-3">Make Appointment</h3>
                            <p class="text-white mb-3">When you come to us, the best things will come to you.</p>
                            <h2 class="text-white mb-0">012 345 6789</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Service End -->



        <!-- Pricing Start -->
        <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="row g-5">
                    <div class="col-lg-5">
                        <div class="section-title mb-4">
                            <h5 class="position-relative d-inline-block text-primary text-uppercase">Pricing Plan</h5>
                            <h1 class="display-5 mb-0">We Offer Fair Prices for Dental Treatment</h1>
                        </div>
                        <p class="mb-4">At Dent Care, we believe that high-quality dental care should be accessible to everyone. That’s why we offer fair and competitive prices for all our dental treatments. Whether you need a routine check-up, advanced dental procedures, or cosmetic dentistry, you can trust that our pricing is transparent and affordable. We strive to provide the best value without compromising on the quality of care. Experience top-notch dental services at prices that won’t break the bank, only at Dent Care.</p>
                        <h5 class="text-uppercase text-primary wow fadeInUp" data-wow-delay="0.3s">Call for Appointment</h5>
                        <h1 class="wow fadeInUp" data-wow-delay="0.6s">012 345 6789</h1>
                    </div>
                    <div class="col-lg-7">
                        <div class="owl-carousel price-carousel wow zoomIn" data-wow-delay="0.9s">
                            <div class="price-item pb-4">
                                <div class="position-relative">
                                    <img class="img-fluid rounded-top" src="img/price-1.jpg" alt="">
                                    <div class="d-flex align-items-center justify-content-center bg-light rounded pt-2 px-3 position-absolute top-100 start-50 translate-middle" style="z-index: 2;">
                                        <h2 class="text-primary m-0">$300</h2>
                                    </div>
                                </div>
                                <div class="position-relative text-center bg-light border-bottom border-primary py-5 p-4">
                                    <h4>Teeth Whitening</h4>
                                    <hr class="text-primary w-50 mx-auto mt-0">
                                    <div class="d-flex justify-content-between mb-3"><span>Modern Equipment</span><i class="fa fa-check text-primary pt-1"></i></div>
                                    <div class="d-flex justify-content-between mb-3"><span>Professional Dentist</span><i class="fa fa-check text-primary pt-1"></i></div>
                                    <div class="d-flex justify-content-between mb-2"><span>24/7 Call Support</span><i class="fa fa-check text-primary pt-1"></i></div>
                                    
                                </div>
                            </div>
                            <div class="price-item pb-4">
                                <div class="position-relative">
                                    <img class="img-fluid rounded-top" src="img/price-2.jpg" alt="">
                                    <div class="d-flex align-items-center justify-content-center bg-light rounded pt-2 px-3 position-absolute top-100 start-50 translate-middle" style="z-index: 2;">
                                        <h2 class="text-primary m-0">$75</h2>
                                    </div>
                                </div>
                                <div class="position-relative text-center bg-light border-bottom border-primary py-5 p-4">
                                    <h4>Teeth Cleanings</h4>
                                    <hr class="text-primary w-50 mx-auto mt-0">
                                    <div class="d-flex justify-content-between mb-3"><span>Modern Equipment</span><i class="fa fa-check text-primary pt-1"></i></div>
                                    <div class="d-flex justify-content-between mb-3"><span>Professional Dentist</span><i class="fa fa-check text-primary pt-1"></i></div>
                                    <div class="d-flex justify-content-between mb-2"><span>24/7 Call Support</span><i class="fa fa-check text-primary pt-1"></i></div>
                                    
                                </div>
                            </div>
                            <div class="price-item pb-4">
                                <div class="position-relative">
                                    <img class="img-fluid rounded-top" src="img/price-3.jpg" alt="">
                                    <div class="d-flex align-items-center justify-content-center bg-light rounded pt-2 px-3 position-absolute top-100 start-50 translate-middle" style="z-index: 2;">
                                        <h2 class="text-primary m-0">$200</h2>
                                    </div>
                                </div>
                                <div class="position-relative text-center bg-light border-bottom border-primary py-5 p-4">
                                    <h4>Wisdom tooth extraction</h4>
                                    <hr class="text-primary w-50 mx-auto mt-0">
                                    <div class="d-flex justify-content-between mb-3"><span>Modern Equipment</span><i class="fa fa-check text-primary pt-1"></i></div>
                                    <div class="d-flex justify-content-between mb-3"><span>Professional Dentist</span><i class="fa fa-check text-primary pt-1"></i></div>
                                    <div class="d-flex justify-content-between mb-2"><span>24/7 Call Support</span><i class="fa fa-check text-primary pt-1"></i></div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Pricing End -->


        <!-- Testimonial Start -->
        <div class="container-fluid bg-primary bg-testimonial py-5 my-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="owl-carousel testimonial-carousel rounded p-5 wow zoomIn" data-wow-delay="0.6s">
                            <div class="testimonial-item text-center text-white">
                                <img class="img-fluid mx-auto rounded mb-4" src="img/testimonial-1.jpg" alt="">
                                <p class="fs-5">Dent Care is the only place I completely trust for my dental care. The professional staff and advanced technology always make me feel secure when I come here.</p>
                                <hr class="mx-auto w-25">
                                <h4 class="text-white mb-0">Lyly</h4>
                            </div>
                            <div class="testimonial-item text-center text-white">
                                <img class="img-fluid mx-auto rounded mb-4" src="img/testimonial-2.jpg" alt="">
                                <p class="fs-5">I am very impressed with the service at Dent Care. The prices are reasonable, and the staff are enthusiastic and friendly. I will definitely recommend it to my friends and family.</p>
                                <hr class="mx-auto w-25">
                                <h4 class="text-white mb-0">Alex</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->


        <!-- Team Start -->
        <div class="container-fluid py-5">
            <div class="container">
                <div class="row g-5">
                    <div class="col-lg-4 wow slideInUp" data-wow-delay="0.1s">
                        <div class="section-title bg-light rounded h-100 p-5">
                            <h5 class="position-relative d-inline-block text-primary text-uppercase">Our Dentist</h5>
                            <h1 class="display-6 mb-4">Meet Our Certified & Experienced Dentist</h1>
                            <a href="appointment.jsp" class="btn btn-primary py-3 px-5">Appointment</a>
                        </div>
                    </div>
                    <div class="col-lg-4 wow slideInUp" data-wow-delay="0.3s">
                        <div class="team-item">
                            <div class="position-relative rounded-top" style="z-index: 1;">
                                <img class="img-fluid rounded-top w-100" src="img/team-1.jpg" alt="">
                                
                            </div>
                            <div class="team-text position-relative bg-light text-center rounded-bottom p-4 pt-5">
                                <h4 class="mb-2">Samy Touabi</h4>
                                <p class="text-primary mb-0">Wisdom tooth extraction</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 wow slideInUp" data-wow-delay="0.6s">
                        <div class="team-item">
                            <div class="position-relative rounded-top" style="z-index: 1;">
                                <img class="img-fluid rounded-top w-100" src="img/team-2.jpg" alt="">
                                
                            </div>
                            <div class="team-text position-relative bg-light text-center rounded-bottom p-4 pt-5">
                                <h4 class="mb-2">John Li</h4>
                                <p class="text-primary mb-0">Wisdom tooth extraction</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 wow slideInUp" data-wow-delay="0.1s">
                        <div class="team-item">
                            <div class="position-relative rounded-top" style="z-index: 1;">
                                <img class="img-fluid rounded-top w-100" src="img/team-3.jpg" alt="">
                                
                            </div>
                            <div class="team-text position-relative bg-light text-center rounded-bottom p-4 pt-5">
                                <h4 class="mb-2">Céline Wan</h4>
                                <p class="text-primary mb-0">Teeth Cleaning</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 wow slideInUp" data-wow-delay="0.3s">
                        <div class="team-item">
                            <div class="position-relative rounded-top" style="z-index: 1;">
                                <img class="img-fluid rounded-top w-100" src="img/team-4.jpg" alt="">
                                
                            </div>
                            <div class="team-text position-relative bg-light text-center rounded-bottom p-4 pt-5">
                                <h4 class="mb-2">Tisham Islam</h4>
                                <p class="text-primary mb-0">Teeth Whitening</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 wow slideInUp" data-wow-delay="0.6s">
                        <div class="team-item">
                            <div class="position-relative rounded-top" style="z-index: 1;">
                                <img class="img-fluid rounded-top w-100" src="img/team-5.jpg" alt="">
                                
                            </div>
                            <div class="team-text position-relative bg-light text-center rounded-bottom p-4 pt-5">
                                <h4 class="mb-2">Nakul Lover</h4>
                                <p class="text-primary mb-0">Teeth Whitening</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Team End -->


        <br>
        <br>
        <br>
        <br>


        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light py-5 wow fadeInUp" data-wow-delay="0.3s" style="margin-top: -75px;">
    <div class="container pt-5">
        <div class="row g-5 pt-4">
            <div class="col-lg-4 col-md-6">
                <h3 class="text-white mb-4">Popular Links</h3>
                <div class="d-flex flex-column justify-content-start">
                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                    <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Our Services</a>
                    <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Contact Us</a>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <h3 class="text-white mb-4">Get In Touch</h3>
                <p class="mb-2"><i class="bi bi-envelope-open text-primary me-2"></i>dentCare23@ks.com</p>
                <p class="mb-0"><i class="bi bi-telephone text-primary me-2"></i>012 345 67890</p>
            </div>
            <div class="col-lg-4 col-md-6">
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
        
        <!-- Footer End -->


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
    </body>

</html>