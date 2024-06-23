<%-- 
    Document   : patient
    Created on : May 20, 2024, 8:55:58 PM
    Author     : Vu Minh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            body {
                /*background: rgb(99, 39, 120)*/
            }


            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8
            }

            .profile-button {
                background: rgb(99, 39, 120);
                box-shadow: none;
                border: none
            }

            .profile-button:hover {
                background: #682773
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none
            }

            .back:hover {
                color: #682773;
                cursor: pointer
            }

            .labels {
                font-size: 11px
            }

            .add-experience:hover {
                background: #BA68C8;
                color: #fff;
                cursor: pointer;
                border: solid 1px #BA68C8
            }

            .profile_button{
                margin: 5px;
                width: 85%;
            }

            .container-box {
                margin-bottom: 120px; /* Khoảng cách giữa các box dưới cùng */
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Điều chỉnh giá trị để thay đổi độ đậm nhạt của box shadow */
            }



            .certification-item {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
                padding: 10px;
                border: 1px solid #ced4da;
                border-radius: 5px;
                background-color: #fff;
                width: 100%;
            }

            .certification-item a {
                flex-grow: 1;
                margin-right: 10px;
                color: #495057;
                text-decoration: none;
            }

            .certification-item button {
                background-color: #06A3DA;
                border: none;
                padding: 5px 10px;
                color: #fff;
                cursor: pointer;
                border-radius: 5px;
            }

            .certification-item button:hover {
                background-color: #06A3DA;
            }

            .link-as-input {
                display: inline-block;
                padding: .375rem .75rem;
                margin-bottom: 0;
                font-size: 1rem;
                font-weight: 400;
                line-height: 1.5;
                color: #495057;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #ced4da;
                border-radius: .25rem;
                transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
            }

            .rounded-circle {
                border-radius: 50% !important;
                width: 150px; /* Đảm bảo rằng width và height có giá trị bằng nhau */
                height: 150px; /* Đảm bảo rằng width và height có giá trị bằng nhau */
                object-fit: cover; /* Đảm bảo hình ảnh được cắt gọn vừa với hình tròn */
            }

        </style>
    </head>
    <body>


        <!-- Topbar Start -->
        <div class="container-fluid bg-light ps-5 pe-0 d-none d-lg-block">
            <div class="row gx-0">
                <div class="col-md-6 text-center text-lg-start mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center">
                        <small class="py-2"><i class="fa fa-map-marker-alt text-primary me-2"></i>${emInfo.branch.city}</small>
                    </div>
                </div>
                <div class="col-md-6 text-center text-lg-end">
                    <div class="position-relative d-inline-flex align-items-center bg-primary text-white top-shape px-5">
                        <div class="me-3 pe-3 border-end py-2">
                            <c:if test="${emInfo.employeeType == 'r'}"> <p class="m-0"></i>Receptionist</p></c:if>
                            <c:if test="${emInfo.employeeType == 'd'}"> <p class="m-0"></i>Doctor</p></c:if>
                            <c:if test="${emInfo.employeeType == 'h'}"> <p class="m-0"></i>Nurse</p></c:if>
                            <c:if test="${emInfo.employeeType == 'b'}"> <p class="m-0"></i>Branch Manager</p></c:if>
                            </div>
                            <div class="py-2">
                                <p class="m-0" ><a href="" style="color: #ffffff">${username}</a></p>                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->

        <!-- Navbar Start -->
        <!-- Navbar End -->
