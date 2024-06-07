<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <link href="../../img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="../../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="../../lib/animate/animate.min.css" rel="stylesheet">
        <link href="../../lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
        <link href="../../lib/twentytwenty/twentytwenty.css" rel="stylesheet" />
        <!-- BoxIcons v2.1.2 -->
        <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet">

        <!-- Roboto Font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">

        <!-- CSS File -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="../../css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="../../css/style.css" rel="stylesheet">
        <style>
            .main-container {
                width: 100%;
                height: 100vh;
                display: flex;
                flex-flow: column;
                justify-content: center;
                align-items: center;
            }


            .check-container {
                width: 6.25rem;
                height: 7.5rem;
                display: flex;
                flex-flow: column;
                align-items: center;
                justify-content: space-between;

                .check-background {
                    width: 100%;
                    height: calc(100% - 1.25rem);
                    background: linear-gradient(to bottom right, #5de593, #41d67c);
                    box-shadow: 0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset,
                        0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset;
                    transform: scale(0.84);
                    border-radius: 50%;
                    animation: animateContainer 0.75s ease-out forwards 0.75s;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    opacity: 0;

                    svg {
                        width: 65%;
                        transform: translateY(0.25rem);
                        stroke-dasharray: 80;
                        stroke-dashoffset: 80;
                        animation: animateCheck 0.35s forwards 1.25s ease-out;
                    }
                }

                .check-shadow {
                    bottom: calc(-15% - 5px);
                    left: 0;
                    border-radius: 50%;
                    background: radial-gradient(closest-side, rgba(73, 218, 131, 1), transparent);
                    animation: animateShadow 0.75s ease-out forwards 0.75s;
                }
            }

            @keyframes animateContainer {
                0% {
                    opacity: 0;
                    transform: scale(0);
                    box-shadow: 0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset,
                        0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset;
                }
                25% {
                    opacity: 1;
                    transform: scale(0.9);
                    box-shadow: 0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset,
                        0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset;
                }
                43.75% {
                    transform: scale(1.15);
                    box-shadow: 0px 0px 0px 43.334px rgba(255, 255, 255, 0.25) inset,
                        0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset;
                }
                62.5% {
                    transform: scale(1);
                    box-shadow: 0px 0px 0px 0px rgba(255, 255, 255, 0.25) inset,
                        0px 0px 0px 21.667px rgba(255, 255, 255, 0.25) inset;
                }
                81.25% {
                    box-shadow: 0px 0px 0px 0px rgba(255, 255, 255, 0.25) inset,
                        0px 0px 0px 0px rgba(255, 255, 255, 0.25) inset;
                }
                100% {
                    opacity: 1;
                    box-shadow: 0px 0px 0px 0px rgba(255, 255, 255, 0.25) inset,
                        0px 0px 0px 0px rgba(255, 255, 255, 0.25) inset;
                }
            }

            @keyframes animateCheck {
                from {
                    stroke-dashoffset: 80;
                }
                to {
                    stroke-dashoffset: 0;
                }
            }

            @keyframes animateShadow {
                0% {
                    opacity: 0;
                    width: 100%;
                    height: 15%;
                }
                25% {
                    opacity: 0.25;
                }
                43.75% {
                    width: 40%;
                    height: 7%;
                    opacity: 0.35;
                }
                100% {
                    width: 85%;
                    height: 15%;
                    opacity: 0.25;
                }
            }

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
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid transparent;
                border-radius: .25rem;
                margin-bottom: 1.5rem;
                box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
            }
            .me-2 {
                margin-right: .5rem!important;
            }

            .containerimg {
                max-width: 960px;
            }

            .avatar-upload {
                position: relative;
                max-width: 205px;
                margin: 50px auto;
            }
            .avatar-upload .avatar-edit {
                position: absolute;
                right: 12px;
                z-index: 1;
                top: 10px;
            }
            .avatar-upload .avatar-edit input {
                display: none;
            }
            .avatar-upload .avatar-edit input + label {
                display: inline-block;
                width: 34px;
                height: 34px;
                margin-bottom: 0;
                border-radius: 100%;
                background: #FFFFFF;
                border: 1px solid transparent;
                box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12);
                cursor: pointer;
                font-weight: normal;
                transition: all 0.2s ease-in-out;
            }
            .avatar-upload .avatar-edit input + label:hover {
                background: #f1f1f1;
                border-color: #d6d6d6;
            }
            .avatar-upload .avatar-edit input + label:after {
                content: "\f040";
                font-family: 'FontAwesome';
                color: #757575;
                position: absolute;
                top: 10px;
                left: 0;
                right: 0;
                text-align: center;
                margin: auto;
            }
            .avatar-upload .avatar-preview {
                width: 192px;
                height: 192px;
                position: relative;
                border-radius: 100%;
                border: 6px solid #F8F8F8;
                box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
            }
            .avatar-upload .avatar-preview > div {
                width: 100%;
                height: 100%;
                border-radius: 100%;
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
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
                            <li class="nav-item">
                                <a class="nav-link" href="admin.jsp">
                                    <i class="bi bi-house"></i> Dashboard
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="PatientController">
                                    <i class="bi bi-list-task"></i> Patient
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-clipboard-check"></i> Treatment
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-clock"></i> Appointment
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-exclamation-square-fill"></i> Report
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-gear-fill"></i> Setting
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="bi bi-people"></i> Users
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
                                <a class="nav-link" href="#">
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
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <div class="containerimg">

                                            <div class="avatar-upload">
                                                <div class="avatar-edit">
                                                    <input type='file' id="imageUpload" accept=".png, .jpg, .jpeg" />
                                                    <label for="imageUpload"></label>
                                                </div>
                                                <div class="avatar-preview">
                                                    <div id="imagePreview" style="background-image: url('https://static.vecteezy.com/system/resources/previews/019/879/186/non_2x/user-icon-on-transparent-background-free-png.png');">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                     
                                    </div>
                                    <hr class="my-4">
<!--                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                            <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe me-2 icon-inline"><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>Website</h6>
                                            <span class="text-secondary">https://bootdey.com</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                            <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github me-2 icon-inline"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>Github</h6>
                                            <span class="text-secondary">bootdey</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                            <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-twitter me-2 icon-inline text-info"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg>Twitter</h6>
                                            <span class="text-secondary">@bootdey</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                            <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-instagram me-2 icon-inline text-danger"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>Instagram</h6>
                                            <span class="text-secondary">bootdey</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                            <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-facebook me-2 icon-inline text-primary"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>Facebook</h6>
                                            <span class="text-secondary">bootdey</span>
                                        </li>
                                    </ul>-->
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="card">
                                <div class="card-body">
                                    <form action="addPatient" method="POST">
<!--                    <input type="hidden" id="id" name="id" value="${paInfo.patientId}">-->
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label class="labels">Fullname</label>
                            <input type="text" id="fullname" name="name" class="form-control" placeholder="" >
                        </div>        
                        <div class="col-md-6">
                            <label class="labels">Phone Number</label>
                            <input type="text" id="phoneNumber" name="phone" class="form-control" placeholder="" >
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label class="labels">Email</label>
                            <input type="text" id="email" name="email" class="form-control" placeholder="" >
                        </div>
                        <div class="col-md-6">
                            <label class="labels">Medicine code</label>
                            <input type="text" id="medicineCode" name="code" class="form-control" placeholder=" " >
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label class="labels" for="gender">Gender</label>
                            <select class="form-select" id="gender" name="gender">
                                <option value="M" <c:if test="${paInfo.gender == 'M'}">selected</c:if>>Male</option>
                                <option value="F" <c:if test="${paInfo.gender == 'F'}">selected</c:if>>Female</option>
                                <option value="X" <c:if test="${paInfo.gender == 'X'}">selected</c:if>>Other</option>
                            </select>
                        </div>                    

                        <div class="col-md-6">
                            <label class="labels" >Date of birth</label>
                            <input type="date"id="dob" name="dob" class="form-control" placeholder="" >
                        </div>
                    </div>
                    <br>
                    <div>
                        <label class="labels">Address</label>
                        <input type="text" id="address" name="address" class="form-control" placeholder="" >
                    </div>

                    <div class="mt-5 text-center"><button class="btn btn-primary py-2 px-4 ms-3" type="submit">Save Profile</button></div>
                     <div class="mt-5 text-center"><button class="btn btn-primary py-2 px-4 ms-3" type="submit">Cancel</button></div>
                </form>
                                  
                              
                              
                                    
                                    <div id="result" class="main-container" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: #fff; z-index: 9999; justify-content: center; align-items: center; flex-direction: column; ">
                                        <div class="check-container">
                                            <div class="check-background">
                                                <svg viewBox="0 0 65 51" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M7 25L27.3077 44L58.5 7" stroke="white" stroke-width="13" stroke-linecap="round" stroke-linejoin="round" />
                                                </svg>
                                            </div>
                                            <div class="check-shadow"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>


<!--                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="d-flex align-items-center mb-3">Project Status</h5>
                                            <p>Web Design</p>
                                            <div class="progress mb-3" style="height: 5px">
                                                <div class="progress-bar bg-primary" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p>Website Markup</p>
                                            <div class="progress mb-3" style="height: 5px">
                                                <div class="progress-bar bg-danger" role="progressbar" style="width: 72%" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p>One Page</p>
                                            <div class="progress mb-3" style="height: 5px">
                                                <div class="progress-bar bg-success" role="progressbar" style="width: 89%" aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p>Mobile Template</p>
                                            <div class="progress mb-3" style="height: 5px">
                                                <div class="progress-bar bg-warning" role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p>Backend API</p>
                                            <div class="progress" style="height: 5px">
                                                <div class="progress-bar bg-info" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>-->
                        </div>
                    </div>
                </div>
            </div>
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
            <script src="js/main.js"></script>
    </body>
    <script>
                                                function readURL(input) {
                                                    if (input.files && input.files[0]) {
                                                        var reader = new FileReader();
                                                        reader.onload = function (e) {
                                                            $('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
                                                            $('#imagePreview').hide();
                                                            $('#imagePreview').fadeIn(650);
                                                        }
                                                        reader.readAsDataURL(input.files[0]);
                                                    }
                                                }
                                                $("#imageUpload").change(function () {
                                                    readURL(this);
                                                });
                                                function showCodeAndRedirect() {
                                                    var resultDiv = document.getElementById("result");
                                                    resultDiv.style.display = "flex";

                                                    setTimeout(function () {
                                                        window.location.href = "viewPatientDetail.jsp";
                                                    }, 2000);
                                                }
    </script>
</html> 