<div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
        <!-- Vertical Navbar -->
        <nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg"
            id="navbarVertical">
            <div class="container-fluid">
                <!-- Toggler -->
                <button class="navbar-toggler ms-n2" type="button" data-bs-toggle="collapse"
                    data-bs-target="#sidebarCollapse" aria-controls="sidebarCollapse" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- Brand -->
                <a href="index.jsp" class="navbar-brand p-0">
                    <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>DentCare</h1>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
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
                            <a class="nav-link" href="../../PatientController">
                                <i class="bi bi-list-task"></i> Patient
                            </a>
                        </li>
                    </ul>
                    <!-- Divider -->
                    <hr class="navbar-divider my-5 opacity-20">
                    <!-- Navigation -->
    
                    <!-- Push content down -->
                    <hr>
                    <!-- User (md) -->
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-person-square"></i> Account
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../../logout">
                                <i class="bi bi-box-arrow-left"></i> Logout
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Main content -->
        <div class="h-screen flex-grow-1 overflow-y-lg-auto">
    
            <!-- Main -->
            <main class="py-6 bg-surface-secondary">
                <div class="container-fluid">
                    <div class="card shadow border-0 mb-7">
                        <div class="card-header">
                            <h5 class="mb-0">Welcome, doctor</h5>
                        </div>
                        <div class="row justify-content-center " >
    
                            <div class="col-md-3 container-box">
                                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                    <img class="rounded-circle mt-5 profile-pic"  src="${image != null ? image : '../../img/profile/no_image_profile.png'}" id="profile-pic" name="profile-pic" alt="personal image">
                
                                    <span class="font-weight-bold">${username}</span>
                                    <span class="text-black-50">${emInfo.email}</span>
                                    <br>
                                    <!--<a href="" class="btn btn-primary py-2 px-4 ms-3 profile_button">Medical appointment history</a>-->
                                    <a href="" class="btn btn-primary py-2 px-4 ms-3 profile_button">Change password</a>
                
                                </div>
                            </div>
                
                            <div class="col-md-1"></div>
                            <div class="col-md-5 container-box">
                                <div class="p-3 py-5">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h4 class="text-right">My account</h4>
                                    </div>
                                    <hr>
                                    <div class="row mt-3">
                                        <div class="col-md-6">
                                            <label class="labels">Fullname</label>
                                            <input type="text" id="fullname" name="fullname" class="form-control" placeholder="" value="${emInfo.name}" readonly="">
                                        </div>        
                                        <div class="col-md-6">
                                            <label class="labels">Phone Number</label>
                                            <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="" value="${emInfo.phoneNumber}" readonly="">
                                        </div>
                                    </div>
                
                                    <div class="row mt-3">
                                        <div class="col-md-6">
                                            <label class="labels">Email</label>
                                            <input type="text" id="email" name="email" class="form-control" placeholder="" value="${emInfo.email}" readonly="">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="labels">Medicine code</label>
                                            <input type="text" id="medicineCode" name="medicineCode" class="form-control" placeholder=" " value="${emInfo.employeeSin}" readonly="">
                                        </div>
                                    </div>
                
                                    <div class="row mt-3">
                                        <div class="col-md-6">
                                            <label class="labels" for="gender">Gender</label>
                                            <input type="text" id="gender" name="gender" class="form-control" readonly="" placeholder="" 
                                                   <c:if test="${emInfo.gender == 'M'}">
                                                       value="Male"
                                                   </c:if>
                                                   <c:if test="${emInfo.gender == 'F'}">
                                                       value="Female"
                                                   </c:if>
                                                   <c:if test="${emInfo.gender == 'X'}">
                                                       value="Other"
                                                   </c:if>
                                                   >
                                        </div>                    
                
                                        <div class="col-md-6">
                                            <label class="labels">Date of birth</label>
                                            <input type="date" id="dob" name="dob" class="form-control" placeholder="" value="${emInfo.dob}" readonly="">
                                        </div>
                                    </div>
                
                                    <div class="row mt-3">
                                        <div class="col-md-6">
                                            <label class="labels">Role</label>
                                            <input type="text" id="role" name="role" class="form-control" placeholder=""  readonly=""
                                                   <c:if test="${emInfo.employeeType == 'r'}">value="Receptionist"</c:if>
                                                   <c:if test="${emInfo.employeeType == 'd'}">value="Doctor"</c:if>
                                                   <c:if test="${emInfo.employeeType == 'h'}">value="Nurse"</c:if>
                                                   <c:if test="${emInfo.employeeType == 'b'}">value="Branch Manage"</c:if>
                                                       >
                                            </div>
                                            <div class="col-md-6">
                                                <label class="labels">Salary / year</label>
                                                <input type="text" id="salary" name="salary" class="form-control" placeholder="" value="${emInfo.annualSalary}" readonly="">
                                        </div>
                                    </div>
                
                                    <div class="row mt-3">
                                        <div class="col-md-6">
                                            <label class="labels">Address</label>
                                            <input type="text" id="address" name="address" class="form-control" placeholder="" value="${emInfo.address}" readonly="">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="labels">Working Branch</label>
                                            <input type="text" id="branch" name="branch" class="form-control" placeholder="" value="${emInfo.branch.city}" readonly="">
                                        </div>
                                    </div>
                
                
                                    <form action="view" method="POST">
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <label class="labels">Certification</label>
                                                <c:forEach items="${requestScope.arrayCerti}" var="cer">
                                                    <div class="certification-item d-flex align-items-center mb-2">
                                                        <a href="${cer.url}" target="_blank" class="link-as-input">${cer.name}</a>
                                                        <button type="button" class="btn btn-gray btn-sm" onclick="confirmDeletion(${cer.id})">Delete</button>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </form>
                
                                    <div class="mt-5 text-center">
                                        <a href="edit" class=" btn btn-primary py-2 px-4 ms-3 ">Edit Profile</a>
                                    </div>
                                </div>
                            </div>    
                
                        </div>            
                    </div>
                </div>
            </main>
        </div>
    </div>

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light py-5 wow fadeInUp" data-wow-delay="0.3s" style="margin-top: -75px;">
            <div class="container pt-5">
                <div class="row g-5 pt-4 justify-content-center">
                    <div class="col-lg-3 col-md-6 mx-auto">
                        <a href="index.html" class="navbar-brand p-0 d-block mx-auto text-start">
                            <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>DentCare</h1>
                        </a>
                        <br>
                        <p class="mb-2 text-start"><i class="bi bi-geo-alt text-primary me-2"></i>123 Street, New York, USA</p>
                        <p class="mb-2 text-start"><i class="bi bi-envelope-open text-primary me-2"></i>dentcare23@medical.com</p>
                        <p class="mb-0 text-start"><i class="bi bi-telephone text-primary me-2"></i>+012 345 67890</p>
                    </div>
                    <div class="col-lg-3 col-md-6 mx-auto">
                        <h3 class="text-white mb-4 text-start">Popular Links</h3>
                        <div class="d-flex flex-column justify-content-start text-start">
                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Our Services</a>
                            <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Latest Blog</a>
                            <a class="text-light" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Contact Us</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 mx-auto">
                        <h3 class="text-white mb-4 text-start">Follow Us</h3>
                        <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href="https://www.facebook.com/groups/490263423665224" target="_blank"><i class="fab fa-facebook-f fw-normal"></i></a>
                        <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                        <a class="btn btn-lg btn-primary btn-lg-square rounded me-2" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                        <a class="btn btn-lg btn-primary btn-lg-square rounded" href="#"><i class="fab fa-instagram fw-normal"></i></a>
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
                                            function confirmDeletion(certId) {
                                                if (confirm("Are you sure you want to delete this certification?")) {
                                                    // Create a form element
                                                    const form = document.createElement('form');
                                                    form.method = 'POST';
                                                    form.action = 'view';

                                                    // Create a hidden input element to hold the certification ID
                                                    const input = document.createElement('input');
                                                    input.type = 'hidden';
                                                    input.name = 'deleteCert';
                                                    input.value = certId;

                                                    // Append the hidden input to the form
                                                    form.appendChild(input);

                                                    // Append the form to the body and submit it
                                                    document.body.appendChild(form);
                                                    form.submit();
                                                }
                                            }
        </script>
    </body>
</html>